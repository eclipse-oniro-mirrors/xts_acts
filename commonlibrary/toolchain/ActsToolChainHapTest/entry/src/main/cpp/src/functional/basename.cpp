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

#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <libgen.h>
#include "test.h"

static void CheckBasename(const char* path, const char* want)
{
    char tmp[100];
    size_t plen = strlen(path);
    if (plen + 1U > sizeof(tmp)) {
        t_error("basename test path too long\n");
        return;
    }
    (void)std::memcpy(tmp, path, plen + 1U);
    char* got = basename(tmp);
    if (strcmp(want, got) != 0) {
        t_error("basename(\"%s\") got \"%s\" want \"%s\"\n", path, got, want);
    }
}

int BasenameTest()
{
    if (strcmp(basename(nullptr), ".") != 0) {
        t_error("basename(0) returned \"%s\"; expected \".\"\n", basename(nullptr));
    }
    CheckBasename("", ".");
    CheckBasename("/usr/lib", "lib");
    CheckBasename("/usr/", "usr");
    CheckBasename("usr/", "usr");
    CheckBasename("/", "/");
    CheckBasename("///", "/");
    CheckBasename("//usr//lib//", "lib");
    CheckBasename(".", ".");
    CheckBasename("..", "..");
    return T_STATUS;
}
