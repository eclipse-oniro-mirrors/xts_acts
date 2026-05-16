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

#include "dso_easy_symver.h"
#include "dso_hard_symver.h"
#include "dso_no_symver.h"
#include "dso_symver.h"

extern "C" void  *__dlsym_time64(void *__restrict, const char *__restrict);
/**
 * @tc.name      : dlsym_no_symver_0100
 * @tc.desc      : invoke a symbol programmatically
 * @tc.level     : Level 0
 */
void DlsymNoSymver0100(void)
{
    symver_log("start");

    void *handle = dlopen(DSO_NO_SYMVER_NAME, RTLD_LAZY);
    if (!handle) {
        symver_error("%s", dlerror());
        return;
    }

    // Clear any existing error
    dlerror();

    functype func = (functype)dlsym(handle, DSO_NO_SYMVER_SYMBOL);
    const char *error = dlerror();
    if (error != nullptr) {
        symver_error("%s", error);
        return;
    }

    const char *result = func();
    symver_streq(result, DSO_NO_SYMVER_SYMBOL);

    dlclose(handle);

    symver_log("end");
}

/**
 * @tc.name      : dlsym_no_symver_0200
 * @tc.desc      : invoke an invalid symbol programmatically
 * @tc.level     : Level 2
 */
void DlsymNoSymver0200(void)
{
    symver_log("start");

    void *handle = dlopen(DSO_NO_SYMVER_NAME, RTLD_LAZY);
    if (!handle) {
        symver_error("%s", dlerror());
        return;
    }

    // Clear any existing error
    dlerror();

    functype func = (functype)dlsym(handle, DSO_SYMBOL_INVALID);
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
 * @tc.name      : dlsym_easy_symver_0100
 * @tc.desc      : invoke a symbol directly after specifying a non-default
 *                 version
 * @tc.level     : Level 0
 */
void DlsymEasySymver0100(void)
{
    symver_log("start");
    __asm__(".symver dso_easy_symver, dso_easy_symver@OLD");
    const char *result = dso_easy_symver();
    symver_streq(result, DSO_EASY_SYMVER_SYMBOL_OLD);

    symver_log("end");
}

/**
 * @tc.name      : dlsym_easy_symver_0200
 * @tc.desc      : invoke a symbol with versions programmatically
 * @tc.level     : Level 1
 */
void DlsymEasySymver0200(void)
{
    symver_log("start");

    void *handle = dlopen(DSO_EASY_SYMVER_NAME, RTLD_LAZY);
    if (!handle) {
        symver_error("%s", dlerror());
        return;
    }

    // Clear any existing error
    dlerror();

    functype func = (functype)dlsym(handle, DSO_EASY_SYMVER_SYMBOL);
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
 * @tc.name      : dlsym_easy_symver_0300
 * @tc.desc      : invoke an invalid symbol programmatically
 * @tc.level     : Level 2
 */
void DlsymEasySymver0300(void)
{
    symver_log("start");

    void *handle = dlopen(DSO_EASY_SYMVER_NAME, RTLD_LAZY);
    if (!handle) {
        symver_error("%s", dlerror());
        return;
    }

    // Clear any existing error
    dlerror();

    functype func = (functype)dlsym(handle, DSO_SYMBOL_INVALID);
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
 * @tc.name      : dlsym_hard_symver_0100
 * @tc.desc      : invoke a symbol directly after specifying a non-default version
 * @tc.level     : Level 0
 */
void DlsymHardSymver0100(void)
{
    symver_log("start");

    __asm__(".symver dso_hard_symver_ld, dso_hard_symver_ld@OLD");
    const char *result = dso_hard_symver_ld();
    symver_streq(result, DSO_HARD_SYMVER_LD_SYMBOL_OLD);
    symver_log("end");
}

/**
 * @tc.name      : dlsym_hard_symver_0200
 * @tc.desc      : invoke a symbol with versions programmatically
 * @tc.level     : Level 1
 */
void DlsymHardSymver0200(void)
{
    symver_log("start");

    void *handle = dlopen(DSO_HARD_SYMVER_NAME, RTLD_LAZY);
    if (!handle) {
        symver_error("%s", dlerror());
        return;
    }

    // Clear any existing error
    dlerror();

    functype func = (functype)dlsym(handle, DSO_HARD_SYMVER_IF_SYMBOL);
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
 * @tc.name      : dlsym_hard_symver_0300
 * @tc.desc      : invoke an invalid symbol programmatically
 * @tc.level     : Level 2
 */
void DlsymHardSymver0300(void)
{
    symver_log("start");

    void *handle = dlopen(DSO_HARD_SYMVER_NAME, RTLD_LAZY);
    if (!handle) {
        symver_error("%s", dlerror());
        return;
    }

    // Clear any existing error
    dlerror();

    functype func = (functype)dlsym(handle, DSO_SYMBOL_INVALID);
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
 * @tc.name      : dlsym_time64_no_symver_0100
 * @tc.desc      : invoke a symbol programmatically
 * @tc.level     : Level 0
 */
void DlsymTime64NoSymver0100(void)
{
    symver_log("start");

    void *handle = dlopen(DSO_NO_SYMVER_NAME, RTLD_LAZY);
    if (!handle) {
        symver_error("%s", dlerror());
        return;
    }

    // Clear any existing error
    dlerror();

    functype func = (functype)__dlsym_time64(handle, DSO_NO_SYMVER_SYMBOL);
    const char *error = dlerror();
    if (error != nullptr) {
        symver_error("%s", error);
        return;
    }

    const char *result = func();
    symver_streq(result, DSO_NO_SYMVER_SYMBOL);

    dlclose(handle);

    symver_log("end");
}

static int DlsymTestImpl(int argc, char *argv[])
{
    symver_log("start");

    DlsymNoSymver0100();
    DlsymNoSymver0200();

    DlsymEasySymver0100();
    DlsymEasySymver0200();
    DlsymEasySymver0300();

    DlsymHardSymver0100();
    DlsymHardSymver0200();
    DlsymHardSymver0300();

    symver_log("t_status = %d", g_tStatus);
    symver_log("end");

    return g_tStatus;
}

int DlsymTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return DlsymTestImpl(1, libcArgv);
}
