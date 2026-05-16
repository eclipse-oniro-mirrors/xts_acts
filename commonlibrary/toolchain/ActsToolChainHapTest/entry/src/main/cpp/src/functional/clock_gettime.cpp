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

#include <cerrno>
#include <cstring>
#include <ctime>
#include "test.h"

int ClockGettimeTest()
{
    struct timespec ts;
    if (!(clock_gettime(CLOCK_REALTIME, &ts) == 0 && errno == 0)) {
        t_error("clock_gettime(CLOCK_REALTIME, &ts) == 0 && errno == 0 failed: %s\n", strerror(errno));
    }
    if (!(CLOCK_GETTIME64(CLOCK_REALTIME, &ts) == 0 && errno == 0)) {
        t_error("CLOCK_GETTIME64(CLOCK_REALTIME, &ts) == 0 && errno == 0 failed: %s\n", strerror(errno));
    }
    return T_STATUS;
}
