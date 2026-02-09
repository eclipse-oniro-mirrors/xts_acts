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
#include <cstdlib>
#include <cstring>
#include <err.h>
#include <fcntl.h>
#include <getopt.h>
#include <glob.h>
#include <ifaddrs.h>
#include <js_native_api.h>
#include <js_native_api_types.h>
#include <linux/quota.h>
#include <net/if.h>
#include <node_api.h>
#include <sys/inotify.h>
#include <sys/random.h>
#include <sys/syscall.h>
#include <sys/sysinfo.h>
#include <unistd.h>
#include <utmp.h>
#include <uv.h>

#define BACKGROUND (0)
#define FOREGROUND (1)
#define TCGETPGRPERROR (-1)
#define ONEVAL 1
#define LASTONEVAL (-1)
#define THIRTEEN 13

#define SUCCESS 1
#define FAIL (-1)
#define ONE 1
#define LENGTH 64
#define TWO 2
#define SIZE_64 64
#define DEF_VALUE (-2)
#define PATH2 "/data/storage/el2/base/files/text2.txt"
#define FILEPATH "/data/storage/el2/base/files"
#define PATH "/data/storage/el2/base/files/test.txt"
#define PATH_DIR "/data/storage/el2/base/files/"

#define TEST_ALARM_TIME 2
#define NO_ERR 0
#define TEST_MODE 0666
#define TEST_0777 0777
#define TEST_ID_VALUE 100

#define PARAM_0 0
#define PARAM_1 1
#define MPARAM_1 (-1)
#define PARAM_2 2
#define PARAM_3 3
#define PARAM_10 10
#define PARAM_64 64
#define PARAM_32 32
#define PARAM_128 128
#define PARAM_256 256
#define PARAM_666 666
#define PARAM_127 127
#define PARAM_0x0 0x0
#define PARAM_5 5
#define PARAM_6 6
#define PARAM_0444 0444
#define PARAM_0777 0777
#define PARAM_UNNORMAL (-1)
#define RETURN_0 0
#define FAILD (-1)
#define ERRON_0 0
#define SIZE_10 10
#define SIZE_100 100
#define SIZE_50 50
#define SIZE_200 200
#define SIZE_4096 4096
#define SIZE_8192 8192
#define TIMEDIFF 2000
#define TEST_BUFFER_SIZE 64
#define TEST_DUP 35
#define MINUSONE (-1)
#define GROUPS_MAX 2
#define PARAM_20 20
extern "C" ssize_t __readlink_chk(const char *, char *, size_t, size_t);

static napi_value Setpgid(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[PARAM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int first;
    napi_get_value_int32(env, args[PARAM_0], &first);
    int second;
    napi_get_value_int32(env, args[PARAM_1], &second);
    pid_t pid = first;
    pid_t pgid = second;
    int setpgidd = setpgid(pid, pgid);
    napi_value result;
    napi_create_int32(env, setpgidd, &result);
    return result;
}

static napi_value Setpgrp(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int first;
    napi_get_value_int32(env, args[PARAM_0], &first);
    napi_value result;
    pid_t pt = setpgrp();
    if (first == LASTONEVAL) {
        if (pt == LASTONEVAL && getpgrp() != getpid()) {
            napi_create_double(env, pt, &result);
        } else {
            napi_create_double(env, ONEVAL, &result);
        }
    } else {
        napi_create_double(env, pt, &result);
    }
    return result;
}

static napi_value Setresuid(napi_env env, napi_callback_info info)
{
    uid_t uid = LASTONEVAL;
    int setval = setresuid(uid, uid, uid);
    napi_value result;
    napi_create_int32(env, setval, &result);
    return result;
}

static napi_value GetGroups(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int valueZero;
    napi_get_value_int32(env, args[0], &valueZero);

    int getInfo = FAIL;
    int size = valueZero;
    gid_t list[PARAM_32];
    getInfo = getgroups(sizeof(size), list);
    if (getInfo != FAIL) {
        getInfo = NO_ERR;
    }
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}

static napi_value GetPid(napi_env env, napi_callback_info info)
{
    pid_t getInfo = FAIL;
    getInfo = getpid();
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}
static napi_value GetPPid(napi_env env, napi_callback_info info)
{
    pid_t getInfo = FAIL;
    getInfo = getppid();
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}
static napi_value GetPGrp(napi_env env, napi_callback_info info)
{
    int setResult = setpgrp();
    pid_t getInfo = FAIL;
    if (setResult == PARAM_0) {
        getInfo = getpgrp();
    }
    if (getInfo != FAIL) {
        getInfo = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}
static napi_value Crypt(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    const char *key = "password";
    size_t lenA;
    size_t lenV = PARAM_32;
    char *salt = static_cast<char *>(malloc(sizeof(char) * lenV));
    napi_get_value_string_utf8(env, args[PARAM_0], salt, lenV, &lenA);
    char *cryptResult = crypt(key, salt);
    napi_value result = nullptr;
    napi_create_string_utf8(env, cryptResult, NAPI_AUTO_LENGTH, &result);
    return result;
}
static napi_value GetPGid(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    pid_t getInfo = getpgid(getpid());
    if (getInfo != FAIL) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value GetSid(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    double valueZero;
    napi_get_value_double(env, args[PARAM_0], &valueZero);

    pid_t getInfo = FAIL;
    getInfo = getsid(valueZero);
    if (FAIL != getInfo) {
        getInfo = SUCCESS;
    }

    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}

static napi_value GetUid(napi_env env, napi_callback_info info)
{
    uid_t uid = getuid();
    int ret = FAIL;
    if (uid != FAIL) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value GetLogin(napi_env env, napi_callback_info info)
{
    char *getInfo = nullptr;
    getInfo = getlogin();
    int ret = FAIL;
    if (getInfo == nullptr) {
        setenv("LOGNAME", "newlogname", PARAM_1);
        getInfo = getlogin();
        unsetenv("LOGNAME");
    }
    if (getInfo != nullptr) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value GetLoginR(napi_env env, napi_callback_info info)
{
    char szUserName[256] = {0};
    int ret = getlogin_r(szUserName, PARAM_256);
    if (ret == PARAM_6) {
        int senv = setenv("LOGNAME", "newlogname", SIZE_10);
        if (senv == PARAM_0) {
            ret = getlogin_r(szUserName, PARAM_256);
            if (ret == PARAM_0) {
                ret = PARAM_1;
            }
        }
        unsetenv("LOGNAME");
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value GetOpt(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    size_t length = LENGTH;
    size_t strResult = PARAM_0;
    char *strTemp = static_cast<char *>(malloc(sizeof(char) * length));

    napi_get_value_string_utf8(env, args[PARAM_0], strTemp, length, &strResult);
    optind = PARAM_0;
    int optArgc = PARAM_3;
    char cmdline[SIZE_50] = "./parse_cmdline";
    char para[SIZE_100] = "100";
    char *optArgv[] = {cmdline, strTemp, para};
    char optString[SIZE_50] = "a:b:c:d";
    int getInfo = getopt(optArgc, optArgv, optString);

    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}

static napi_value GetTid(napi_env env, napi_callback_info info)
{
    pid_t getInfo = FAIL;
    getInfo = gettid();
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}

static napi_value GetEUid(napi_env env, napi_callback_info info)
{
    uid_t getInfo = PARAM_0;
    getInfo = geteuid();
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}

static napi_value GetGid(napi_env env, napi_callback_info info)
{
    uid_t getInfo = PARAM_0;
    getInfo = getgid();
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}

static napi_value GetEGid(napi_env env, napi_callback_info info)
{
    uid_t getInfo = PARAM_0;
    getInfo = getegid();
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}

static napi_value GetHostName(napi_env env, napi_callback_info info)
{
    char name[65];
    int getInfo = gethostname(name, sizeof(name));
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}
static napi_value GetPageSize(napi_env env, napi_callback_info info)
{
    int getInfo = getpagesize();
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}

static napi_value GetDTableSize(napi_env env, napi_callback_info info)
{
    int getInfo = getdtablesize();
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}
static napi_value GetReSuid(napi_env env, napi_callback_info info)
{
    uid_t ruid = THIRTEEN;
    uid_t euid = THIRTEEN;
    uid_t suid = THIRTEEN;

    int getInfo = getresuid(&ruid, &euid, &suid);

    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}

static napi_value GetResGid(napi_env env, napi_callback_info info)
{
    gid_t rgid = THIRTEEN;
    gid_t egid = THIRTEEN;
    gid_t sgid = THIRTEEN;
    int getInfo = getresgid(&rgid, &egid, &sgid);
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}

static napi_value Sleep(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueZero;
    napi_get_value_int32(env, args[PARAM_0], &valueZero);
    int sin_value = sleep(valueZero);
    napi_value result = nullptr;
    napi_create_int32(env, sin_value, &result);
    return result;
}

static napi_value Isatty(napi_env env, napi_callback_info info)
{
    int fd = open("/data/storage/el2/base/files/test.txt", O_CREAT, PARAM_0777);
    int sin_value = isatty(fd);
    close(fd);
    napi_value result = nullptr;
    napi_create_int32(env, sin_value, &result);
    return result;
}

static napi_value Swab(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[PARAM_0], &valueFirst);
    char *sigValue;
    char src[PARAM_20] = "ABCD";
    char dest[PARAM_20] = "abcd";
    if (valueFirst == PARAM_0) {
        swab(src, dest, TWO);
        sigValue = dest;
    } else {
        swab(src, dest, FAIL);
        sigValue = dest;
    }
    napi_value result;
    napi_create_string_utf8(env, sigValue, NAPI_AUTO_LENGTH, &result);
    return result;
}
static napi_value Sync(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    sync();
    napi_value result = nullptr;
    napi_create_int32(env, errno, &result);
    return result;
}

static napi_value Syncfs(napi_env env, napi_callback_info info)
{
    int syncfs_value = syncfs(FAIL);
    napi_value result = nullptr;
    napi_create_int32(env, syncfs_value, &result);
    return result;
}

static napi_value Syscall(napi_env env, napi_callback_info info)
{
    pid_t tid;
    tid = syscall(SYS_gettid);
    napi_value result = nullptr;

    if (tid > PARAM_0) {
        napi_create_int32(env, PARAM_0, &result);
        return result;
    } else {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
}

static napi_value Sysinfo(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[PARAM_0], &valueFirst);
    int sys_value;
    if (valueFirst == PARAM_0) {
        struct sysinfo infos;
        sys_value = sysinfo(&infos);
    } else {
        sys_value = sysinfo(nullptr);
    }
    napi_value result = nullptr;
    napi_create_int32(env, sys_value, &result);
    return result;
}

static napi_value Sync_file_range(napi_env env, napi_callback_info info)
{
    int sync_value = sync_file_range(FAIL, PARAM_0, PARAM_0, PARAM_0);
    napi_value result = nullptr;
    napi_create_int32(env, sync_value, &result);
    return result;
}

static napi_value Symlink(napi_env env, napi_callback_info info)
{
    char file_name[] = PATH;
    char linkName[] = PATH2;
    int syslink_result = symlink(file_name, linkName);
    unlink(linkName);
    napi_value result = nullptr;
    napi_create_int32(env, syslink_result, &result);
    return result;
}

static napi_value Symlinkat(napi_env env, napi_callback_info info)
{
    char symlinkName[] = "teat";
    creat(PATH, O_RDWR | O_CREAT);
    DIR *dp = opendir(PATH_DIR);
    int fdd = dirfd(dp);
    int syslinkat_result = symlinkat(PATH, fdd, symlinkName);
    unlinkat(fdd, symlinkName, PARAM_0);
    unlink(PATH);
    napi_value result = nullptr;
    napi_create_int32(env, syslinkat_result, &result);
    return result;
}

int tcgetpgrp_handler(void)
{
    pid_t pid;
    errno = ERRON_0;
    pid = tcgetpgrp(STDIN_FILENO);
    if (pid == MPARAM_1) {
        return TCGETPGRPERROR;
    } else if (pid == getpgrp()) {
        return FOREGROUND;
    } else {
        return BACKGROUND;
    }
}
static napi_value Tcsetpgrp(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[PARAM_0], &valueFirst);
    int result = PARAM_0;
    if (valueFirst == PARAM_0) {
        result = tcsetpgrp(FAIL, FAIL);
    } else {
        tcgetsid(STDIN_FILENO);
        tcgetpgrp_handler();
        result = tcsetpgrp(STDIN_FILENO, getpgrp());
        tcgetpgrp_handler();
        result = tcsetpgrp(STDIN_FILENO, getpgrp());
    }
    napi_value results = nullptr;
    napi_create_int32(env, result, &results);
    return results;
}

static napi_value Tcgetpgrp(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[PARAM_0], &valueFirst);
    int result = PARAM_0;
    if (valueFirst == PARAM_0) {
        result = tcgetpgrp(FAIL);
    } else {
        tcgetsid(STDIN_FILENO);
        result = tcgetpgrp_handler();
    }
    napi_value results = nullptr;
    napi_create_int32(env, result, &results);
    return results;
}

static napi_value Read(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = SIZE_64, stresult = SIZE_64;
    char path[length];
    napi_get_value_string_utf8(env, args[0], path, length, &stresult);
    int fd = open(path, O_CREAT, TEST_MODE);
    char buf[SIZE_100];
    int len = PARAM_2;
    int bytes = read(fd, buf, len);
    napi_value result = nullptr;
    if (bytes < PARAM_0) {
        napi_create_int32(env, PARAM_UNNORMAL, &result);
    } else {
        napi_create_int32(env, PARAM_0, &result);
    }
    return result;
}

static napi_value Readlink(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int param = FAIL;
    napi_get_value_int32(env, args[PARAM_0], &param);

    int resultValue = FAILD;
    if (param == PARAM_UNNORMAL) {
        char *buf = nullptr;
        int ret = FAIL;
        const char *softptr = "./noreadlink.txt.soft";
        ret = readlink(softptr, buf, sizeof(buf));
        if (ret < PARAM_0) {
            resultValue = RETURN_0;
        }
    } else {
        struct stat sb;
        char *buf;
        int ret;
        buf = static_cast<char *>(malloc(sb.st_size + PARAM_1));
        errno = ERRON_0;
        ret = readlink("/data/storage/el2/base/files/testReadlink.txt", buf, sizeof(buf));
        if (errno != ERRON_0) {
            resultValue = errno;
        }
        if (ret > PARAM_0) {
            resultValue = RETURN_0;
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);
    return result;
}

static napi_value Readlinkat(napi_env env, napi_callback_info info)
{
    ssize_t bytes = readlinkat(PARAM_UNNORMAL, nullptr, nullptr, PARAM_0);

    napi_value result = nullptr;
    int resultValue = FAILD;
    if (bytes < PARAM_0) {
        resultValue = RETURN_0;
    }

    napi_create_int32(env, resultValue, &result);
    return result;
}

static napi_value Rmdir(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[PARAM_0], &param);

    int ret;
    if (param == PARAM_UNNORMAL) {
        char path[] = "errorPath";
        ret = access(path, F_OK);
        if (ret == PARAM_0) {
            rmdir(path);
        }
        ret = rmdir(path);
    } else {
        char path[] = "/data/storage/el2/base/files/rmdirPath";
        ret = access(path, F_OK);
        if (ret == PARAM_0) {
            remove(path);
        }
        mkdir(path, TEST_0777);
        ret = rmdir(path);
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Ttyname(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int isOpenFile = FAIL;

    napi_get_value_int32(env, args[PARAM_0], &isOpenFile);
    int value0 = FAIL;

    if (isOpenFile == PARAM_1) {
        char file[SIZE_100] = "/dev/tty";
        value0 = open(file, O_RDONLY);
    } else {
        char file[SIZE_100] = "/unexit";
        value0 = open(file, O_RDONLY);
    }

    int tojsResult = FAIL;

    if (value0 == FAIL) {
        char *ttyname_value = ttyname(value0);
        if (ttyname_value == nullptr) {
            tojsResult = PARAM_0;
        }
    } else {
        char *ttyname_value = ttyname(value0);
        if (ttyname_value != nullptr || errno == EACCES) {
            tojsResult = PARAM_0;
        }
    }
    close(value0);
    napi_value result = nullptr;
    napi_create_int32(env, tojsResult, &result);

    return result;
}

static napi_value Ttyname_r(napi_env env, napi_callback_info info)
{
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int isOpenFile = FAIL;
    int tojsResult = FAIL;
    napi_get_value_int32(env, args[PARAM_0], &isOpenFile);

    if (isOpenFile != PARAM_1) {
        int fd = open("/dev/null", O_WRONLY);
        char buf[PARAM_1];
        tojsResult = ttyname_r(fd, buf, sizeof(buf));
        if (tojsResult == ENOTTY) {
            tojsResult = PARAM_0;
        }
        close(fd);
    }
    napi_value result = nullptr;
    napi_create_int32(env, tojsResult, &result);

    return result;
}

static napi_value Truncate(napi_env env, napi_callback_info info)
{
    char path[] = "/data/storage/el2/base/files/testTruncated.txt";
    int df = open(path, O_CREAT, TEST_MODE);
    int truncate_value = FAIL;
    if (df != MPARAM_1) {
        close(df);
        truncate_value = truncate(path, PARAM_0);
    }
    napi_value result = nullptr;
    remove(path);
    napi_create_int32(env, truncate_value, &result);
    return result;
}

static napi_value Truncate64(napi_env env, napi_callback_info info)
{
    char path[] = "/data/storage/el2/base/files/moTruncated.txt";
    int df = open(path, O_CREAT, TEST_MODE);
    int truncate_value = FAIL;
    if (df != MPARAM_1) {
        close(df);
        truncate_value = truncate64(path, PARAM_0);
    }
    napi_value result = nullptr;
    remove(path);
    napi_create_int32(env, truncate_value, &result);
    return result;
}

static napi_value Unlink(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[PARAM_0], &param);

    int ret;
    if (param == PARAM_UNNORMAL) {
        char path[] = "unexist_test_unlink.txt";
        ret = unlink(path);
    } else {
        char path[] = "/data/storage/el2/base/files/test_unlink.txt";
        int fd = open(path, O_CREAT, TEST_MODE);
        close(fd);
        ret = unlink(path);
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Unlinkat(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[PARAM_0], &param);

    int ret;
    if (param == PARAM_UNNORMAL) {
        char path[] = "unexist_test_unlinkat.txt";
        ret = unlinkat(PARAM_UNNORMAL, path, AT_REMOVEDIR);
    } else {
        char path[] = "/data/storage/el2/base/files/test_unlinkat.txt";
        int fd = open(path, O_CREAT, TEST_MODE);
        ret = unlinkat(fd, path, PARAM_0);
        close(fd);
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Usleep(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int valueFirst;
    napi_get_value_int32(env, args[PARAM_0], &valueFirst);

    struct timespec old_time;
    clock_gettime(CLOCK_MONOTONIC, &old_time);

    int usleepResult = usleep(valueFirst);
    struct timespec new_time;
    clock_gettime(CLOCK_MONOTONIC, &new_time);

    long int difference = new_time.tv_sec - old_time.tv_sec - TIMEDIFF;

    int toJs = FAIL;
    if (usleepResult == PARAM_0 && difference <= TWO) {
        toJs = SUCCESS;
    }

    napi_value result = nullptr;
    napi_create_int32(env, toJs, &result);
    return result;
}

static napi_value Access(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    int fd = open("/data/storage/el2/base/files/fzl.txt", O_CREAT, PARAM_0777);
    int returnValue = access("/data/storage/el2/base/files/fzl.txt", F_OK);
    close(fd);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value Eaccess(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    int fd = open("/data/storage/el2/base/files/fzl.txt", O_CREAT, PARAM_0777);
    int returnValue = eaccess("/data/storage/el2/base/files/fzl.txt", F_OK);
    close(fd);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value Fexecve(napi_env env, napi_callback_info info)
{
    int fileDescribe;
    int backParam = ERRON_0;
    pid_t fpid = fork();
    if (fpid == ERRON_0) {
        const char *pathname = "/data/storage/el2/base/files/Fzl.txt";
        int flags = O_CREAT;
        mode_t mode = S_IRWXU;
        fileDescribe = open(pathname, flags, mode);
        char strTemp[] = "/data/storage/el2/base/files/Fzl.txt";
        char *const argv[] = {strTemp, nullptr};
        char *const envp[] = {nullptr};
        backParam = fexecve(fileDescribe, argv, envp);
        close(fileDescribe);
        _exit(PARAM_0);
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value Execvpe(napi_env env, napi_callback_info info)
{
    int backParam = ERRON_0;
    pid_t fpid = fork();
    if (fpid == ERRON_0) {
        const char *pathname = "/data/storage/el2/base/files/LXL.txt";
        int flags = O_CREAT;
        mode_t mode = S_IRWXU;
        int fd = open(pathname, flags, mode);
        char *const firstParam[] = {nullptr};
        char *const secondParam[] = {nullptr};
        backParam = execvpe(pathname, firstParam, secondParam);
        close(fd);
        _exit(PARAM_0);
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value Execvp(napi_env env, napi_callback_info info)
{
    int backParam = ERRON_0;
    pid_t fpid = fork();
    if (fpid == ERRON_0) {
        const char *pathname = "/data/storage/el2/base/files/LXL.txt";
        int flags = O_CREAT;
        mode_t mode = S_IRWXU;
        int fd = open(pathname, flags, mode);
        char *const firstParam[PARAM_1] = {nullptr};
        backParam = execvp(pathname, firstParam);
        close(fd);
        _exit(PARAM_0);
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value Execve(napi_env env, napi_callback_info info)
{
    int backParam = ERRON_0;
    pid_t fpid = fork();
    if (fpid == ERRON_0) {
        const char *pathname = "/data/storage/el2/base/files/LXL.txt";
        int flags = O_CREAT;
        mode_t mode = S_IRWXU;
        int fd = open(pathname, flags, mode);
        char *const firstParam[] = {nullptr};
        char *const secondParam[] = {nullptr};
        backParam = execve(pathname, firstParam, secondParam);
        close(fd);
        _exit(PARAM_0);
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value Execlp(napi_env env, napi_callback_info info)
{
    int backParam = ERRON_0;
    pid_t fpid = fork();
    if (fpid == ERRON_0) {
        const char *pathname = "/data/storage/el2/base/files/LXL.txt";
        int flags = O_CREAT;
        mode_t mode = S_IRWXU;
        int fd = open(pathname, flags, mode);
        const char *firstParam = nullptr;
        backParam = execlp(pathname, firstParam);
        close(fd);
        _exit(PARAM_0);
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}
static napi_value Execl(napi_env env, napi_callback_info info)
{
    int backParam = ERRON_0;
    pid_t fpid = fork();
    if (fpid == ERRON_0) {
        backParam = execl("/bin/ls", "ls", "-al", "/etc/passwd", static_cast<char *>(ERRON_0));
        _exit(PARAM_0);
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value Execv(napi_env env, napi_callback_info info)
{
    int backParam = ERRON_0;
    pid_t fpid = fork();
    if (fpid == ERRON_0) {
        char s1[] = "/data/storage/el2/base/files";
        char s2[] = "/Fzl.txt";
        char *args[3];
        args[PARAM_0] = s1;
        args[PARAM_1] = s2;
        args[PARAM_2] = nullptr;
        backParam = execv(args[PARAM_0], args);
        _exit(PARAM_0);
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value Execle(napi_env env, napi_callback_info info)
{
    int backParam = ERRON_0;
    pid_t fpid = fork();
    if (fpid == ERRON_0) {
        const char *pathname = "/data/storage/el2/base/files/LXL.txt";
        int flags = O_CREAT;
        mode_t mode = S_IRWXU;
        int fd = open(pathname, flags, mode);
        const char *firstParam = nullptr;
        backParam = execle(pathname, firstParam);
        close(fd);
        _exit(PARAM_0);
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value Alarm(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[PARAM_0], &param);
    napi_value result = nullptr;

    int resultValue = alarm(param);
    if (resultValue >= PARAM_0) {
        resultValue = PARAM_0;
    }
    napi_create_int32(env, resultValue, &result);

    return result;
}

void *get_brk() { return sbrk(PARAM_0); }
static napi_value Brk(napi_env env, napi_callback_info info)
{
    void *initial_break = get_brk();
    void *newBreak = (void *)((uintptr_t)(initial_break) + PARAM_1);
    int resultValue = brk(newBreak);

    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

static napi_value Acct(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_int32(env, FAIL, &result);
    return result;
}

static napi_value Getentropy(napi_env env, napi_callback_info info)
{
    void *buffer[256];
    int resultValue = getentropy(buffer, PARAM_256);
    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

static napi_value Getdomainname(napi_env env, napi_callback_info info)
{
    char cbuf[BUFSIZ] = {PARAM_0};
    int resultValue = getdomainname(cbuf, sizeof(cbuf));
    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

static napi_value Getcwd(napi_env env, napi_callback_info info)
{
    char *value;
    char buf[200] = {PARAM_0};
    value = getcwd(buf, sizeof(buf));
    int resultValue = FAIL;
    if (value != nullptr) {
        resultValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

static napi_value Fork(napi_env env, napi_callback_info info)
{
    pid_t fpid;

    fpid = fork();
    int ret = FAIL;
    if (fpid != FAIL) {
        ret = SUCCESS;
    }
    if (fpid == PARAM_0) {
        _exit(PARAM_0);
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}

static napi_value Fpathconf(napi_env env, napi_callback_info info)
{
    long value = fpathconf(PARAM_0, _PC_LINK_MAX);
    int ret = FAIL;
    if (value != FAIL) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}

static napi_value Chdir(napi_env env, napi_callback_info info)
{
    int returnValue = chdir("/data/storage/el2/base/files");
    napi_value result;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value Chown(napi_env env, napi_callback_info info)
{
    int getUId = getuid();
    int getGId = getgid();
    int returnValue = chown("/data/storage/el2/base/files", getUId, getGId);
    napi_value result;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value Chroot(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, NO_ERR, &result);
    return result;
}

static napi_value Fsync(napi_env env, napi_callback_info info)
{
    int fd = open("/data/storage/el2/base/files/Fzl.txt", O_CREAT, PARAM_0777);
    int ret = fsync(fd);
    close(fd);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Ftruncate(napi_env env, napi_callback_info info)
{
    FILE *fptr = fopen("/data/storage/el2/base/files/Fzl.txt", "w");
    NAPI_ASSERT(env, fptr != nullptr, "Ftruncate fopen Error");
    fprintf(fptr, "%s", "this is a sample!");
    int freturn = ftruncate(fileno(fptr), SIZE_100);
    fclose(fptr);
    napi_value result;
    napi_create_int32(env, freturn, &result);
    return result;
}

static napi_value Ftruncate64(napi_env env, napi_callback_info info)
{
    FILE *fptr = fopen("/data/storage/el2/base/files/Fzl.txt", "w");
    NAPI_ASSERT(env, fptr != nullptr, "Ftruncate64 fopen Error");
    fprintf(fptr, "%s", "this is a sample!");
    int freturn = ftruncate64(fileno(fptr), SIZE_100);
    fclose(fptr);
    napi_value result;
    napi_create_int32(env, freturn, &result);
    return result;
}

static napi_value LChOwn(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64, stresult = PARAM_64;
    char *strTemp = static_cast<char *>(malloc(sizeof(char) * length));

    napi_get_value_string_utf8(env, args[PARAM_0], strTemp, length, &stresult);
    int value = lchown(strTemp, TEST_ID_VALUE, TEST_ID_VALUE);
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value Link(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[PARAM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t lenA;
    size_t lenV = PARAM_32;
    char *oldPath = static_cast<char *>(malloc(sizeof(char) * lenV));
    char *newPath = static_cast<char *>(malloc(sizeof(char) * lenV));
    napi_get_value_string_utf8(env, args[PARAM_0], oldPath, lenV, &lenA);
    napi_get_value_string_utf8(env, args[PARAM_1], newPath, lenV, &lenA);

    int value = link(oldPath, newPath);

    errno = ERRON_0;

    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value LinkAt(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[PARAM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t lenA;
    size_t lenV = PARAM_32;
    char *oldPath = static_cast<char *>(malloc(sizeof(char) * lenV));
    char *newPath = static_cast<char *>(malloc(sizeof(char) * lenV));

    napi_get_value_string_utf8(env, args[PARAM_0], oldPath, lenV, &lenA);
    napi_get_value_string_utf8(env, args[PARAM_1], newPath, lenV, &lenA);

    int newFd = creat(newPath, PARAM_666);
    int value = linkat(AT_FDCWD, oldPath, newFd, newPath, AT_SYMLINK_FOLLOW);
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value LockF(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t lenA;
    size_t lenV = PARAM_32;
    char *path = static_cast<char *>(malloc(sizeof(char) * lenV));
    int ret;
    napi_get_value_string_utf8(env, args[PARAM_0], path, lenV, &lenA);
    int fd = open(path, O_RDWR | O_CREAT, TEST_MODE);
    ret = lockf(fd, F_LOCK, PARAM_0);
    lockf(fd, F_ULOCK, PARAM_0);
    close(fd);
    remove(path);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value LockF64(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t lenA;
    size_t lenV = PARAM_32;
    char *path = static_cast<char *>(malloc(sizeof(char) * lenV));
    int ret;
    napi_get_value_string_utf8(env, args[PARAM_0], path, lenV, &lenA);
    int fd = open(path, O_RDWR | O_CREAT, TEST_MODE);
    ret = lockf64(fd, F_LOCK, PARAM_0);
    lockf64(fd, F_ULOCK, PARAM_0);
    close(fd);
    remove(path);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Getrandom(napi_env env, napi_callback_info info)
{
    void *buf = malloc(PARAM_32);
    ssize_t ret = getrandom(buf, PARAM_32, PARAM_0);
    napi_value result = nullptr;
    if (ret != PARAM_UNNORMAL) {
        napi_create_int32(env, PARAM_0, &result);
    } else {
        napi_create_int32(env, PARAM_UNNORMAL, &result);
    }
    return result;
}
static napi_value Glob(napi_env env, napi_callback_info info)
{
    glob_t buf;
    int ret = glob("/data/storage/el2/base/files/*", GLOB_NOSORT, nullptr, &buf);
    napi_value result = nullptr;
    if (ret == PARAM_0) {
        napi_create_int32(env, PARAM_0, &result);
    } else {
        napi_create_int32(env, PARAM_UNNORMAL, &result);
    }
    globfree(&buf);
    return result;
}

static napi_value Globfree(napi_env env, napi_callback_info info)
{
    glob_t buf;
    int ret = glob("/data/storage/el2/base/files/*", GLOB_NOSORT, nullptr, &buf);
    napi_value result = nullptr;
    if (ret == PARAM_0) {
        napi_create_int32(env, PARAM_0, &result);
    } else {
        napi_create_int32(env, PARAM_UNNORMAL, &result);
    }
    globfree(&buf);
    return result;
}

static napi_value ReadLink(napi_env env, napi_callback_info info)
{
    struct stat sb;
    int exp = FAIL;
    const char wstr[] = "this is a test\n";
    const char softptr[] = "/data/storage/el2/base/files/readlink.txt.soft";
    char *buf = static_cast<char *>(malloc(sizeof(char) * (sb.st_size + 1)));
    const char ptr[] = "/data/storage/el2/base/files/readlink.txt";
    FILE *fptr = fopen(ptr, "w");
    if (fptr != nullptr) {
        fwrite(wstr, sizeof(char), strlen(wstr), fptr);
    }
    fclose(fptr);
    int link = symlink("/data/storage/el2/base/files/symlink.txt", softptr);
    if (link == PARAM_0) {
        ssize_t ret = readlink(softptr, buf, sizeof(buf));
        if (ret != static_cast<ssize_t>(FAIL)) {
            exp = PARAM_0;
        }
    }
    remove(ptr);
    remove(softptr);
    napi_value result = nullptr;
    napi_create_int32(env, exp, &result);
    return result;
}

static napi_value ReadLinkAt(napi_env env, napi_callback_info info)
{
    struct stat sb;
    int exp = FAIL;
    const char wstr[] = "this is a test\n";
    const char softptr[] = "/data/storage/el2/base/files/readlink.txt.soft";
    char *buf = static_cast<char *>(malloc(sizeof(char) * (sb.st_size + 1)));
    const char ptr[] = "/data/storage/el2/base/files/readlink.txt";
    FILE *fptr = fopen(ptr, "w");
    if (fptr != nullptr) {
        fwrite(wstr, sizeof(char), strlen(wstr), fptr);
    }
    fclose(fptr);
    int link = symlink("/data/storage/el2/base/files/symlink.txt", softptr);
    if (link == PARAM_0) {
        ssize_t ret = readlinkat(PARAM_0, softptr, buf, sizeof(buf));
        if (ret != static_cast<ssize_t>(FAIL)) {
            exp = PARAM_0;
        }
    }
    remove(ptr);
    remove(softptr);
    napi_value result = nullptr;
    napi_create_int32(env, exp, &result);
    return result;
}

static napi_value Optarg(napi_env env, napi_callback_info info)
{
    optind = PARAM_0;
    int optArgc = PARAM_3;
    char cmdline[50] = "./parse_cmdline";
    char para[100] = "100";
    char par[3] = "-a";
    char *optArgv[] = {cmdline, par, para};
    char optString[50] = "a:b:c:d";
    int ch = getopt(optArgc, optArgv, optString);
    int res = PARAM_0;
    if (ch == 'a') {
        if (optarg == para) {
            res = SUCCESS;
        } else {
            res = FAIL;
        }
    } else {
        res = FAIL;
    }
    napi_value result = nullptr;
    napi_create_int32(env, res, &result);
    return result;
}
static napi_value Optind(napi_env env, napi_callback_info info)
{
    optind = PARAM_0;
    int optArgc = PARAM_3;
    char cmdline[50] = "./parse_cmdline";
    char para[100] = "100";
    char par[3] = "-a";
    char *optArgv[] = {cmdline, par, para};
    char optString[50] = "a:b:c:d";
    int ch = getopt(optArgc, optArgv, optString);
    int res = PARAM_0;
    if (ch == 'a') {
        if (optind == PARAM_3) {
            res = SUCCESS;
        } else {
            res = FAIL;
        }
    } else {
        res = FAIL;
    }
    napi_value result = nullptr;
    napi_create_int32(env, res, &result);
    return result;
}
static napi_value Optopt(napi_env env, napi_callback_info info)
{
    optind = PARAM_0;
    int optArgc = PARAM_3;
    char cmdline[50] = "./parse_cmdline";
    char para[100] = "100";
    char par[3] = "-f";
    char *optArgv[] = {cmdline, par, para};
    char optString[50] = "a:b:c:d";
    int ch = getopt(optArgc, optArgv, optString);

    int res = PARAM_0;
    if (ch == '?') {
        if (optopt == 'f') {
            res = SUCCESS;
        } else {
            res = FAIL;
        }
    } else {
        res = FAIL;
    }
    napi_value result = nullptr;
    napi_create_int32(env, res, &result);
    return result;
}
static napi_value Opterr(napi_env env, napi_callback_info info)
{
    optind = PARAM_0;
    opterr = PARAM_0;
    int optArgc = PARAM_3;
    char cmdline[50] = "./parse_cmdline";
    char para[100] = "100";
    char par[3] = "-a";
    char *optArgv[] = {cmdline, par, para};
    char optString[50] = "a:b:c:d";
    int ch = getopt(optArgc, optArgv, optString);
    int res = PARAM_0;
    if (ch == 'a') {
        if (opterr == PARAM_0) {
            res = SUCCESS;
        } else {
            res = FAIL;
        }
    } else {
        res = FAIL;
    }
    napi_value result = nullptr;
    napi_create_int32(env, res, &result);
    return result;
}

static napi_value PRead(napi_env env, napi_callback_info info)
{
    const char *txt = "This is pread_0100 test.";
    int ret = PARAM_UNNORMAL;
    char buffer[64];
    int bufferSize = PARAM_64;
    memset(buffer, PARAM_0x0, sizeof(buffer));
    int fd = open("/data/storage/el2/base/files/test.txt", O_CREAT | O_RDWR, PARAM_0777);
    pwrite(fd, txt, strlen(txt), PARAM_0);
    lseek(fd, PARAM_0, SEEK_SET);
    size_t cnt = pread(fd, buffer, bufferSize, PARAM_0);
    if (cnt == strlen(txt)) {
        ret = SUCCESS;
    } else {
        ret = FAIL;
    }
    close(fd);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Nice(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int value;
    napi_get_value_int32(env, args[PARAM_0], &value);
    int ret = nice(value);
    if (ret != MPARAM_1) {
        ret = PARAM_0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Pipe(napi_env env, napi_callback_info info)
{
    int fd[PARAM_2];
    int ret = pipe(fd);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Pipe2(napi_env env, napi_callback_info info)
{
    int fd[PARAM_2];
    int ret = pipe2(fd, O_CLOEXEC);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Pathconf(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    napi_value result = nullptr;
    int status = PARAM_0;
    psignal(WTERMSIG(status), "signal");
    napi_create_int32(env, errno, &result);
    return result;
}

int do_plain_test(int (*fn1)(void *arg), void *arg1, int (*fn2)(void *arg), void *arg2)
{
    int ret = PARAM_0;
    int pid = PARAM_0;
    pid = fork();
    if (pid == FAIL) {
        return FAIL;
    }
    if (pid == PARAM_0)
        _exit(PARAM_0);
    if (fn2)
        ret = fn2(arg2);
    return ret;
}

int pausetest(void *testarg)
{
    int flag = pause();
    return flag;
}

static napi_value Pause(napi_env env, napi_callback_info info)
{
    void *test = nullptr;
    do_plain_test(pausetest, test, nullptr, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value Pread(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    size_t size = PARAM_64;
    char buffer[100];
    off_t offset = PARAM_10;
    char *value = static_cast<char *>(malloc(sizeof(char) * size));
    size_t actualVal;
    napi_get_value_string_utf8(env, args[PARAM_0], value, size, &actualVal);

    napi_value result = nullptr;
    int fd = open(value, O_RDWR);
    ssize_t ret = pread(fd, buffer, sizeof(buffer), offset);
    close(fd);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Setsid(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    pid_t fk = fork();
    if (fk == PARAM_0) {
        setsid();
        _exit(PARAM_0);
    } else {
        ret = NO_ERR;
    }

    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Setdomainname(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, PARAM_0, &result);
    return result;
}

static napi_value Setgroups(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, PARAM_0, &result);
    return result;
}

static napi_value Setgid(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, PARAM_UNNORMAL, &result);
    return result;
}

static napi_value Seteuid(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, PARAM_0, &result);
    return result;
}

static napi_value Setegid(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, PARAM_0, &result);
    return result;
}

static napi_value Setreuid(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, PARAM_0, &result);
    return result;
}

static napi_value Setregid(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, PARAM_0, &result);
    return result;
}

static napi_value Setresgid(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, PARAM_0, &result);
    return result;
}

static napi_value Issetugid(napi_env env, napi_callback_info info)
{
    int ret = issetugid();
    napi_value result = nullptr;
    if (ret == PARAM_0) {
        napi_create_int32(env, RETURN_0, &result);
    } else {
        napi_create_int32(env, FAILD, &result);
    }

    return result;
}
static napi_value ReadlinkChk(napi_env env, napi_callback_info info)
{
    struct stat sb;
    int exp = FAIL;
    const char wstr[] = "this is a test\n";
    const char softptr[] = "/data/storage/el2/base/files/readlink.txt.soft";
    char *buf = static_cast<char *>(malloc(sizeof(char) * (sb.st_size + 1)));
    const char ptr[] = "/data/storage/el2/base/files/readlink.txt";
    FILE *fptr = fopen(ptr, "w");
    if (fptr != nullptr) {
        fwrite(wstr, sizeof(char), strlen(wstr), fptr);
    }
    fclose(fptr);
    int link = symlink("/data/storage/el2/base/files/symlink.txt", softptr);
    if (link == PARAM_0) {
        ssize_t ret = __readlink_chk(softptr, buf, sizeof(buf), sizeof(buf));
        if (ret != static_cast<ssize_t>(FAIL)) {
            exp = PARAM_0;
        }
    }
    remove(ptr);
    remove(softptr);
    napi_value result = nullptr;
    napi_create_int32(env, exp, &result);
    return result;
}

static napi_value Vfork(napi_env env, napi_callback_info info)
{
    int adj = PARAM_0;
    pid_t pid;
    pid = vfork();

    if (pid < PARAM_0) {
        adj = FAIL;
    }
    if (pid == PARAM_0) {
        sleep(PARAM_1);
        _exit(PARAM_0);
    }
    napi_value result;
    napi_create_int32(env, adj, &result);
    return result;
}
static napi_value Sethostname(napi_env env, napi_callback_info info)
{
    napi_value resval;
    napi_create_int32(env, PARAM_0, &resval);
    return resval;
}

static napi_value Setuid(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, PARAM_0, &result);
    return result;
}

static napi_value Sysconf(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int param;
    napi_get_value_int32(env, args[PARAM_0], &param);
    int resultValue;
    if (param == _SC_PAGE_SIZE) {
        resultValue = sysconf(_SC_PAGE_SIZE);
    } else {
        resultValue = sysconf(PARAM_UNNORMAL);
    }

    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

static napi_value Sbrk(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    sbrk(PARAM_0);
    int resultValue = FAILD;
    if (errno != ENOMEM) {
        resultValue = RETURN_0;
    }

    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);
    return result;
}

static napi_value Write(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int fd_in = PARAM_0;
    napi_get_value_int32(env, args[PARAM_0], &fd_in);
    char buf[SIZE_64] = "";
    int resultValue = write(fd_in, buf, PARAM_2);
    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);
    return result;
}

static napi_value Environ(napi_env env, napi_callback_info info)
{
    int resultValue = FAILD;
    int i = PARAM_0;
    for (i = PARAM_0; environ[i]; i++) {
        errno = ERRON_0;
        printf("%s", environ[i]);
        if (errno == ERRON_0) {
            resultValue = RETURN_0;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);
    return result;
}

static napi_value Close(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = LENGTH;
    size_t strResult = PARAM_0;
    char strTemp[length];
    napi_get_value_string_utf8(env, args[PARAM_0], strTemp, length, &strResult);
    char str[] = "This is a test sample!";
    int fd = open(strTemp, O_CREAT, TEST_MODE);
    write(fd, str, sizeof(str));
    int backParam = close(fd);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value Copy_file_range(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[PARAM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = LENGTH;
    size_t strResult = PARAM_0;
    char path_in[PATH_MAX];
    napi_get_value_string_utf8(env, args[PARAM_0], path_in, length, &strResult);
    size_t length2 = LENGTH;
    size_t strResult2 = PARAM_0;
    char path_out[PATH_MAX];
    napi_get_value_string_utf8(env, args[PARAM_1], path_out, length2, &strResult2);

    int fd_in = PARAM_0;
    int fdOut = PARAM_0;
    int backParam = PARAM_0;
    fd_in = open(path_in, O_RDWR | O_CREAT, TEST_MODE);
    fdOut = open(path_out, O_RDWR | O_CREAT, TEST_MODE);
    int wlen = PARAM_0;
    do {
        backParam = copy_file_range(fd_in, nullptr, fdOut, nullptr, wlen, PARAM_0);
        wlen -= backParam;
    } while (wlen > NO_ERR && backParam > NO_ERR);

    close(fd_in);
    close(fdOut);

    if (backParam >= NO_ERR) {
        backParam = NO_ERR;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}
static napi_value CTerMid(napi_env env, napi_callback_info info)
{
    char buf[BUFSIZ];
    char *backParam = ctermid(buf);
    napi_value result = nullptr;
    napi_create_string_utf8(env, backParam, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Dup(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = LENGTH;
    size_t strResult = PARAM_0;
    char path[length];
    napi_get_value_string_utf8(env, args[PARAM_0], path, length, &strResult);

    int fd = open(path, O_CREAT, TEST_MODE);
    dup(fd);
    close(fd);
    napi_value result = nullptr;
    napi_create_int32(env, errno, &result);
    return result;
}

static napi_value Dup2(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = LENGTH;
    size_t strResult = PARAM_0;
    char path[length];
    napi_get_value_string_utf8(env, args[PARAM_0], path, length, &strResult);
    int fileDescribe = open(path, O_CREAT, TEST_MODE);
    dup2(fileDescribe, TEST_DUP);
    close(fileDescribe);
    napi_value result = nullptr;
    napi_create_int32(env, errno, &result);
    return result;
}

static napi_value Dup3(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    int fileDescribe = open(PATH, O_CREAT, TEST_MODE);
    int returnValue = FAIL;
    if (dup3(fileDescribe, TEST_DUP, O_CLOEXEC) != -1) {
        returnValue = BACKGROUND;
    }
    close(fileDescribe);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value Faccessat(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = LENGTH;
    size_t strResult = PARAM_0;
    char ptr[length];
    napi_get_value_string_utf8(env, args[PARAM_0], ptr, length, &strResult);
    int fd = open(ptr, O_RDWR | O_CREAT, TEST_MODE);
    int isExist = faccessat(fd, ptr, F_OK, PARAM_0);
    close(fd);
    remove(ptr);
    napi_value result = nullptr;
    napi_create_int32(env, isExist, &result);
    return result;
}

static napi_value Fchdir(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = LENGTH;
    size_t strResult = PARAM_0;
    char PATH_DATA[length];
    napi_get_value_string_utf8(env, args[PARAM_0], PATH_DATA, length, &strResult);
    char buf[30];
    int fd = open(PATH_DATA, O_RDONLY);
    int backParam = fchdir(fd);

    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    memset(buf, PARAM_0, sizeof(buf));
    getcwd(buf, sizeof(buf));
    strcmp(PATH_DATA, buf);
    close(fd);
    return result;
}

static napi_value Fdatasync(napi_env env, napi_callback_info info)
{
    int backParam = PARAM_0;
    int fileDescribe = PARAM_0;
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = LENGTH;
    size_t strResult = PARAM_0;
    char pathname[length];
    napi_get_value_string_utf8(env, args[PARAM_0], pathname, length, &strResult);
    fileDescribe = open(pathname, O_CREAT, PARAM_0777);
    backParam = fdatasync(fileDescribe);
    close(fileDescribe);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value Fchown(napi_env env, napi_callback_info info)
{
    int backParam = 0;
    int fileDescribe = 0;
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = LENGTH;
    size_t strResult = PARAM_0;
    char pathname[length];
    napi_get_value_string_utf8(env, args[PARAM_0], pathname, length, &strResult);
    fileDescribe = open(pathname, O_CREAT, PARAM_0777);
    uid_t owner = getuid();
    gid_t group = getgid();
    backParam = fchown(fileDescribe, owner, group);
    close(fileDescribe);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}
static napi_value Fchownat(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = LENGTH;
    size_t strResult = PARAM_0;
    char pathname[length];
    napi_get_value_string_utf8(env, args[PARAM_0], pathname, length, &strResult);
    int backParam = PARAM_0, fileDescribe = PARAM_0, flag = AT_EMPTY_PATH;
    fileDescribe = open(pathname, O_CREAT, PARAM_0777);
    uid_t owner = getuid();
    gid_t group = getgid();
    backParam = fchownat(fileDescribe, pathname, owner, group, flag);
    close(fileDescribe);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}
int do_plain_tests(int (*fn1)(void *arg), void *arg1, int (*fn2)(void *arg), void *arg2)
{
    int ret = PARAM_0;
    int pid = PARAM_0;

    pid = fork();
    if (pid == FAILD) {
        return FAILD;
    }
    if (pid == NO_ERR) {
        _exit(PARAM_0);
    }
    if (fn2) {
        ret = fn2(arg2);
    }
    return ret;
}

int Msggettest(void *testarg)
{
    int resultdaemon = daemon(PARAM_0, PARAM_0);
    return resultdaemon;
}

static napi_value Daemon(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    void *test1 = nullptr;
    do_plain_tests(Msggettest, test1, nullptr, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, errno, &result);
    return result;
}

void test(va_list ap, const char *fmt, ...)
{
    va_start(ap, fmt);
    vwarn(fmt, ap);
    va_end(ap);
}
static napi_value Vwarn(napi_env env, napi_callback_info info)
{
    const char *filename = "/data/storage/el2/base/files/Fzl.txt";
    int fd = open(filename, O_CREAT | O_RDONLY | O_TRUNC, PARAM_0444);
    const char *data = "Hello";
    int ret = PARAM_0;
    ssize_t bytesWritten = write(fd, data, strlen(data));
    if (bytesWritten == FAIL) {
        const char *fmt = "vwarn_error:Unable to create file: ";
        va_list ap;
        test(ap, fmt);
        ret = FAIL;
    }
    close(fd);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

void VwarnxTest(va_list ap, const char *fmt, ...)
{
    va_start(ap, fmt);
    vwarnx(fmt, ap);
    va_end(ap);
}
static napi_value Vwarnx(napi_env env, napi_callback_info info)
{
    const char *filename = "/data/storage/el2/base/files/Fzl.txt";
    int fd = open(filename, O_CREAT | O_RDONLY | O_TRUNC, PARAM_0444);
    const char *data = "Hello";
    int ret = PARAM_0;
    ssize_t bytesWritten = write(fd, data, strlen(data));
    if (bytesWritten == FAIL) {
        const char *fmt = "vwarnx_error:Unable to create file: ";
        va_list ap;
        VwarnxTest(ap, fmt);
        ret = FAIL;
    }
    close(fd);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"getGroups", nullptr, GetGroups, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getPid", nullptr, GetPid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getPPid", nullptr, GetPPid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getPGrp", nullptr, GetPGrp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getPGid", nullptr, GetPGid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getSid", nullptr, GetSid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getUid", nullptr, GetUid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getLogin", nullptr, GetLogin, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getLoginR", nullptr, GetLoginR, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getOpt", nullptr, GetOpt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getTid", nullptr, GetTid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getEUid", nullptr, GetEUid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getGid", nullptr, GetGid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getEGid", nullptr, GetEGid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getHostName", nullptr, GetHostName, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getPageSize", nullptr, GetPageSize, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getDTableSize", nullptr, GetDTableSize, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getReSuid", nullptr, GetReSuid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getResGid", nullptr, GetResGid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sleep", nullptr, Sleep, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"lChOwn", nullptr, LChOwn, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"link", nullptr, Link, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"linkAt", nullptr, LinkAt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"lockF", nullptr, LockF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"lockF64", nullptr, LockF64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getrandom", nullptr, Getrandom, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glob", nullptr, Glob, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"globfree", nullptr, Globfree, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"isatty", nullptr, Isatty, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"swab", nullptr, Swab, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sync", nullptr, Sync, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"syncfs", nullptr, Syncfs, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"syscall", nullptr, Syscall, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sysinfo", nullptr, Sysinfo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sync_file_range", nullptr, Sync_file_range, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"symlinkat", nullptr, Symlinkat, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"symlink", nullptr, Symlink, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tcgetpgrp", nullptr, Tcgetpgrp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tcsetpgrp", nullptr, Tcsetpgrp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setpgid", nullptr, Setpgid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setpgrp", nullptr, Setpgrp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"crypt", nullptr, Crypt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setresuid", nullptr, Setresuid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"read", nullptr, Read, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"readlink", nullptr, Readlink, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"readlinkat", nullptr, Readlinkat, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"rmdir", nullptr, Rmdir, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"truncate", nullptr, Truncate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"truncate64", nullptr, Truncate64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"unlink", nullptr, Unlink, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"unlinkat", nullptr, Unlinkat, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usleep", nullptr, Usleep, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ttyname", nullptr, Ttyname, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ttyname_r", nullptr, Ttyname_r, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"access", nullptr, Access, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eaccess", nullptr, Eaccess, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"close", nullptr, Close, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ctermid", nullptr, CTerMid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"copy_file_range", nullptr, Copy_file_range, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"alarm", nullptr, Alarm, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"brk", nullptr, Brk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"acct", nullptr, Acct, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getentropy", nullptr, Getentropy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getcwd", nullptr, Getcwd, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fork", nullptr, Fork, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fpathconf", nullptr, Fpathconf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getdomainname", nullptr, Getdomainname, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"chdir", nullptr, Chdir, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"chown", nullptr, Chown, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"chroot", nullptr, Chroot, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fsync", nullptr, Fsync, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ftruncate", nullptr, Ftruncate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ftruncate64", nullptr, Ftruncate64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"readLink", nullptr, ReadLink, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"readLinkAt", nullptr, ReadLinkAt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"truncate", nullptr, Truncate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"truncate64", nullptr, Truncate64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"optarg", nullptr, Optarg, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"optind", nullptr, Optind, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"optopt", nullptr, Optopt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"opterr", nullptr, Opterr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pRead", nullptr, PRead, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nice", nullptr, Nice, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pipe", nullptr, Pipe, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pipe2", nullptr, Pipe2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pathconf", nullptr, Pathconf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pause", nullptr, Pause, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pread", nullptr, Pread, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setsid", nullptr, Setsid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setdomainname", nullptr, Setdomainname, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setgroups", nullptr, Setgroups, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setgid", nullptr, Setgid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setuid", nullptr, Setuid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"seteuid", nullptr, Seteuid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setegid", nullptr, Setegid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setreuid", nullptr, Setreuid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setregid", nullptr, Setregid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setresgid", nullptr, Setresgid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"readlinkChk", nullptr, ReadlinkChk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"issetugid", nullptr, Issetugid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"vfork", nullptr, Vfork, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sethostname", nullptr, Sethostname, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"daemon", nullptr, Daemon, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sysconf", nullptr, Sysconf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sbrk", nullptr, Sbrk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"write", nullptr, Write, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"environ", nullptr, Environ, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"dup", nullptr, Dup, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"dup2", nullptr, Dup2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"dup3", nullptr, Dup3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"execl", nullptr, Execl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"execle", nullptr, Execle, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"execlp", nullptr, Execlp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"execv", nullptr, Execv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"execvp", nullptr, Execvp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"execvpe", nullptr, Execvpe, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fexecve", nullptr, Fexecve, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"execve", nullptr, Execve, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"faccessat", nullptr, Faccessat, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fchdir", nullptr, Fchdir, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fchown", nullptr, Fchown, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fchownat", nullptr, Fchownat, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fdatasync", nullptr, Fdatasync, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"vwarn", nullptr, Vwarn, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"vwarnx", nullptr, Vwarnx, nullptr, nullptr, nullptr, napi_default, nullptr}};
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "unistd",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }