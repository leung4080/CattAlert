
if [ $TERM != "dumb" ] ; then
	echo "Current User:" $USER  "($LANG)"
	if [ $UID -eq 0 ] ; then
		if [ "$LANG" == "zh_CN.GB18030" ] ; then
		LANG=zh_CN.GB18030  echo "������root�����û����У����û�ִ�еĶ�������ʹϵͳ����޷��ָ�����!!"
		elif [ `echo $LANG|awk -F"." '{print $2}'` = "UTF-8" ] ; then
		LANG=zh_CN.UTF-8  echo "������root�����û����У����û�ִ�еĶ�������ʹϵͳ����޷��ָ�����!!"
		fi
	fi

fi
