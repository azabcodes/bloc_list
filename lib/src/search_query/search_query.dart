import 'package:bloc/bloc.dart';


class SearchQueryCubit extends Cubit<String> {
  SearchQueryCubit() : super('');
  void clearQuery() => emit('');
  void setQuery(String query) => emit(query.toLowerCase());
}
