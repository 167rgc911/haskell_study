*** scrapy ***

>>> fetch("https://book.realworldhaskell.org/read/")
>>> r = response
>>> l = [ d.attrib["href"] for d in response.xpath("//li/a") ]
>>> import os.path
>>> cnt = 0
>>> for f in l:
...   u = r.urljoin(os.path.basename(f))
...   fetch(u)
...   with open("{:02}".format(cnt) + os.path.basename(f), 'w') as hsf:
...     hsf.write(response.text) 
...   cnt += 1

