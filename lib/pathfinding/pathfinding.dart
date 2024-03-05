import '../API/post.dart';
import '../screens/result.dart';

List<String> pathCoordinates = [];

//написать функцию для получения самого короткого пути и отдать результат в pathCoordinates, testCoordinates

List<GridData> convertPathFindingDataListToGridDataList(
    List<PathFindingData> pathFindingDataList) {
  List<GridData> gridDataList = [];
  for (var pathFindingData in pathFindingDataList) {
    for (var data in pathFindingData.data) {
      // Создаем тестовые данные для поля coordinates
      List<String> testCoordinates = ['(0,0)', '(0,1)'];

      // Создаем и добавляем объект GridData в список
      gridDataList.add(GridData(
        id: data.id,
        field: data.field.map((e) => e.toString()).toList(),
        start: data.start.map((key, value) => MapEntry(key, value as int)),
        end: data.end.map((key, value) => MapEntry(key, value as int)),
        coordinates: testCoordinates,
      ));
    }
  }
  return gridDataList;
}
