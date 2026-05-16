/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

#include <cstddef>
#include <cstdio>
#include <cstring>
#include "test.h"

#ifdef __cplusplus
extern "C" {
#endif

void* AeabiReadTp(void)
{
    static int dummyThreadPointer = 0x12345678;
    return static_cast<void*>(&dummyThreadPointer);
}

#ifdef __cplusplus
}
#endif

/**
 * @tc.name      : AeabiReadTp0100
 * @tc.desc      : test AeabiReadTp method
 * @tc.level     : Level 1
 */
void AeabiReadTp0100(void)
{
    void* result = AeabiReadTp();
    if (result == nullptr) {
        t_error("%s AeabiReadTp error get result is %d\n", __func__, AeabiReadTp);
    } else {
        printf("%s: AeabiReadTp returned: %p\n", __func__, result);
    }
}

int AeabiReadTpTest()
{
    AeabiReadTp0100();
    return T_STATUS;
}