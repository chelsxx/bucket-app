class ArticlesController < ApplicationController

   def index

       @articles = Article.all 
     
     #filters
      if params[:filters].present?
      if params[:filters][:when] == 'Food'
        @articles = @articles.where(:category => "Food")
      elsif params[:filters][:when] == 'Places'
        @articles = @articles.where(:category => "Places")
      elsif params[:filters][:when] == 'Activities'
        @articles = @articles.where(:category => "Activities")
      end
      end
      
     # sorting
    if params[:filters].present?
    if params[:filters][:sort] == "start_time"
      @articles = @articles.order('created_at ')
    else
       # default sort
      @articles = @articles.order('created_at DESC')
    end 
    end  
   end  
   
   def foodindex
        @articles = Article.all
        @article = Article.find(params[:id])
   end
  
  
   def show 
       @article = Article.find(params[:id])
   end
  
    def new
        @article = Article.new
    end
    
    def edit
  @article = Article.find(params[:id])
    end
    
   def create
  @article = Article.new(article_params)
   
    if @article.save
     redirect_to @article
  else
     render 'new'
    end
   end
  
  def update
    @article = Article.find(params[:id])
 
    if @article.update(article_params)
        redirect_to @article
    else
        render 'edit'
    end
  end
 
 def destroy
  @article = Article.find(params[:id])
  @article.destroy
 
  redirect_to articles_path
 end
 
private
  def article_params
    params.require(:article).permit(:title, :text, :date, :category, :picture, :filters, :when, :sort)
  end
   
   def filter_params
       params.require(:filters).permit(:when, :sort)
   end   

    
end
