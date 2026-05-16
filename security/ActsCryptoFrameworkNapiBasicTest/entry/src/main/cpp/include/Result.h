/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#ifndef HCF_RESULT_H
#define HCF_RESULT_H

typedef enum HcfResult {
    /** Indicates success. */
    HCF_SUCCESS = 0,
    /** Indicates that input params is invalid . */
    HCF_INVALID_PARAMS = -10001,
    /** Indicates that function or algorithm is not supported. */
    HCF_NOT_SUPPORT = -10002,

    /** Indicates that memory malloc fails. */
    HCF_ERR_MALLOC = -20001,
    /** Indicates that call napi api fails. */
    HCF_ERR_NAPI = -20002,

    /** Indicates that third part has something wrong. */
    HCF_ERR_CRYPTO_OPERATION = -30001,
} HcfResult;
 
#endif //HCF_RESULT_H
