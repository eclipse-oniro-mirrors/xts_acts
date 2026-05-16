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

#include <cstdlib>
#include <pthread.h>
#include <unistd.h>
#include "functionalext.h"

const int32_t STACK_SIZE = 4 * 1024;

/**
 * @tc.name      : PthreadAttrSetstacksize0100
 * @tc.desc      : Verify pthread_attr_setstacksize process success
 * @tc.level     : Level 1
 */
void PthreadAttrSetstacksize0100(void)
{
    pthread_attr_t attr;
    pthread_attr_init(&attr);
    int32_t ret = pthread_attr_setstacksize(&attr, STACK_SIZE);
    EXPECT_EQ("PthreadAttrSetstacksize0100", ret, 0);
    pthread_attr_destroy(&attr);
}

/**
 * @tc.name      : PthreadAttrSetstacksize0200
 * @tc.desc      : Verify pthread_attr_setstacksize process fail because second param is unsigned large numbers
 * @tc.level     : Level 2
 */
void PthreadAttrSetstacksize0200(void)
{
    pthread_attr_t attr;
    pthread_attr_init(&attr);
    int32_t ret = pthread_attr_setstacksize(&attr, -1);
    EXPECT_EQ("PthreadAttrSetstacksize0200", ret, EINVAL);
    pthread_attr_destroy(&attr);
}

static int PthreadAttrSetstacksizeTestTestImpl(int argc, char* argv[])
{
    PthreadAttrSetstacksize0100();
    PthreadAttrSetstacksize0200();
    return T_STATUS;
}

int PthreadAttrSetstacksizeTestTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return PthreadAttrSetstacksizeTestTestImpl(1, libcArgvStub);
}
