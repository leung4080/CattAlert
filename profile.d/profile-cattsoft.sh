
if [ $TERM != "dumb" ] ; then
echo "Current User:" $USER  "($LANG)"
if [ $UID -eq 0 ] ; then
	if [ "$LANG" == "zh_CN.GB18030" ] ; then
	echo "正在以root超级用户运行，此用户执行的动作可能使系统造成无法恢复的损坏!!"
	elif [ `echo $LANG|awk -F"." '{print $2}'` == "UTF-8" ] ; then
	echo "姝ｅ湪浠oot瓒呯骇鐢ㄦ埛杩愯锛屾鐢ㄦ埛鎵ц鐨勫姩浣滃彲鑳戒娇绯荤粺閫犳垚鏃犳硶鎭㈠鐨勬崯鍧�!!"
	fi
fi
fi
