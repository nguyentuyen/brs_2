class ReportsController < ApplicationController
  def index
    @models = []
    ActiveRecord::Base.connection.tables.each do |table|
      @models << table.camelize.singularize
    end
  end
end
