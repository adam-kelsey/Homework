require 'sinatra'
require 'mysql'
require 'data_mapper'
require 'dm-mysql-adapter'
require 'shotgun'

DataMapper.setup(
  :default,
  'mysql://root@127.0.0.1/blog'
  )

class BlogPost
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :content, String
  property :date, String
  property :author, String
  property :created, String
  property :edited, String
end

DataMapper.finalize.auto_upgrade!

get '/' do
  @blog_posts = BlogPost.all
  @blog_posts = @blog_posts.reverse
  erb :index, layout: :layout
end

get '/createpost' do
  erb :create, layout: :layout
end

post '/addpost' do
  time = Time.now
  @blogpost = BlogPost.new
  @blogpost.created = time
  @blogpost.edited = time
  @blogpost.title = params[:title]
  @blogpost.author = params[:author]
  @blogpost.content = params[:content]
  @blogpost.date = "#{time.month}/#{time.day}/#{time.year} at #{time.hour}:#{time.min}."
  @blogpost.save
  redirect to '/'
end

get "/viewcontent/:id" do
  @editcontent = BlogPost.get params[:id]
  erb :display_blogpost, layout: :layout
end

get "/viewcontent/edit/:id" do
  @editcontent = BlogPost.get params[:id]
  erb :edit
end

patch '/edit/:id' do
  editedtime = Time.now
  @blogpost = BlogPost.get params[:id]
  @blogpost.update content:params[:edited]
  @blogpost.update edited:editedtime
  redirect to '/'
end

delete '/delete_post/:id' do
  @blogpost = BlogPost.get params[:id]
  @blogpost.destroy
  redirect to '/'
end


# get '/edit' do
#   erb :edit, layout: :layout
# end





