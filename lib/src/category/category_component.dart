import 'dart:html';
import 'package:over_react/over_react.dart';
import 'package:QueVivaLaViva/src/category/category_model.dart' as model;


@Factory()
UiFactory<CategoryProps> Category;

@Props()
class CategoryProps extends UiProps {
  model.Category category;
}

@State()
class CategoryState extends UiState {

}

@Component()
class CategoryComponent extends UiStatefulComponent<CategoryProps, CategoryState> {

  @override
  componentDidMount() {

  }

  @override
  Map getDefaultProps() => (newProps()
  );

  @override
  Map getInitialState() => (newState()
  );

  @override
  render() {
    return Dom.div()(
      Dom.h4()(props.category.categoryName),
      Dom.div()(props.category.recipes.map((recipe) => (Recipe()
          ..recipe = recipe
      )()))
    )
  }
}