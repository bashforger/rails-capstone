module TransactionsHelper
  def groups(transaction)
    grr = []
    transaction.group_ids&.each { |id| grr << current_user.groups.find(id) }
    grr
  end

  def group_icon(transaction)
    unless groups(transaction).empty?
      html_out = ''
      html_out << image_tag(groups(transaction).first.icon, class: 'mw-100').html_safe
    end
    render inline: html_out
  end

  def groups_list(transaction)
    if groups(transaction)
      html_out = ''
      groups(transaction).each do |group|
        html_out << (link_to group.name, group, class: 'badge bg-info m-1').html_safe
      end
    end
    render inline: html_out
  end
end
