import 'dart:html';
import 'package:over_react/over_react.dart';
import 'package:QueVivaLaViva/src/cookbook/cookbook_model.dart' as model;
import 'package:QueVivaLaViva/src/category/category_component.dart';



@Factory()
UiFactory<CookBookProps> CookBook;

@Props()
class CookBookProps extends UiProps {
  // Props go here, declared as fields:
  bool isDisabled;
  Iterable<String> items;
}

@State()
class CookBookState extends UiState {
  bool isLoading;
  Map imageData;
}

@Component()
class CookBookComponent extends UiStatefulComponent<CookBookProps, CookBookState> {

  Map imageData;
  model.CookBook cookBook;


  @override
  componentDidMount() {
    HttpRequest.request('packages/QueVivaLaViva/resources/recipes.json', mimeType: 'application/json').then((response) {
      cookBook = new model.CookBook.fromJson(response.response as Map);
      setState(newState()..isLoading = false);
    });
  }


  @override
  Map getDefaultProps() => (newProps()
  // Cascade default props here
    ..isDisabled = false
    ..items = []
  );

  @override
  Map getInitialState() => (newState()
    ..isLoading = true
  );

  @override
  render() {
    if (state.isLoading) {
      return Dom.h2()('Loading...');
    } else {
      return Dom.div()(
          cookBook.categories.map((category) => (Category()
            ..category = category
          )())
      );
    }
  }
}