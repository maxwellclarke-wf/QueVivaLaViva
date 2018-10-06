import 'dart:html';
import 'package:over_react/over_react.dart';
import 'package:QueVivaLaViva/src/recipe/recipe_model.dart' as model;


@Factory()
UiFactory<RecipeProps> Recipe;

@Props()
class RecipeProps extends UiProps {
  model.Recipe recipe;
}

@State()
class RecipeState extends UiState {

}

@Component()
class RecipeComponent extends UiStatefulComponent<RecipeProps, RecipeState> {

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
      props.recipe.images.map((imgUrl) => (Dom.img()
          ..href = imgUrl
      ))
    );
  }
}