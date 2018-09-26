for f in `ls Activity_1*`
do
    gsed -i -e 's/_Fig_/_Fig_0/g; s/_Fig_01/_Fig_1/g; s/_Fig_1./_Fig_01./g' $f
done
	 
