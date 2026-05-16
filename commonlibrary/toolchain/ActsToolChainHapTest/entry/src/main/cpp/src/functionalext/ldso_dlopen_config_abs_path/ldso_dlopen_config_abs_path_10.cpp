/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#include <dlfcn.h>
#include <cstdio>
#include <cstdlib>
#include "functionalext.h"
#include "ldso_dlopen_config_abs_path.h"

static int LdsoDlopenConfigAbsPath10TestImpl()
{
    if (!CheckPrerequisites()) {
        printf("CheckPrerequisites failed\n");
        return g_tStatus;
    }

    DlopenConfigAbsPathPolicyFunc(false);
    DlopenConfigAbsPathPolicyFunc(true);
    if (OpenSo(true, false)) {
        printf("OpenSo with abs path succeed\n");
        g_tStatus = 1;
    }
    return g_tStatus;
}

int LdsoDlopenConfigAbsPath10Test(void)
{
    return LdsoDlopenConfigAbsPath10TestImpl();
}
