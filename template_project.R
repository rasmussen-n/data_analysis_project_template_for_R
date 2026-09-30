library(fs)
library(here)

# Helper function to generate clean headers
make_header <- function(script_name, description = "TBD") {
  c(	"## Header ======================================================================",
     "##",
     paste0("## Script name: ", script_name),
     "##",
     paste0("## Purpose: ", description),
     "##",
     paste0("## Author: ", "Nathan Rasmussen"),
     "##",
     "## Email: rasmussenn@vcuhealth.org",
     "##",
     paste0("## Date created:", Sys.Date()),
     "##",
     "## Notes: ",
     "##",
     "",
     "# Attach packages ==============================================================",
     "",
     "library(tidyverse)",
     "library(here)",
    "\n"
  )
}

# Execution code template specifically for control_script.R
control_script_body <- c(
  "library(glue)",
  "",
  "# Setup ========================================================================",
  "",
  "component_scripts <- c(",
  '  "scripts/01_import.R",',
  '  "scripts/02_clean.R",',
  '  "scripts/03_visualize.R",',
  '  "scripts/04_analyze.R"',
  ")",
  "",
  "# Execute ======================================================================",
  "",
  "for (script in component_scripts) {",
  '  message(glue("Running {script}..."))',
  "  # local = TRUE keeps script-level objects from clobbering 'script' loop var",
  "  source(here(script), local = TRUE)",
  '  message(glue("Completed {script}\\n"))',
  "}",
  "",
  'message("All scripts executed successfully!")'
)

# Text content for README.md
readme_content <- c(
  "# Project Name",
  "### ",
  "",
  "## Folders/Files",
  "###",
  "",
  '"data"',
  '  - contains raw data, should be saved as "read-only"',
  "",
  '"scripts"',
  "  - contains code scripts.",
  "  - should contain component code scripts, including the following important scripts:",
  '    - "01_import.R"',
  '    - "02_clean.R"',
  '    - "03_analyze.R"',
  '    - "04_visualize.R"',
  "",
  '"outputs"',
  "  - contains the following self-explanatory files:",
  '    - "figures"',
  '    - "reports"',
  '    - "models"',
  "",
  '"control_script.R"',
  "  - orchestrates component scripts",
  "",
  '"README.md"',
  "  - this document contains project documentation and instructions.",
  "    More information can be found in the notes in the control script and component scripts",
  "",
  '"_quarto.yml"',
  "  - this document provides directions for quarto reports to be stored in /outputs/reports",
  "  - quarto documents are excellent for data science and analysis since they allow for",
  "    consolidating code and explanation in one place that can produce high quality reports",
  "  - if you do not plan on using quarto documents you may ignore or delete this file",
  "",
  '"ignore"',
  "  - temporary files",
  "",
  "###"
)

yml_content <- c(
  "project: ",
  "  type: default",
  "  output-dir: outputs/reports",
  "",
  "execute: ",
  "  echo: false",
  "  warning: false"
)

create_project_structure <- function() {
  
  # 1. Define folder paths
  folders <- c(
    "data",
    "scripts",
    "outputs/figures",
    "outputs/reports",
    "outputs/models",
    "ignore"
  )
  
  # 2. Define scripts and their descriptions
  scripts_info <- list(
    "control_script.R"     = "Master control script to run the full pipeline",
    "scripts/01_import.R"   = "Import raw datasets",
    "scripts/02_clean.R"    = "Clean and tidy datasets",
    "scripts/03_visualize.R"= "Generate exploratory and final data visualizations",
    "scripts/04_analyze.R"  = "Run statistical models and analysis"
  )
  
  # 3. Create directories
  fs::dir_create(here::here(folders))
  
  # 4. Create blank files and populate headers
  for (script_path in names(scripts_info)) {
    full_path <- here::here(script_path)
    fs::file_create(full_path)
    
    # Write custom header into each script
    header_content <- make_header(
      script_name = basename(script_path), 
      description = scripts_info[[script_path]]
    )
    
    # If it's control_script.R, append the execution body
    if (script_path == "control_script.R") {
      file_content <- c(header_content, control_script_body)
    } else {
      file_content <- header_content
    }
    
    writeLines(file_content, full_path)
  }
  
  # 5. Create README.md file and populate content
  readme_path <- here::here("README.md")
  fs::file_create(readme_path)
  writeLines(readme_content, readme_path)
  
  
  # 6. Create _quarto.yml file and populate content
  quarto_path <- here::here("_quarto.yml")
  fs::file_create(quarto_path)
  writeLines(yml_content, quarto_path)

  # Print the resulting project structure
  message("\nProject structure, README.md, and scripts created successfully:\n")
  fs::dir_tree(here::here(), recurse = 2)
}

# Run the setup function
create_project_structure()