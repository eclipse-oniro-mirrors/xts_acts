/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
 */

#include <AbilityKit/native_child_process.h>
#include <cstdlib>
#include <cstring>
#include <iostream>
#include <map>
#include <string>
#include <unistd.h>
#include <hilog/log.h>

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x3200
#define LOG_TAG "CHILD_TAG"

extern "C" {
void Main(NativeChildProcess_Args args)
{
    // 子进程的入口函数，实现子进程的业务逻辑
    // 函数返回后子进程随即退出
    OH_LOG_INFO(LOG_APP, "NativeChildProcess Main Enter ===================");
    OH_LOG_INFO(LOG_APP, "entryParams:%{public}s", args.entryParams);
    auto successMsg = "SUCC";    

    OH_LOG_INFO(LOG_APP, "=================== start loop");
    NativeChildProcess_Fd *current = args.fdList.head;
    NativeChildProcess_Args *args_global = OH_Ability_GetCurrentChildProcessArgs();
    OH_LOG_INFO(LOG_APP, "entryParams:%{public}s", args_global->entryParams);
    if (current != nullptr) {
        auto fdName = current->fdName;
        auto fd = current->fd;
        OH_LOG_INFO(LOG_APP, "=================== fd:%{public}d", fd);
        int32_t bufferLen = 5;
        std::vector<char> buffer(bufferLen);
        ssize_t bytesRead = read(fd, buffer.data(), buffer.size());
        OH_LOG_INFO(LOG_APP, "read Result:%{public}s", buffer.data());
        write(fd, successMsg, strlen(successMsg));
        current = current->next;
        close(fd);
    }
    OH_LOG_INFO(LOG_APP, "=================== end");
}
}