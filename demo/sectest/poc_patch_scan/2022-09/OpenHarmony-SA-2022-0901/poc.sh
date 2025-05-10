#!/bin/bash
# Copyright (C) 2023 Huawei Device Co., Ltd.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


#//OpenHarmony标准系统中cJSON库解析900层的嵌套json数据大概会占用60KB栈空间
#修改栈的存储上限，模拟栈资源紧缺的情况，便于触发栈溢出
#或者也可以继续增加嵌套的层数，使栈溢出，每增加一层会多占用64B的栈空间
ulimit -s 60

#运行poc可执行程序
./poc 
