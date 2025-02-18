class CommentsController < ApplicationController
  before_action :load_parent
  def create
    Rails.logger.info "parent: #{@parent}"
    @comment = @parent.comments.new(comment_params)
    change_state

    if @comment.save
      redirect_to polymorphic_path(@comment.parent)
    else
      # do something else
    end
  end

  private

  def comment_params
    params.require(:comment).permit(
      :content,
      :parent_id,
      :parent_type,
      :user_id,
      project_attributes: [
        :new_state
      ]
    )
  end

  def load_parent
    params.each do |name, value|
      Rails.logger.info "name: #{name}, value: #{value}"
      @parent = ::Regexp.last_match(1).classify.constantize.find(value) if name =~ /(.+)_id$/
    end
  end

  def change_state
    @comment.previous_state  = @parent.aasm.current_state
    return unless params[:comment][:new_state].present?

    @parent.change_state(params[:comment][:new_state])
    # TO_DO need error handling here if state can't transition from current to new
    @comment.current_state = @parent.aasm.current_state
  end
end
