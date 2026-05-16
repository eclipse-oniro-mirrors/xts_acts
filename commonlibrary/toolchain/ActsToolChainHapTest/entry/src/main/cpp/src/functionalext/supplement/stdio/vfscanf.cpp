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

#include <cstdarg>
#include <cstdio>
#include <cstring>
#include "filepath_util.h"

#define TEST_VALUE_123 123

int ReadFile(FILE *stream, char *fmt, ...)
{
    va_list ap;
    va_start(ap, fmt);
    int result = vfscanf(stream, fmt, ap);
    va_end(ap);
    return result;
}

/**
 * @tc.name      : Vfscanf0100
 * @tc.desc      : Reads data from the stream and stores them according to the parameter format.
 * @tc.level     : Level 0
 */
void Vfscanf0100(void)
{
    FILE *fp = nullptr;
    int val = 0;
    char buffer[BUFSIZ];
    char file[PATH_MAX] = {0};
    if (!FileAbsolutePath(STR_VFSCANF_TXT, file, sizeof(file))) {
        return;
    }
    fp = fopen(file, "w+");
    if (fp == nullptr) {
        t_error("%s fopen failed\n", __func__);
        return;
    }
    if (fprintf(fp, "%s %d", "vfscanftest", TEST_VALUE_123) < 0) {
        t_error("%s fprintf failed\n", __func__);
        return;
    }
    rewind(fp);

    int result = ReadFile(fp, "%s %d", buffer, &val);
    if (result < 0) {
        t_error("%s vfscanf get result is %d are less 0\n", __func__, result);
    }
    if (strcmp(buffer, "vfscanftest") != 0) {
        t_error("%s vfscanf get is '%s' are not 'vfscanftest'\n", __func__, buffer);
    }
    if (val != TEST_VALUE_123) {
        t_error("%s vfscanf get is %d are not 123\n", __func__, val);
    }
    (void)fclose(fp);
    (void)remove(file);
}

/**
 * @tc.name      : Vfscanf0200
 * @tc.desc      : Test conversion of different formats
 * @tc.level     : Level 1
 */
void Vfscanf0200(void)
{
    FILE *fp = nullptr;
    char val[BUFSIZ];
    char buffer[BUFSIZ];
    char file[PATH_MAX] = {0};
    if (!FileAbsolutePath(STR_VFSCANF_TXT, file, sizeof(file))) {
        return;
    }
    fp = fopen(file, "w+");
    if (fp == nullptr) {
        t_error("%s fopen failed\n", __func__);
        return;
    }
    if (fprintf(fp, "%s %d", "vfscanftest", TEST_VALUE_123) < 0) {
        t_error("%s fprintf failed\n", __func__);
        return;
    }
    rewind(fp);

    int result = ReadFile(fp, "%s %s", buffer, val);
    if (result < 0) {
        t_error("%s vfscanf get result is %d are less 0\n", __func__, result);
    }
    if (strcmp(buffer, "vfscanftest") != 0) {
        t_error("%s vfscanf get is '%s' are not 'vfscanftest'\n", __func__, buffer);
    }
    if (strcmp(val, "123") != 0) {
        t_error("%s vfscanf get is '%s' are not '123'\n", __func__, val);
    }
    (void)fclose(fp);
    (void)remove(file);
}

/**
 * @tc.name      : Vfscanf0300
 * @tc.desc      : The test corresponding position does not match the format
 * @tc.level     : Level 2
 */
void Vfscanf0300(void)
{
    FILE *fp = nullptr;
    int val1 = 0;
    int val2 = 0;
    char file[PATH_MAX] = {0};
    if (!FileAbsolutePath(STR_VFSCANF_TXT, file, sizeof(file))) {
        return;
    }
    fp = fopen(file, "w+");
    if (fp == nullptr) {
        t_error("%s fopen failed", __func__);
        return;
    }
    if (fprintf(fp, "%s %d", "vfscanftest", TEST_VALUE_123) < 0) {
        t_error("%s fprintf failed", __func__);
        return;
    }
    rewind(fp);

    int result = ReadFile(fp, "%d %d", val1, val2);
    if (result > 0) {
        t_error("%s vfscanf get result is %d are more than the 0\n", __func__, result);
    }
    if (val1 != 0) {
        t_error("%s vfscanf get is %d are not 0\n", __func__, val1);
    }
    if (val2 != 0) {
        t_error("%s vfscanf get is %d are not 0\n", __func__, val2);
    }
    (void)fclose(fp);
    (void)remove(file);
}

static int VfscanfTestImpl(int argc, char *argv[])
{
    Vfscanf0100();
    Vfscanf0200();
    Vfscanf0300();
    return g_tStatus;
}

int VfscanfTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return VfscanfTestImpl(1, libcArgv);
}
