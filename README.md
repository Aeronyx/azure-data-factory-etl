# Azure Data Factory ETL: Unified Sales and Website Data Pipeline

## Overview
This Terraform project provisions a robust Azure-based ETL (Extract, Transform, Load) platform designed to consolidate all sales and website data into a centralized, report-ready location each night (or weekly as needed). Leveraging Azure Data Factory, the solution automates data ingestion from multiple Azure sources, landing it in a secure Azure Data Lake for downstream reporting, analytics, and BI tools like Power BI.

---

## Architecture Summary

- **Resource Group**: Logical grouping for all resources
- **Azure Storage Account**: Central data lake (landing, staging, reporting)
- **Azure Data Factory**: Orchestrates ETL pipelines and schedules
- **Synapse Analytics (Optional/Reporting)**: Used for advanced analytical/reporting needs
- **Managed Identity**: Secures resource access across services

```
Data Sources in Azure
   └→ Data Factory (pipelines/triggers)
        └→ Storage Account (Data Lake)
             └→ Analytics/Reporting
```

---

## Project Structure

- `main.tf`, `variables.tf`, `outputs.tf`, `versions.tf`: Top-level orchestration
- `terraform.tfvars`: Example values for variables
- `/datafactory`: Azure Data Factory logic & submodule
- `/storage`: Storage Account logic & submodule
- `/synapse`: Synapse Analytics logic & submodule (optional)

---

## Deployment Steps

1. **Edit `terraform.tfvars`**
   - Update variable values for your Azure environment (location, account names, tags, etc.)
   - Replace sample values as appropriate

2. **Initialize Terraform**
   ```sh
   terraform init
   ```

3. **Validate Configuration**
   ```sh
   terraform validate
   ```

4. **Plan and Apply**
   ```sh
   terraform plan
   terraform apply
   ```

5. **Integration**
   - Update Data Factory pipelines to add or refine data connectors as new Azure data sources emerge
   - Connect Power BI or other reporting tools to the output data lake or Synapse

---

## Notes & Next Steps
- Modular design: Easily add or extend with new sources, destinations, or pipeline logic
- Review `/datafactory`, `/storage`, and `/synapse` for submodule-specific documentation
- Synapse and advanced networking/security can be tuned based on your compliance and reporting needs

---

For detailed module info, see the `README.md` in each subdirectory.

## License
MIT