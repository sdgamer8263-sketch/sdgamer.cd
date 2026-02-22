#!/bin/bash
# SDGAMER WINDOWS 2016 HUB
BOLD='\033[1m' ; NC='\033[0m' ; SUCCESS='\033[0;32m' ; INFO='\033[0;34m' ; WARN='\033[0;33m' ; DANGER='\033[0;31m' ; ACCENT='\033[0;35m'
CONTAINER_NAME="windows2016"

while true; do
    LOCAL_IP=$(hostname -I | awk '{print $1}')
    [ "$(docker ps -q -f name=$CONTAINER_NAME)" ] && STATUS="${SUCCESS}RUNNING${NC}" || STATUS="${DANGER}OFFLINE${NC}"
    clear
    echo -e "${ACCENT}────────────────────────────────────────────${NC}"
    echo -e "          ${BOLD}SDGAMER WIN-2016 HUB${NC}"
    echo -e "${ACCENT}────────────────────────────────────────────${NC}"
    echo -e "  STATUS: $STATUS  |  WEB UI: http://$LOCAL_IP:6080"
    echo -e "${ACCENT}────────────────────────────────────────────${NC}"
    echo -e " [1] Install  [2] ON  [3] OFF  [4] Restart  [5] Uninstall  [0] Exit"
    read -p " Select: " choice
    case $choice in
        1) docker run -d --name $CONTAINER_NAME --privileged --device /dev/kvm -p 6080:6080 nobitaa/windows2016 ;;
        2) docker start $CONTAINER_NAME ;;
        3) docker stop $CONTAINER_NAME ;;
        4) docker restart $CONTAINER_NAME ;;
        5) docker stop $CONTAINER_NAME && docker rm $CONTAINER_NAME ;;
        0) exit 0 ;;
    esac
done
