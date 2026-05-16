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

#include <pthread.h>
#include "functionalext.h"

const int SUCCESS = 0;

/**
 * @tc.name      : pthread_cond_init_0100
 * @tc.desc      : The pthread_cond_init initialization parameter is valid,
 *                 and the parameter assignment can be passed normally
 * @tc.level     : Level 0
 */
void PthreadCondInit0100()
{
    static pthread_cond_t cond = PTHREAD_COND_INITIALIZER;
    int back = pthread_cond_init(&cond, nullptr);
    EXPECT_EQ("pthread_cond_init_0100", back, SUCCESS);
}

/**
 * @tc.name      : pthread_cond_init_0200
 * @tc.desc      : The pthread_cond_init initialization parameter is valid,
 *                 the parameter assignment can be passed normally, and the thread can be created normally
 * @tc.level     : Level 0
 */
void PthreadCondInit0200()
{
    static pthread_cond_t cond = PTHREAD_COND_INITIALIZER;
    pthread_condattr_t a;
    pthread_condattr_init(&a);
    int back = pthread_cond_init(&cond, &a);
    pthread_condattr_destroy(&a);
    EXPECT_EQ("pthread_cond_init_0200", back, SUCCESS);
}

static int PthreadCondInitTestImpl(int argc, char *argv[])
{
    PthreadCondInit0100();
    PthreadCondInit0200();
    return g_tStatus;
}

int PthreadCondInitTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return PthreadCondInitTestImpl(1, libcArgv);
}
