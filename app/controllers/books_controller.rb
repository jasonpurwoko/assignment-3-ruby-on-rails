class BooksController < ApplicationController
  def index
    @books = Book.sorted
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      flash[:notice] = "Book '#{@book.title}' created successfully."
      redirect_to(books_path)
    else
      render('new')
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update_attributes(book_params)
      flash[:notice] = "Book '#{@book.title}' updated successfully."
      redirect_to(book_path(@book))
    else
      render('edit')
    end
  end

  def delete
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Book '#{@book.title}' deleted successfully."
    redirect_to(books_path)
  end


  private

  def book_params
    params.require(:book).permit(:id, :title, :author, :genre, :price, :published_date, :created_at, :updated_at)
  end
end
