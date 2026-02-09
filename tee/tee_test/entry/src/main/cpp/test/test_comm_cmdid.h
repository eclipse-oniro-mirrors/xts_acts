/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#ifndef __TEST_COMM_CMDID_H__
#define __TEST_COMM_CMDID_H__

typedef enum {
    TEE_TEST_VALUE = 0x1000,
    TEE_TEST_BUFFER,
    TEE_TEST_ALLTYPE,
    TEE_TEST_WRITE_OVERFOLW,
    TEE_TEST_SHAREMEM,
} CommCmdId;

#endif
