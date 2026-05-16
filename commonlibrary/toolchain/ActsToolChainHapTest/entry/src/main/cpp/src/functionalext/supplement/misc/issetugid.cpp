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

#include <cstdio>
#include <unistd.h>
#include "libc_test_shim.h"
/**
 * @tc.name      : Issetugid0100
 * @tc.desc      : test whether the issetugid function get program has set gid uid
 * @tc.level     : Level 0
 */
void Issetugid0100(int& status)
{
    int result = issetugid();
    if (result != 0) {
        LibcTestError(&status, "%s issetugid error get result is %d are not 0", __func__, result);
    }
}

int IssetugidTest()
{
    int status = SUCCESS_CODE;

    Issetugid0100(status);
    return status;
}
