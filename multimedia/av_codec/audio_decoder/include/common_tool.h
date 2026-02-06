/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

#ifndef COMMON_TOOL_H
#define COMMON_TOOL_H

#include <iostream>
#include <string>
#include <ctime>
#include <sys/time.h>
#include <stdint.h>

#include "nocopyable.h"

namespace OHOS {
namespace MediaAVCodec {
constexpr int32_t FUZZ_TEST_NUM = 2000;
constexpr int32_t REPEAT_CALL_NUM = 2000;
constexpr int32_t RUN_TIME = 2 * 3600;
constexpr int32_t CONSTASNTS = 256;
constexpr int32_t STRING_LEN = 65535;
constexpr int32_t RAND_INT_MIN = -1000000;
constexpr int32_t RAND_INT_MAX = 1000000;
constexpr double DOUBLE_MIN = -10000;
constexpr double DOUBLE_MAX = 10000;

class CommonTool : public NoCopyable {
public:
    CommonTool();
    ~CommonTool() = default;

    std::string GetRandString();
    int32_t GetRandInt();
    int64_t GetRandLong();
    float GetRandFloat();
    double GetRandDouble();
};
} // namespace MediaAVCodec
} // namespace OHOS

#endif // COMMON_TOOL_H