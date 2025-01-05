{
  programs.tmux = {
    enable = true;
    extraConfig = ''
      set-window-option -g mode-keys vi

      unbind C-B
      set -g prefix C-Space
      bind C-Space send-prefix

      bind R source-file ~/.tmux.conf \; display "Reloaded!"

      set-option -g history-limit 50000

      bind C-j select-pane -D
      bind C-k select-pane -U
      bind C-h select-pane -L
      bind C-l select-pane -R
      bind j select-pane -D
      bind k select-pane -U
      bind h select-pane -L
      bind l select-pane -R

      bind r switch-client -T RESIZE

      bind -T RESIZE k resize-pane -U \; switch-client -T RESIZE
      bind -T RESIZE j resize-pane -D \; switch-client -T RESIZE
      bind -T RESIZE h resize-pane -L \; switch-client -T RESIZE
      bind -T RESIZE l resize-pane -R \; switch-client -T RESIZE

      bind -T RESIZE K resize-pane -U 5 \; switch-client -T RESIZE
      bind -T RESIZE J resize-pane -D 5 \; switch-client -T RESIZE
      bind -T RESIZE H resize-pane -L 5 \; switch-client -T RESIZE
      bind -T RESIZE L resize-pane -R 5 \; switch-client -T RESIZE

      bind s split-window -c "#{pane_current_path}"
      bind v split-window -h -c "#{pane_current_path}"

      bind Space new-window -c "#{pane_current_path}"
      bind C-Space new-window -c "#{pane_current_path}"

      unbind x
      bind c confirm-before -p "kill-pane #W? (y/n)" kill-pane

      bind N previous-window

      bind y switch-client -T copy-mode
      '';
  };
}
