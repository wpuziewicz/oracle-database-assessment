mdkir ~/new
cp ../db_assessment/opConfig/opt*csv ~/new

sed -i '/^ $/d' ~/new/*csv
sed -i 's/,/|/g' ~/new/optcon*

