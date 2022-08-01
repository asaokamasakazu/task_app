class PostsController < ApplicationController
  before_action :time
  before_action :schedule_count, {only:[:index]}

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(
      title: params[:title],
      start_day: params[:start_day],
      finish_day: params[:finish_day],
      all_day: params[:all_day],
      memo: params[:memo]
    )
    if @post.start_day > @post.finish_day
      if @post.title == ""
        @error_message = ["タイトルは必須です。", "終了日の日付が開始日の日付よりも後になるように設定してください。"]
        render("posts/new")
      else 
        @error_message = ["終了日の日付が開始日の日付よりも後になるように設定してください。"]
        render("posts/new")
      end
    elsif @post.save
      flash[:notice] = "スケジュールの新規登録に成功しました。"
      redirect_to("/posts")
    else
      @error_message = ["タイトルは必須です。"]
      #render("posts/new")
      render "new"
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.title = params[:title]
    @post.start_day = params[:start_day]
    @post.finish_day = params[:finish_day]
    @post.all_day = params[:all_day]
    @post.memo = params[:memo]
    if @post.start_day > @post.finish_day
      if @post.title == ""
        @error_message = ["タイトルは必須です。", "終了日の日付が開始日の日付よりも後になるように設定してください。"]
        render("posts/edit")
      else 
        @error_message = ["終了日の日付が開始日の日付よりも後になるように設定してください。"]
        render("posts/edit")
      end
    elsif @post.save
      flash[:notice] = "スケジュールの編集に成功しました。"
      redirect_to("/posts")
    else
      @error_message = ["タイトルは必須です。"]
      render("posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "スケジュールの削除に成功しました。"
    redirect_to("/posts")
  end
end