class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def import
    return redirect_to request.referer, notice: 'No file added' if params[:file].nil?
    return redirect_to request.referer, notice: 'Only CSV files allowed' unless params[:file].content_type == 'text/csv'

    CsvImportService.new.call(params[:file])

    redirect_to request.referer, notice: 'Import started...'
  end
end
