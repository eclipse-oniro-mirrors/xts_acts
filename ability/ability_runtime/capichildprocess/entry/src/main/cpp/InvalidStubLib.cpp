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

#include "AbilityKit/native_child_process.h"
#include "loghelper.h"

extern "C" {
OHIPCRemoteStub* NativeChildProcess_OnConnect()
{
    OH_LOG_INFO(LOG_APP, "Child process - OnConnect return invalid stub");
    return nullptr;
}

void NativeChildProcess_MainProc()
{
}

} // extern "C"
