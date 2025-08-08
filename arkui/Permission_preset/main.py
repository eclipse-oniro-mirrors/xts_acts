# 1.本地查看采集的性能指标，需要在main.py的pass_dict['user_define']中将whether_upload设置为False:
# "whether_upload": "False" # 上传关了，本地生成报告
# "whether_upload": "True" # 上传开了，本地没报告
# "minicap_enable": "True" # 打开完成时延采集开关
# "runtimeLoad": "mid" # 运行时后台负载窗口数量：min = 15窗, mid = 23窗, max = 27窗
# "device_check_enable": "False"  # 温度检测开关
# "hardinput_enable": "False"  # 硬件注入开关。双指捏合的操作，需要打开硬件注入
# "trace_extra_tag": "nweb"  # trace采集指标扩展参数，可以自定义添加多个参数，中间用空格隔开
# "systrace_on": "False"  # 关闭生成sys二进制trace文件，生成默认.ftrace文件
# 本地需要丢帧数据时，pass_dict['user_define']中加入"whether_upload": "False"即可
# 本地需要完成时延数据，pass_dict['user_define']中除了"whether_upload": "False"外，再加入"minicap_enable": "True"
# 另外，本地采集完成时延指标时，采集器collect-frame版本需要更新到2.2.22, hypium更新到1.6.32版本及以上

import os
import time
from xdevice.__main__ import main_process

try:
    pass_dict = dict()
    pass_dict['task_id'] = time.strftime('%Y%m%d%H%M%S', time.localtime())
    pass_dict['user_define'] = {"action_mode": "quickly",
                                "device_check_enable": "False",
                                "hardinput_enable": "True",  # 硬件注入开关
                                "whether_upload": "False",
                                "minicap_enable": "False",
                                "systrace_on": "False",  # 关闭生成sys二进制trace文件，生成默认.ftrace文件
                                "taskEnv": "oh_phone",  # 设备类型
                                "testModel": "scene",  # 测试模型
                                }

    # task_id, 滑动速度等工厂中由agent下发时指定，通过pass_through参数透传给执行器
    # cmd = 'run -l action_testsuite -ta pass_through:' + str(pass_dict)
    cmd = 'run -l Permission_Preset -ta pass_through:' + str(pass_dict)
    main_process(cmd)
    time.sleep(30)
except Exception as e:
    print(e)
finally:
    os.system("adb forward --remove-all")
