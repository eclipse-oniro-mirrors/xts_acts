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

#include <sys/wait.h>
#include <unistd.h>
#include "functionalext.h"

/**
 * @tc.name      : Getpgrp0100
 * @tc.desc      : Whether the child process is in the same process group as the Parent process
 * @tc.level     : Level 0
 */
void Getpgrp0100(void)
{
    pid_t gpid = getpgrp();
    pid_t child = fork();
    EXPECT_TRUE("Getpgrp0100", child >= 0);

    if (child == 0) {
        pid_t gpidChild = getpgrp();
        EXPECT_EQ("Getpgrp0100", gpidChild, gpid);
    } else if (child > 0) {
        wait(nullptr);
    }
}

static int GetpgrpTestImpl(void)
{
    Getpgrp0100();
    return T_STATUS;
}

int GetpgrpTest(void)
{
    return GetpgrpTestImpl();
}
