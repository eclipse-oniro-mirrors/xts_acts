/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

#include <threads.h>
#include "functionalext.h"

/**
 * @tc.name      : CndInit0100
 * @tc.desc      : Verify that a new condition variable can be initialized
 * @tc.level     : Level 0
 */
void CndInit0100(void)
{
    cnd_t buf;
    int result = cnd_init(&buf);
    EXPECT_EQ("CndInit0100", result, thrd_success);
    cnd_destroy(&buf);
}

static int CndInitTestWithArgs(int argc, char* argv[])
{
    CndInit0100();
    return T_STATUS;
}

int CndInitTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return CndInitTestWithArgs(1, libcArgvStub);
}
