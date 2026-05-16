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

#include <dlfcn.h>

#include "dso_symver.h"

/**
 * @tc.name      : dlvsym_no_symver_0100
 * @tc.desc      : invoke a symbol with an invalid version
 * @tc.level     : Level 2
 */
void DlvsymNoSymver0100(void)
{
    symver_log("start");

    void *handle = dlopen(DSO_NO_SYMVER_NAME, RTLD_LAZY);
    if (!handle) {
        symver_error("%s", dlerror());
        return;
    }

    // Clear any existing error
    dlerror();

    functype func = (functype)dlvsym(handle, DSO_NO_SYMVER_SYMBOL, DSO_VERSION_INVALID);
    const char *error = dlerror();
    if (error == nullptr) {
        symver_error();
        return;
    }

    symver_log("error = %s", error);

    dlclose(handle);

    symver_log("end");
}

/**
 * @tc.name      : dlvsym_no_symver_0200
 * @tc.desc      : invoke an invalid symbol with an invalid version
 * @tc.level     : Level 2
 */
void DlvsymNoSymver0200(void)
{
    symver_log("start");

    void *handle = dlopen(DSO_NO_SYMVER_NAME, RTLD_LAZY);
    if (!handle) {
        symver_error("%s", dlerror());
        return;
    }

    // Clear any existing error
    dlerror();

    functype func = (functype)dlvsym(handle, DSO_SYMBOL_INVALID, DSO_VERSION_INVALID);
    const char *error = dlerror();
    if (error == nullptr) {
        symver_error();
        return;
    }

    symver_log("error = %s", error);

    dlclose(handle);

    symver_log("end");
}

/**
 * @tc.name      : dlvsym_easy_symver_0100
 * @tc.desc      : invoke a symbol with the default version
 * @tc.level     : Level 0
 */
void DlvsymEasySymver0100(void)
{
    symver_log("start");

    void *handle = dlopen(DSO_EASY_SYMVER_NAME, RTLD_LAZY);
    if (!handle) {
        symver_error("%s", dlerror());
        return;
    }

    // Clear any existing error
    dlerror();

    functype func = (functype)dlvsym(handle, DSO_EASY_SYMVER_SYMBOL, DSO_EASY_SYMVER_VERSION_STABLE);
    const char *error = dlerror();
    if (error != nullptr) {
        symver_error("%s", error);
        return;
    }

    const char *result = func();
    symver_streq(result, DSO_EASY_SYMVER_SYMBOL_STABLE);

    dlclose(handle);

    symver_log("end");
}

/**
 * @tc.name      : dlvsym_easy_symver_0200
 * @tc.desc      : invoke a symbol with a non-default version
 * @tc.level     : Level 1
 */
void DlvsymEasySymver0200(void)
{
    symver_log("start");

    void *handle = dlopen(DSO_EASY_SYMVER_NAME, RTLD_LAZY);
    if (!handle) {
        symver_error("%s", dlerror());
        return;
    }

    // Clear any existing error
    dlerror();

    functype func = (functype)dlvsym(handle, DSO_EASY_SYMVER_SYMBOL, DSO_EASY_SYMVER_VERSION_OLD);
    const char *error = dlerror();
    if (error != nullptr) {
        symver_error("%s", error);
        return;
    }

    const char *result = func();
    symver_streq(result, DSO_EASY_SYMVER_SYMBOL_OLD);

    dlclose(handle);

    symver_log("end");
}

/**
 * @tc.name      : dlvsym_easy_symver_0300
 * @tc.desc      : invoke an invalid symbol with an invalid version
 * @tc.level     : Level 2
 */
void DlvsymEasySymver0300(void)
{
    symver_log("start");

    void *handle = dlopen(DSO_EASY_SYMVER_NAME, RTLD_LAZY);
    if (!handle) {
        symver_error("%s", dlerror());
        return;
    }

    // Clear any existing error
    dlerror();

    functype func = (functype)dlvsym(handle, DSO_SYMBOL_INVALID, DSO_VERSION_INVALID);
    const char *error = dlerror();
    if (error == nullptr) {
        symver_error();
        return;
    }

    symver_log("error = %s", error);

    dlclose(handle);

    symver_log("end");
}

/**
 * @tc.name      : dlvsym_easy_symver_0400
 * @tc.desc      : invoke a symbol with an invalid version
 * @tc.level     : Level 2
 */
void DlvsymEasySymver0400(void)
{
    symver_log("start");

    void *handle = dlopen(DSO_EASY_SYMVER_NAME, RTLD_LAZY);
    if (!handle) {
        symver_error("%s", dlerror());
        return;
    }

    // Clear any existing error
    dlerror();

    functype func = (functype)dlvsym(handle, DSO_EASY_SYMVER_SYMBOL, DSO_VERSION_INVALID);
    const char *error = dlerror();
    if (error == nullptr) {
        symver_error();
        return;
    }

    symver_log("error = %s", error);

    dlclose(handle);

    symver_log("end");
}

/**
 * @tc.name      : dlvsym_hard_symver_0100
 * @tc.desc      : invoke a symbol with the default version
 * @tc.level     : Level 0
 */
void DlvsymHardSymver0100(void)
{
    symver_log("start");

    void *handle = dlopen(DSO_HARD_SYMVER_NAME, RTLD_LAZY);
    if (!handle) {
        symver_error("%s", dlerror());
        return;
    }

    // Clear any existing error
    dlerror();

    functype func = (functype)dlvsym(handle, DSO_HARD_SYMVER_IF_SYMBOL, DSO_HARD_SYMVER_VERSION_STABLE);
    const char *error = dlerror();
    if (error != nullptr) {
        symver_error("%s", error);
        return;
    }

    const char *result = func();
    symver_streq(result, DSO_HARD_SYMVER_IF_SYMBOL_STABLE);

    dlclose(handle);

    symver_log("end");
}

/**
 * @tc.name      : dlvsym_hard_symver_0200
 * @tc.desc      : invoke a symbol with a non-default version
 * @tc.level     : Level 1
 */
void DlvsymHardSymver0200(void)
{
    symver_log("start");

    void *handle = dlopen(DSO_HARD_SYMVER_NAME, RTLD_LAZY);
    if (!handle) {
        symver_error("%s", dlerror());
        return;
    }

    // Clear any existing error
    dlerror();

    functype func = (functype)dlvsym(handle, DSO_HARD_SYMVER_IF_SYMBOL, DSO_HARD_SYMVER_VERSION_OLD);
    const char *error = dlerror();
    if (error != nullptr) {
        symver_error("%s", error);
        return;
    }

    const char *result = func();
    symver_streq(result, DSO_HARD_SYMVER_IF_SYMBOL_OLD);

    dlclose(handle);

    symver_log("end");
}

/**
 * @tc.name      : dlvsym_hard_symver_0300
 * @tc.desc      : invoke an invalid symbol with an invalid version
 * @tc.level     : Level 2
 */
void DlvsymHardSymver0300(void)
{
    symver_log("start");

    void *handle = dlopen(DSO_HARD_SYMVER_NAME, RTLD_LAZY);
    if (!handle) {
        symver_error("%s", dlerror());
        return;
    }

    // Clear any existing error
    dlerror();

    functype func = (functype)dlvsym(handle, DSO_SYMBOL_INVALID, DSO_VERSION_INVALID);
    const char *error = dlerror();
    if (error == nullptr) {
        symver_error();
        return;
    }

    symver_log("error = %s", error);

    dlclose(handle);

    symver_log("end");
}

/**
 * @tc.name      : dlvsym_hard_symver_0400
 * @tc.desc      : invoke a symbol with an invalid version
 * @tc.level     : Level 2
 */
void DlvsymHardSymver0400(void)
{
    symver_log("start");

    void *handle = dlopen(DSO_HARD_SYMVER_NAME, RTLD_LAZY);
    if (!handle) {
        symver_error("%s", dlerror());
        return;
    }

    // Clear any existing error
    dlerror();

    functype func = (functype)dlvsym(handle, DSO_HARD_SYMVER_IF_SYMBOL, DSO_VERSION_INVALID);
    const char *error = dlerror();
    if (error == nullptr) {
        symver_error();
        return;
    }

    symver_log("error = %s", error);

    dlclose(handle);

    symver_log("end");
}

static int DlvsymTestImpl(int argc, char *argv[])
{
    symver_log("start");

    DlvsymNoSymver0100();
    DlvsymNoSymver0200();

    DlvsymEasySymver0100();
    DlvsymEasySymver0200();
    DlvsymEasySymver0300();
    DlvsymEasySymver0400();

    DlvsymHardSymver0100();
    DlvsymHardSymver0200();
    DlvsymHardSymver0300();
    DlvsymHardSymver0400();

    symver_log("t_status = %d", g_tStatus);
    symver_log("end");

    return g_tStatus;
}

int DlvsymTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return DlvsymTestImpl(1, libcArgv);
}
