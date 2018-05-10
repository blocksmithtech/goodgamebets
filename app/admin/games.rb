ActiveAdmin.register Game do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :home_team_id, :away_team_id, :winner_id, :closes_at, :played_at, :wallet,
              :gametype, :wallet, :home_score, :away_score, :state
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  member_action :mark_as_complete, method: :put do
    return redirect_to resource_path, alert: "Winner is empty" if resource.winner.nil?
    resource.generate_awards!
    msg = 'The game was marked as completed and awards distributed.'
    redirect_to resource_path, notice: msg
  end

  action_item :view, priority: 0, only: :show, if: proc{ !resource.completed? } do
    link_to 'Mark as Complete', mark_as_complete_admin_game_path, method: :put,
                                                                  data: {confirm: 'Are you sure?'}
  end
end
