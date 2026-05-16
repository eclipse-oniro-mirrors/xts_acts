/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *	http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
 
#include <cstring>
#include <dlfcn.h>
#include "test.h"

static int TlsInitDlopenTestImpl(int argc, char *argv[])
{
    void *h;
    char *(*f)(void);
    char *s;
    (void)argc;
    (void)argv;

    h = dlopen("/data/storage/el1/bundle/libs/arm/libtls_init_dso.so", RTLD_NOW | RTLD_GLOBAL);
    if (!h) {
        t_error("dlopen failed: %s\n", dlerror());
    }
    f = reinterpret_cast<char *(*)()>(dlsym(h, "gettls"));
    if (!f) {
        t_error("dlsym failed: %s\n", dlerror());
    }
    s = f();
    if (!s) {
        t_error("tls was not initialized at dlopen\n");
    }
    if (strcmp(s, "foobar") != 0) {
        t_error("tls was not initialized correctly at dlopen (got \"%s\", want \"foobar\"\n", s);
    }

    return g_tStatus;
}

int TlsInitDlopenTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return TlsInitDlopenTestImpl(1, libcArgv);
}
