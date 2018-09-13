
class RecipesController < ApplicationController
    
    def show
        @recipe = Recipe.find(params[:id])
    end

    def new
        @recipetypes = RecipeType.all
        @recipe = Recipe.new
    end
    
    def create
        
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
            redirect_to recipe_path(@recipe.id)
        else
            @recipetypes = RecipeType.all
            render 'new'
        end
    end

    def edit
        @recipe = Recipe.find(params[:id])
        @recipetypes = RecipeType.all
    end

    def update
        @recipe = Recipe.find(params[:id])  
        if @recipe.update(recipe_params)                                            
        redirect_to recipe_path(@recipe.id)
        else
            @recipetypes = RecipeType.all
            render 'edit'
        end
    end

    def recipe_params
        params.require(:recipe).permit(:title, :recipe_type_id, :cuisine, 
                                                    :difficulty, :cook_time, :ingredients, 
                                                    :cook_method)
    end
end