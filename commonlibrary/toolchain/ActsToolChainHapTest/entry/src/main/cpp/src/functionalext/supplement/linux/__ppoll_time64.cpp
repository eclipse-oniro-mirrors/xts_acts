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

#include <ctime>
#include <fcntl.h>
#include <poll.h>
#include <sys/stat.h>
#include "functionalext.h"

/**
 * @tc.name      : ppoll_time64_0300
 * @tc.desc      : Listen for readable file event (illegal parameter)
 * @tc.level     : Level 2
 */
void PpollTime640300(void)
{
    struct timespec timeout;
    timeout.tv_sec = 1;
    timeout.tv_nsec = 0;

    int ret = ppoll(nullptr, 1, &timeout, nullptr);
    EXPECT_EQ("PpollTime640300", ret, ERREXPECT);
}

int PpollTime64CompatTest(void)
{
    PpollTime640300();
    return T_STATUS;
}