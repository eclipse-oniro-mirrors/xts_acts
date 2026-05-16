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

#include <cstdio>
#include <cstring>
#include <cstdarg>
#include <cstdlib>
#include <climits>
#include "test.h"

#define BUFFER_SIZE 1000
#define FSEEK_OFFSET 0

char *Getfileall(char *fname)
{
    FILE *fp;
    char *str;
    char txt[BUFFER_SIZE];
    int filesize;
    if ((fp = fopen(fname, "r")) == nullptr) {
        printf("打开文件%s错误\n", fname);
        return nullptr;
    }
    if (fseek(fp, FSEEK_OFFSET, SEEK_END) != 0) {
        (void)fclose(fp);
        return nullptr;
    }
    filesize = ftell(fp);
    if (filesize < 0 || filesize > INT_MAX - 1) {
        (void)fclose(fp);
        return nullptr;
    }
    str = static_cast<char *>(malloc(static_cast<size_t>(filesize)));
    if (str == nullptr) {
        (void)fclose(fp);
        return nullptr;
    }
    str[0] = 0;
    rewind(fp);

    while ((fgets(txt, BUFFER_SIZE, fp)) != nullptr) {
        strcat(str, txt);
    }
    (void)fclose(fp);
    return str;
}

void vfprintf_test(char *fileName, char *format, char *funcName, char *wantReuslt, ...)
{
    FILE *file = fopen(fileName, "w");
    if (!file) {
        t_error("%s fopen failed\n", funcName);
    }
    va_list ap;
    va_start(ap, wantReuslt);
    int result = vfprintf(file, format, ap);
    va_end(ap);
    (void)fclose(file);
    if (result < 0) {
        t_error("%s vfprintf get result is %d not less 0", funcName, result);
    }
    char *buffer = Getfileall(fileName);
    if (strcmp(buffer, wantReuslt) != 0) {
        t_error("%s vfprintf get is '%s' not '%s'", funcName, buffer, wantReuslt);
    }
    (void)remove(fileName);
}

void vfprintf_n_test(char *fileName, char *format, char *funcName, char *wantReuslt, ...)
{
    FILE *file = fopen(fileName, "w");
    if (!file) {
        t_error("%s fopen failed\n", funcName);
    }
    va_list ap;
    va_start(ap, wantReuslt);
    int result = vfprintf(file, format, ap);
    va_end(ap);
    (void)fclose(file);
    if (result < 0) {
        t_error("%s vfprintf get result is %d not less 0", funcName, result);
    }
    char *buffer = Getfileall(fileName);
    if (strcmp(buffer, wantReuslt) == 0) {
        t_error("%s vfprintf get is '%s'", funcName, buffer);
    }
    (void)remove(fileName);
}

static int VfprintfTestImpl(int argc, char *argv[])
{
    /**
     * @tc.name      : vfprintf_0100
     * @tc.desc      : Format the output string through vfprintf, the formatted part is a number
     * @tc.level     : Level 0
     */
    vfprintf_test("/data/storage/el2/base/cache/vfprintf.txt", "value is %s and %s", "vfprintf_0100",
                  "value is qwe and 1", "qwe", "1");
    /**
     * @tc.name      : vfprintf_0200
     * @tc.desc      : Format the output string through vfprintf, the formatted part is a string
     * @tc.level     : Level 1
     */
    vfprintf_test("/data/storage/el2/base/cache/vfprintf.txt", "value is %d and %d", "vfprintf_0200",
                  "value is 1 and 1", 1, 1);
    /**
     * @tc.name      : vfprintf_0300
     * @tc.desc      : When calling vfprintf, the parameters passed in exceeds the number of formats to be formatted
     * @tc.level     : Level 2
     */
    vfprintf_test("/data/storage/el2/base/cache/vfprintf.txt", "value is %d", "vfprintf_0300", "value is 1", 1, 1);
    /**
     * @tc.name      : vfprintf_0400
     * @tc.desc      : The parameters passed in when calling vfprintf are inconsistent with the data type to be
     * formatted
     * @tc.level     : Level 2
     */
    vfprintf_n_test("/data/storage/el2/base/cache/vfprintf.txt", "value is %s and %d", "vfprintf_0400",
                    "value is qer and erq", "qer", "erq");
    return g_tStatus;
}

int VfprintfTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return VfprintfTestImpl(1, libcArgv);
}
