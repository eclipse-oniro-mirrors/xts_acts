/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

#ifndef HUKS_HMAC_TEST_H
#define HUKS_HMAC_TEST_H

#include <string>

#include "huks_three_stage_test_common.h"
namespace Unittest::Hmac
{
static const std::string g_inData =
    "Hks_HMAC_Test_000000000000000000000000000000000000000000000000000000000000000000"
    "00000000000000000000000000000000000000000000000000000000000000000000000000000000"
    "0000000000000000000000000000000000000000000000000000000000000000000000000_string";
const uint32_t COMMON_SIZE = 256;
struct GenerateKeyCaseParam {
    uint32_t id;
    int32_t result;
    struct OH_Huks_Param params[4];
};
int Security_HUKS_NAPI_HMAC_hmac_0100(void);
int Security_HUKS_NAPI_HMAC_SM3_0100(void);
}  // namespace Unittest::Hmac
#endif  // HUKS_HMAC_TEST_H