---
title: Making earthquake maps from text
---

The majority of the walkthroughs on this mini-site deal with processing walls of text. If you're new and excited about data, processing text was probably not what you signed up for. Maybe you thought you'd be making fun maps like this:

<iframe width="100%" height="520" frameborder="0" src="https://dundee.cartodb.com/viz/31df1b04-5d22-11e5-b446-0e6e1df11cbf/embed_map" allowfullscreen webkitallowfullscreen mozallowfullscreen oallowfullscreen msallowfullscreen></iframe>

Fortunately, learning about text goes hand-in-hand with making interesting data visualizations. This walkthrough shows how to quickly get from a dense text file to building an interactive time-lapse map ([via CartoDB](http://docs.cartodb.com/tutorials/introduction_torque.html)) in an easy 5 minutes. 

How can a data visualization be built so easily? The first step is just understanding that __data is text__.



# Get the earthquakes data

For this exercise, we will use the real-time earthquake feed from the [United States Geological Survey's Earthquake Hazards Program](http://earthquake.usgs.gov/).

The USGS has a several formats for their real-time data feeds; [we want the __Spreadsheet__format](http://earthquake.usgs.gov/earthquakes/feed/v1.0/csv.php). You can choose from the various slices. For this demonstration, I'm using "[Significant Earthquakes in the Past 30 Days](http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/significant_month.csv)." Clicking the link should automatically download the file to your computer.

Open the file in your __text editor__ to see what the file contains:

![image](/files/images/lessons/earthquakes.csv.png)

CSV, which stands for [comma-separated values](https://en.wikipedia.org/wiki/Comma-separated_values), is a popular text format for storing data. The commas act as __delimiters__ and denote the "columns" in the data. But for humans, it's very hard to "see" as data, which is why we use spreadsheets.

![image](/files/images/lessons/earthquakes.csv.excel.png)


A spreadsheet program such as Excel knows how to interpret those commas: when you open the earthquakes CSV with Excel, the column-delimiting commas that were present in the text file don't appear. Things get a little column when a value in a data column contains a comma, but the general upshot is that __most of the data we will ever encounter is stored as plain text__. 

# Text is universal

Most data-handling programs -- from Excel to fancy online visualization tools -- live with this reality. So the other upshot is that no matter what you want to do with your data: analyze it, map it, chart it, stuff it into a database, make a web app from it -- you just need to get it into this spreadsheet-friendly text format.


## Moving to Google Sheets

So if this earthquakes CSV works in Excel, it should just work in [Google Sheets](https://www.google.com/sheets/about/). Inside a new Google spreadsheet, click __File__ in the menubar, then __Import...__, then __Upload__. It will give you some options, such as specifying the __Separator character__. You can choose __Comma__, but the __Detect automatically__ should work just fine.

![image](/files/images/lessons/earthquakes.csv.import.google.png)

(You can also try choosing another option, such as __Tab__, to see how misinterpreting the separator character is the difference between a spreadsheet and a blob of text)

For the most part, Google Sheets and Excel are interchangeable. I usually go with Google Sheets because of its cleaner interface with the online collaboration conveniently built-in. Either way, there's no obstacle in exporting my work into CSV so that any Excel user can use it, and vice versa.

# Mapping the data

With structured data, visualizing it is a matter of knowing which columns are relevant. When it comes to earthquakes, an obvious visualization is __where__ the earthquakes took place. The relevant columns are __latitude__ and __longitude__. 

There are a few hacks that can be done to make a map via Google Sheets, but let's just move to an application in which mapping is a built-in feature.

## Google Fusion Tables

[Google Fusion Tables](https://support.google.com/fusiontables/answer/2571232?hl=en) is a hybrid between a spreadsheet and database; it's not as easy-to-use or edit as the former, but it has a few more "power" features, including the ability to store and efficiently manage far more data than a Google spreadsheet. For whatever reason, Google has included a built-in mapping tool in Fusion Tables but not Sheets. But again, our data is just plain text CSV and is portable across the two different apps.

The easiest way to create a Fusion Table is to go to your Google Drive at drive.google.com (note: if you are trying this from a Stanford account, you may have to do it from your personal Google account). The Fusion Tables option is a bit buried: click the __New__ button, and then __More__.

Creating a new Fusion Table will prompt you to upload a file; go ahead and upload your earthquakes CSV. Then you can click through the __Next__ button and accept all the default options. The result should look very similar to a spreadsheet:

![image](files/images/lessons/earthquakes.csv.in.ft.png)

Fusion Tables will try to guess if your data contains geospatial data -- i.e. the "latitude" and "longitude" columns in our earthquakes CSV -- and then automatically create a map based on the data.

You should see a tab titled "__Map of latitude__". Click it to see the map:

![image](/files/images/lessons/earthquakes.csv.in.ft.map.png)

Fusion Tables has a lot of functionality and options; you can check out [Google's tutorial for more information](http://support.google.com/fusiontables/bin/answer.py?answer=184641).

## Google's My Maps

Let's use another of Google's tools: [My Maps](https://www.google.com/mymaps). Go back to your Google Drive and click the __New__ button, then __More__ to see the __My Maps__ option. Click on the option to import your own data, and it will prompt you to select a file. 

Unlike Fusion Tables, My Maps won't automatically create a map based off of the __latitude__ and __longitude__ columns and will prompt you to confirm which columns to use:

![image](/files/images/lessons/earthquakes.csv.import.to-mymaps.png)

The result is a mapping interface more geared toward the average consumer who needs to make a custom map. There's more tools for styling the map but (I'm assuming) less support for the kinds of huge datasets that Fusion Tables can manage:

![image](/files/images/lessons/earthquakes.csv.in.mymaps.png)

## CartoDB

If CSV is truly a portable data format, then there's no reason to stick with Google's family of tools. Let's try [CartoDB, a popular geodata visualization tool](https://cartodb.com/). 

In the CartoDB dashboard, select the __Connect dataset__ tab. 

You can upload the earthquakes data you've downloaded. Or you could use the option to paste in a URL; here's the URL for [All Earthquakes, Past 30 Days](http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.csv):

`http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.csv`

![image](/files/images/lessons/earthquakes.csv.cartodb-upload.png)

After the dataset has been uploaded, CartoDB should take you to a map view:

![image](/files/images/lessons/earthquakes.csv.cartodb-newmap.png)

CartoDB is geared specifically toward making interactive, animated data maps. I'm not familiar with all of its options and tools so I won't go into detail as you can look at their tutorials yourself. But since the earthquake data has a __time__ column, it makes sense to try out [CartoDB's "torque" map](http://docs.cartodb.com/tutorials/introduction_torque.html), which you can try out by clicking the "__wizards__" button in the sidebar:

![image](/files/images/lessons/earthquakes.csv.cartodb-torque-wizard.png)

Here's [the CartoDB page for that map](https://dundee.cartodb.com/viz/31df1b04-5d22-11e5-b446-0e6e1df11cbf/map).


# Get the text

If you're not a front-end programmer or designer, the good news is that there's a variety of sophisticated, user-friendly software that can produce great visualizations. But they need you, the user, to provide the data.

Finding that data, understanding its structure, and wrangling it into spreadsheet form is ultimately the hard and painful work of the data journalist. But it's important to remember, during the grind and suffering of data wrangling, that when the data wrangling is done, you have a vast array of applications that can then build something interesting and valuable.












