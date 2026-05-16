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

#include <cerrno>
#include <climits>
#include <cstddef>
#include <cstring>
#include <unistd.h>
#include "functionalext.h"

namespace {
constexpr size_t K_GETCWD_BUF_BYTES = 200U;
} // namespace

// Manual test result
char* g_manual = "/data/tests/libc-test/src/";
// hdc shell test result
char* g_hdcAuto = "/";

/*
 * @tc.name      : Getcwd0100
 * @tc.desc      : Verify that the absolute PATH of the current working directory can be obtained
 *                 (parameters are valid)
 * @tc.level     : Level 0
 */
void Getcwd0100(void)
{
    char buf[K_GETCWD_BUF_BYTES] = { 0 };
    char* result = getcwd(buf, sizeof(buf));
    if (!(strcmp(result, g_manual) ^ strcmp(result, g_hdcAuto))) {
        t_error(
            "%s getcwd failed, except result is %s when g_manual or %s when hdc test\n", __func__, g_manual, g_hdcAuto);
    }
}

/*
 * @tc.name      : Getcwd0200
 * @tc.desc      : Verify that the absolute PATH of the current working directory can be obtained (parameter is nullptr)
 * @tc.level     : Level 1
 */
void Getcwd0200(void)
{
    char* result = getcwd(nullptr, K_GETCWD_BUF_BYTES);
    if (!(strcmp(result, g_manual) ^ strcmp(result, g_hdcAuto))) {
        t_error(
            "%s getcwd failed, except result is %s when g_manual or %s when hdc test\n", __func__, g_manual, g_hdcAuto);
    }
}

/*
 * @tc.name      : Getcwd0300
 * @tc.desc      : Verify that the absolute PATH of the current working directory cannot be obtained (parameter is 0)
 * @tc.level     : Level 2
 */
void Getcwd0300(void)
{
    char buf[K_GETCWD_BUF_BYTES] = { 0 };
    char* result = getcwd(buf, 0);
    if (result) {
        t_error("%s getcwd should failed, the result should be null\n", __func__);
    }
}

static int GetcwdTestImpl(int argc, char* argv[])
{
    Getcwd0100();
    Getcwd0200();
    Getcwd0300();
    return T_STATUS;
}

int GetcwdTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return GetcwdTestImpl(1, libcArgvStub);
}
