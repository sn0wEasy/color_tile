List<List<T>> getPermutation<T>(List<T> list) {
  if (list.length == 1) return [list];

  List<List<T>> retList = <List<T>>[];
  for (T item in list) {
    List<T> selected = <T>[item];
    List<T> unused = [...list]..remove(item);

    for (List<T> rightSide in getPermutation(unused)) {
      retList.add(<T>[...selected, ...rightSide]);
    }
  }

  return retList;
}
