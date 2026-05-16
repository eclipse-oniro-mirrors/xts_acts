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

#include <cerrno>
#include <csignal>
#include <cstdio>
#include <cstdlib>
#include <sys/tgkill.h>
#include "libc_test_shim.h"
#define ARGV_1 12345
#define ARGV_2 34567
int TgkillTest()
{
    int status = SUCCESS_CODE;

    int tgid;
    int tid;
    tgid = ARGV_1;
    tid = ARGV_2;

    if (tgkill(tgid, tid, SIGPROF) == -1 && errno != ESRCH) {
        perror("tgkill failed");
    }

    return SUCCESS_CODE;
}
