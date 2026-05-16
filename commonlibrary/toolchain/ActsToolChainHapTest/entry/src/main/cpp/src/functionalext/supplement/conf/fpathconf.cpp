/*
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

#include <climits>
#include <unistd.h>
#include "functionalext.h"

/**
 * @tc.name      : Fpathconf0100
 * @tc.desc      : Verify that you can query values related to file system limits and options
 *                 (each parameter is valid, the name parameter is _PC_LINK_MAX,)
 * @tc.level     : Level 0
 */
void Fpathconf0100(void)
{
    long result = fpathconf(0, _PC_LINK_MAX);
    if (result < static_cast<long>(_POSIX_LINK_MAX)) {
        t_error("[%s] failed: fpathconf _PC_LINK_MAX %ld < _POSIX_LINK_MAX %ld\n",
                __func__,
                result,
                static_cast<long>(_POSIX_LINK_MAX));
    }
}

/**
 * @tc.name      : Fpathconf0200
 * @tc.desc      : Verify that you can query values related to file system limits and options
 *                 (each parameter is valid, the name parameter is _PC_SOCK_MAXBUF,)
 * @tc.level     : Level 0
 */
void Fpathconf0200(void)
{
    long result = fpathconf(0, _PC_SOCK_MAXBUF);
    EXPECT_EQ("Fpathconf0200", result, -1);
}

/**
 * @tc.name      : Fpathconf0300
 * @tc.desc      : Verify that you can query values related to file system limits and options
 *                 (each parameter is valid, the name parameter is _PC_FILESIZEBITS,)
 * @tc.level     : Level 0
 */
void Fpathconf0300(void)
{
    long result = fpathconf(0, _PC_FILESIZEBITS);
    EXPECT_EQ("Fpathconf0300", result, FILESIZEBITS);
}

/**
 * @tc.name      : Fpathconf0400
 * @tc.desc      : Verify that you can query values related to file system limits and options
 *                 (each parameter is valid, the name parameter is _PC_2_SYMLINKS,)
 * @tc.level     : Level 0
 */
void Fpathconf0400(void)
{
    long result = fpathconf(0, _PC_2_SYMLINKS);
    EXPECT_EQ("Fpathconf0400", result, 1);
}

/**
 * @tc.name      : Fpathconf0500
 * @tc.desc      : Verify that you can query values related to file system limits and options
 *                  (each parameter is valid, the name parameter is 1000,)
 * @tc.level     : Level 2
 */
void Fpathconf0500(void)
{
    long result = fpathconf(0, 1000);
    EXPECT_EQ("Fpathconf0500", result, -1);
}

static int FpathconfTestImpl(int argc, char* argv[])
{
    Fpathconf0100();
    Fpathconf0200();
    Fpathconf0300();
    Fpathconf0400();
    Fpathconf0500();
    return T_STATUS;
}

int FpathconfTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return FpathconfTestImpl(1, libcArgvStub);
}
