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

#include <pwd.h>
#include "libc_test_shim.h"

int GetpwnamRCrashTest()
{
    struct passwd* pw;
    struct passwd pwbuf;
    char buf[1024];
    (void)getpwnam_r("nonsensical_user", &pwbuf, buf, sizeof buf, &pw);

    return SUCCESS_CODE;
}
