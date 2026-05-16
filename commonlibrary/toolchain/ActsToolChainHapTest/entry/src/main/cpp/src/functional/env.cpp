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
#include <cstdlib>
#include <cstring>
#include <unistd.h>
#include "test.h"

static void EnvTestBasicCases(char*& s)
{
    if (!environ) {
        t_error("environ is nullptr\n");
    }
    if (clearenv() || (environ && *environ)) {
        t_error("clrearenv: %s\n", strerror(errno));
    }
    if (putenv("TEST=1")) {
        t_error("putenv: %s\n", strerror(errno));
    }
    if (strcmp(environ[0], "TEST=1") != 0) {
        t_error("putenv failed: environ[0]: %s, wanted \"TEST=1\"\n", environ[0]);
    }
    if ((s = environ[1])) {
        t_error("environ[1]: %p, wanted 0\n", s);
    }
    if (!(s = getenv("TEST"))) {
        t_error("getenv(\"TEST\"): 0, wanted \"1\"\n");
    }
    if (strcmp(s, "1") != 0) {
        t_error("getenv(\"TEST\"): \"%s\", wanted \"1\"\n", s);
    }
}

static void EnvTestSetenvCases(char*& s)
{
    if (unsetenv("TEST")) {
        t_error("unsetenv: %s\n", strerror(errno));
    }
    if ((s = *environ)) {
        t_error("*environ: %p != 0\n", s);
    }
    if ((s = getenv("TEST"))) {
        t_error("getenv(\"TEST\"): %p, wanted 0\n", s);
    }
    errno = 0;
    if (setenv("TEST", "2", 0)) {
        t_error("setenv: %s\n", strerror(errno));
    }
    if (strcmp(s = getenv("TEST"), "2") != 0) {
        t_error("getenv(\"TEST\"): \"%s\", wanted \"2\"\n", s);
    }
    if (strcmp(environ[0], "TEST=2") != 0) {
        t_error("setenv failed: environ[0]: %s, wanted \"TEST=2\"\n", environ[0]);
    }
    errno = 0;
    if (setenv("TEST", "3", 0)) {
        t_error("setenv: %s\n", strerror(errno));
    }
    if (strcmp(s = getenv("TEST"), "2") != 0) {
        t_error("getenv(\"TEST\"): \"%s\", wanted \"2\"\n", s);
    }
    errno = 0;
    if (setenv("TEST", "3", 1)) {
        t_error("setenv: %s\n", strerror(errno));
    }
    if (strcmp(s = getenv("TEST"), "3") != 0) {
        t_error("getenv(\"TEST\"): \"%s\", wanted \"3\"\n", s);
    }
}

static void EnvTestFailureCases()
{
    int r;

    /* test failures */
    errno = 0;
    if ((r = setenv("", "", 0)) != -1 || errno != EINVAL) {
        t_error("setenv(\"\",\"\",0): %d, errno: %d (%s), wanted -1, %d (EINVAL)\n", r, errno, strerror(errno), EINVAL);
    }
}

int EnvTest()
{
    char* s;

    EnvTestBasicCases(s);
    EnvTestSetenvCases(s);
    EnvTestFailureCases();
    return T_STATUS;
}
