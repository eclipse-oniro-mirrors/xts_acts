/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

#include <csignal>
#include "CommonTool.h"

namespace {
constexpr int K_SIGRETURN_RAISE_FAILURE_CODE = 2;
} // namespace

static volatile sig_atomic_t g_x;

static void Handler(int s)
{
    (void)s;
    g_x = 1;
}

int SigreturnTest()
{
    (void)signal(SIGINT, Handler);
    if (raise(SIGINT)) {
        return K_SIGRETURN_RAISE_FAILURE_CODE;
    }
    if (g_x != 1) {
        return 1;
    }
    return SUCCESS_CODE;
}
