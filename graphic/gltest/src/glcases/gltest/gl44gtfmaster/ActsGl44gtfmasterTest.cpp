/*
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#include <climits>
#include <gtest/gtest.h>
#include <ctime>
#include "Gl44gtfmasterBaseFunc.h"
#include "ActsGl44gtfmasterTestSuite.h"

namespace OHOS {
    using namespace std;
    using namespace testing::ext;

    time_t ActsGl44gtfmasterTestSuite::startTime;
    time_t ActsGl44gtfmasterTestSuite::endTime;
    FuncRunResult ActsGl44gtfmasterTestSuite::runResult;

}