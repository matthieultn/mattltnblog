class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :show, :destroy]
    
    def new 
        # On récupère un nouvel article
        @article = Article.new
    end
    
    def create
        # On crée un nouvel article
        @article = Article.new(article_params)
        
        # Si l'article se modifie on affiche un message à l'utilisateur et on le redirige vers son article
        if @article.save
            flash[:notice]="Article créé"
            redirect_to article_path(@article)
            
        else
            # On reste sur la page new
            render 'new'
        end
    end
    
    def show
    end
    
    def edit
    end
    
    def update
        # Si l'article se modifie on affiche un message à l'utilisateur et on le redirige vers son article
        if @article.update(article_params)
            flash[:notice]="Article modifié"
            redirect_to article_path(@article)
        else
            # On reste sur la page edit
            render 'edit'
        end
    end
    
    def index
        @articles = Article.all
    end
    
    def destroy
        @article.destroy
        flash[:notice]="Article supprimé"
        redirect_to articles_path
    end

    private
        def set_article
            # On récupère l'ID de l'article
            @article = Article.find(params[:id])
        end
        
        def article_params
            params.require(:article).permit(:title, :description)
        end
end