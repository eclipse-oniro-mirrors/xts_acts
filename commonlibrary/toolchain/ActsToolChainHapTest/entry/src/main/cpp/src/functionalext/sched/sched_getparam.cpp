/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
#include <cstdio>
#include <cstring>
#include <sched.h>
#include "functionalext.h"
#include "test.h"

/**
 * @tc.name      : sched_getparam
 * @tc.desc      : When param is nullptr, call sched_getparam.
 * @tc.level     : Level 2
 */
static void SchedGetparam0010(void)
{
    EXPECT_EQ(SchedGetparam0010, sched_getparam(getpid(), nullptr), -1);
}

static int SchedGetparamTestImpl(void)
{
    SchedGetparam0010();
    return T_STATUS;
}

int SchedGetparamTest(void)
{
    return SchedGetparamTestImpl();
}
