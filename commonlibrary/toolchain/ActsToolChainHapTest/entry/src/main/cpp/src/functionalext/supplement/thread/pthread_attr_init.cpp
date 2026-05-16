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

#include <pthread.h>
#include "functionalext.h"

const int SUCCESS = 0;

void* ThreadFun(void* arg)
{
    return nullptr;
}

/**
 * @tc.name      : PthreadAttrInit0100
 * @tc.desc      : Initialize the thread properties, the parameters are valid,
 *                 and the parameter assignment can be passed normally
 * @tc.level     : Level 0
 */
void PthreadAttrInit0100(void)
{
    pthread_attr_t attr;
    int back = pthread_attr_init(&attr);
    EXPECT_EQ("PthreadAttrInit0100", back, SUCCESS);
    (void)pthread_attr_destroy(&attr);
}

/**
 * @tc.name      : PthreadAttrInit0200
 * @tc.desc      : Initialize the thread attributes, the parameters are valid, the parameter assignment can
 *                 be passed normally, and the thread is created to pass the parameter pthread_attr_t
 * @tc.level     : Level 0
 */
void PthreadAttrInit0200(void)
{
    pthread_attr_t attr;
    pthread_t myThread1;
    int back = pthread_attr_init(&attr);
    int result = pthread_create(&myThread1, &attr, ThreadFun, nullptr);
    pthread_join(myThread1, nullptr);
    EXPECT_EQ("PthreadAttrInit0200", back, SUCCESS);
    EXPECT_EQ("PthreadAttrInit0200", result, SUCCESS);
    (void)pthread_attr_destroy(&attr);
}

static int PthreadAttrInitTestImpl(int argc, char* argv[])
{
    PthreadAttrInit0100();
    PthreadAttrInit0200();

    return T_STATUS;
}

int PthreadAttrInitTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return PthreadAttrInitTestImpl(1, libcArgvStub);
}
