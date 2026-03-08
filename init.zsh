# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::superset::deps()
#
#>
######################################################################
p6df::modules::superset::deps() {

  # shellcheck disable=2034
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

  p6_return_void
}

#  Environment:	 SUPERSET_PASSWORD SUPERSET_URL SUPERSET_USERNAME
######################################################################
#<
#
# Function: p6df::modules::superset::mcp::env()
#
#  Environment:	 SUPERSET_PASSWORD SUPERSET_URL SUPERSET_USERNAME
#>
#/ Synopsis
#/    Maps Superset env vars to MCP-specific vars
#/
######################################################################
p6df::modules::superset::mcp::env() {

  if p6_string_blank "$SUPERSET_URL"; then
    p6_env_export "SUPERSET_URL"      "http://localhost:8088"
    p6_env_export "SUPERSET_USERNAME" "${SUPERSET_USERNAME:-admin}"
  fi

  if p6_string_blank_NOT "$SUPERSET_PASSWORD"; then
    p6_env_export "SUPERSET_PASSWORD" "$SUPERSET_PASSWORD"
  else
    p6_env_export_un SUPERSET_PASSWORD
  fi

  p6_return_void
}
