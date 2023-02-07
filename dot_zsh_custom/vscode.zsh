## Open Tmux session from VS Code Integrated terminal
if [[ -n $VSCODE ]]; then
  if [[ "$VSCODE" != "code" ]]; then
    command tmuxinator start "$VSCODE"
    return $?
  else
    command tmuxinator start code -n "$VSCODE_WORKSPACE_BASENAME" workspace="$VSCODE_WORKSPACE" basename="$VSCODE_WORKSPACE_BASENAME"
    return $?
  fi
fi
