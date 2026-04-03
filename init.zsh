# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::superset::deps()
#
#>
######################################################################
p6df::modules::superset::deps() {
  ModuleDeps=(
    p6m7g8-dotfiles/p6common
  )
}

######################################################################
#<
#
# Function: p6df::modules::superset::mcp()
#
#>
#/ Synopsis
#/    Installs Apache Superset MCP server
#/
######################################################################
p6df::modules::superset::mcp() {

  p6_js_npm_global_install "superset-mcp"

  p6df::modules::anthropic::mcp::server::add "superset" "npx" "-y" "superset-mcp"
  p6df::modules::openai::mcp::server::add "superset" "npx" "-y" "superset-mcp"

  p6_return_void
}

######################################################################
#<
#
# Function: words superset $SUPERSET_USERNAME = p6df::modules::superset::profile::mod()
#
#  Returns:
#	words - superset $SUPERSET_USERNAME
#
#  Environment:	 SUPERSET_USERNAME
#>
######################################################################
p6df::modules::superset::profile::mod() {

  p6_return_words 'superset' '$SUPERSET_HOME' '$SUPERSET_CONFIG_PATH'
}
