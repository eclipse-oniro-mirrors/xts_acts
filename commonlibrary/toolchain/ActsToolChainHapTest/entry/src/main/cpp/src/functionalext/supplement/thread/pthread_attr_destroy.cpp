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

/**
 * @tc.name      : PthreadAttrDestroy0100
 * @tc.desc      : The parameters are valid and the function can return normally
 * @tc.level     : Level 0
 */
void PthreadAttrDestroy0100(void)
{
    pthread_attr_t attr;
    int result = pthread_attr_destroy(&attr);
    EXPECT_EQ("PthreadAttrDestroy0100", result, 0);
}

static int PthreadAttrDestroyTestImpl(int argc, char* argv[])
{
    PthreadAttrDestroy0100();

    return T_STATUS;
}

int PthreadAttrDestroyTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return PthreadAttrDestroyTestImpl(1, libcArgvStub);
}
