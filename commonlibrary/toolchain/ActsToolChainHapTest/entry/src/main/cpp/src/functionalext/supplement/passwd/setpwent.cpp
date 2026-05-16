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
#include <cstdio>
#include <cstring>
#include <pwd.h>

#include "test.h"

/**
 * @tc.name      : Setpwent0100
 * @tc.desc      : rewinds to the beginning of the password database
 * @tc.level     : Level 0
 */
void Setpwent0100(void)
{
    errno = 0;
    struct passwd* result = getpwent();
    if (result == nullptr) {
        t_error("%s failed: getpwent\n", __func__);
    }

    if (errno != 0) {
        t_error("%s failed: getpwent. errno = %ld\n", __func__, errno);
    }

    char buf[BUFSIZ] = { 0 };
    (void)std::snprintf(buf, sizeof(buf), "%s", result->pw_name);

    setpwent();

    result = getpwent();
    if (result == nullptr) {
        t_error("%s failed: getpwent\n", __func__);
    }

    if (strcmp(result->pw_name, buf)) {
        t_error("%s failed: result->pw_name = %s\n", __func__, result->pw_name);
    }
}

static int SetpwentTestImpl(int argc, char* argv[])
{
    Setpwent0100();

    return T_STATUS;
}

int SetpwentTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return SetpwentTestImpl(1, libcArgvStub);
}
