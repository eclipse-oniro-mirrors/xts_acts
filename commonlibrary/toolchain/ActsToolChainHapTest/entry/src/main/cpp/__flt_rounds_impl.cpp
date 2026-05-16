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

#include "__flt_rounds_impl.h"
#include <cfenv>
#include <cfloat>

namespace {
constexpr int K_FLT_ROUND_TOWARD_ZERO = 0;
constexpr int K_FLT_ROUND_TO_NEAREST = 1;
constexpr int K_FLT_ROUND_UPWARD = 2;
constexpr int K_FLT_ROUND_DOWNWARD = 3;
constexpr int K_FLT_ROUND_UNKNOWN = -1;
} // namespace

int FltRounds()
{
    switch (fegetround()) {
#ifdef FE_TOWARDZERO
        case FE_TOWARDZERO:
            return K_FLT_ROUND_TOWARD_ZERO;
#endif
        case FE_TONEAREST:
            return K_FLT_ROUND_TO_NEAREST;
#ifdef FE_UPWARD
        case FE_UPWARD:
            return K_FLT_ROUND_UPWARD;
#endif
#ifdef FE_DOWNWARD
        case FE_DOWNWARD:
            return K_FLT_ROUND_DOWNWARD;
#endif
        default:
            break;
    }
    return K_FLT_ROUND_UNKNOWN;
}
