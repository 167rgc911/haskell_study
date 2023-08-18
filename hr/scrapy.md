*** scrapy ***

>>> fetch("https://staff.fnwi.uva.nl/d.j.n.vaneijck2/HR/")
>>> r = response
>>> l = [ d.attrib["href"] for d in response.xpath("//li/a") if ".hs" in d.attrib["href"] ]
>>> import os.path
>>> for f in l:
...   u = r.urljoin(os.path.basename(f))
...   fetch(u)
...   with open(os.path.basename(f), 'w') as hsf:
...     hsf.write(response.text) 

