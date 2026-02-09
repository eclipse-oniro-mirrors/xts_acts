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

#include "common/napi_helper.cpp"
#include "common/native_common.h"
#include "napi/native_api.h"
#include <cerrno>
#include <cfloat>
#include <clocale>
#include <cmath>
#include <cstdarg>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <fcntl.h>
#include <malloc.h>
#include <unistd.h>

#define PARAM_0 0
#define PARAM_1 1
#define MPARAM_1 (-1)
#define PARAM_2 2
#define PARAM_10 10
#define PARAM_31 31
#define PARAM_3 3
#define PARAM_5 5
#define PARAM_16 16
#define PARAM_60 60
#define PARAM_13 13
#define PARAM_99 99
#define PARAM_123 123
#define PARAM_20 20
#define PARAM_50 50
#define PARAM_100 100
#define PARAM_0777 0777
#define PARAM_1024 1024
#define PARAM_11 11
#define PARAM_321 321
#define PARAM_4 4
#define PARAM_31416 3.1416
#define PARAM_31416F 3.1416f
#define SIZEOF_CHAR(x) (sizeof(x) / sizeof(char))

static const char *g_tempFile = "/data/storage/el2/base/files/fzl.txt";
static const char *g_tempLinkFile = "/data/storage/el2/base/files/fzl_link.txt";
static const char *TEMP_FILE_NEW = "/data/storage/el2/base/files/fzl_new.txt";

extern "C" char *__fgets_chk(char *, int, FILE *, size_t);
static napi_value Fgets_chk_One(napi_env env, napi_callback_info info)
{
    FILE *fp = fopen(g_tempFile, "w+");
    NAPI_ASSERT(env, fp != nullptr, "__fgets_chk fopen Error");
    char src[] = "testfgetschk";
    int len = strlen(src) + PARAM_1;
    fputs(src, fp);
    fseek(fp, PARAM_0, SEEK_SET);
    char dest[100] = {0};
    char *ret = __fgets_chk(dest, len, fp, sizeof(dest));
    NAPI_ASSERT(env, ret != nullptr, "__fgets_chk Error");
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, strcmp(dest, src) == PARAM_0, &result);
    return result;
}

extern "C" size_t __fread_chk(void *, size_t, size_t, FILE *, size_t);
static napi_value Fread_Chk_One(napi_env env, napi_callback_info info)
{
    FILE *fp = fopen(g_tempFile, "w+");
    NAPI_ASSERT(env, fp != nullptr, "__fread_chk fopen Error");
    char src[] = "testfreadchk";
    fputs(src, fp);
    fseek(fp, PARAM_0, SEEK_SET);
    char dest[100] = {0};
    size_t ret = __fread_chk(dest, PARAM_1, PARAM_20, fp, sizeof(dest));
    NAPI_ASSERT(env, ret == strlen(src), "__fread_chk Error");
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, strcmp(dest, src) == PARAM_0, &result);
    return result;
}

extern "C" ssize_t __pwrite_chk(int fd, const void *buf, size_t count, off_t offset, size_t buf_size);
static napi_value Pwrite_Chk_One(napi_env env, napi_callback_info info)
{
    int fd = open(g_tempFile, O_CREAT | O_RDWR, PARAM_0777);
    FILE *fp = fdopen(fd, "w+");
    NAPI_ASSERT(env, fp != nullptr, "__pwrite_chk fopen Error");
    char src[100] = "testpwritechk";
    size_t ret = __pwrite_chk(fd, src, strlen(src), PARAM_0, sizeof(src));
    NAPI_ASSERT(env, ret == strlen(src), "__pwrite_chk Error");
    fseek(fp, PARAM_0, SEEK_SET);
    char dest[100] = {0};
    __fread_chk(dest, PARAM_1, PARAM_20, fp, sizeof(dest));
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, strcmp(dest, src) == PARAM_0, &result);
    return result;
}

extern "C" ssize_t __readlinkat_chk(int dirfd, const char *path, char *buf, size_t size, size_t buf_size);
static napi_value Readlinkat_Chk_One(napi_env env, napi_callback_info info)
{
    FILE *fp = fopen(g_tempFile, "w+");
    NAPI_ASSERT(env, fp != nullptr, "__readlinkat_chk fopen Error");
    char src[100] = "testreadlinkatchk";
    fputs(src, fp);
    fseek(fp, PARAM_0, SEEK_SET);
    int linkRet = symlink(g_tempFile, g_tempLinkFile);
    NAPI_ASSERT(env, linkRet == PARAM_0, "Readlinkat_Chk_One symlink Error");
    int fd = open(g_tempLinkFile, O_RDWR);
    char dest[100] = {0};
    size_t ret = __readlinkat_chk(fd, g_tempLinkFile, dest, strlen(src), sizeof(dest));
    NAPI_ASSERT(env, strlen(dest) > PARAM_0, "__readlinkat_chk Error");
    fclose(fp);
    unlink(g_tempLinkFile);
    unlink(g_tempFile);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, ret == strlen(src), &result);
    return result;
}

extern "C" int __snprintf_chk(char *dest, size_t supplied_size, int flags, size_t dst_len_from_compiler,
                              const char *format, ...);

static napi_value Snprintf_Chk_One(napi_env env, napi_callback_info info)
{
    char dest[100] = {0};
    char src[] = "hello";
    int ret = __snprintf_chk(dest, PARAM_50, PARAM_0, sizeof(dest), "%s", src);
    if (ret == PARAM_5 && strcmp(dest, src) == 0) {
        ret = PARAM_1;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

extern "C" int __sprintf_chk(char *dest, int flags, size_t dst_len_from_compiler, const char *format, ...);

static napi_value Sprintf_Chk_One(napi_env env, napi_callback_info info)
{
    char dest[100] = {0};
    char src[] = "hello";
    int ret = __sprintf_chk(dest, PARAM_0, sizeof(dest), "%s", src);
    if (ret == PARAM_5 && strcmp(dest, src) == 0) {
        ret = PARAM_1;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

extern "C" int __vsnprintf_chk(char *dest, size_t supplied_size, int flags, size_t dst_len_from_compiler,
                               const char *format, va_list va);
extern "C" int VsnprintfChkTest(const char *format, ...);
int VsnprintfChkTest(const char *format, ...)
{
    char dest[100] = {0};
    va_list args;
    va_start(args, format);
    int ret = __vsnprintf_chk(dest, PARAM_50, PARAM_0, sizeof(dest), format, args);
    va_end(args);
    return ret;
}

static napi_value Vsnprintf_Chk_One(napi_env env, napi_callback_info info)
{
    size_t ret = MPARAM_1;
    char src[] = "hello";
    ret = VsnprintfChkTest("%s", src);
    napi_value result = nullptr;
    napi_create_int32(env, ret == strlen(src), &result);
    return result;
}

extern "C" ssize_t __write_chk(int fd, const void *buf, size_t count, size_t buf_size);
static napi_value Write_Chk_One(napi_env env, napi_callback_info info)
{
    int fd = open(g_tempFile, O_CREAT | O_RDWR, PARAM_0777);
    FILE *fp = fdopen(fd, "w+");
    NAPI_ASSERT(env, fp != nullptr, "__readlinkat_chk fopen Error");
    char src[100] = "testwritechkchk";
    int len = strlen(src) + PARAM_1;
    size_t ret = __write_chk(fd, src, len, sizeof(src));
    fseek(fp, PARAM_0, SEEK_SET);
    char readBuf[100] = {0};
    fgets(readBuf, len, fp);
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, ret == strlen(readBuf) + PARAM_1, &result);
    return result;
}

static napi_value Asprintf_One(napi_env env, napi_callback_info info)
{
    char buf[] = "d";
    char *testStr = nullptr;
    int ret = MPARAM_1;
    ret = asprintf(&testStr, "%s", buf);
    ;
    if (testStr) {
        free(testStr);
        testStr = nullptr;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value ClearErr_One(napi_env env, napi_callback_info info)
{
    int fd = open(g_tempFile, O_CREAT | O_RDONLY);
    FILE *fp = fdopen(fd, "r+");
    NAPI_ASSERT(env, fp != nullptr, "ClearErr_One fopen Error");
    fputc('a', fp);
    if (ferror(fp)) {
        clearerr(fp);
    }
    int ret = MPARAM_1;
    if (ferror(fp)) {
        ret = PARAM_0;
    } else {
        ret = PARAM_1;
    }
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Clearerr_Unlocked_One(napi_env env, napi_callback_info info)
{
    int fd = open(g_tempFile, O_CREAT | O_RDONLY);
    FILE *fp = fdopen(fd, "r+");
    NAPI_ASSERT(env, fp != nullptr, "clearerr_unlocked open Error");
    fputc('a', fp);
    if (ferror_unlocked(fp)) {
        clearerr_unlocked(fp);
    }
    int ret = MPARAM_1;
    if (ferror_unlocked(fp)) {
        ret = PARAM_0;
    } else {
        ret = PARAM_1;
    }
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Dprintf_One(napi_env env, napi_callback_info info)
{
    int fd = open(g_tempFile, O_CREAT | O_RDWR, PARAM_0777);
    FILE *fp = fdopen(fd, "w");
    NAPI_ASSERT(env, fp != nullptr, "dprintf open Error");
    int ret = dprintf(fd, "%s", "hello world");
    NAPI_ASSERT(env, ret > PARAM_0, "dprintf dprintf Error");
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, ret == PARAM_11, &result);
    return result;
}

static napi_value Fclose_One(napi_env env, napi_callback_info info)
{
    int fd = open(g_tempFile, O_CREAT | O_RDWR, PARAM_0777);
    FILE *fp = fdopen(fd, "w");
    NAPI_ASSERT(env, fp != nullptr, "fclose open Error");
    fprintf(fp, "hello world");
    int ret = fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, ret == PARAM_0, &result);
    return result;
}

static napi_value Fdopen_One(napi_env env, napi_callback_info info)
{
    errno = PARAM_0;
    int fd = open(g_tempFile, O_CREAT | O_RDWR, PARAM_0777);
    FILE *fp = fdopen(fd, "w");
    NAPI_ASSERT(env, fp != nullptr, "fdopen open Error");
    fprintf(fp, "hello world");
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, errno == PARAM_0, &result);
    return result;
}

static napi_value Feof_unlocked_One(napi_env env, napi_callback_info info)
{
    int fd = open(g_tempFile, O_CREAT | O_RDWR, PARAM_0777);
    FILE *fp = fdopen(fd, "w+");
    NAPI_ASSERT(env, fp != nullptr, "feof_unlocked fopen Error");
    char src[] = "hello";
    int ret = MPARAM_1;
    fputs_unlocked(src, fp);
    rewind(fp);
    while (fgetc_unlocked(fp) != EOF) {
    }
    if (feof_unlocked(fp)) {
        ret = PARAM_1;
    }
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Ferror_One(napi_env env, napi_callback_info info)
{
    int fd = open(g_tempFile, O_CREAT | O_RDONLY);
    FILE *fp = fdopen(fd, "r+");
    NAPI_ASSERT(env, fp != nullptr, "ferror open Error");
    fputc('a', fp);
    int ret = MPARAM_1;
    if (ferror(fp)) {
        clearerr(fp);
        ret = PARAM_1;
    }
    if (ferror(fp)) {
        ret = PARAM_0;
    } else {
        ret = PARAM_1;
    }
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Ferror_unlocked_One(napi_env env, napi_callback_info info)
{
    int fd = open(g_tempFile, O_CREAT | O_RDONLY);
    FILE *fp = fdopen(fd, "r+");
    NAPI_ASSERT(env, fp != nullptr, "ferror_unlocked open Error");
    fputc('a', fp);
    int ret = MPARAM_1;
    if (ferror_unlocked(fp)) {
        clearerr_unlocked(fp);
        ret = PARAM_1;
    }
    if (ferror_unlocked(fp)) {
        ret = PARAM_0;
    } else {
        ret = PARAM_1;
    }
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Fflush_One(napi_env env, napi_callback_info info)
{
    char dest[20] = {0};
    FILE *fp = fopen(g_tempFile, "w+");
    NAPI_ASSERT(env, fp != nullptr, "fflush fopen Error");
    fputs("hello", fp);
    fflush(fp);
    rewind(fp);
    fgets(dest, sizeof(dest), fp);
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, strcmp(dest, "hello") == PARAM_0, &result);
    return result;
}

static napi_value Fflush_unlocked_One(napi_env env, napi_callback_info info)
{
    char dest[20] = {0};
    FILE *fp = fopen(g_tempFile, "w+");
    NAPI_ASSERT(env, fp != nullptr, "fflush_unlocked fopen Error");
    fputs_unlocked("hello", fp);
    fflush_unlocked(fp);
    rewind(fp);
    fgets_unlocked(dest, sizeof(dest), fp);
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, strcmp(dest, "hello") == PARAM_0, &result);
    return result;
}

static napi_value Fgetc_One(napi_env env, napi_callback_info info)
{
    FILE *fp = fopen(g_tempFile, "w+");
    NAPI_ASSERT(env, fp != nullptr, "fgetc fopen Error");
    fputc('a', fp);
    rewind(fp);
    int ret = fgetc(fp);
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, ret == 'a', &result);
    return result;
}

static napi_value Fgetc_unlocked_One(napi_env env, napi_callback_info info)
{
    FILE *fp = fopen(g_tempFile, "w+");
    NAPI_ASSERT(env, fp != nullptr, "fgetc_unlocked fopen Error");
    fputc_unlocked('a', fp);
    rewind(fp);
    int ret = fgetc_unlocked(fp);
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, ret == 'a', &result);
    return result;
}

static napi_value Fgetin_One(napi_env env, napi_callback_info info)
{
    FILE *fp = fopen(g_tempFile, "w+");
    NAPI_ASSERT(env, fp != nullptr, "fgetin fopen Error");
    fputs("helloworld", fp);
    rewind(fp);
    size_t plen = PARAM_0;
    char *ret = fgetln(fp, &plen);
    napi_value result = nullptr;
    napi_create_int32(env, strcmp(ret, "helloworld") == PARAM_0 && strlen(ret) == plen, &result);
    fclose(fp);
    remove(g_tempFile);
    return result;
}

static napi_value Fgetpos_One(napi_env env, napi_callback_info info)
{
    fpos_t pos;
    FILE *fp = fopen(g_tempFile, "w");
    NAPI_ASSERT(env, fp != nullptr, "fgetpos fopen Error");
    fputs("helloworld", fp);
    fseek(fp, PARAM_0, SEEK_END);
    int ret = fgetpos(fp, &pos);
    NAPI_ASSERT(env, ret == PARAM_0, "fgetpos Error");
    rewind(fp);
    ret = fgetpos(fp, &pos);
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, ret == PARAM_0, &result);
    return result;
}

static napi_value Fgetpos64_One(napi_env env, napi_callback_info info)
{
    fpos64_t pos;
    FILE *fp = fopen(g_tempFile, "w");
    NAPI_ASSERT(env, fp != nullptr, "fgetpos64 fopen Error");
    fputs("helloworld", fp);
    fseek(fp, PARAM_0, SEEK_END);
    int ret = fgetpos64(fp, &pos);
    NAPI_ASSERT(env, ret == PARAM_0, "fgetpos64 Error");
    rewind(fp);
    ret = fgetpos64(fp, &pos);
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, ret == PARAM_0, &result);
    return result;
}

static napi_value Fgets_One(napi_env env, napi_callback_info info)
{
    char dest[20] = {0};
    FILE *fp = fopen(g_tempFile, "w+");
    NAPI_ASSERT(env, fp != nullptr, "fgets fopen Error");
    fputs("hello", fp);
    rewind(fp);
    fgets(&dest[0], sizeof(dest), fp);
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, strcmp(dest, "hello") == PARAM_0, &result);
    return result;
}

static napi_value Fgets_unlocked_One(napi_env env, napi_callback_info info)
{
    char dest[20] = {0};
    FILE *fp = fopen(g_tempFile, "w+");
    NAPI_ASSERT(env, fp != nullptr, "fgets_unlocked fopen Error");
    fputs_unlocked("hello", fp);
    rewind(fp);
    fgets_unlocked(&dest[0], sizeof(dest), fp);
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, strcmp(dest, "hello") == PARAM_0, &result);
    return result;
}

static napi_value Fileno_One(napi_env env, napi_callback_info info)
{
    FILE *fp = fopen(g_tempFile, "w+");
    NAPI_ASSERT(env, fp != nullptr, "fileno_unlocked fopen Error");
    int ret = MPARAM_1;
    if (fileno_unlocked(fp) == fileno(fp)) {
        ret = PARAM_1;
    }
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Fileno_unlocked_One(napi_env env, napi_callback_info info)
{
    FILE *fp = fopen(g_tempFile, "w+");
    NAPI_ASSERT(env, fp != nullptr, "fileno_unlocked fopen Error");
    int ret = MPARAM_1;
    if (fileno(fp) == fileno_unlocked(fp)) {
        ret = PARAM_1;
    }
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Flockfile_One(napi_env env, napi_callback_info info)
{
    errno = PARAM_0;
    puts("start do_child_one");
    flockfile(stdout);
    puts("after first flockfile");
    flockfile(stdout);
    puts("foo");
    funlockfile(stdout);
    puts("after first funlockfile");
    funlockfile(stdout);
    puts("all done");
    napi_value result = nullptr;
    napi_create_int32(env, errno == PARAM_0, &result);
    return result;
}

static napi_value Fmemopen_One(napi_env env, napi_callback_info info)
{
    char src[] = "helloworld";
    FILE *fp = fmemopen(src, sizeof(src), "r");
    NAPI_ASSERT(env, fp != nullptr, "fmemopen Error");
    const int bufferSize = PARAM_16;
    char buf[bufferSize];
    char *ret = fgets(buf, sizeof(buf), fp);
    NAPI_ASSERT(env, ret != nullptr, "fmemopen fgets Error");
    fclose(fp);
    napi_value result = nullptr;
    napi_create_int32(env, strcmp(src, ret) == PARAM_0, &result);
    return result;
}

static napi_value Fopen_One(napi_env env, napi_callback_info info)
{
    errno = PARAM_0;
    FILE *fp = fopen(g_tempFile, "w");
    NAPI_ASSERT(env, fp != nullptr, "fopen Error");
    fputc('a', fp);
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, errno == PARAM_0, &result);
    return result;
}

static napi_value Fopen64_One(napi_env env, napi_callback_info info)
{
    errno = PARAM_0;
    FILE *fp = fopen64(g_tempFile, "w");
    NAPI_ASSERT(env, fp != nullptr, "fopen64 Error");
    fputc('a', fp);
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, errno == PARAM_0, &result);
    return result;
}

static napi_value Fprintf_One(napi_env env, napi_callback_info info)
{
    FILE *fp = fopen(g_tempFile, "w+");
    NAPI_ASSERT(env, fp != nullptr, "fprintf fopen Error");
    fprintf(fp, "%s", "helloworld");
    int ret = MPARAM_1;
    if (!ferror(fp)) {
        ret = PARAM_1;
    }
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, ret == PARAM_1, &result);
    return result;
}

extern "C" int fpurge(FILE *);
static napi_value Fpurge_One(napi_env env, napi_callback_info info)
{
    FILE *fp = fopen(g_tempFile, "w+");
    NAPI_ASSERT(env, fp != nullptr, "fpurge fopen Error");
    fputs("helloworld", fp);
    int ret = fpurge(fp);
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, ret == PARAM_0, &result);
    return result;
}

static napi_value Fputc_One(napi_env env, napi_callback_info info)
{
    FILE *fp = fopen(g_tempFile, "w+");
    NAPI_ASSERT(env, fp != nullptr, "fputc fopen Error");
    int ret = fputc('a', fp);
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, ret == 'a', &result);
    return result;
}

static napi_value Fputc_unlocked_One(napi_env env, napi_callback_info info)
{
    FILE *fp = fopen(g_tempFile, "w+");
    NAPI_ASSERT(env, fp != nullptr, "fputc_unlocked fopen Error");
    int ret = fputc_unlocked('a', fp);
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, ret == 'a', &result);
    return result;
}

static napi_value Fputs_One(napi_env env, napi_callback_info info)
{
    char dest[20] = {0};
    FILE *fp = fopen(g_tempFile, "w+");
    NAPI_ASSERT(env, fp != nullptr, "fputs fopen Error");
    fputs("hello", fp);
    rewind(fp);
    fgets(dest, sizeof(dest), fp);
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, strcmp(dest, "hello") == PARAM_0, &result);
    return result;
}

static napi_value Fputs_unlocked_One(napi_env env, napi_callback_info info)
{
    char dest[20] = {0};
    FILE *fp = fopen(g_tempFile, "w+");
    NAPI_ASSERT(env, fp != nullptr, "fputs_unlocked fopen Error");
    fputs_unlocked("hello", fp);
    rewind(fp);
    fgets_unlocked(dest, sizeof(dest), fp);
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, strcmp(dest, "hello") == PARAM_0, &result);
    return result;
}

static napi_value Fread_One(napi_env env, napi_callback_info info)
{
    char dest[20] = {0};
    FILE *fp = fopen(g_tempFile, "w+");
    NAPI_ASSERT(env, fp != nullptr, "fread fopen Error");
    size_t ret = fwrite("AB", PARAM_1, PARAM_2, fp);
    NAPI_ASSERT(env, ret == 2U, "fread fwrite Error");
    rewind(fp);
    ret = fread(&dest[0], PARAM_1, PARAM_2, fp);
    NAPI_ASSERT(env, ret == 2U, "fread Error");
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, strcmp(dest, "AB") == PARAM_0, &result);
    return result;
}

static napi_value Fread_unlocked_One(napi_env env, napi_callback_info info)
{
    char dest[20] = {0};
    FILE *fp = fopen(g_tempFile, "w+");
    NAPI_ASSERT(env, fp != nullptr, "fread_unlocked fopen Error");
    size_t ret = fwrite_unlocked("AB", PARAM_1, PARAM_2, fp);
    NAPI_ASSERT(env, ret == 2U, "fwrite_unlocked Error");
    rewind(fp);
    ret = fread_unlocked(&dest[0], PARAM_1, PARAM_2, fp);
    NAPI_ASSERT(env, ret == 2U, "fread_unlocked Error");
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, strcmp(dest, "AB") == PARAM_0, &result);
    return result;
}

static napi_value Freopen_One(napi_env env, napi_callback_info info)
{
    errno = PARAM_0;
    FILE *fp = fopen(g_tempFile, "w+");
    NAPI_ASSERT(env, fp != nullptr, "freopen fopen Error");
    fp = freopen(g_tempFile, "r+", fp);
    NAPI_ASSERT(env, fp != nullptr, "freopen Error");
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, errno == PARAM_0, &result);
    return result;
}

static napi_value Freopen64_One(napi_env env, napi_callback_info info)
{
    errno = PARAM_0;
    FILE *fp = fopen64(g_tempFile, "w+");
    NAPI_ASSERT(env, fp != nullptr, "freopen64 fopen Error");
    fp = freopen64(g_tempFile, "r+", fp);
    NAPI_ASSERT(env, fp != nullptr, "freopen64 Error");
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, errno == PARAM_0, &result);
    return result;
}

static napi_value Fscanf_One(napi_env env, napi_callback_info info)
{
    char str[80];
    float f;
    FILE *fp = fopen(g_tempFile, "w+");
    NAPI_ASSERT(env, fp != nullptr, "fscanf fopen Error");
    fprintf(fp, "%f %s", PARAM_31416, "PI");
    rewind(fp);
    fscanf(fp, "%f", &f);
    fscanf(fp, "%s", str);
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, strcmp(str, "PI") == PARAM_0 && fabsf(f - PARAM_31416F) < FLT_EPSILON, &result);
    return result;
}

static napi_value Fseek_One(napi_env env, napi_callback_info info)
{
    FILE *fp = fopen(g_tempFile, "w+");
    NAPI_ASSERT(env, fp != nullptr, "fseek fopen Error");
    const char src[] = "hello world";
    fwrite(src, sizeof(char), strlen(src), fp);
    fseek(fp, PARAM_4, SEEK_SET);
    char ret = fgetc(fp);
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, ret == 'o', &result);
    return result;
}

static napi_value Fseeko_One(napi_env env, napi_callback_info info)
{
    FILE *fp = fopen(g_tempFile, "w+");
    NAPI_ASSERT(env, fp != nullptr, "fseeko fopen Error");
    const char src[] = "hello world";
    fwrite(src, sizeof(char), strlen(src), fp);
    fseeko(fp, 4L, SEEK_SET);
    char ret = fgetc(fp);
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, ret == 'o', &result);
    return result;
}

static napi_value Fseeko64_One(napi_env env, napi_callback_info info)
{
    FILE *fp = fopen(g_tempFile, "w+");
    NAPI_ASSERT(env, fp != nullptr, "fseeko64 fopen Error");
    const char src[] = "hello world";
    fwrite(src, sizeof(char), strlen(src), fp);
    fseeko64(fp, 4L, SEEK_SET);
    char ret = fgetc(fp);
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, ret == 'o', &result);
    return result;
}

static napi_value Fsetpos_One(napi_env env, napi_callback_info info)
{
    long long a = PARAM_0;
    fpos_t pos;
    pos.__lldata = a;
    FILE *fp = fopen(g_tempFile, "w+");
    NAPI_ASSERT(env, fp != nullptr, "fsetpos fopen Error");
    const char src[] = "hello world";
    fwrite(src, sizeof(char), strlen(src), fp);
    char dest[100] = {0};
    int posValue = fsetpos(fp, &pos);
    NAPI_ASSERT(env, posValue == PARAM_0, "fsetpos Error");
    int ret = fread(dest, sizeof(char), sizeof(dest), fp);
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, ret == strlen(src), &result);
    return result;
}

static napi_value Fsetpos64_One(napi_env env, napi_callback_info info)
{
    long long a = PARAM_0;
    fpos_t pos;
    pos.__lldata = a;
    FILE *fp = fopen(g_tempFile, "w+");
    NAPI_ASSERT(env, fp != nullptr, "fsetpos64 fopen Error");
    const char src[] = "hello world";
    fwrite(src, sizeof(char), strlen(src), fp);
    char dest[100] = {0};
    int posValue = fsetpos64(fp, &pos);
    NAPI_ASSERT(env, posValue == PARAM_0, "fsetpos64 Error");
    size_t ret = fread(dest, sizeof(char), sizeof(dest), fp);
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, ret == strlen(dest), &result);
    return result;
}

static napi_value Ftell_One(napi_env env, napi_callback_info info)
{
    FILE *fp = fopen(g_tempFile, "w+");
    NAPI_ASSERT(env, fp != nullptr, "ftell fopen Error");
    const char src[] = "hello world";
    fwrite(src, sizeof(char), strlen(src), fp);
    int fret = fseek(fp, PARAM_0, SEEK_SET);
    NAPI_ASSERT(env, fret == PARAM_0, "ftell fseek Error");
    long ret = ftell(fp);
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, ret == PARAM_0, &result);
    return result;
}

static napi_value Ftello_One(napi_env env, napi_callback_info info)
{
    FILE *fp = fopen(g_tempFile, "w+");
    NAPI_ASSERT(env, fp != nullptr, "ftello fopen Error");
    const char src[] = "hello world";
    fwrite(src, sizeof(char), strlen(src), fp);
    int fret = fseek(fp, PARAM_0, SEEK_SET);
    NAPI_ASSERT(env, fret == PARAM_0, "ftello fseek Error");
    off_t ret = ftello(fp);
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, ret == (off_t)PARAM_0, &result);
    return result;
}

static napi_value Ftello64_One(napi_env env, napi_callback_info info)
{
    FILE *fp = fopen(g_tempFile, "w+");
    NAPI_ASSERT(env, fp != nullptr, "ftello64 fopen Error");
    const char src[] = "hello world";
    fwrite(src, sizeof(char), strlen(src), fp);
    int fret = fseek(fp, PARAM_0, SEEK_SET);
    NAPI_ASSERT(env, fret == PARAM_0, "ftello64 fseek Error");
    off64_t ret = ftello64(fp);
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, ret == (off64_t)PARAM_0, &result);
    return result;
}

static napi_value Ftrylockfile_One(napi_env env, napi_callback_info info)
{
    FILE *fp = fopen(g_tempFile, "w+");
    NAPI_ASSERT(env, fp != nullptr, "ftrylockfile fopen Error");
    int ret = MPARAM_1;
    ret = ftrylockfile(fp);
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, ret == PARAM_0, &result);
    return result;
}

static napi_value Funlockfile_One(napi_env env, napi_callback_info info)
{
    errno = PARAM_0;
    puts("start do_child_one");
    flockfile(stdout);
    puts("after first flockfile");
    flockfile(stdout);
    puts("foo");
    funlockfile(stdout);
    puts("after first funlockfile");
    funlockfile(stdout);
    puts("all done");
    napi_value result = nullptr;
    napi_create_int32(env, errno == PARAM_0, &result);
    return result;
}

static napi_value Fwrite_One(napi_env env, napi_callback_info info)
{
    char dest[20] = {0};
    FILE *fp = fopen(g_tempFile, "w+");
    NAPI_ASSERT(env, fp != nullptr, "fwrite fopen Error");
    size_t ret = fwrite("AB", PARAM_1, PARAM_2, fp);
    NAPI_ASSERT(env, ret == 2U, "fwrite Error");
    rewind(fp);
    ret = fread(&dest[0], PARAM_1, PARAM_2, fp);
    NAPI_ASSERT(env, ret == 2U, "fwrite fread Error");
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, strcmp(dest, "AB") == PARAM_0, &result);
    return result;
}

static napi_value Fwrite_unlocked_One(napi_env env, napi_callback_info info)
{
    char dest[20] = {0};
    FILE *fp = fopen(g_tempFile, "w+");
    NAPI_ASSERT(env, fp != nullptr, "fwrite_unlocked fopen Error");
    size_t ret = fwrite_unlocked("AB", PARAM_1, PARAM_2, fp);
    NAPI_ASSERT(env, ret == 2U, "fwrite_unlocked Error");
    rewind(fp);
    ret = fread_unlocked(&dest[0], PARAM_1, PARAM_2, fp);
    NAPI_ASSERT(env, ret == 2U, "fwrite_unlocked fread_unlocked Error");
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, strcmp(dest, "AB") == PARAM_0, &result);
    return result;
}

static napi_value Getc_One(napi_env env, napi_callback_info info)
{
    FILE *fp = fopen(g_tempFile, "w+");
    NAPI_ASSERT(env, fp != nullptr, "getc fopen Error");
    fputc_unlocked('a', fp);
    rewind(fp);
    int ret = getc(fp);
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, ret == 'a', &result);
    return result;
}

static napi_value Getc_unlocked_One(napi_env env, napi_callback_info info)
{
    FILE *fp = fopen(g_tempFile, "w+");
    NAPI_ASSERT(env, fp != nullptr, "getc_unlocked fopen Error");
    fputc_unlocked('a', fp);
    rewind(fp);
    int ret = getc_unlocked(fp);
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, ret == 'a', &result);
    return result;
}

static napi_value GetChar_One(napi_env env, napi_callback_info info)
{
    FILE *fp = fopen(g_tempFile, "w");
    NAPI_ASSERT(env, fp != nullptr, "getchar fopen Error");
    char src[] = "getchar";
    fputs(src, fp);
    rewind(fp);
    FILE *fp1 = freopen(g_tempFile, "r", stdin);
    NAPI_ASSERT(env, fp1 != nullptr, "getchar freopen Error");
    int ret = getchar();
    fclose(fp);
    fclose(fp1);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, ret == 'g', &result);
    return result;
}

static napi_value GetChar_unlocked_One(napi_env env, napi_callback_info info)
{
    FILE *fp = fopen(g_tempFile, "w");
    NAPI_ASSERT(env, fp != nullptr, "getchar_unlocked fopen Error");
    char src[] = "getchar";
    fputs(src, fp);
    rewind(fp);
    FILE *fp1 = freopen(g_tempFile, "r", stdin);
    NAPI_ASSERT(env, fp1 != nullptr, "getchar_unlocked freopen Error");
    int ret = getchar_unlocked();
    fclose(fp);
    fclose(fp1);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, ret == 'g', &result);
    return result;
}

static napi_value PutC_unlocked_One(napi_env env, napi_callback_info info)
{
    int ret = MPARAM_1;
    FILE *fp = fopen(g_tempFile, "w");
    NAPI_ASSERT(env, fp != nullptr, "PutC_unlocked_One fopen Error");
    char ch = 'p';
    ret = putc_unlocked(ch, fp);
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, ret == 'p', &result);
    return result;
}

static napi_value PutChar_unlocked_One(napi_env env, napi_callback_info info)
{
    int ret = MPARAM_1;
    char ch[] = "this is putchar_unlocked_0100 test case, std output success!";
    int length = SIZEOF_CHAR(ch);
    for (int nLoop = PARAM_0; nLoop < length; nLoop++) {
        ret = putchar_unlocked(ch[nLoop]);
        NAPI_ASSERT(env, ret == ch[nLoop], "putChar_unlocked Error");
    }
    napi_value result = nullptr;
    napi_create_int32(env, PARAM_1, &result);
    return result;
}

static napi_value Getdelim_One(napi_env env, napi_callback_info info)
{
    char *line = nullptr;
    size_t len = PARAM_0;
    FILE *fp = fopen(g_tempFile, "w+");
    NAPI_ASSERT(env, fp != nullptr, "getdelim fopen Error");
    const char src[] = "hello,world";
    fwrite(src, sizeof(char), strlen(src), fp);
    int fret = fseek(fp, PARAM_0, SEEK_SET);
    NAPI_ASSERT(env, fret == PARAM_0, "getdelim fseek Error");
    ssize_t ret = getdelim(&line, &len, ',', fp);
    NAPI_ASSERT(env, ret > PARAM_0, "getdelim Error");
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, strcmp(line, "hello,") == PARAM_0 && len > strlen("hello,"), &result);
    return result;
}

static napi_value Getline_One(napi_env env, napi_callback_info info)
{
    char *line = nullptr;
    size_t len = PARAM_0;
    FILE *fp = fopen(g_tempFile, "w+");
    NAPI_ASSERT(env, fp != nullptr, "getline fopen Error");
    const char src[] = "helloworld";
    fwrite(src, sizeof(char), strlen(src), fp);
    int fret = fseek(fp, PARAM_0, SEEK_SET);
    NAPI_ASSERT(env, fret == PARAM_0, "getline fseek Error");
    ssize_t ret = getline(&line, &len, fp);
    NAPI_ASSERT(env, ret > PARAM_0, "getline Error");
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, strcmp(line, "helloworld") == PARAM_0 && ret == PARAM_10, &result);
    return result;
}

static napi_value Gets_One(napi_env env, napi_callback_info info)
{
    FILE *fp = fopen(g_tempFile, "w");
    NAPI_ASSERT(env, fp != nullptr, "gets fopen Error");
    char src[] = "gets";
    fputs(src, fp);
    fseek(fp, PARAM_0, SEEK_SET);
    FILE *fp1 = freopen(g_tempFile, "r", stdin);
    NAPI_ASSERT(env, fp1 != nullptr, "gets freopen Error");
    char dest[20] = {0};
    char *ret = gets(dest);
    fclose(fp);
    fclose(fp1);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, strcmp(ret, "gets") == PARAM_0 && strcmp(dest, ret) == PARAM_0, &result);
    return result;
}

static napi_value Nrand48_One(napi_env env, napi_callback_info info)
{
    unsigned short s[3] = {1, 2, 3};
    int ret = PARAM_0;
    for (int i = PARAM_0; i < PARAM_10; i++) {
        for (int j = PARAM_0; j < PARAM_3; j++) {
            s[j] += i * PARAM_10;
        }
        long rev = nrand48(s);
        if (rev < pow(PARAM_2, PARAM_31) && rev > PARAM_0) {
            ret++;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret == PARAM_10, &result);
    return result;
}

static napi_value Open_Memstream_One(napi_env env, napi_callback_info info)
{
    size_t len = PARAM_0;
    char *ptr = nullptr;
    FILE *fp = open_memstream(&ptr, &len);
    NAPI_ASSERT(env, fp != nullptr, "open_memstream Error");
    int value = fputs("hello, world!", fp);
    NAPI_ASSERT(env, value != EOF, "open_memstream fputs Error");
    fflush(fp);
    fclose(fp);
    free(ptr);
    ptr = nullptr;
    napi_value result = nullptr;
    napi_create_int32(env, strlen("hello, world!") == len, &result);
    return result;
}

static napi_value Perror_One(napi_env env, napi_callback_info info)
{
    int ret = MPARAM_1;
    FILE *fp = fopen(g_tempFile, "rb");
    if (fp == nullptr) {
        perror("The following error occurred");
        ret = PARAM_1;
    } else {
        fclose(fp);
        remove(g_tempFile);
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret == PARAM_1, &result);
    return result;
}

static napi_value Printf_One(napi_env env, napi_callback_info info)
{
    int ret = printf("%s \n", "A string");
    napi_value result = nullptr;
    napi_create_int32(env, ret == PARAM_10, &result);
    return result;
}

static napi_value Putc_One(napi_env env, napi_callback_info info)
{
    int ret = MPARAM_1;
    FILE *fp = fopen(g_tempFile, "w");
    NAPI_ASSERT(env, fp != nullptr, "Putc_One fopen Error");
    char ch = 'p';
    ret = putc(ch, fp);
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, ret == 'p', &result);
    return result;
}

static napi_value Putchar_One(napi_env env, napi_callback_info info)
{
    int ret = MPARAM_1;
    char ch[] = "this is putchar_ont test case, std output success!";
    int length = SIZEOF_CHAR(ch);
    for (int nLoop = PARAM_0; nLoop < length; nLoop++) {
        ret = putchar(ch[nLoop]);
        NAPI_ASSERT(env, ret == ch[nLoop], "Putchar_One Error");
    }
    napi_value result = nullptr;
    napi_create_int32(env, PARAM_1, &result);
    return result;
}

static napi_value Putenv_One(napi_env env, napi_callback_info info)
{
    char src[] = "test=Putenv_One";
    int ret = unsetenv("test");
    NAPI_ASSERT(env, ret == PARAM_0, "Putenv_One unsetenv Error");
    ret = putenv(src);
    NAPI_ASSERT(env, ret == PARAM_0, "Putenv_One putenv Error");
    char *test = getenv("test");
    NAPI_ASSERT(env, test != nullptr, "Putenv_One getenv Error");
    unsetenv("test");
    napi_value result = nullptr;
    napi_create_int32(env, strcmp("Putenv_One", test) == PARAM_0, &result);
    return result;
}

static napi_value Puts_One(napi_env env, napi_callback_info info)
{
    char src[] = "Puts_One";
    int ret = puts(src);
    NAPI_ASSERT(env, ret != EOF, "Puts_One puts Error");
    napi_value result = nullptr;
    napi_create_int32(env, ret == PARAM_0, &result);
    return result;
}

static napi_value Putw_One(napi_env env, napi_callback_info info)
{
    FILE *fp = fopen(g_tempFile, "w");
    NAPI_ASSERT(env, fp != nullptr, "Putw_One fopen Error");
    int ret = putw(PARAM_10, fp);
    NAPI_ASSERT(env, ret != EOF, "Putw_One putw Error");
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, ret == PARAM_0, &result);
    return result;
}

static napi_value Remove_One(napi_env env, napi_callback_info info)
{
    FILE *fp = fopen(g_tempFile, "w");
    NAPI_ASSERT(env, fp != nullptr, "Remove_One fopen Error");
    fclose(fp);
    int ret = remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, ret == PARAM_0, &result);
    return result;
}

static napi_value Rename_One(napi_env env, napi_callback_info info)
{
    FILE *fp = fopen(g_tempFile, "w");
    NAPI_ASSERT(env, fp != nullptr, "Rename_One fopen Error");
    int ret = rename(g_tempFile, g_tempLinkFile);
    fclose(fp);
    remove(g_tempLinkFile);
    napi_value result = nullptr;
    napi_create_int32(env, ret == PARAM_0, &result);
    return result;
}

static napi_value Renameat_One(napi_env env, napi_callback_info info)
{
    int oldfd = open(g_tempFile, O_CREAT, PARAM_0777);
    int newfd = open(TEMP_FILE_NEW, O_CREAT, PARAM_0777);
    NAPI_ASSERT(env, oldfd != EOF && newfd != EOF, "Renameat_One open Error");
    int ret = renameat(oldfd, g_tempFile, newfd, TEMP_FILE_NEW);
    close(oldfd);
    close(newfd);
    remove(g_tempFile);
    remove(TEMP_FILE_NEW);
    napi_value result = nullptr;
    napi_create_int32(env, ret == PARAM_0, &result);
    return result;
}

static napi_value Rewind_One(napi_env env, napi_callback_info info)
{
    FILE *fp = fopen(g_tempFile, "w");
    NAPI_ASSERT(env, fp != nullptr, "Rewind_One fopen Error");
    char str[] = "test";
    fwrite(str, PARAM_1, sizeof(str), fp);
    rewind(fp);
    napi_value result = nullptr;
    napi_create_int32(env, feof(fp) == false, &result);
    fclose(fp);
    remove(g_tempFile);
    return result;
}

static napi_value Scanf_One(napi_env env, napi_callback_info info)
{
    FILE *fp = fopen(g_tempFile, "w");
    NAPI_ASSERT(env, fp != nullptr, "Scanf_One fopen Error");
    char str[] = "testscanf";
    fputs(str, fp);
    fseek(fp, PARAM_0, SEEK_SET);
    FILE *fp1 = freopen(g_tempFile, "r", stdin);
    NAPI_ASSERT(env, fp1 != nullptr, "Scanf_One freopen Error");
    char ch[50] = {0};
    int ret = scanf("%s", ch);
    NAPI_ASSERT(env, ret == PARAM_1, "scanf Error");
    fclose(fp);
    fclose(fp1);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, strcmp(ch, "testscanf") == PARAM_0, &result);
    return result;
}

static napi_value Setvbuf_One(napi_env env, napi_callback_info info)
{
    FILE *fp = fopen(g_tempFile, "w");
    NAPI_ASSERT(env, fp != nullptr, "Setvbuf_One fopen Error");
    char buff[1024] = {0};
    int ret = setvbuf(fp, buff, _IOFBF, PARAM_1024);
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, ret == PARAM_0, &result);
    return result;
}

static napi_value Snprintf_One(napi_env env, napi_callback_info info)
{
    char dest[100] = {0};
    int ret = MPARAM_1;
    ret = snprintf(dest, PARAM_100, "The half of %d is %d", PARAM_60, PARAM_60 / PARAM_2);
    napi_value result = nullptr;
    napi_create_int32(env, ret == PARAM_20, &result);
    return result;
}

static napi_value Sprintf_One(napi_env env, napi_callback_info info)
{
    char dest[50] = {0};
    int ret = MPARAM_1;
    ret = sprintf(dest, "%d plus %d is %d", PARAM_5, PARAM_3, PARAM_5 + PARAM_3);
    napi_value result = nullptr;
    napi_create_int32(env, ret == PARAM_13, &result);
    return result;
}

static napi_value Sscanf_One(napi_env env, napi_callback_info info)
{
    const char src[] = "Rudolph is 12 years old";
    char dest[20] = {0};
    int i;
    int ret = MPARAM_1;
    ret = sscanf(src, "%s %*s %d", dest, &i);
    napi_value result = nullptr;
    napi_create_int32(env, ret == PARAM_2, &result);
    return result;
}

static napi_value Stderr_One(napi_env env, napi_callback_info info)
{
    int ret = fileno(stderr);
    napi_value result = nullptr;
    napi_create_int32(env, ret == PARAM_2, &result);
    return result;
}
static napi_value Stdin_One(napi_env env, napi_callback_info info)
{
    int ret = fileno(stdin);
    napi_value result = nullptr;
    napi_create_int32(env, ret == PARAM_0, &result);
    return result;
}
static napi_value Stdout_One(napi_env env, napi_callback_info info)
{
    int ret = fileno(stdout);
    napi_value result = nullptr;
    napi_create_int32(env, ret == PARAM_1, &result);
    return result;
}

static napi_value Tempnam_One(napi_env env, napi_callback_info info)
{
    const char *TEMP_PATH = "/data/storage/el2/base/files/";
    const char *TEMP_NAME = "temp";
    char *ret = tempnam(TEMP_PATH, TEMP_NAME);
    NAPI_ASSERT(env, ret != nullptr, "Tempnam_One tempnam Error");
    napi_value result = nullptr;
    napi_create_int32(env, strstr(ret, TEMP_NAME) != nullptr, &result);
    return result;
}

static napi_value Tmpname_One(napi_env env, napi_callback_info info)
{
    char buffer[L_tmpnam];
    char *ret = tmpnam(buffer);
    napi_value result = nullptr;
    napi_create_int32(env, ret != nullptr && strlen(ret) > PARAM_0, &result);
    return result;
}

static napi_value Ungetc_One(napi_env env, napi_callback_info info)
{
    FILE *fp = fopen(g_tempFile, "w+");
    NAPI_ASSERT(env, fp != nullptr, "ungetc fopen Error");
    int ch = 'a';
    putc(ch, fp);
    fseek(fp, PARAM_0, SEEK_SET);
    int ret = ungetc(ch, fp);
    ret = getc(fp);
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, ret == 'a', &result);
    return result;
}

extern "C" int Vasprintf_Test(const char *format, ...);
int Vasprintf_Test(const char *format, ...)
{
    va_list args;
    va_start(args, format);
    char ta[] = " ";
    char *temp = ta;
    vasprintf(&temp, format, args);
    va_end(args);
    return strcmp(temp, "value is 123 and 321.") == PARAM_0;
}

static napi_value Vasprintf_One(napi_env env, napi_callback_info info)
{
    int ret = Vasprintf_Test("value is %d and %d.", PARAM_123, PARAM_321);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

extern "C" int Vdprintf_Test(int fd, const char *format, ...);
int Vdprintf_Test(int fd, const char *format, ...)
{
    va_list args;
    va_start(args, format);
    int ret = MPARAM_1;
    ret = vdprintf(fd, format, args);
    va_end(args);
    return ret;
}

static napi_value Vdprintf_One(napi_env env, napi_callback_info info)
{
    int fd = open(g_tempFile, O_CREAT | O_RDWR, PARAM_0777);
    NAPI_ASSERT(env, fd != EOF, "vdprintf open Error");
    char value[] = "asdf";
    char dest[20] = {0};
    int ret = MPARAM_1;
    ret = Vdprintf_Test(fd, "%s", value);
    NAPI_ASSERT(env, ret >= PARAM_0, "vdprintf Error");
    FILE *fp = fdopen(fd, "r");
    rewind(fp);
    fread(dest, sizeof(char), sizeof(dest), fp);
    fclose(fp);
    close(fd);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, strcmp(dest, "asdf") == PARAM_0, &result);
    return result;
}

extern "C" int Vfprintf_Test(const char *file_name, const char *format, const char *want_reuslt, ...);
int Vfprintf_Test(const char *file_name, const char *format, const char *want_reuslt, ...)
{
    FILE *fp = fopen(file_name, "w+");
    va_list args;
    va_start(args, want_reuslt);
    vfprintf(fp, format, args);
    va_end(args);
    rewind(fp);
    char dest[100] = {0};
    fread(dest, sizeof(char), sizeof(dest), fp);
    fclose(fp);
    remove(file_name);
    return strcmp(dest, want_reuslt) == PARAM_0;
}

static napi_value Vfprintf_One(napi_env env, napi_callback_info info)
{
    int ret = Vfprintf_Test(g_tempFile, "value is %s and %s", "value is qwe and 1", "qwe", "1");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

extern "C" int Vfscanf_Test(FILE *fp, const char *format, ...);
int Vfscanf_Test(FILE *fp, const char *format, ...)
{
    va_list args;
    va_start(args, format);
    int result = vfscanf(fp, format, args);
    va_end(args);
    return result;
}

static napi_value Vfscanf_One(napi_env env, napi_callback_info info)
{
    FILE *fp = fopen(g_tempFile, "w+");
    NAPI_ASSERT(env, fp != nullptr, "Vfscanf_One fopen Error");
    fprintf(fp, "%s %d", "vfscanftest", PARAM_123);
    rewind(fp);
    char dest[100] = {0};
    int val = PARAM_0;
    int ret = MPARAM_1;
    ret = Vfscanf_Test(fp, "%s %d", dest, &val);
    NAPI_ASSERT(env, ret >= PARAM_0, "vfscanf Error");
    fclose(fp);
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, strcmp(dest, "vfscanftest") == PARAM_0, &result);
    return result;
}

extern "C" int Vprintf_Test(const char *format, ...);
int Vprintf_Test(const char *format, ...)
{
    va_list args;
    va_start(args, format);
    int result = vprintf(format, args);
    char want[] = "This is the 1th test for vprintf";
    va_end(args);
    return result == strlen(want);
}

static napi_value Vprintf_One(napi_env env, napi_callback_info info)
{
    int ret = Vprintf_Test("This is the %dth test for vprintf", PARAM_1);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

extern "C" int Vsnprintf_test(const char *want_reuslt, size_t n, const char *format, const char *func_name, ...);
int Vsnprintf_test(const char *want_reuslt, size_t n, const char *format, const char *func_name, ...)
{
    va_list args;
    va_start(args, func_name);
    char s[n];
    int result = vsnprintf(s, n, format, args);
    va_end(args);
    return (strcmp(s, want_reuslt) == PARAM_0) && (result == n - PARAM_1);
}

static napi_value Vsnprintf_One(napi_env env, napi_callback_info info)
{
    int ret = Vsnprintf_test("value is use", PARAM_13, "value is %s", "Vsnprintf_One", "use");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

extern "C" int Vsscanf_Test(const char *str, const char *format, ...);
int Vsscanf_Test(const char *str, const char *format, ...)
{
    va_list args;
    va_start(args, format);
    int result = vsscanf(str, format, args);
    va_end(args);
    return result;
}

static napi_value Vsscanf_One(napi_env env, napi_callback_info info)
{
    int val;
    char dest[1024] = {0};
    int ret = Vsscanf_Test("99 bottles of beer on the wall", " %d %s ", &val, dest);
    napi_value result = nullptr;
    napi_create_int32(env, ret == PARAM_2 && val == PARAM_99 && strcmp(dest, "bottles") == PARAM_0, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"Fgets_chk_One", nullptr, Fgets_chk_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Fread_Chk_One", nullptr, Fread_Chk_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Pwrite_Chk_One", nullptr, Pwrite_Chk_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Readlinkat_Chk_One", nullptr, Readlinkat_Chk_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Snprintf_Chk_One", nullptr, Snprintf_Chk_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Sprintf_Chk_One", nullptr, Sprintf_Chk_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Vsnprintf_Chk_One", nullptr, Vsnprintf_Chk_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Write_Chk_One", nullptr, Write_Chk_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Asprintf_One", nullptr, Asprintf_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ClearErr_One", nullptr, ClearErr_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Clearerr_Unlocked_One", nullptr, Clearerr_Unlocked_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Dprintf_One", nullptr, Dprintf_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Fclose_One", nullptr, Fclose_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Fdopen_One", nullptr, Fdopen_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Feof_unlocked_One", nullptr, Feof_unlocked_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Ferror_One", nullptr, Ferror_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Ferror_unlocked_One", nullptr, Ferror_unlocked_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Fflush_One", nullptr, Fflush_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Fflush_unlocked_One", nullptr, Fflush_unlocked_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Fgetc_One", nullptr, Fgetc_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Fgetc_unlocked_One", nullptr, Fgetc_unlocked_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Fgetin_One", nullptr, Fgetin_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Fgetpos_One", nullptr, Fgetpos_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Fgetpos64_One", nullptr, Fgetpos64_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Fgets_One", nullptr, Fgets_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Fgets_unlocked_One", nullptr, Fgets_unlocked_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Fileno_One", nullptr, Fileno_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Fileno_unlocked_One", nullptr, Fileno_unlocked_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Flockfile_One", nullptr, Flockfile_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Fmemopen_One", nullptr, Fmemopen_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Fopen_One", nullptr, Fopen_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Fopen64_One", nullptr, Fopen64_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Fprintf_One", nullptr, Fprintf_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Fpurge_One", nullptr, Fpurge_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Fputc_One", nullptr, Fputc_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Fputc_unlocked_One", nullptr, Fputc_unlocked_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Fputs_One", nullptr, Fputs_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Fputs_unlocked_One", nullptr, Fputs_unlocked_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Fread_One", nullptr, Fread_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Fread_unlocked_One", nullptr, Fread_unlocked_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Freopen_One", nullptr, Freopen_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Freopen64_One", nullptr, Freopen64_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Fscanf_One", nullptr, Fscanf_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Fseek_One", nullptr, Fseek_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Fseeko_One", nullptr, Fseeko_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Fseeko64_One", nullptr, Fseeko64_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Fsetpos_One", nullptr, Fsetpos_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Fsetpos64_One", nullptr, Fsetpos64_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Ftell_One", nullptr, Ftell_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Ftello_One", nullptr, Ftello_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Ftello64_One", nullptr, Ftello64_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Ftrylockfile_One", nullptr, Ftrylockfile_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Funlockfile_One", nullptr, Funlockfile_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Fwrite_One", nullptr, Fwrite_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Fwrite_unlocked_One", nullptr, Fwrite_unlocked_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Getc_One", nullptr, Getc_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Getc_unlocked_One", nullptr, Getc_unlocked_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetChar_One", nullptr, GetChar_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetChar_unlocked_One", nullptr, GetChar_unlocked_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PutC_unlocked_One", nullptr, PutC_unlocked_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PutChar_unlocked_One", nullptr, PutChar_unlocked_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Getdelim_One", nullptr, Getdelim_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Getline_One", nullptr, Getline_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Gets_One", nullptr, Gets_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Nrand48_One", nullptr, Nrand48_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Open_Memstream_One", nullptr, Open_Memstream_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Perror_One", nullptr, Perror_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Printf_One", nullptr, Printf_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Putc_One", nullptr, Putc_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Putchar_One", nullptr, Putchar_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Putenv_One", nullptr, Putenv_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Puts_One", nullptr, Puts_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Putw_One", nullptr, Putw_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Remove_One", nullptr, Remove_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Rename_One", nullptr, Rename_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Renameat_One", nullptr, Renameat_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Rewind_One", nullptr, Rewind_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Scanf_One", nullptr, Scanf_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Setvbuf_One", nullptr, Setvbuf_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Snprintf_One", nullptr, Snprintf_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Sprintf_One", nullptr, Sprintf_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Sscanf_One", nullptr, Sscanf_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Stderr_One", nullptr, Stderr_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Stdin_One", nullptr, Stdin_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Stdout_One", nullptr, Stdout_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Tempnam_One", nullptr, Tempnam_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Tmpname_One", nullptr, Tmpname_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Ungetc_One", nullptr, Ungetc_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Vasprintf_One", nullptr, Vasprintf_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Vdprintf_One", nullptr, Vdprintf_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Vfprintf_One", nullptr, Vfprintf_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Vfscanf_One", nullptr, Vfscanf_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Vprintf_One", nullptr, Vprintf_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Vsnprintf_One", nullptr, Vsnprintf_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Vsscanf_One", nullptr, Vsscanf_One, nullptr, nullptr, nullptr, napi_default, nullptr},

    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}

EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "stdiondk1",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
