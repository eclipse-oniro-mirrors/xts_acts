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
#include <pthread.h>

#include "pthread_util.h"

#define DEFAULT_GUARD_SIZE 8192

static void PthreadGuardSize0100(void)
{
    pthread_attr_t attr = { 0 };
    size_t guardSize = 0;
    pthread_attr_init(&attr);
    pthread_attr_getguardsize(&attr, &guardSize);
#ifdef TARGET_GUARD_SIZE
    TEST(guardSize == TARGET_GUARD_SIZE);
#else
    TEST(guardSize == DEFAULT_GUARD_SIZE);
#endif
}

static TEST_FUN g_gFunArray[] = {
    PthreadGuardSize0100,
};

static int PthreadGuardSizeTestImpl(void)
{
    int num = sizeof(g_gFunArray) / sizeof(TEST_FUN);
    for (int pos = 0; pos < num; ++pos) {
        g_gFunArray[pos]();
    }
    return T_STATUS;
}

int PthreadGuardSizeTest(void)
{
    return PthreadGuardSizeTestImpl();
}
