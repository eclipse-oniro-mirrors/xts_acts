/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "huks_three_stage_test_common.h"
#ifndef HUKS_MEM_H
#define HUKS_MEM_H

#include <stdint.h>
#include <stdlib.h>

#ifdef __cplusplus
extern "C" {
#endif

void *HksMalloc(size_t size);
void HksFree(void *ptr);
int32_t HksMemCmp(const void *ptr1, const void *ptr2, uint32_t size);

#define OH_HUKS_KEY_BYTES(keySize) (((keySize) + 7) / 8)

#define HUKS_FREE_BLOB(blob) do { \
    if ((blob).data != nullptr) { \
        HksFree((blob).data); \
        (blob).data = nullptr; \
    } \
    (blob).size = 0; \
} while (0)

#ifdef __cplusplus
}
#endif

#endif /* HUKS_MEM_H */
