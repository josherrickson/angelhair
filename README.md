# Angelhair

Creating spaghetti plots in Stata that are readable with large amounts of data.

Spaghetti plots (line plots over time for multiple groups/individuals) are handy tools for data exploration, but become unreadble rapidly as the
number of groups/individuals increases. To address this, the *angelhair* command produces a spaghetti plot where all groups/individuals are plotted,
but a small random selected number of groups/individuals are highlighted so show individual trends.

## Installing

You can install the entire package directly with:

```
net install angelhair, from("https://raw.githubusercontent.com/josherrickson/angelhair/master")
```

This will allow `adoupdate` to check for updates and install them as needed.
