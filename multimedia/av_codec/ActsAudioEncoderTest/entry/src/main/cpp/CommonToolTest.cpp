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

#include "common_tool.h"

using namespace std;
using namespace OHOS::MediaAVCodec;

constexpr uint32_t NUM_10 = 10;

CommonTool::CommonTool()
{
    srand(time(nullptr) * NUM_10);
}

string CommonTool::GetRandString()
{
    string str;
    int32_t len = arc4random() % STRING_LEN;
    char c;
    for (int32_t idx = 0; idx < len; idx++) {
        c = arc4random() % CONSTASNTS;
        str.push_back(c);
    }
    return str;
}

int32_t CommonTool::GetRandInt()
{
    return RAND_INT_MIN + arc4random() % (RAND_INT_MAX - RAND_INT_MIN + 1);
}

int64_t CommonTool::GetRandLong()
{
    return RAND_INT_MIN + arc4random() % (RAND_INT_MAX - RAND_INT_MIN + 1);
}

float CommonTool::GetRandFloat()
{
    return (float)arc4random() / RAND_MAX * (DOUBLE_MAX - DOUBLE_MIN) + DOUBLE_MIN;
}

double CommonTool::GetRandDouble()
{
    return (double)arc4random() / RAND_MAX * (DOUBLE_MAX - DOUBLE_MIN) + DOUBLE_MIN;
}