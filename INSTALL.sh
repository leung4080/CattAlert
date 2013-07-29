#/usr/bin/sh
#===============================================================================
#
#          FILE: INSTALL.sh
# 
#         USAGE: ./INSTALL.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: LiangHuiQiang (), Leung4080@gmail.com
#  ORGANIZATION: 
#       CREATED: 2013/7/29 9:40:44 中国标准时间
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error

USERID=`id |cut -f2 -d "="|cut -f1 -d "("`
if [ $USERID -gt 0 ] ; then echo "need root ! exit." ; exit 0; fi
cd `dirname $0`;



DATE=`date +%Y%m%d`
#BACKUP FILE
if [ ! -f /etc/motd_$DATE ] ; then 
          /bin/cp /etc/motd /etc/motd_$DATE ;
fi
if [ ! -f /etc/profile_$DATE ] ; then
          /bin/cp /etc/profile /etc/profile_$DATE;
fi


SysType=`uname`
case $SysType in
  Linux)

      if [ -f ./motd_Linux ] ; then 
        /bin/cp ./motd_Linux ./motd
        /usr/bin/install -v -m 644 ./motd /etc/motd ; 
        /bin/rm -f ./motd
      fi

      if [ -f ./profile.d/profile-cattsoft.sh ] ; then /usr/bin/install -v -m 755 ./profile.d/profile-cattsoft.sh /etc/profile.d/profile-cattsoft.sh ; fi

    ;;
  SunOS)
      SysRelease=`uname -r`
      if [ $SysRelease = "5.10" ] ;then 
          /bin/cp ./motd_$SysType$SysRelease ./motd
          /usr/sbin/install -f /etc -m 644 ./motd /etc/motd  ; 
          /bin/rm -f ./motd
      fi
      HADChange=`grep "Current User" /etc/profile |wc -l`
      if [ $HADChange  -eq  0 ] ; then
     	  cat ./profile.d/profile_SunOS >> /etc/profile 
    	fi
    ;;
  AIX)
      
      SysRelease=`uname -v`.`uname -r`
      /bin/cp ./motd_$SysType$SysRelease ./motd 
      /usr/bin/install -f /etc -M 444 ./motd /etc/motd ;
      /bin/rm -f ./motd
      HADChange=`grep "Current User" /etc/profile| wc -l `
      if [ $HADChange  -eq  0 ] ; then
     	  cat ./profile.d/profile_AIX >> /etc/profile 
    	fi
    ;;
  HPUX)
    ;;
  *)
    ;;

esac    # --- end of case ---

LANG=C echo "如需修改登录提示，请修改 ./motd_$SysType$SysRelease  文件，并重新运行此脚本:sh INSTALL.sh"

