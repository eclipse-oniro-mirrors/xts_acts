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

#include <cstring>
#include <fcntl.h>
#include <js_native_api.h>
#include <js_native_api_types.h>
#include <node_api.h>
#include <stdio_ext.h>
#include <unistd.h>

#define PARAM_0 0
#define PARAM_5 5
#define INIT (-1)

static const char *TEMP_FILE = "/data/storage/el2/base/files/fzl.txt";
static const char *g_tempFileContent = "This is a test";

static napi_value FBufSize_One(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int ret = INIT;
    char buf[1024];
    FILE *fp = nullptr;
    do {
        int fileDescribe = open(TEMP_FILE, O_CREAT);
        fp = fdopen(fileDescribe, "r");
        if (fp == nullptr) {
            break;
        }
        setvbuf(fp, buf, _IOFBF, sizeof(buf));
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
        int fileDescribe = open(TEMP_FILE, O_CREAT);
        fp = fdopen(fileDescribe, "r");
        if (fp == nullptr) {
            break;
        }
        setvbuf(fp, nullptr, _IOFBF, PARAM_0);
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
        int fileDescribe = open(TEMP_FILE, O_CREAT);
        fp = fdopen(fileDescribe, "r");
        if (fp == nullptr) {
            break;
        }
        setvbuf(fp, buf, _IOLBF, sizeof(buf));
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
        int fileDescribe = open(TEMP_FILE, O_CREAT);
        fp = fdopen(fileDescribe, "r");
        if (fp == nullptr) {
            break;
        }
        setvbuf(fp, buf, _IOFBF, sizeof(buf));
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
        int fileDescribe = open(TEMP_FILE, O_CREAT);
        fp = fdopen(fileDescribe, "r");
        if (fp == nullptr) {
            break;
        }
        setvbuf(fp, buf, _IONBF, sizeof(buf));
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
        int fileDescribe = open(TEMP_FILE, O_CREAT | O_WRONLY);
        fp = fdopen(fileDescribe, "w");
        if (fp == nullptr) {
            break;
        }
        fputs(g_tempFileContent, fp);
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
        int fileDescribe = open(TEMP_FILE, O_CREAT | O_WRONLY);
        fp = fdopen(fileDescribe, "w");
        if (fp == nullptr) {
            break;
        }
        fputs(g_tempFileContent, fp);
        fflush(fp);
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
    char buf[100];
    FILE *fp = nullptr;
    do {
        int fileDescribe = open(TEMP_FILE, O_CREAT | O_WRONLY);
        fp = fdopen(fileDescribe, "w");
        if (fp == nullptr) {
            break;
        }
        fputs(g_tempFileContent, fp);
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
        int fileDescribe = open(TEMP_FILE, O_CREAT);
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
        int fileDescribe = open(TEMP_FILE, O_CREAT | O_WRONLY);
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
        int fileDescribe = open(TEMP_FILE, O_CREAT);
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
        int fileDescribe = open(TEMP_FILE, O_CREAT | O_WRONLY);
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
        int fileDescribe = open(TEMP_FILE, O_CREAT | O_WRONLY);
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
        int fileDescribe = open(TEMP_FILE, O_CREAT | O_WRONLY);
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
        int fileDescribe = open(TEMP_FILE, O_CREAT);
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
        int fileDescribe = open(TEMP_FILE, O_CREAT | O_WRONLY);
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
        int fileDescribe = open(TEMP_FILE, O_CREAT);
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
        int fileDescribe = open(TEMP_FILE, O_CREAT | O_WRONLY | O_TRUNC);
        fp = fdopen(fileDescribe, "w+");
        if (fp == nullptr) {
            break;
        }
        setvbuf(fp, buf, _IOLBF, sizeof(buf));
        fputs(g_tempFileContent, fp);
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
