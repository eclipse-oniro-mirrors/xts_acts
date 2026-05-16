/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <cmath>
#include "functionalext.h"

/**
 * @tc.name      : Nan0100
 * @tc.desc      : Returns a floating point representation of NaN
 * @tc.level     : Level 0
 */
void Nan0100(void)
{
    double ret = std::nan("");
    if (fabs(ret - static_cast<double>(NAN)) > EPS) {
        t_error("Nan0100 failed \n");
    }
}

static int NanTestImpl(void)
{
    Nan0100();
    return T_STATUS;
}

int NanTest(void)
{
    return NanTestImpl();
}
