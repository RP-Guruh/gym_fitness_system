class TableShowComponent < ViewComponent::Base
  include Pagy::Backend

  def initialize(data:, model:, relation: nil, id: nil, search_path: nil)
    @data = data
    @q = nil
    @pagy = nil
    @model = model.constantize
    @id = id
    @relation = relation
    @search_path = search_path
  end

  def before_render
    @q = @model.ransack(view_context.params[:q])
    @q.sorts = "created_at desc" if @q.sorts.empty?
    @data = @q.result(distinct: true).where(@relation => @id)

    unless @data.empty?
      @pagy, @data = pagy(@data, items: 5)
    end
  end

  def sort_link(column, title = nil, default_order: :asc)
    helpers.sort_link(@q, column, title, default_order: default_order)
  end

  def search_form_for
    helpers.search_form_for @q, url: @search_path, method: :get do |f|
      yield(f)
    end
  end
end
