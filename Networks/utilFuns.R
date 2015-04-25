library(codetools)

# Allow to collect functions from other packages and then color code them based on where they come from.

# Color the edges based on the number of calls.

# Make this in D3 or with SVG annotations.

getFunctionNetwork =
function(pkg, within = TRUE)
{
 if(!grepl(":", pkg))
     pkg = paste("package", pkg, sep = ":")

 funs = getPackageFunctions(pkg)
 calls = lapply(funs, getCalledFuns, names(funs))

 if(within)
     lapply(calls, intersect, names(funs))
 else
     calls
}

getCalledFuns =
function(f, knownFuns = character())
{
  vars = findGlobals(f, FALSE)
#  unique( c(vars$functions, intersect(vars$variables, knownFuns)) )
  intersect(c(vars$functions, vars$variables), knownFuns)   
}

getPackageFunctions =
function(pkg)
{
 ids = ls(pkg)
 isFun = sapply(ids, function(v) is.function(get(v, pkg)))

 ns = getNamespace(gsub(".*:", "", pkg))
 funs = mget(ids[isFun], ns, ifnotfound = list(NULL))  # or inherits = TRUE
 funs[ ! sapply(funs, is.null) ]
}
