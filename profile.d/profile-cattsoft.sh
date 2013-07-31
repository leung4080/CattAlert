
if [ $TERM != "dumb" ] ; then
	echo "Current User:" $USER  "($LANG)"
	if [ $UID -eq 0 ] ; then
		if [ "$LANG" == "zh_CN.GB18030" ] ; then
		LANG=zh_CN.GB18030  echo "正在以root超级用户运行，此用户执行的动作可能使系统造成无法恢复的损坏!!"
		elif [ `echo $LANG|awk -F"." '{print $2}'` = "UTF-8" ] ; then
		LANG=zh_CN.UTF-8  echo "正在以root超级用户运行，此用户执行的动作可能使系统造成无法恢复的损坏!!"
		fi
	fi

fi
