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
#include <node_api.h>
#include <sched.h>
#include <unistd.h>

#define NO_ERR 0
#define TWENTYTHREE 23
#define DEFAULTVALUE (-100)
#define SYS_pidfd_open 4
#define ONEVAL 1
#define MINUSONE (-1)
#define MINUSTEN (-10)
#define TWOTHREE 23
#define FAIL (-1)
#define NO_ERR 0
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_UNNORMAL (-1)
#define ERRON_0 0
#define TWENTYTHREE 23
#define DEFAULTVALUE (-100)

static napi_value SchedGetPriorityMax(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int first = PARAM_0;
    napi_get_value_int32(env, args[0], &first);
    int maxvalue = sched_get_priority_max(first);
    napi_value result = nullptr;
    napi_create_int32(env, maxvalue, &result);
    return result;
}

static napi_value SchedGetPriorityMin(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int first = PARAM_0;
    napi_get_value_int32(env, args[0], &first);
    int minvalue = sched_get_priority_min(first);
    napi_value result = nullptr;
    napi_create_int32(env, minvalue, &result);
    return result;
}
static napi_value SchedCpualloc(napi_env env, napi_callback_info info)
{
    size_t count = PARAM_0;
    cpu_set_t *ret = __sched_cpualloc(count);
    napi_value result = nullptr;
    if (ret == nullptr) {
        napi_create_int32(env, PARAM_UNNORMAL, &result);
    } else {
        napi_create_int32(env, PARAM_0, &result);
    }
    return result;
}
static napi_value SchedYield(napi_env env, napi_callback_info info)
{
    int schValue = sched_yield();
    napi_value result = nullptr;
    napi_create_int32(env, schValue, &result);
    return result;
}

static napi_value SchedGetscheduler(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int first = PARAM_0;
    napi_get_value_int32(env, args[0], &first);
    napi_value result = nullptr;

    if (first == PARAM_0) {
        int schval = sched_getscheduler(getpid());
        napi_create_int32(env, schval, &result);
    }
    if (first == MINUSONE) {
        int schval = sched_getscheduler(MINUSTEN);
        napi_create_int32(env, schval, &result);
    }
    return result;
}

static napi_value SchedSetparam(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    struct sched_param param = {PARAM_0};
    pid_t pid = getpid();
    int first = PARAM_0;
    napi_get_value_int32(env, args[0], &first);
    int maxpri = sched_get_priority_max(SCHED_RR);
    int minpri = sched_get_priority_min(SCHED_RR);
    if (maxpri == FAIL || minpri == FAIL) {
        napi_create_int32(env, FAIL, &result);
    }
    errno = 0;
    if (first == PARAM_0) {
        int ret = sched_getparam(pid, &param);
        if (ret == NO_ERR) {
            ret = sched_setparam(pid, &param);
        }
        napi_create_int32(env, ret, &result);
    } else if (first == FAIL) {
        int schval = sched_setparam(pid, nullptr);
        napi_create_int32(env, schval, &result);
    } else {
        napi_create_int32(env, DEFAULTVALUE, &result);
    }
    return result;
}

static napi_value SchedSetscheduler(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int first = PARAM_0;
    napi_get_value_int32(env, args[0], &first);
    int sched = PARAM_0;
    pid_t pid = getpid();
    sched = SCHED_FIFO;
    struct sched_param param = {PARAM_0};
    if (first == NO_ERR) {
        param.sched_priority = TWENTYTHREE;
        int schval = sched_setscheduler(pid, sched, &param);
        napi_create_int32(env, schval, &result);
    } else if (first == FAIL) {
        int schval = sched_setscheduler(pid, sched, nullptr);
        napi_create_int32(env, schval, &result);
    } else {
        napi_create_int32(env, DEFAULTVALUE, &result);
    }
    return result;
}

static napi_value SchedGetaffinity(napi_env env, napi_callback_info info)
{
    cpu_set_t mask;
    cpu_set_t get;
    CPU_ZERO(&mask);
    CPU_SET(PARAM_0, &mask);
    int schval = sched_setaffinity(PARAM_0, sizeof(mask), &mask);
    CPU_ZERO(&get);
    schval = sched_getaffinity(PARAM_0, sizeof(get), &get);
    napi_value result;
    napi_create_int32(env, schval, &result);
    return result;
}

static napi_value SchedGetcpu(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    int schval = sched_getcpu();
    napi_value result = nullptr;
    if (errno != PARAM_0) {
        napi_create_int32(env, MINUSONE, &result);
    } else if (schval >= PARAM_0) {
        napi_create_int32(env, PARAM_0, &result);
    }
    return result;
}

static napi_value SchedSetaffinity(napi_env env, napi_callback_info info)
{
    cpu_set_t mask;
    CPU_ZERO(&mask);
    CPU_SET(PARAM_0, &mask);
    int schval = sched_setaffinity(PARAM_0, sizeof(mask), &mask);
    napi_value result;
    napi_create_int32(env, schval, &result);
    return result;
}

static napi_value SchedRrGetInterval(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int first = PARAM_0;
    napi_value result;
    napi_get_value_int32(env, args[0], &first);
    if (first == PARAM_0) {
        pid_t pid = getpid();
        struct timespec ts = {PARAM_0};
        int schedvalue = sched_rr_get_interval(pid, &ts);
        napi_create_int32(env, schedvalue, &result);
    } else {
        pid_t pid = MINUSONE;
        struct timespec ts = {PARAM_0};
        int schedvalue = sched_rr_get_interval(pid, &ts);
        napi_create_int32(env, schedvalue, &result);
    }
    return result;
}
static napi_value Setns(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    pid_t pid = getpid();
    int fd = syscall(SYS_pidfd_open, pid, PARAM_0);
    int setval = PARAM_1;
    if (fd >= PARAM_0) {
        setval = setns(fd, PARAM_0);
    }
    napi_value result;
    napi_create_int32(env, setval, &result);
    return result;
}
static napi_value Schedcpucount(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int num_cpus = PARAM_0;
    num_cpus = sysconf(_SC_NPROCESSORS_CONF);
    size_t size;
    size = CPU_ALLOC_SIZE(num_cpus);
    cpu_set_t *cpu;
    cpu = CPU_ALLOC(num_cpus);
    int returnValue = __sched_cpucount(size, cpu);
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value Unshare(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int isOpenFile = PARAM_0, toJsResult = FAIL;
    napi_get_value_int32(env, args[0], &isOpenFile);
    if (isOpenFile == PARAM_1) {
        int unshareResult = unshare(CLONE_FILES);
        if (unshareResult == PARAM_0) {
            toJsResult = PARAM_1;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, toJsResult, &result);
    return result;
}

static napi_value SchedGetparam(napi_env env, napi_callback_info info)
{
    struct sched_param param1;
    int ret = sched_getparam(PARAM_0, &param1);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"schedGetPriorityMax", nullptr, SchedGetPriorityMax, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"schedGetPriorityMin", nullptr, SchedGetPriorityMin, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sched_yield", nullptr, SchedYield, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sched_getscheduler", nullptr, SchedGetscheduler, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sched_setparam", nullptr, SchedSetparam, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sched_setscheduler", nullptr, SchedSetscheduler, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sched_getaffinity", nullptr, SchedGetaffinity, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sched_getcpu", nullptr, SchedGetcpu, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sched_setaffinity", nullptr, SchedSetaffinity, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sched_rr_get_interval", nullptr, SchedRrGetInterval, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setns", nullptr, Setns, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"schedCpuCount", nullptr, Schedcpucount, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"schedCpualloc", nullptr, SchedCpualloc, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"unshare", nullptr, Unshare, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"schedGetparam", nullptr, SchedGetparam, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "sched",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }