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

  p6df::modules::anthropic::mcp::server::add "superset" "npx" "-y" "superset-mcp"
  p6df::modules::openai::mcp::server::add "superset" "npx" "-y" "superset-mcp"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::superset::profile::on(profile, code)
#
#  Args:
#	profile -
#	code - shell code block (export SUPERSET_URL=... SUPERSET_USERNAME=... SUPERSET_PASSWORD=...)
#
#  Environment:	 P6_DFZ_PROFILE_SUPERSET SUPERSET_PASSWORD SUPERSET_URL SUPERSET_USERNAME
#>
######################################################################
p6df::modules::superset::profile::on() {
  local profile="$1"
  local code="$2"

  p6_run_code "$code"

  p6_env_export "P6_DFZ_PROFILE_SUPERSET" "$profile"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::superset::profile::off(code)
#
#  Args:
#	code - shell code block previously passed to profile::on
#
#  Environment:	 P6_DFZ_PROFILE_SUPERSET SUPERSET_PASSWORD SUPERSET_URL SUPERSET_USERNAME
#>
######################################################################
p6df::modules::superset::profile::off() {
  local code="$1"

  p6_env_unset_from_code "$code"
  p6_env_export_un P6_DFZ_PROFILE_SUPERSET

  p6_return_void
}
