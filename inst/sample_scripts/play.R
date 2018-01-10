dfi <- setClass(
  "data.frame.improved",
  representation(
    tmp = "numeric"
  ),
  contains = "data.frame"
)

setGeneric("as.dfi", function(x) {
  standardGeneric("as.dfi")
})

setMethod(
  "as.dfi",
  signature("data.frame"),
  function(x){
    return(new(Class = "data.frame.improved",
               .Data = slot(x, ".Data"),
               names = slot(x, "names"),
               row.names = slot(x, "row.names"),
               .S3Class = slot(x, ".S3Class"),
               tmp = 111))
  }
)

setMethod(
  "as.data.frame",
  signature("data.frame.improved"),
  function(x){
    return(new(Class = "data.frame",
               .Data = slot(x, ".Data"),
               names = slot(x, "names"),
               row.names = slot(x, "row.names"),
               .S3Class = slot(x, ".S3Class")))
  }
)

setMethod(
  "ncol",
  signature("data.frame.improved"),
  function(x){
    return(ncol(as.data.frame(x))+1)
  }
)

setMethod(
  "select",
  signature("data.frame.improved"),
  function(x){
    return(new(Class = "data.frame",
               .Data = slot(x, ".Data"),
               names = slot(x, "names"),
               row.names = slot(x, "row.names"),
               .S3Class = slot(x, ".S3Class")))
  }
)
