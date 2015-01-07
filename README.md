QueVivaLaViva - A recipe site
=============
###in dedication to Aubree's grandmother's recipes.

Visit the actual site hosted on github pages through here: http://www.quevivalaviva.com/
OR directly through http://maxwellclarke-wf.github.io/QueVivaLaViva/app/index.html

###Technologies:
* Angular
* Bootstrap-UI for Angular utilizing the accordion and (soon) typeahead widget(s)
* A bootstrap template modified for use
* Some python to turn file structures into JSON documents
* imageOptim for some basic cleanup of the images and some compression
* github pages for hosting (see the gh-pages branch for specifics on implementation)
* godaddy for the domain

The last Viva is pronounced vie-va.

###TODO:
* Add typeahead bar for filtering (implemented but commented out currently because it needs routes)
  * Add filtering for which are shown, needed for typeahead bar
  * Add routes for opened items so links can be shared
  * Set only one recipe openable at a time (toggleable maybe? Supported by bootstrap-ui)
* Fix (lack of) animation smooveness issue caused by using computed vertical space which makes animations janky
* Fill out footer with links
* Run images through better compression that's not so one-size-fits-all (and maybe not host on github pages)
* Mobile-specific rendering choices
* * fix footer so that it doesn't sit in front of accordions and prevent them from being clicked
