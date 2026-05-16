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

#include <syslog.h>

#include "test.h"

const int MASKPRI = LOG_UPTO(LOG_WARNING);

/**
 * @tc.name      : Setlogmask0100
 * @tc.desc      : set log priority mask
 * @tc.level     : Level 0
 */
void Setlogmask0100(void)
{
    int result = setlogmask(MASKPRI);
    result = setlogmask(result);
    if (result != MASKPRI) {
        t_error("%s failed: result = %d\n", __func__, result);
    }
}

/**
 * @tc.name      : Setlogmask0200
 * @tc.desc      : set log an invalid priority mask
 * @tc.level     : Level 2
 */
void Setlogmask0200(void)
{
    int result = setlogmask(0);
    if (result != setlogmask(result)) {
        t_error("%s failed: result = %d\n", __func__, result);
    }
}

static int SetlogmaskTestImpl(int argc, char* argv[])
{
    Setlogmask0100();
    Setlogmask0200();

    return T_STATUS;
}

int SetlogmaskTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return SetlogmaskTestImpl(1, libcArgvStub);
}
