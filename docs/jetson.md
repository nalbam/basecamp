# jetson

## power mode

```bash
# 현재 모드 확인
sudo nvpmodel -q

# 최대성능
sudo nvpmodel -m0

# 절약모드
sudo nvpmodel -m1
```

## fan speed

```bash
# max
sudo sh -c 'echo 255 > /sys/devices/pwm-fan/target_pwm'

# off
sudo sh -c 'echo 0 > /sys/devices/pwm-fan/target_pwm'
```
