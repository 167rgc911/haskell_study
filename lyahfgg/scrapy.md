*** scrapy ***

>>> fetch("http://learnyouahaskell.com/chapters"
>>> r = response
>>> l = [ d.attrib["href"] for d in response.xpath("//li/a") if '#' not in d.attrib["href"] ]
>>> import os.path
>>> cnt = 0
>>> for f in l:
...   u = r.urljoin(os.path.basename(f))
...   fetch(u)
...   with open("{:02}".format(cnt) + os.path.basename(f) + ".html", 'w') as hsf:
...     hsf.write(response.text) 
...   cnt += 1

