  
declare namespace tei = "http://www.tei-c.org/ns/1.0";

for $file in collection("C:\Users\julia\Downloads\TEI-XML-Annotated")//tei:text
let $distinctElements := distinct-values($file//*/name())
return
  <results>
  {
    for $element in $distinctElements
    return
      element { $element } {
        for $attr in distinct-values($file//*/[@* and name() = $element]/@*/name())
        return attribute { $attr } { $file//*/[@* and name() = $element]/@*[name() = $attr] },
        $file//*/[name() = $element]/node()
      }
  }
  </results>
