module ApplicationHelper
  def form_actions(back_path)
    "<div class='btn-group' role='group'>
      <button class='btn btn-default' id='SaveButton' type='submit'>Salvar</button>
      <a href=#{back_path} class='btn btn-default'>Voltar</a>
    </div>"
  end

  def menu_html(options)
    path_controller = options[:path].delete "/"
    className = 'active' if params[:controller] == path_controller
    "<li class='#{className}'>
      #{link_to options[:title], options[:path]}
    </li>"
  end

  def navbar(*menus)
    menus.reduce('') { |a, e| a << menu_html(e) }
  end

  def make_menu(back_path)
    "<div class='btn-group' role='group'>
      <button class='btn btn-default' id='SaveButton' type='submit'>Salvar</button>
      <a href=#{back_path} class='btn btn-default'>Voltar</a>
    </div>"
  end
end
