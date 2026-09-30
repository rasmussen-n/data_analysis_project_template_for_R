README

To get started:

Download R and RStudio if you have not already.

Create a project and save the directory wherever you would like.

Within RStudio, select "Files" at the top of the bottom right pane and navigate to "template_project.R"
(This will be easier if you move this folder containing "template_project.R" and this file to the 
folder above your directory file, especially if you save all directories within that root file 
(eg., "R_directories" or something like that). Then you can click on "R_directories" (or whatever the
file above is called in your computer) in the file path at the top of the right lower pane of RStudio.
Then you can select this folder and the "template_project.R" file.

Once you select "template_project.R" it will load into your source pane (top left pane in RStudio).

Click your cursor in that top left pane and hit "Ctrl" + "Shift" + "s". This will run the entire
script all at once.

Running the script will create your folders, basic script templates, and control script as well as 
a README.md file that contains explanations of all the files. You can open this by selecting the file
in RStudio (bottom right pane) to open it to your source pane (top left pane in RStudio).

By default the control script ("control_script.R") when run ("Ctrl" + "Shift" + "s") will run
01_import.R, then 02_clean.R, then 03_visualize.R, then finally 04.analyze.R. These can be edited within
the file.

	- 01_import.R should have the code to load your data into the environment.

	- 02_clean.R should have the code to clean and tidy your data.

	- 03_visualize.R should have the code for producing images/figures.

	- 04_analyze.R should have the code for models and analyses.

Since these all run at once, if you are in the middle of exploratory data analysis or still working with 
the data, I would recommend either removing the files you are working on from the control script (you
can deactivate the code that runs them by typing a "#" at the beginning of every line of code loading
the files you want to remove, this will turn that code into part of a comment rather than executable 
code) or I would recommend that you do most of your fiddling with the analysis and code in other scripts.
Then you can copy finished code (that produces figures, tables, models, etc. as objects or prints them as 
files in the output folder) to your 03_visualize.R or 04_analyze.R files so that all the appropriate 
figures and models etc. will be created whenever you run the control script.

Since the control script loads your data and your cleaned data, unless you are exporting that to your 
data folder as an output (in which case you would need to have changed the code in your control script)
you will need to run the import script and cleaning script every time you want to work with your data.
This can be done by deactivating the 03_visualize and 04_analyze scripts within the control script so 
running the control script will prepare your data, or you can just run the 01 script followed by the 02
script each time you need to load your data to the environment.

If none of this makes sense, feel free to reach out to someone with a little more experience or reference
the following wonderful (free) resources to get started.

Resources:
- R for Data Science (2e) (free online textbook covering the basics or R) https://r4ds.hadley.nz/
- R Programming 101 YouTube channel (lots of excellent tutorials) https://www.youtube.com/@RProgramming101
- Equitable Equations YouTube channel (more excellent tutorials) https://www.youtube.com/@EquitableEquations
- Your favorite LLM (most will be very adept at R and can help you troubleshoot and create code)
- Any search engine: R is open source and there are MANY blogs, forums, tutorials, and educational materials
available if you look.

Good luck, and have fun!

Nathan Rasmussen
