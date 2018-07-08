class ArticlesController < ApplicationController
    
    
    def new 
        # On récupère un nouvel article
        @article = Article.new
    end
    
    def create
        # On crée un nouvel article
        @article = Article.new(article_params)
        
        # Si l'article se modifie on affiche un message à l'utilisateur et on le redirige vers son article
        if @article.save
            flash[:notice]="Article bel et bien créé"
            redirect_to article_path(@article)
            
        else
            # On reste sur la page new
            render 'new'
        end
    end
    
    def show
        # On récupère l'ID de l'article
        @article = Article.find(params[:id])
    end
    
    def edit
        # On récupère l'ID de l'article
        @article = Article.find(params[:id])
    end
    
    def update
        # On récupère l'ID de l'article
        @article = Article.find(params[:id])
        
        # Si l'article se modifie on affiche un message à l'utilisateur et on le redirige vers son article
        if @article.update(article_params)
            flash[:notice]="Article bel et bien modifié"
            redirect_to article_path(@article)
        else
            # On reste sur la page edit
            render 'edit'
        end
    end
    
    def index
        @articles = Article.all
    end

    private
    
    def article_params
     params.require(:article).permit(:title, :description)
    end
end