#= require active_admin/base
#= require active_admin/editor
#= require_directory ./admin
#= require rails.validations
#= require rails.validations.formtastic


validate_forms =() ->
  if $("form .validations").lenght != 0
    $("form .validations").each ->
      $(this).validate()

$ ->
  console.log 'aa'

