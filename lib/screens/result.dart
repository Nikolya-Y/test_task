import 'package:flutter/material.dart';

class GridScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Path Finding Grid'),
      ),
      body: GridWidget(
        // Здесь передаем данные о сетках в виде списка
        data: [
          GridData(
            id: "7d785c38-cd54-4a98-ab57-44e50ae646c1",
            field: [".X.", ".X.", "..."],
            start: {
              'x': 2,
              'y': 1,
            },
            end: {
              'x': 0,
              'y': 2,
            },
            coordinates: [
              '(0,0)',
              '(0,1)'
            ], //  для хранения списка адресов клеток, которые должны быть закрашены определенным цветом
          ),
          GridData(
            id: "88746d24-bf68-4dea-a6b6-4a8fefb47eb9",
            field: ["XXX.", "X..X", "X..X", ".XXX"],
            start: {
              'x': 0,
              'y': 3,
            },
            end: {
              'x': 3,
              'y': 0,
            },
            coordinates: [
              '(1,1)'
            ], //  для хранения списка адресов клеток, которые должны быть закрашены определенным цветом
          ),
        ],
      ),
    );
  }
}

// Виджет для отображения списка сеток
class GridWidget extends StatelessWidget {
  final List<GridData> data;

  GridWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return GridItem(
            data[index]); // Возвращаем виджет GridItem для каждой сетки
      },
    );
  }
}

// Виджет для отображения одной сетки
class GridItem extends StatelessWidget {
  final GridData gridData;

  GridItem(this.gridData) {
    // Проверка размера сетки
    if (gridData.field.length > 100 ||
        gridData.field[0].length > 100 ||
        gridData.field.length < 1 ||
        gridData.field[0].length < 1) {
      throw Exception('Размер сетки должен быть от 1 до 100');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Grid ID: ${gridData.id}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          // Создаем сетку из виджетов клеток
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: gridData
                  .field[0].length, // Определяем количество столбцов в сетке
            ),
            itemCount: gridData.field.length *
                gridData.field[0].length, // Общее количество клеток в сетке
            itemBuilder: (context, index) {
              int row =
                  index ~/ gridData.field[0].length; // Вычисляем индекс строки
              int col =
                  index % gridData.field[0].length; // Вычисляем индекс столбца

              // Создаем виджет клетки в зависимости от значения в массиве field
              return Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  border:
                      Border.all(), // Добавляем границы для отделения клеток
                  color: _getCellColor(
                      gridData.field,
                      gridData.start,
                      gridData.end,
                      gridData.coordinates,
                      col,
                      row), // Fixed argument list
                ),
                child: Center(
                  child: Text(
                    '', // Можно добавить какой-то текст или другой виджет, если нужно
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  // Метод для определения цвета клетки
  Color _getCellColor(List<String> field, Map<String, int> startPoint,
      Map<String, int> endPoint, List<String> coordinates, int col, int row) {
    // 1

    // Проверяем, является ли текущая клетка стартовой точкой
    if (col == startPoint['x'] && row == startPoint['y']) {
      return Color(0xFF64FFDA); // Цвет стартовой точки
    }

    // Проверяем, является ли текущая клетка конечной точкой
    if (col == endPoint['x'] && row == endPoint['y']) {
      return Color(0xFF009688); // Цвет конечной точки
    }

    // Проверяем, является ли текущая клетка одной из клеток для закрашивания в специальный цвет
    String currentCoordinate = "($col,$row)";
    if (coordinates.contains(currentCoordinate)) {
      return Color(0xFF4CAF50); // Цвет для закрашенных клеток
    }

    // Проверяем, является ли текущая клетка заблокированной
    if (field[row][col] == 'X') {
      return Colors.black; // Цвет заблокированных клеток
    }

    // Возвращаем белый цвет для остальных клеток
    return Colors.white;
  }
}

// Модель данных для сетки
class GridData {
  final String id;
  final List<String> field;
  final Map<String, int> start;
  final Map<String, int> end;
  final List<String> coordinates; // Добавлено поле coordinates

  GridData({
    required this.id,
    required this.field,
    required this.start,
    required this.end,
    required this.coordinates, // Исправлено на передачу coordinates
  });
}
