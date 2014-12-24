import fnmatch
import pprint
import os

def buildTree(dirRoot):
    tree = []
	
    for root, dirnames, filenames in os.walk(dirRoot):
        for category in dirnames: # first is the immediate subdir
            print category
            tree.append(buildCategory(os.path.join(root,category), category))
        break
    return tree

def buildCategory(cwd, category):
    items = {}
    for root, dirnames, filenames in os.walk(cwd):
        for recipeName in dirnames:
            print recipeName
            items[recipeName] = buildRecipe(recipeName, category, buildFilePaths( os.path.join( root,recipeName ) ) )
    return items

def buildFilePaths(pathToDir):
    for root, dirnames, filenames in os.walk(pathToDir):
        return [os.path.join(pathToDir,filename) for filename in filenames]

def buildRecipe(name, type, arrFilePaths):
    print arrFilePaths
    subtree = {}
    return {'name':name, 'type':type, 'image_urls':arrFilePaths}

fileOut = file('out.json', 'w')
fileOut.write(pprint.pformat( buildTree( "/Users/maxwellclarke/Dropbox/Documents/Gramma O's Recipe Project" ) ) )
fileOut.close()

# TODO: build real __MAIN__ to run from CLI

