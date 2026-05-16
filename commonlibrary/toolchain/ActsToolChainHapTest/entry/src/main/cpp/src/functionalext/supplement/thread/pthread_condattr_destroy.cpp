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

/**
 * @tc.name      : PthreadCondattrDestroy0100
 * @tc.desc      : Verify pthread_condattr_destroy process succes
 * @tc.level     : Level 1
 */
void PthreadCondattrDestroy0100(void)
{
    pthread_condattr_t condattr;
    pthread_condattr_init(&condattr);
    int32_t ret = pthread_condattr_destroy(&condattr);
    EXPECT_EQ("PthreadCondattrDestroy0100", ret, 0);
}

static int PthreadCondattrDestroyTestTestImpl(void)
{
    PthreadCondattrDestroy0100();
    return T_STATUS;
}

int PthreadCondattrDestroyTestTest(void)
{
    return PthreadCondattrDestroyTestTestImpl();
}
