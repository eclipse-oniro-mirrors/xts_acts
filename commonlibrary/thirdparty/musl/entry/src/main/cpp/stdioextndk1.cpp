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

#include <cerrno>
#include <cstring>
#include <fcntl.h>
#include <js_native_api.h>
#include <js_native_api_types.h>
#include <node_api.h>
#include <stdio_ext.h>
#include <unistd.h>
#include <hilog/log.h>

#define PARAM_0 0
#define PARAM_5 5
#define INIT (-1)
#define FAIL (-1)
#define NO_ERR 0
#define PARAM_0777 0777

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0xFEFE
#define LOG_TAG "MUSL_LIBCTEST"

static const char *TEMP_FILE = "/data/storage/el2/base/files/fzl.txt";
static const char *g_tempFileContent = "This is a test";

static napi_value FBufSize_One(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int ret = INIT;
    char buf[1024];
    FILE *fp = nullptr;
    do {
        errno = 0;
        int fileDescribe = open(TEMP_FILE, O_CREAT, PARAM_0777);
        if (fileDescribe == FAIL) {
            OH_LOG_INFO(LOG_APP, "FBufSize_One open failed: ret %{public}d errno : %{public}d", fileDescribe, errno);
            break;
        }
        fp = fdopen(fileDescribe, "r");
        if (fp == nullptr) {
            break;
        }
        errno = 0;
        int res = setvbuf(fp, buf, _IOFBF, sizeof(buf));
        if (res != NO_ERR) {
            OH_LOG_INFO(LOG_APP, "FBufSize_One setvbuf failed: ret %{public}d errno : %{public}d", res, errno);
            break;
        }
        size_t bufsize = __fbufsize(fp);
        ret = bufsize <= sizeof(buf);
    } while (PARAM_0);
    if (fp != nullptr) {
        fclose(fp);
    }
    remove(TEMP_FILE);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value FBufSize_Two(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int ret = INIT;
    FILE *fp = nullptr;
    do {
        errno = 0;
        int fileDescribe = open(TEMP_FILE, O_CREAT, PARAM_0777);
        if (fileDescribe == FAIL) {
            OH_LOG_INFO(LOG_APP, "FBufSize_Two open failed: ret %{public}d errno : %{public}d", fileDescribe, errno);
            break;
        }
        fp = fdopen(fileDescribe, "r");
        if (fp == nullptr) {
            break;
        }
        errno = 0;
        int res = setvbuf(fp, nullptr, _IOFBF, PARAM_0);
        if (res != NO_ERR) {
            OH_LOG_INFO(LOG_APP, "FBufSize_Two setvbuf failed: ret %{public}d errno : %{public}d", res, errno);
            break;
        }
        size_t bufsize = __fbufsize(fp);
        ret = bufsize == PARAM_0;
    } while (PARAM_0);
    if (fp != nullptr) {
        fclose(fp);
    }
    remove(TEMP_FILE);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Flbf_One(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int ret = INIT;
    char buf[BUFSIZ];
    FILE *fp = nullptr;
    do {
        errno = 0;
        int fileDescribe = open(TEMP_FILE, O_CREAT, PARAM_0777);
        if (fileDescribe == FAIL) {
            OH_LOG_INFO(LOG_APP, "Flbf_One open failed: ret %{public}d errno : %{public}d", fileDescribe, errno);
            break;
        }
        fp = fdopen(fileDescribe, "r");
        if (fp == nullptr) {
            break;
        }
        errno = 0;
        int res = setvbuf(fp, buf, _IOLBF, sizeof(buf));
        if (res != NO_ERR) {
            OH_LOG_INFO(LOG_APP, "Flbf_One setvbuf failed: ret %{public}d errno : %{public}d", res, errno);
            break;
        }
        ret = __flbf(fp);
    } while (PARAM_0);
    if (fp != nullptr) {
        fclose(fp);
    }
    remove(TEMP_FILE);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Flbf_Two(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int ret = INIT;
    char buf[BUFSIZ];
    FILE *fp = nullptr;
    do {
        errno = 0;
        int fileDescribe = open(TEMP_FILE, O_CREAT, PARAM_0777);
        if (fileDescribe == FAIL) {
            OH_LOG_INFO(LOG_APP, "Flbf_Two open failed: ret %{public}d errno : %{public}d", fileDescribe, errno);
            break;
        }
        fp = fdopen(fileDescribe, "r");
        if (fp == nullptr) {
            break;
        }
        errno = 0;
        int res = setvbuf(fp, buf, _IOFBF, sizeof(buf));
        if (res != NO_ERR) {
            OH_LOG_INFO(LOG_APP, "Flbf_Two setvbuf failed: ret %{public}d errno : %{public}d", res, errno);
            break;
        }
        ret = __flbf(fp);
    } while (PARAM_0);
    if (fp != nullptr) {
        fclose(fp);
    }
    remove(TEMP_FILE);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Flbf_Three(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int ret = INIT;
    char buf[BUFSIZ];
    FILE *fp = nullptr;
    do {
        errno = 0;
        int fileDescribe = open(TEMP_FILE, O_CREAT, PARAM_0777);
        if (fileDescribe == FAIL) {
            OH_LOG_INFO(LOG_APP, "Flbf_Three open failed: ret %{public}d errno : %{public}d", fileDescribe, errno);
        }
        fp = fdopen(fileDescribe, "r");
        if (fp == nullptr) {
            break;
        }
        errno = 0;
        int res = setvbuf(fp, buf, _IONBF, sizeof(buf));
        if (res != NO_ERR) {
            OH_LOG_INFO(LOG_APP, "Flbf_Three setvbuf failed: ret %{public}d errno : %{public}d", res, errno);
            break;
        }
        ret = __flbf(fp);
    } while (PARAM_0);
    if (fp != nullptr) {
        fclose(fp);
    }
    remove(TEMP_FILE);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Fpending_One(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int ret = INIT;
    FILE *fp = nullptr;
    do {
        errno = 0;
        int fileDescribe = open(TEMP_FILE, O_CREAT | O_WRONLY);
        if (fileDescribe == FAIL) {
            OH_LOG_INFO(LOG_APP, "Fpending_One open failed: ret %{public}d errno : %{public}d", fileDescribe, errno);
            break;
        }
        fp = fdopen(fileDescribe, "w");
        if (fp == nullptr) {
            break;
        }
        errno = 0;
        int res = fputs(g_tempFileContent, fp);
        if (res == EOF) {
            OH_LOG_INFO(LOG_APP, "Fpending_One fputs failed: res %{public}d errno : %{public}d", res, errno);
            break;
        }
        ret = __fpending(fp);
    } while (PARAM_0);
    if (fp != nullptr) {
        fclose(fp);
    }
    remove(TEMP_FILE);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Fpending_Two(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int ret = INIT;
    FILE *fp = nullptr;
    do {
        errno = 0;
        int fileDescribe = open(TEMP_FILE, O_CREAT | O_WRONLY);
        if (fileDescribe == FAIL) {
            OH_LOG_INFO(LOG_APP, "Fpending_Two open failed: ret %{public}d errno : %{public}d", fileDescribe, errno);
            break;
        }
        fp = fdopen(fileDescribe, "w");
        if (fp == nullptr) {
            break;
        }
        int res = fputs(g_tempFileContent, fp);
        if (res == EOF) {
            OH_LOG_INFO(LOG_APP, "Fpending_Two fputs failed: res %{public}d errno : %{public}d", res, errno);
        }
        res = fflush(fp);
        if (res != NO_ERR) {
            OH_LOG_INFO(LOG_APP, "Fpending_Two fflush failed: res %{public}d errno : %{public}d", res, errno);
            break;
        }
        ret = __fpending(fp);
    } while (PARAM_0);
    if (fp != nullptr) {
        fclose(fp);
    }
    remove(TEMP_FILE);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Fpurge_One(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int ret = INIT;
    char buf[100] = {0};
    FILE *fp = nullptr;
    do {
        errno = 0;
        int fileDescribe = open(TEMP_FILE, O_CREAT | O_WRONLY);
        if (fileDescribe == FAIL) {
            OH_LOG_INFO(LOG_APP, "Fpurge_One open failed: ret %{public}d errno : %{public}d", fileDescribe, errno);
            break;
        }
        fp = fdopen(fileDescribe, "w");
        if (fp == nullptr) {
            break;
        }
        int res = fputs(g_tempFileContent, fp);
        if (res == EOF) {
            OH_LOG_INFO(LOG_APP, "Fpurge_One fputs failed: res %{public}d errno : %{public}d", res, errno);
        }
        ret = __fpurge(fp);
        fgets(buf, sizeof(buf), fp);
        ret = strlen(buf);
    } while (PARAM_0);
    if (fp != nullptr) {
        fclose(fp);
    }
    remove(TEMP_FILE);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Freadable_One(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int ret = INIT;
    FILE *fp = nullptr;
    do {
        errno = 0;
        int fileDescribe = open(TEMP_FILE, O_CREAT, PARAM_0777);
        if (fileDescribe == FAIL) {
            OH_LOG_INFO(LOG_APP, "Freadable_One open failed: ret %{public}d errno : %{public}d", fileDescribe, errno);
            break;
        }
        fp = fdopen(fileDescribe, "r");
        if (fp == nullptr) {
            break;
        }
        ret = __freadable(fp);
    } while (PARAM_0);
    if (fp != nullptr) {
        fclose(fp);
    }
    remove(TEMP_FILE);
    napi_create_int32(env, !ret, &result);
    return result;
}

static napi_value Freadable_Two(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int ret = INIT;
    FILE *fp = nullptr;
    do {
        errno = 0;
        int fileDescribe = open(TEMP_FILE, O_CREAT | O_WRONLY);
        if (fileDescribe == FAIL) {
            OH_LOG_INFO(LOG_APP, "Freadable_Two open failed: ret %{public}d errno : %{public}d", fileDescribe, errno);
            break;
        }
        fp = fdopen(fileDescribe, "w");
        if (fp == nullptr) {
            break;
        }
        ret = __freadable(fp);
    } while (PARAM_0);
    if (fp != nullptr) {
        fclose(fp);
    }
    remove(TEMP_FILE);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Freading_One(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int ret = INIT;
    FILE *fp = nullptr;
    do {
        errno = 0;
        int fileDescribe = open(TEMP_FILE, O_CREAT, PARAM_0777);
        if (fileDescribe == FAIL) {
            OH_LOG_INFO(LOG_APP, "Freading_One open failed: ret %{public}d errno : %{public}d", fileDescribe, errno);
            break;
        }
        fp = fdopen(fileDescribe, "r");
        if (fp == nullptr) {
            break;
        }
        ret = __freading(fp);
    } while (PARAM_0);
    if (fp != nullptr) {
        fclose(fp);
    }
    remove(TEMP_FILE);
    napi_create_int32(env, !ret, &result);
    return result;
}

static napi_value Freading_Two(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int ret = INIT;
    FILE *fp = nullptr;
    do {
        errno = 0;
        int fileDescribe = open(TEMP_FILE, O_CREAT | O_WRONLY);
        if (fileDescribe == FAIL) {
            OH_LOG_INFO(LOG_APP, "Freading_Two open failed: ret %{public}d errno : %{public}d", fileDescribe, errno);
            break;
        }
        fp = fdopen(fileDescribe, "w");
        if (fp == nullptr) {
            break;
        }
        ret = __freading(fp);
    } while (PARAM_0);
    if (fp != nullptr) {
        fclose(fp);
    }
    remove(TEMP_FILE);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Fseterr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int ret = INIT;
    FILE *fp = nullptr;
    do {
        errno = 0;
        int fileDescribe = open(TEMP_FILE, O_CREAT | O_WRONLY);
        if (fileDescribe == FAIL) {
            OH_LOG_INFO(LOG_APP, "Fseterr open failed: ret %{public}d errno : %{public}d", fileDescribe, errno);
            break;
        }
        fp = fdopen(fileDescribe, "w");
        if (fp == nullptr) {
            break;
        }
        __fseterr(fp);
        ret = ferror(fp);
        clearerr(fp);
    } while (PARAM_0);
    if (fp != nullptr) {
        fclose(fp);
    }
    remove(TEMP_FILE);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Fwritable_One(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int ret = INIT;
    FILE *fp = nullptr;
    do {
        errno = 0;
        int fileDescribe = open(TEMP_FILE, O_CREAT | O_WRONLY);
        if (fileDescribe == FAIL) {
            OH_LOG_INFO(LOG_APP, "Fwritable_One open failed: ret %{public}d errno : %{public}d", fileDescribe, errno);
            break;
        }
        fp = fdopen(fileDescribe, "w");
        if (fp == nullptr) {
            break;
        }
        ret = __fwritable(fp);
    } while (PARAM_0);
    if (fp != nullptr) {
        fclose(fp);
    }
    remove(TEMP_FILE);
    napi_create_int32(env, !ret, &result);
    return result;
}

static napi_value Fwritable_Two(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int ret = INIT;
    FILE *fp = nullptr;
    do {
        errno = 0;
        int fileDescribe = open(TEMP_FILE, O_CREAT, PARAM_0777);
        if (fileDescribe == FAIL) {
            OH_LOG_INFO(LOG_APP, "Fwritable_Two open failed: ret %{public}d errno : %{public}d", fileDescribe, errno);
            break;
        }
        fp = fdopen(fileDescribe, "r");
        if (fp == nullptr) {
            break;
        }
        ret = __fwritable(fp);
    } while (PARAM_0);
    if (fp != nullptr) {
        fclose(fp);
    }
    remove(TEMP_FILE);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Fwriting_One(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int ret = INIT;
    FILE *fp = nullptr;
    do {
        errno = 0;
        int fileDescribe = open(TEMP_FILE, O_CREAT | O_WRONLY);
        if (fileDescribe == FAIL) {
            OH_LOG_INFO(LOG_APP, "Fwriting_One open failed: ret %{public}d errno : %{public}d", fileDescribe, errno);
            break;
        }
        fp = fdopen(fileDescribe, "w");
        if (fp == nullptr) {
            break;
        }
        ret = __fwriting(fp);
    } while (PARAM_0);
    if (fp != nullptr) {
        fclose(fp);
    }
    remove(TEMP_FILE);
    napi_create_int32(env, !ret, &result);
    return result;
}

static napi_value Fwriting_Two(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int ret = INIT;
    FILE *fp = nullptr;
    do {
        errno = 0;
        int fileDescribe = open(TEMP_FILE, O_CREAT, PARAM_0777);
        if (fileDescribe == FAIL) {
            OH_LOG_INFO(LOG_APP, "Fwriting_Two open failed: ret %{public}d errno : %{public}d", fileDescribe, errno);
            break;
        }
        fp = fdopen(fileDescribe, "r");
        if (fp == nullptr) {
            break;
        }
        ret = __fwriting(fp);
    } while (PARAM_0);
    if (fp != nullptr) {
        fclose(fp);
    }
    remove(TEMP_FILE);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Flushlbf(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int ret = INIT;
    FILE *fp = nullptr;
    char buf[BUFSIZ] = {0};
    do {
        errno = 0;
        int fileDescribe = open(TEMP_FILE, O_CREAT | O_WRONLY | O_TRUNC);
        if (fileDescribe == FAIL) {
            OH_LOG_INFO(LOG_APP, "Flushlbf open failed: ret %{public}d errno : %{public}d", fileDescribe, errno);
            break;
        }
        fp = fdopen(fileDescribe, "w+");
        if (fp == nullptr) {
            break;
        }
        errno = 0;
        int res = setvbuf(fp, buf, _IOLBF, sizeof(buf));
        if (res != 0) {
            OH_LOG_INFO(LOG_APP, "Flushlbf setvbuf failed: ret %{public}d errno : %{public}d", res, errno);
            break;
        }
        res = fputs(g_tempFileContent, fp);
        if (res == EOF) {
            OH_LOG_INFO(LOG_APP, "Flushlbf fputs failed: res %{public}d errno : %{public}d", res, errno);
            break;
        }
        ret = __fpending(fp);
        if (ret) {
            _flushlbf();
            ret = __fpending(fp);
        } else {
            ret = !ret;
        }
    } while (PARAM_0);
    if (fp != nullptr) {
        fclose(fp);
    }
    remove(TEMP_FILE);
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"fBufSize_One", nullptr, FBufSize_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fBufSize_Two", nullptr, FBufSize_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fLbf_One", nullptr, Flbf_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fLbf_Two", nullptr, Flbf_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fLbf_Three", nullptr, Flbf_Three, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fPending_One", nullptr, Fpending_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fPending_Two", nullptr, Fpending_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fPurge_One", nullptr, Fpurge_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fReadable_One", nullptr, Freadable_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fReadable_Two", nullptr, Freadable_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fReading_One", nullptr, Freading_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fReading_Two", nullptr, Freading_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fSetErr", nullptr, Fseterr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fWritable_One", nullptr, Fwritable_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fWritable_Two", nullptr, Fwritable_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fWriting_One", nullptr, Fwriting_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fWriting_Two", nullptr, Fwriting_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"flushLbf", nullptr, Flushlbf, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "libstdioextndk1",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
