###########################
# Author: Nirjas Jakilim
# Motive: Fetching Oracle University Guide Pages"
###########################


book_id="948288928" # insert your book_id here. this can be found on referer url.
sg_id="S105665GC20_sg" #paste your sg_id here. the systax is mainly like as : id_sg. you can find it on referer url.
referer="https://learning.oracle.com/secure_content_v2/ohr/media/948288928/V1/S105665GC20_sg/mobile/index.html" #paste your referer url here.
i=1 # Staring with page 1
while [ $i -le 209 ] # run the loop till the number of pages
do
curl -H 'authority: learning.oracle.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="98", "Google Chrome";v="98"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.80 Safari/537.36' \
  -H 'sec-ch-ua-platform: "Linux"' \
  -H 'accept: image/avif,image/webp,image/apng,image/svg+xml,image/*,*/*;q=0.8' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: no-cors' \
  -H 'sec-fetch-dest: image' \
  -H 'referer: ${referer}' \
  -H 'accept-language: en-US,en;q=0.9' \
  -H '''cookie: <paste_your_cookie here>''' \
  https://learning.oracle.com/secure_content_v2/ohr/media/${book_id}/V1/${sg_id}/files/mobile/$i.jpg -o $i.jpg --silent
i=`expr $i + 1`
done

echo "Building PDF"
img2pdf $(find . -iname '*.jpg' | sort -V) --pagesize A4 -o ../document.pdf
echo "All Done!"