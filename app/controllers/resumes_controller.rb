class ResumesController < ApplicationController
  def index
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @resumes = Resume.all
  end

  def new
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @resume = Resume.new
  end

  def create
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @resume = Resume.new(resume_params)

    if @resume.save
      redirect_to resumes_path, notice: "The resume #{@resume.name} has been uploaded."
    else
      render "new"
    end
  end

  def destroy
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to resumes_path, notice:  "The resume #{@resume.name} has been deleted."
  end

private
  def resume_params
    params.require(:resume).permit(:name, :attachment)
  end
end