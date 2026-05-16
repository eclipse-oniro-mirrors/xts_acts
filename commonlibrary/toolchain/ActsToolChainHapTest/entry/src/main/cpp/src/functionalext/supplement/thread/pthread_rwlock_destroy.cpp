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
 * @tc.name      : PthreadRwlockDestroy0100
 * @tc.desc      : Verify pthread_rwlock_destroy process success
 * @tc.level     : Level 1
 */
void PthreadRwlockDestroy0100(void)
{
    pthread_rwlock_t rwLock;
    pthread_rwlock_init(&rwLock, nullptr);
    int32_t ret = pthread_rwlock_destroy(&rwLock);
    EXPECT_EQ("PthreadRwlockDestroy0100", ret, 0);
}

static int PthreadRwlockDestroyTestTestImpl(void)
{
    PthreadRwlockDestroy0100();
    return T_STATUS;
}

int PthreadRwlockDestroyTestTest(void)
{
    return PthreadRwlockDestroyTestTestImpl();
}
