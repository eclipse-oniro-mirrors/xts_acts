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
#include <cstdarg>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <fcntl.h>
#include <sys/inotify.h>
#include <unistd.h>
#include <utmp.h>
#include <uv.h>

#define SBUF_SIZE 128
#define ONEVAL 1
#define MINUSONE (-1)
#define SUCCESS 1
#define ERRON_0 0
#define SIZE_20 20
#define PARAM_1 1
#define PARAM_2 2
#define ZEROVAL 0
#define PATH "/data/storage/el2/base/files"
#define TEST_MODE 0666
#define PARAM_0777 0777
#define SBUF_SIZE 128
#define ZEROVAL 0
#define ONEVAL 1
#define MINUSONE (-1)
#define SIXFOUR 64
#define ONEEIGHT 18
#define MAX_NAMBER 1024
#define HUNDRED 100
#define MAX_NUMBER 128
#define NO_ERR 0
#define SUCCESS 1
#define FAIL (-1)
#define ZERO 0
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_5 5
#define PARAM_13 13
#define SIZE_64 64
#define PARAM_123 123
#define PARAM_321 321
#define HUNDRED 100
#define PATH "/data/storage/el2/base/files"
#define STRLENGTH 64
#define ONE 1
#define PARAM_2 2
#define PARAM_UNNORMAL (-1)
#define RETURN_0 0
#define SIZE_10 10
#define SIZE_20 20
#define SIZE_100 100
#define SIZE_1024 1024
#define SIZE_4096 4096
#define SIZE_8192 8192
#define ONESIX 16
#define DEF_VALUE (-2)
#define PARAM_10 10
#define LENGTH 256
#define RUTVAL 112
#define STR_VFSCANF_TXT "/data/storage/el2/base/files/Fzl.txt"

extern "C" int __vsprintf_chk(char *dest, int flags, size_t dst_len_from_compiler, const char *format, va_list va);

extern "C" size_t __fread_chk(void *, size_t, size_t, FILE *, size_t);
extern "C" char *__fgets_chk(char *, int, FILE *, size_t);
extern "C" ssize_t __pwrite_chk(int fd, const void *buf, size_t count, off_t offset, size_t buf_size);
extern "C" ssize_t __write_chk(int fd, const void *buf, size_t count, size_t buf_size);
extern "C" int __sprintf_chk(char *dest, int flags, size_t dst_len_from_compiler, const char *format, ...);
extern "C" int __snprintf_chk(char *dest, size_t supplied_size, int flags, size_t dst_len_from_compiler,
                              const char *format, ...);
extern "C" int __vsnprintf_chk(char *dest, size_t supplied_size, int flags, size_t dst_len_from_compiler,
                               const char *format, va_list va);

static napi_value Setbuf(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    FILE *f = fopen(STR_VFSCANF_TXT, "w+");
    NAPI_ASSERT(env, f != nullptr, "Setbuf fopen Error");
    setbuf(f, nullptr);
    fclose(f);
    napi_value result = nullptr;
    napi_create_int32(env, errno, &result);
    return result;
}

static napi_value Setbuffer(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    FILE *f = fopen(STR_VFSCANF_TXT, "w+");
    NAPI_ASSERT(env, f != nullptr, "Setbuffer fopen Error");
    setbuffer(f, nullptr, BUFSIZ);
    fclose(f);
    napi_value result = nullptr;
    napi_create_int32(env, errno, &result);
    return result;
}

static napi_value Setlinebuf(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    FILE *f = fopen(STR_VFSCANF_TXT, "w+");
    NAPI_ASSERT(env, f != nullptr, "Setlinebuf fopen Error");
    setlinebuf(f);
    fclose(f);
    napi_value result = nullptr;
    napi_create_int32(env, errno, &result);
    return result;
}

int VsprintfTest(char *format, ...)
{
    char buffer[SIZE_20] = {0};
    va_list aptr;
    va_start(aptr, format);
    int vspval = vsprintf(buffer, format, aptr);
    va_end(aptr);
    return vspval;
}
static napi_value Vsprintf(napi_env env, napi_callback_info info)
{
    int i = ONEVAL;
    napi_value result = nullptr;
    char format[SBUF_SIZE] = "%d";
    int vspval = VsprintfTest(format, i);
    if (vspval > ZEROVAL) {
        napi_create_int32(env, ZEROVAL, &result);
    } else {
        napi_create_int32(env, MINUSONE, &result);
    }
    return result;
}

int vsprintfChkTest(char *format, ...)
{
    char buffer[SIZE_20] = {0};
    va_list aptr;
    va_start(aptr, format);
    int vspval = __vsprintf_chk(buffer, PARAM_1, PARAM_2, format, aptr);
    va_end(aptr);
    return vspval;
}
static napi_value VsprintfChk(napi_env env, napi_callback_info info)
{
    int i = ONEVAL;
    napi_value result = nullptr;
    char format[SBUF_SIZE] = "%d";
    int vspval = vsprintfChkTest(format, i);
    if (vspval > ZEROVAL) {
        napi_create_int32(env, ZEROVAL, &result);
    } else {
        napi_create_int32(env, MINUSONE, &result);
    }
    return result;
}
static napi_value Feof(napi_env env, napi_callback_info info)
{
    char path[SBUF_SIZE] = "/data/storage/el2/base/files/Fzl.txt";
    int fileDescribe = SUCCESS;
    FILE *stream = fopen(path, "r");
    NAPI_ASSERT(env, stream != nullptr, "Feof fopen Error");
    napi_value result = nullptr;
    fileDescribe = feof(stream);
    fclose(stream);
    napi_create_int32(env, fileDescribe, &result);
    return result;
}

static napi_value Tmpnam(napi_env env, napi_callback_info info)
{
    char buffer[L_tmpnam];
    char *p = tmpnam(buffer);
    napi_value result = nullptr;
    napi_create_string_utf8(env, p, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Tmpfile(napi_env env, napi_callback_info info)
{
    FILE *f = tmpfile();
    int file_value = ZERO;
    if (f == nullptr) {
        file_value = FAIL;
    }
    napi_value result = nullptr;
    napi_create_int32(env, file_value, &result);
    return result;
}

static napi_value Tmpfile64(napi_env env, napi_callback_info info)
{
    FILE *f = tmpfile64();
    int file_value = ZERO;
    if (f == nullptr) {
        file_value = FAIL;
    }
    napi_value result = nullptr;
    napi_create_int32(env, file_value, &result);
    return result;
}

int vsnprintfChk_test(char *str, size_t n, char *fmt, const char *funcName, ...)
{
    char s[n];
    va_list ap;
    va_start(ap, funcName);
    size_t bos = __DIAGNOSE_BOS(fmt);
    int vsnval = __vsnprintf_chk(s, n, ZEROVAL, bos, fmt, ap);
    va_end(ap);
    return vsnval;
}

static napi_value VsnprintfChk(napi_env env, napi_callback_info info)
{
    char value[MAX_NUMBER] = "value is use";
    char value1[MAX_NUMBER] = "value is %s";
    int vsnval = vsnprintfChk_test(value, PARAM_13, value1, "vsnprintfChk_test", "use");
    napi_value result = nullptr;
    if (vsnval < ZEROVAL) {
        napi_create_int32(env, MINUSONE, &result);
    } else {
        napi_create_int32(env, ZEROVAL, &result);
    }
    return result;
}

static napi_value SnprintfChk(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int isSuccessCase;
    napi_get_value_int32(env, args[0], &isSuccessCase);
    char buffer[SIZE_20];
    int snprintf_value = DEF_VALUE;
    int toJs = DEF_VALUE;
    if (isSuccessCase == PARAM_1) {
        snprintf_value = __snprintf_chk(buffer, SIZE_20, PARAM_0, SIZE_20, "hello : %s", "world!");
        if (snprintf_value > PARAM_0) {
            toJs = PARAM_1;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, toJs, &result);
    return result;
}

static napi_value SprintfChk(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int isSuccessCase;
    napi_get_value_int32(env, args[0], &isSuccessCase);
    char buffer[SIZE_20];
    int sprintfValue = DEF_VALUE;
    int toJs = DEF_VALUE;
    if (isSuccessCase == PARAM_1) {
        sprintfValue = __sprintf_chk(buffer, PARAM_0, SIZE_20, "hello : %s", "world!");
        if (sprintfValue > PARAM_0) {
            toJs = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, toJs, &result);
    return result;
}

static napi_value WriteChk(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    size_t length = SIZE_64, stresult = PARAM_0;
    char *strTemp = static_cast<char *>(malloc(sizeof(char) * length));
    napi_get_value_string_utf8(env, args[0], strTemp, length, &stresult);
    char *valueSecond = NapiHelper::GetString(env, args[1]);

    int fp = open(strTemp, O_WRONLY | O_CREAT, PARAM_0777);
    ssize_t valueResult = __write_chk(fp, valueSecond, strlen(valueSecond), strlen(valueSecond) + PARAM_1);
    int toJs = DEF_VALUE;
    if (valueResult != FAIL) {
        toJs = SUCCESS;
    }
    close(fp);
    napi_value result = nullptr;
    napi_create_int32(env, toJs, &result);
    return result;
}

static napi_value PwriteChk(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    size_t length = SIZE_64, stresult = PARAM_0;
    char *strTemp = static_cast<char *>(malloc(sizeof(char) * length));
    napi_get_value_string_utf8(env, args[0], strTemp, length, &stresult);
    char *valueSecond = NapiHelper::GetString(env, args[1]);

    int fp = open(strTemp, O_WRONLY | O_CREAT, PARAM_0777);
    ssize_t valueResult = __pwrite_chk(fp, valueSecond, strlen(valueSecond), PARAM_5, strlen(valueSecond) + PARAM_1);
    int toJs = DEF_VALUE;
    if (valueResult != FAIL) {
        toJs = SUCCESS;
    }
    close(fp);
    napi_value result = nullptr;
    napi_create_int32(env, toJs, &result);
    return result;
}

static napi_value FgetsChk(napi_env env, napi_callback_info info)
{
    char helloWorld[] = "hello world!";
    FILE *fp = fmemopen(helloWorld, sizeof(helloWorld), "r");
    const int bufferSize = ONESIX;
    char buf[bufferSize];
    char *char_value;
    char_value = __fgets_chk(buf, sizeof(buf), fp, ONESIX);
    fclose(fp);
    napi_value result = nullptr;
    napi_create_string_utf8(env, char_value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Fread_chk(napi_env env, napi_callback_info info)
{
    size_t bos = ZERO;
    FILE *file;
    char buffer[20];
    file = fopen(PATH, "r");
    int ret = __fread_chk(buffer, bos, bos, file, bos);
    fclose(file);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

int vasprintf_0100(char *v, ...)
{
    va_list ap;
    va_start(ap, v);
    char ta[] = " ";
    char *temp = ta;
    int result = vasprintf(&temp, v, ap);
    if (result < PARAM_0 || strcmp(temp, "value is 123 and 321.") != PARAM_0) {
        result = FAIL;
    }
    va_end(ap);
    return result;
}

static napi_value Vasprintf(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int caseNumber;
    int toJs = FAIL;
    napi_get_value_int32(env, args[0], &caseNumber);
    if (caseNumber == PARAM_1) {
        char cb[] = "value is %d and %d.";
        int value = vasprintf_0100(cb, PARAM_123, PARAM_321);
        if (value != FAIL) {
            toJs = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, toJs, &result);
    return result;
}

static napi_value Ungetc(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int valueFirst = getchar();
    napi_get_value_int32(env, args[0], &valueFirst);
    FILE *fp = fopen("/data/storage/el2/base/files/FZL.txt", "r");
    valueFirst = getc(fp);
    int ungetcValue = ungetc(valueFirst, fp);
    fclose(fp);
    napi_value result = nullptr;
    napi_create_int32(env, ungetcValue, &result);
    return result;
}

static napi_value Putw(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    FILE *fp;
    napi_value result = nullptr;
    char file[LENGTH] = "/data/storage/el2/base/files/testPutw.txt";
    fp = fopen(file, "w+");
    if (valueFirst == ZEROVAL) {
        int putval = putw(PARAM_10, fp);
        napi_create_int32(env, putval, &result);
    } else {
        int putval = putw(PARAM_10, stdin);
        napi_create_int32(env, putval, &result);
    }
    fclose(fp);
    return result;
}

static napi_value Rename(napi_env env, napi_callback_info info)
{
    char oldName[] = "/data/storage/el2/base/files/testRenameOld.txt";
    char newName[] = "/data/storage/el2/base/files/testRenameNew.txt";
    int resultValue = rename(oldName, newName);
    napi_value result = nullptr;

    napi_create_int32(env, resultValue, &result);
    return result;
}
int vfsf(FILE *file, char *fmt, ...)
{
    va_list argp;
    int value;
    va_start(argp, fmt);
    value = vfscanf(file, fmt, argp);
    va_end(argp);
    return value;
}
#define TFVAL 24
#define FFVAL 40.0
static napi_value Vfscanf(napi_env env, napi_callback_info info)
{
    errno = ZEROVAL;
    FILE *file;
    int i = TFVAL;
    float fl = FFVAL;
    char str[4] = "boy";
    file = fopen("/data/storage/el2/base/files/Fzl.txt", "w+");
    char value[MAX_NUMBER] = "%d%f%s";
    int ret = vfsf(file, value, i, fl, str);
    rewind(file);
    fscanf(file, "%d%f%s", &i, &fl, str);
    fclose(file);
    if (errno == NO_ERR) {
        ret = SUCCESS;
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Remove(napi_env env, napi_callback_info info)
{
    char path[] = "/data/storage/el2/base/files/testRemove.txt";
    int resultValue = remove(path);
    napi_value result = nullptr;

    napi_create_int32(env, resultValue, &result);
    return result;
}

int vfprintftest(char *file_name, char *format, char *funcName, char *want_reuslt, ...)
{
    FILE *file = fopen(file_name, "w");
    va_list ap;
    va_start(ap, want_reuslt);
    int vfpval = vfprintf(file, format, ap);
    va_end(ap);
    fclose(file);
    return vfpval;
}

static napi_value Vfprintf(napi_env env, napi_callback_info info)
{
    char value1[MAX_NUMBER] = "/data/storage/el2/base/files/test.txt";
    char value2[MAX_NUMBER] = "value is %s and %d";
    char value3[MAX_NUMBER] = "vfprintf_0100";
    char value4[MAX_NUMBER] = "value is qwe and 1";

    int vfpval = vfprintftest(value1, value2, value3, value4, "qwe", "1");
    napi_value result;
    if (vfpval < ZEROVAL) {
        napi_create_int32(env, MINUSONE, &result);
    } else {
        napi_create_int32(env, ZEROVAL, &result);
    }
    return result;
}

int vprintf()
{
    va_list ap;
    return vfprintf(stdout, "/data/storage/el2/base/files/test.txt", ap);
}

int VprintfTestt(char *format, ...)
{
    va_list args;
    va_start(args, format);
    int vprval = vprintf(format, args);
    va_end(args);
    return vprval;
}

static napi_value Vprintf(napi_env env, napi_callback_info info)
{
    char value[MAX_NUMBER] = "value is %s and %d";
    int vprval = VprintfTestt(value);
    napi_value result;
    if (vprval < ZEROVAL) {
        napi_create_int32(env, MINUSONE, &result);
    } else {
        napi_create_int32(env, ZEROVAL, &result);
    }
    return result;
}

int vsnprintf_test(char *str, size_t n, char *fmt, const char *funcName, ...)
{
    char s[n];
    va_list ap;
    va_start(ap, funcName);
    int vsnval = vsnprintf(s, n, fmt, ap);
    va_end(ap);
    return vsnval;
}

static napi_value Vsnprintf(napi_env env, napi_callback_info info)
{
    char value1[MAX_NUMBER] = "value is use";
    char value2[MAX_NUMBER] = "value is %s";

    int vsnval = vsnprintf_test(value1, 13, value2, "vsnprintf_test", "use");
    napi_value result = nullptr;
    if (vsnval < ZEROVAL) {
        napi_create_int32(env, MINUSONE, &result);
    } else {
        napi_create_int32(env, ZEROVAL, &result);
    }
    return result;
}

int GetMatches(const char *str, const char *format, ...)
{
    va_list args;
    va_start(args, format);
    int vssval = vsscanf(str, format, args);
    va_end(args);
    return vssval;
}

static napi_value Vsscanf(napi_env env, napi_callback_info info)
{
    int val = ZEROVAL;
    char buf[HUNDRED];
    int vssval = GetMatches("99 bottles of beer on the wall", " %d %s ", &val, buf);
    napi_value result;
    if (vssval < ZEROVAL) {
        napi_create_int32(env, MINUSONE, &result);
    } else {
        napi_create_int32(env, ZEROVAL, &result);
    }
    return result;
}

static napi_value Tempnam(napi_env env, napi_callback_info info)
{
    char dir[] = PATH;
    char pte[] = "temp";
    char *temp = tempnam(dir, pte);
    napi_value result = nullptr;
    napi_create_string_utf8(env, temp, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Sscanf(napi_env env, napi_callback_info info)
{
    const char *fmt = "temp";
    char s[] = "temp";
    int snprintf_value = sscanf(s, fmt, fmt);
    napi_value result = nullptr;
    napi_create_int32(env, snprintf_value, &result);
    return result;
}

static napi_value Snprintf(napi_env env, napi_callback_info info)
{
    char buffer[20];
    const char *format = "AB";
    int snprintf_value = snprintf(buffer, ZERO, format, format);
    napi_value result = nullptr;
    napi_create_int32(env, snprintf_value, &result);
    return result;
}

static napi_value Setvbuf(napi_env env, napi_callback_info info)
{
    char buf[MAX_NAMBER] = {0};
    char path[PATH_MAX] = {0};
    FILE *fptr = fopen("/data/storage/el2/base/files/FZL.txt", "w+");
    int setval = setvbuf(fptr, buf, _IOFBF, MAX_NAMBER);
    napi_value result = nullptr;
    napi_create_int32(env, setval, &result);
    fclose(fptr);
    remove(path);
    return result;
}

static napi_value PutCUnlocked(napi_env env, napi_callback_info info)
{
    const int32_t PUTC_RET = RUTVAL;
    int ret = FAIL;
    FILE *file = fopen("/data/storage/el2/base/files/fzl.txt", "w");
    if (putc_unlocked('p', file) != PUTC_RET) {
        ret = FAIL;
    } else {
        ret = SUCCESS;
    }
    fclose(file);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Putc(napi_env env, napi_callback_info info)
{
    const int32_t PUTC_RET = RUTVAL;
    int ret = FAIL;
    FILE *file = fopen("/data/storage/el2/base/files/fzl.txt", "w");
    if (putc('p', file) != PUTC_RET) {
        ret = FAIL;
    } else {
        ret = SUCCESS;
    }
    fclose(file);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"setbuf", nullptr, Setbuf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setbuffer", nullptr, Setbuffer, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setlinebuf", nullptr, Setlinebuf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"vsprintf", nullptr, Vsprintf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"vsprintfChk", nullptr, VsprintfChk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"feof", nullptr, Feof, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"putc", nullptr, Putc, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"putCUnlocked", nullptr, PutCUnlocked, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setvbuf", nullptr, Setvbuf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"snprintf", nullptr, Snprintf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sscanf", nullptr, Sscanf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tempnam", nullptr, Tempnam, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"vsscanf", nullptr, Vsscanf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"vsnprintf", nullptr, Vsnprintf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"vprintf", nullptr, Vprintf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"vfprintf", nullptr, Vfprintf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"vfscanf", nullptr, Vfscanf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"remove", nullptr, Remove, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"rename", nullptr, Rename, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"putw", nullptr, Putw, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ungetc", nullptr, Ungetc, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"vasprintf", nullptr, Vasprintf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"freadChk", nullptr, Fread_chk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fgetsChk", nullptr, FgetsChk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pwriteChk", nullptr, PwriteChk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"writeChk", nullptr, WriteChk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sprintfChk", nullptr, SprintfChk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"snprintfChk", nullptr, SnprintfChk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"vsnprintfChk", nullptr, VsnprintfChk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tmpfile", nullptr, Tmpfile, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tmpfile64", nullptr, Tmpfile64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tmpnam", nullptr, Tmpnam, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "stdio",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
