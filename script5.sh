#!/bin/bash

echo "Build your personal Open Source Story "
echo ""

read -p "1. What software or tool do you rely on the most? " tool
read -p "2. What problem do you wish technology solved for you? " problem
read -p "3. What would you create if you had unlimited skills? " dream
read -p "4. Why do you think sharing code matters? " belief

today=$(date '+%d %b %Y')
user=$(whoami)
file_name="manifesto_${user}.txt"

{
    echo "----- Open Source Story ($today) -----"
    echo ""
    echo "I am $user."
    echo ""
    echo "Every day, I depend on $tool to get things done."
    echo "But I often think about $problem."
    echo ""
    echo "If I could, I would build $dream."
    echo ""
    echo "I believe in sharing because $belief."
    echo ""
    echo "Open source is not just code — it is people helping people."
} > "$file_name"

echo -n "Writing your story"
for i in {1..3}
do
    echo -n "."
    sleep 0.5
done
echo " Done!"

echo ""
echo "Saved to: $file_name"
echo ""
echo "Your Open Source Story:"
echo "----------------------------------"
cat "$file_name"
