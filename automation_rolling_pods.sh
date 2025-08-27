#!/bin/bash
rizki@master:~/script$ cat automation_rolling_update_pods.sh
#!/bin/bash
while true
do
        echo "rolling update pods!!!!"
        pods1="$(kubectl get deployment | grep test1 | awk '{print $1}')"
        image_pods="$(kubectl describe pods $pods1 | awk '/Image:/ {print$2}' )"
        if [[ -n "$pods1" ]]
        then
                kubectl rollout restart deployment/$pods1
                echo "ALERT PODSS!!!" | mail -s "ROLLING UPDATE TO PODS $pods1" youremail@gmail.com
                break
        fi
done
