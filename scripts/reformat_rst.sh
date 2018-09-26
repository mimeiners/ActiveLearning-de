for f in `ls Activity_*.rst`
do
    gsed -i -e 's/: math: `/ :math:`/g; s/Bild ::/figure::/g; s/img \//img\//g; s/Mathematik/math/g; s/Hinweis/note/g; s/_Figure_/_Fig_/g' $f
done
	 
