output "static_web_app_url" {
  description = "Public URL of the deployed Static Web App"
  value       = "https://${azurerm_static_web_app.main.default_host_name}"
}

output "static_web_app_api_token" {
  description = "Deployment token for GitHub Actions (store as AZURE_STATIC_WEB_APPS_API_TOKEN secret)"
  value       = azurerm_static_web_app.main.api_key
  sensitive   = true
}
