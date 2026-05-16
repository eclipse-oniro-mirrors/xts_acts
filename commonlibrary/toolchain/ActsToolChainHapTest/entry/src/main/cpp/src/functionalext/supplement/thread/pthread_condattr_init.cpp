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
 * @tc.name      : PthreadCondattrInit0100
 * @tc.desc      : Verify pthread_condattr_init process success
 * @tc.level     : Level 1
 */
void PthreadCondattrInit0100(void)
{
    pthread_condattr_t condattr;
    int32_t ret = pthread_condattr_init(&condattr);
    EXPECT_EQ("PthreadCondattrInit0100", ret, 0);
    pthread_condattr_destroy(&condattr);
}

static int PthreadCondattrInitTestTestImpl(void)
{
    PthreadCondattrInit0100();
    return T_STATUS;
}

int PthreadCondattrInitTestTest(void)
{
    return PthreadCondattrInitTestTestImpl();
}
