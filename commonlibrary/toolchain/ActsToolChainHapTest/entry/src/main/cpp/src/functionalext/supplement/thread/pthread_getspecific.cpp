/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

#include <pthread.h>
#include <cstdlib>
#include <unistd.h>
#include "functionalext.h"

static pthread_key_t g_key;

static void *ThreadfuncA(void *arg)
{
    int32_t value = 0;
    int32_t ret = pthread_setspecific(g_key, &value);
    EXPECT_EQ("PthreadGetspecific0100", ret, 0);
    int32_t *keyRet = (int32_t *)pthread_getspecific(g_key);
    EXPECT_EQ("PthreadGetspecific0100", *keyRet, 0);
    return arg;
}

/**
 * @tc.name:      pthread_getspecific_0100
 * @tc.desc:      Verify pthread_getspecific process success.
 * @tc.level:     level 0
 */
void PthreadGetspecific0100(void)
{
    pthread_key_create(&g_key, nullptr);
    pthread_t tid1;
    pthread_create(&tid1, nullptr, ThreadfuncA, nullptr);
    pthread_join(tid1, nullptr);
    pthread_key_delete(g_key);
}

static int PthreadGetspecificTestImpl(void)
{
    PthreadGetspecific0100();
    return g_tStatus;
}

int PthreadGetspecificTestTest(void)
{
    return PthreadGetspecificTestImpl();
}

