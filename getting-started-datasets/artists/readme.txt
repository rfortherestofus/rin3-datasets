Original data set download source: Tidy Tuesday GitHub repo

URL: https://github.com/rfordatascience/tidytuesday/blob/master/data/2023/2023-01-17/artists.csv


License for TidyTuesday: Creative Commons Zero v1.0 Universal
CC0 1.0 Universal - https://github.com/rfordatascience/tidytuesday/blob/master/LICENSE

License for arthistory package: MIT License

Citation: Lemus S, Stam H (2022). arthistory: Art History Textbook Data. https://github.com/saralemus7/arthistory, https://saralemus7.github.io/arthistory/.

Description: From the {arthistory} package page: "This package contains data that was used for Holland Stam’s thesis work, titled Quantifying art historical narratives. The data was collected to assess the demographic representation of artists through editions of Janson’s History of Art and Gardner’s Art Through the Ages, two of the most popular art history textbooks used in the American education system."



The artists data set contains "variables regarding the artists’ demographics and numeric metrics for describing how much space they or their work took up in each edition of each textbook."


artists data set fields:


artist_name - The name of each artist

edition_number - The edition number of the textbook from either Janson's History or Art or Gardner's Art Through the Ages.

year - The year of publication for a given edition of Janson or Gardner.

artist_nationality - The nationality of a given artist.

artist_nationality_other - The nationality of the artist. Of the total count of artists through all editions of Janson's History of Art and Gardner's Art Through the Ages, 77.32% account for French, Spanish, British, American and German. Therefore, the categorical strings of this variable are French, Spanish, British, American, German and Other

artist_gender - The gender of the artist

artist_race - The race of the artist

artist_ethnicity - The ethnicity of the artist

book - Which book, either Janson or Gardner the particular artist at that particular time was included.

space_ratio_per_page_total - The area in centimeters squared of both the text and the figure of a particular artist in a given edition of Janson's History of Art divided by the area in centimeters squared of a single page of the respective edition. This variable is continuous.

artist_unique_id - The unique identifying number assigned to artists across books is denoted in alphabetical order. This variable is discrete.

moma_count_to_year - The total count of exhibitions ever held by the Museum of Modern Art (MoMA) of a particular artist at a given year of publication. This variable is discrete.

whitney_count_to_year - The count of exhibitions held by The Whitney of a particular artist at a particular moment of time, as highlighted by year. This variable in discrete.

artist_race_nwi - The non-white indicator for artist race, meaning if an artist's race is denoted as either white or non-white.
