/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

#include "dso_easy_symver.h"
#include "dso_hard_symver.h"
#include "dso_no_symver.h"
#include "dso_symver.h"

/**
 * @tc.name      : dynlink_0100
 * @tc.desc      : invoke a symbol without versions directly
 * @tc.level     : Level 0
 */
void Dynlink0100(void)
{
    symver_log("start");

    const char *result = dso_no_symver();
    symver_streq(result, DSO_NO_SYMVER_SYMBOL);

    symver_log("end");
}

/**
 * @tc.name      : dynlink_0200
 * @tc.desc      : invoke a symbol with versions directly
 * @tc.level     : Level 1
 */
void Dynlink0200(void)
{
    symver_log("start");

    const char *result = dso_easy_symver();
    symver_streq(result, DSO_EASY_SYMVER_SYMBOL_STABLE);

    symver_log("end");
}

/**
 * @tc.name      : dynlink_0300
 * @tc.desc      : invoke a symbol with versions directly
 * @tc.level     : Level 1
 */
void Dynlink0300(void)
{
    symver_log("start");

    const char *result = dso_hard_symver_ld();
    symver_streq(result, DSO_HARD_SYMVER_LD_SYMBOL_STABLE);

    symver_log("end");
}

static int DynlinkTestImpl(int argc, char *argv[])
{
    symver_log("start");

    Dynlink0100();
    Dynlink0200();
    Dynlink0300();

    symver_log("t_status = %d", g_tStatus);
    symver_log("end");

    return g_tStatus;
}

int DynlinkTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return DynlinkTestImpl(1, libcArgv);
}
