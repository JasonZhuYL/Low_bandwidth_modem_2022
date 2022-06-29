stty -f /dev/tty.usbmodem1103 1200
receive_file="receive.txt"
reference_file="transmit.txt"


echo "Receive script"
echo "Compiling bit error program"


chmod o+rw /dev/tty.usbmodem1103
echo "Start receiving"
(stty raw; timeout 3s cat > "$receive_file") < /dev/tty.usbmodem1103&
sleep 2 
cat "$reference_file" > /dev/tty.usbmodem1103&

wait
echo "Done receiving. Start comparision"
# ./bit_error_check.out "$receive_file" "$reference_file"




chmod o+rw /dev/tty.usbmodem1103
cat /dev/tty.usbmodem1103 > transmit.txt
