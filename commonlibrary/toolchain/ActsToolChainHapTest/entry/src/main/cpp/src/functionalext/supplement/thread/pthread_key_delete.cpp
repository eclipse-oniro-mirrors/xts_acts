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

#include <cstdio>
#include <pthread.h>
#include "test.h"

/**
 * @tc.name      : PthreadKeyDelete0100
 * @tc.desc      : The parameter is valid, verify that the specified data key of the destroy thread is successful
 * @tc.level     : Level 0
 */
void PthreadKeyDelete0100(void)
{
    pthread_key_t key;
    pthread_key_create(&key, nullptr);
    int result = pthread_key_delete(key);
    if (result != 0) {
        t_error("%s pthread_key_delete error get result is %d are not want 0\n", __func__, result);
    }
}

static int PthreadKeyDeleteTestImpl(int argc, char* argv[])
{
    PthreadKeyDelete0100();
    return T_STATUS;
}

int PthreadKeyDeleteTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return PthreadKeyDeleteTestImpl(1, libcArgvStub);
}
