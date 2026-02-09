#!/usr/bin/python
# -*- coding: UTF-8 -*-
"""
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
"""

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
    cmd = 'run -l PermissionPreset'
    main_process(cmd)
    time.sleep(30)
except Exception as e:
    print(e)