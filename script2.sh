vaide@VaidehiGupta:~/project$ cat script2.sh
#!/bin/bash

pkg="git"

echo "checking $pkg..."

if dpkg -l | grep -q "^ii  $pkg "
then
    echo "$pkg is installed"

    apt show "$pkg" 2>/dev/null | grep -E 'Version|Homepage|Download-Size'
else
    echo "$pkg is not installed"
    echo "run: sudo apt install $pkg"
fi

echo ""

case "$pkg" in
    httpd|apache2)
        echo "apache is used to run websites" ;;
    mysql|mysql-server)
        echo "mysql is used to store data for apps" ;;
    git)
        echo "git helps track code changes" ;;
    vlc)
        echo "vlc plays almost all video and audio" ;;
    firefox)
        echo "firefox is a browser for everyday use" ;;
    *)
        echo "this is an open source package" ;;
esac
