import fnmatch
import pprint
import os
import json
import urllib

def buildTree(dirRoot, urlRoot):
    tree = {}
    for root, dirnames, filenames in os.walk(dirRoot):
        for category in dirnames: # first is the immediate subdir
            print category
            tree[category] = buildCategory(os.path.join(root,category), category, urlRoot)
        break
    return tree

def buildCategory(cwd, category, urlRoot):
    items = {}
    for root, dirnames, filenames in os.walk(cwd):
        for recipeName in dirnames:
            print recipeName
            items[recipeName] = buildRecipe(recipeName, category, buildFilePaths( os.path.join( root,recipeName ), os.path.join( urlRoot,category,recipeName ) ) )
    return items

def buildFilePaths(pathToDir, urlRoot):
    for root, dirnames, filenames in os.walk(pathToDir):
        return [urllib.quote( os.path.join(urlRoot,filename) ) for filename in filenames if filename.endswith('.jpg')]

def buildRecipe(name, type, arrFilePaths):
    print arrFilePaths
    subtree = {}
    return {"name":name, "type":type, "image_urls":arrFilePaths}

def outputJson(data):
    return json.dumps(data, sort_keys=True, indent=4, separators=(',', ': '))

def main():
	fileOut = file('../app/res/recipes/recipes.json', 'w')
	fileOut.write( outputJson( buildTree( "/Users/maxwellclarke/Dropbox/Documents/Gramma O's Recipe Project", 'res/img' ) ) )
	fileOut.close()

   # my code here

if __name__ == "__main__":
    main()
