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
#include <sys/times.h>

#include "test.h"

/**
 * @tc.name      : Times0100
 * @tc.desc      : get process times
 * @tc.level     : Level 0
 */
void Times0100(void)
{
    struct tms buf;
    clock_t result = times(&buf);
    if (result < 0) {
        t_error("%s failed: result = %d\n", __func__, result);
        return;
    }

    if (buf.tms_utime < 0) {
        t_error("%s failed: buf.tms_utime = %d\n", __func__, buf.tms_utime);
    }

    if (buf.tms_stime < 0) {
        t_error("%s failed: buf.tms_stime = %d\n", __func__, buf.tms_stime);
    }

    if (buf.tms_cutime < 0) {
        t_error("%s failed: buf.tms_cutime = %d\n", __func__, buf.tms_cutime);
    }

    if (buf.tms_cstime < 0) {
        t_error("%s failed: buf.tms_cstime = %d\n", __func__, buf.tms_cstime);
    }
}

/**
 * @tc.name      : Times0200
 * @tc.desc      : get process times with nullptr
 * @tc.level     : Level 2
 */
void Times0200(void)
{
    clock_t result = times(nullptr);
    if (result < 0) {
        t_error("%s failed: result = %d\n", __func__, result);
        return;
    }
}

static int TimesTestImpl(int argc, char* argv[])
{
    Times0100();
    Times0200();

    return T_STATUS;
}

int TimesTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return TimesTestImpl(1, libcArgvStub);
}
