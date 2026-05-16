/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <cerrno>
#include <cstdio>
#include <cstdlib>
#include <dlfcn.h>
#include "functionalext.h"

namespace {
using MktempFn = char* (*)(char*);
char* MktempForLibcTest(char* tpl)
{
    static MktempFn fn = nullptr;
    if (fn == nullptr) {
        fn = reinterpret_cast<MktempFn>(dlsym(RTLD_DEFAULT, "mktemp"));
    }
    return (fn != nullptr) ? fn(tpl) : nullptr;
}
} // namespace

/**
 * @tc.name      : Mktemp0100
 * @tc.desc      : Create a temporary file with the correct parameters
 * @tc.level     : Level 0
 */
void Mktemp0100(void)
{
    char tempFile[] = "test-XXXXXX";
    char* ret = MktempForLibcTest(tempFile);
    EXPECT_PTRNE("Mktemp0100", ret, nullptr);
    if (ret) {
        EXPECT_NE("Mktemp0100", ret[0], 0);
    }
}

/**
 * @tc.name      : Mktemp0200
 * @tc.desc      : Create temp file with wrong template parameter
 * @tc.level     : Level 2
 */
void Mktemp0200(void)
{
    char tempFile[] = "test";
    char* ret = MktempForLibcTest(tempFile);
    EXPECT_PTRNE("Mktemp0200", ret, nullptr);
    if (ret) {
        EXPECT_EQ("Mktemp0200", ret[0], 0);
    }
}

/**
 * @tc.name      : Mktemp0300
 * @tc.desc      : Create temp file with wrong template argument (wrong template length)
 * @tc.level     : Level 2
 */
void Mktemp0300(void)
{
    char tempFile[] = "test-XX";
    char* ret = MktempForLibcTest(tempFile);
    EXPECT_PTRNE("Mktemp0300", ret, nullptr);
    if (ret) {
        EXPECT_EQ("Mktemp0300", ret[0], 0);
    }
}

/**
 * @tc.name      : Mktemp0400
 * @tc.desc      : Create temp file with template argument （'XXXXXX' not at the end）
 * @tc.level     : Level 2
 */
void Mktemp0400(void)
{
    char tempFile[] = "test-XXXXXX-dir";
    char* ret = MktempForLibcTest(tempFile);
    EXPECT_PTRNE("Mktemp0400", ret, nullptr);
    // XXXXXX is not at the end, MktempForLibcTest() will fail
    if (ret) {
        EXPECT_EQ("Mktemp0400", errno, EINVAL);
    }
}

/**
 * @tc.name      : Mktemp0500
 * @tc.desc      : Repeated calls generate unique file
 * @tc.level     : Level 1
 */
void Mktemp0500(void)
{
    char tempFile1[] = "test-XXXXXX";
    char tempFile2[] = "test-XXXXXX";
    char* ret1 = MktempForLibcTest(tempFile1);
    char* ret2 = MktempForLibcTest(tempFile2);
    EXPECT_PTRNE("Mktemp0500", ret1, nullptr);
    EXPECT_PTRNE("Mktemp0500", ret2, nullptr);
    if (ret1 && ret2) {
        EXPECT_STRNE("Mktemp0500", ret1, ret2); // The two results should be different
    }
}

/**
 * @tc.name      : Mktemp0600
 * @tc.desc      : Verify mktemp retries when file exists
 * @tc.level     : Level 1
 */
void Mktemp0600(void)
{
    char tempFile[] = "test-XXXXXX";
    char newFile[256] = { 0 };
    int fd = mkstemp(tempFile); // create file
    if (fd != -1) {
        (void)std::snprintf(newFile, sizeof(newFile), "%s", tempFile);
        char* ret = MktempForLibcTest(tempFile);
        EXPECT_PTRNE("Mktemp0600", ret, nullptr);
        if (ret) {
            EXPECT_EQ("Mktemp0600", ret[0], 0);
        }
        close(fd);
        unlink(newFile); // clean file
    }
}

static int MktempTestImpl(void)
{
    Mktemp0100();
    Mktemp0200();
    Mktemp0300();
    Mktemp0400();
    Mktemp0500();
    Mktemp0600();
    return T_STATUS;
}

int MktempTest(void)
{
    return MktempTestImpl();
}
