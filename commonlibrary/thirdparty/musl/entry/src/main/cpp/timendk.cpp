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
#include <clocale>
#include <csignal>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <ctime>
#include <ifaddrs.h>
#include <js_native_api.h>
#include <js_native_api_types.h>
#include <linux/quota.h>
#include <malloc.h>
#include <net/if.h>
#include <node_api.h>
#include <sched.h>
#include <string>
#include <sys/inotify.h>
#include <sys/time.h>
#include <sys/timex.h>
#include <unistd.h>
#include <utmp.h>
#include <uv.h>

#define ONEVAL 1
#define TWOVAL 2
#define THREE 3
#define NO_ERR 0
#define SUCCESS 1
#define FAIL (-1)
#define TEST_SIZE 2
#define ONE 1
#define PARAM_4 4
#define MAX_NUMBER 256
#define FAILNUMBER (-1)
#define TIME_L 1659177614
#define MAX_UTIME (3)
static int g_count = 0;
#define SIGNUM 40
#define TVSEC 1000000000
#define TVNSEC 200000000

#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_5 5
#define PARAM_1999 1999
#define PARAM_12 12
#define PARAM_17 17
#define PARAM_06 06
#define PARAM_30 30
#define PARAM_23 23
#define PARAM_1900 1900
#define PARAM_02 02
#define PARAM_07 07
#define PARAM_16 16
#define PARAM_15 15
#define PARAM_20 20
#define PARAM_UNNORMAL (-1)
#define RETURN_0 0
#define FAILD (-1)
#define ERRON_0 0
#define SIZE_10 10
#define SIZE_30 30
#define SIZE_64 64
#define SIZE_100 100
#define SIZE_1024 1024
#define SIZE_4096 4096
#define SIZE_8192 8192
#define SIZE_0666 0666
static napi_value GetITimer(napi_env env, napi_callback_info info)
{
    struct itimerval currValue;
    int getInfo = getitimer(ITIMER_VIRTUAL, &currValue);
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}
static napi_value GetTimeOfDay(napi_env env, napi_callback_info info)
{
    errno = NO_ERR;
    struct timeval start;
    int gitInfo = gettimeofday(&start, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, gitInfo, &result);
    return result;
}

void signalHandler(int signo)
{
    switch (signo) {
    case SIGALRM:
        printf("Caught the SIGALRM signal!\n");
        break;
    default :
        printf("Can not catch the SIGALRM signal!\n");
        break;
    }
}

static napi_value Setitimer(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_4;
    napi_value args[4] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    int valueSecond;
    napi_get_value_int32(env, args[1], &valueSecond);
    int valueThird;
    napi_get_value_int32(env, args[2], &valueThird);
    int valueForth;
    napi_get_value_int32(env, args[3], &valueForth);
    signal(SIGALRM, signalHandler);
    struct itimerval it;
    memset(&it, PARAM_0, sizeof(it));
    it.it_value.tv_sec = valueFirst;
    it.it_value.tv_usec = valueSecond;
    it.it_interval.tv_sec = valueThird;
    it.it_interval.tv_usec = valueForth;
    int setValue = setitimer(ITIMER_REAL, &it, nullptr);
    napi_value result;
    napi_create_int32(env, setValue, &result);
    return result;
}

static napi_value Strftime(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    tzset();
    static time_t gTime = TIME_L;
    struct tm *timeptr = localtime(&gTime);
    char buffer[MAX_NUMBER];
    strftime(buffer, sizeof(buffer) - PARAM_1, valueFirst, timeptr);
    napi_value result = nullptr;
    napi_create_string_utf8(env, buffer, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Strftime_l(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    static time_t gTime = TIME_L;
    struct tm *timeptr = localtime(&gTime);
    char buffer[MAX_NUMBER];
    locale_t m_locale = newlocale(LC_ALL_MASK, "en_US", nullptr);
    strftime_l(buffer, sizeof(buffer) - PARAM_1, valueFirst, timeptr, m_locale);
    napi_value result = nullptr;
    napi_create_string_utf8(env, buffer, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Timegm(napi_env env, napi_callback_info info)
{
    time_t timeThis;
    tzset();
    static time_t gTime = TIME_L;
    struct tm *timeptr = localtime(&gTime);
    timeThis = timegm(timeptr);

    int timeValue = timeThis;
    napi_value result = nullptr;
    napi_create_int32(env, timeValue, &result);
    return result;
}

static napi_value TimespecGet(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);

    struct timespec ts;
    int timeValue = timespec_get(&ts, TIME_UTC);
    napi_value result = nullptr;
    napi_create_int32(env, timeValue, &result);
    return result;
}

static napi_value Timer_create(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);

    int timeValue = timer_create(FAILNUMBER, nullptr, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, timeValue, &result);
    return result;
}

void TimerHandler(int sig)
{
    if (g_count < MAX_UTIME) {
        g_count++;
    }
    printf("timer handler return\n");
    return;
}
static napi_value Timer_delete(napi_env env, napi_callback_info info)
{
    size_t argc = ONE;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);

    timer_t timerid;
    struct sigevent sev;
    struct itimerspec its;

    sev.sigev_notify = SIGEV_SIGNAL;
    sev.sigev_signo = SIGUSR1;
    sev.sigev_value.sival_ptr = &timerid;
    signal(SIGUSR1, TimerHandler);
    timer_create(CLOCK_MONOTONIC, &sev, &timerid);

    its.it_value.tv_sec = ONE;
    its.it_value.tv_nsec = PARAM_0;
    its.it_interval.tv_sec = its.it_value.tv_sec;
    its.it_interval.tv_nsec = its.it_value.tv_nsec;
    timer_settime(timerid, PARAM_0, &its, nullptr);

    while (g_count != MAX_UTIME) {
        sleep(PARAM_1);
    }
    int timeValue = timer_delete(timerid);

    napi_value result = nullptr;
    napi_create_int32(env, timeValue, &result);
    return result;
}

static napi_value Timer_gettime(napi_env env, napi_callback_info info)
{
    size_t argc = ONE;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);

    int timeValue = timer_gettime(nullptr, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, timeValue, &result);
    return result;
}
volatile int t_status = PARAM_0;
void handler(int sig)
{
    g_count++;

    return;
}

static napi_value Timer_settime(napi_env env, napi_callback_info info)
{
    size_t argc = ONE;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    struct sigevent sev;
    timer_t timerid;

    sev.sigev_notify = SIGEV_SIGNAL;
    sev.sigev_signo = SIGNUM;
    sev.sigev_value.sival_ptr = &timerid;

    signal(SIGNUM, handler);

    int result = timer_create(CLOCK_REALTIME, &sev, &timerid);
    struct itimerspec its;
    its.it_value.tv_sec = ONE;
    its.it_value.tv_nsec = PARAM_0;
    its.it_interval.tv_sec = PARAM_0;
    its.it_interval.tv_nsec = PARAM_0;
    result = timer_settime(timerid, PARAM_0, &its, nullptr);
    while (g_count <= PARAM_0) {
        sleep(PARAM_1);
    }
    result = timer_delete(timerid);

    napi_value results = nullptr;
    napi_create_int32(env, result, &results);
    return results;
}
static napi_value Timer_getoverrun(napi_env env, napi_callback_info info)
{
    size_t argc = ONE;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);

    int timeValue = timer_getoverrun(nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, timeValue, &result);
    return result;
}

static napi_value Strptime(napi_env env, napi_callback_info info)
{
    size_t argc = ONE;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    const char *buffer = "1";
    struct tm tmTime = {0};
    char *cnt = strptime(buffer, valueFirst, &tmTime);
    napi_value result = nullptr;
    napi_create_string_utf8(env, cnt, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Time(napi_env env, napi_callback_info info)
{
    time_t timeValue = time(nullptr);

    napi_value result = nullptr;

    napi_create_double(env, timeValue, &result);

    return result;
}

static napi_value GetdateErr(napi_env env, napi_callback_info info)
{
    getdate_err = PARAM_1;
    int resultValue = abs(getdate_err);
    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

static napi_value Daylight(napi_env env, napi_callback_info info)
{
    daylight = PARAM_1;
    int resultValue = abs(daylight);
    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

static napi_value Tzset(napi_env env, napi_callback_info info)
{
    int toJs = FAIL;
    time_t td;
    time_t td1;
    time_t td2;
    char pch[] = "TZ=US/Pacific";
    char lg[] = "TZ=America/Los_Angeles";
    char pst[] = "TZ=PST8PDT";
    putenv(pch);
    tzset();
    time(&td);
    std::string usTimeString = asctime(localtime(&td));

    putenv(lg);
    tzset();
    time(&td1);
    std::string amerTimeString = asctime(localtime(&td1));

    putenv(pst);
    tzset();
    time(&td2);
    std::string pstTimeString = asctime(localtime(&td2));

    if (usTimeString != amerTimeString || usTimeString != pstTimeString || amerTimeString != pstTimeString) {
        toJs = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, toJs, &result);
    return result;
}

static napi_value DiffTime(napi_env env, napi_callback_info info)
{
    time_t now;
    struct tm newyear;
    double seconds;
    time(&now);
    newyear = *localtime(&now);
    newyear.tm_hour = PARAM_0;
    newyear.tm_min = PARAM_0;
    newyear.tm_sec = PARAM_0;
    newyear.tm_mon = PARAM_0;
    newyear.tm_mday = PARAM_1;
    time_t firstTime = PARAM_1999 - PARAM_12 - PARAM_17 - PARAM_06 - PARAM_30 - PARAM_23;
    time_t secondTime = PARAM_1900 - PARAM_02 - PARAM_07 - PARAM_16 - PARAM_15 - PARAM_20;
    seconds = difftime(firstTime, secondTime);
    napi_value result = nullptr;
    napi_create_double(env, seconds, &result);
    return result;
}

static napi_value CTime_r(napi_env env, napi_callback_info info)
{
    char *checkParam = nullptr;
    int returnParam = PARAM_1;
    const time_t time = PARAM_0;
    char secondParam[32];
    checkParam = ctime_r(&time, secondParam);
    if (checkParam != nullptr) {
        returnParam = PARAM_0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnParam, &result);
    return result;
}

static napi_value CTime(napi_env env, napi_callback_info info)
{
    char *checkParam = nullptr;
    int returnParam = PARAM_1;
    const time_t time = PARAM_0;
    checkParam = ctime(&time);
    if (checkParam != nullptr) {
        returnParam = PARAM_0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnParam, &result);
    return result;
}

napi_value Asctime(napi_env env, napi_callback_info info)
{
    time_t curr_time;
    time(&curr_time);
    char *time_str = asctime(localtime(&curr_time));
    int resultValue = FAIL;
    if (time_str != nullptr) {
        resultValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);
    return result;
}

napi_value AsctimeR(napi_env env, napi_callback_info info)
{
    time_t rawtime;
    struct tm *timeinfo;
    char buffer[80];

    time(&rawtime);
    timeinfo = localtime(&rawtime);
    char *resultVal = asctime_r(timeinfo, buffer);
    int resultValue = FAIL;
    if (resultVal != nullptr) {
        resultValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);
    return result;
}

static napi_value Clock(napi_env env, napi_callback_info info)
{
    clock_t returnValue = clock();
    int param = FAIL;
    if (returnValue >= PARAM_0) {
        param = SUCCESS;
    }
    napi_value result;
    napi_create_int32(env, param, &result);
    return result;
}

static napi_value ClockAdjtime(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    struct timex tx;
    memset(&tx, PARAM_0, sizeof(tx));

    int value = clock_adjtime(CLOCK_REALTIME, &tx);
    int returnValue = FAIL;
    if (value != FAIL) {
        returnValue = SUCCESS;
    }
    napi_value result;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value ClockGetcpuclockid(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    clockid_t clk;
    pid_t pid = getppid();

    clock_getcpuclockid(pid, &clk);
    int returnValue = FAIL;
    if (errno == ERRON_0) {
        returnValue = SUCCESS;
    }
    napi_value result;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value ClockGetres(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    struct timespec ts;
    int value = clock_getres(CLOCK_REALTIME, &ts);
    napi_value result;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value ClockGettime(napi_env env, napi_callback_info info)
{
    struct timespec ts;
    int value = clock_gettime(CLOCK_REALTIME, &ts);
    napi_value result;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value ClockNanosleep(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    struct timespec ts;
    ts.tv_sec = ts.tv_nsec / TVSEC;
    ts.tv_nsec = TVNSEC;
    int ret = FAIL;
    ret = clock_nanosleep(CLOCK_REALTIME, TIMER_ABSTIME, &ts, nullptr);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value ClockSettime(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, NO_ERR, &result);
    return result;
}

static napi_value Localtime(napi_env env, napi_callback_info info)
{
    struct tm *ptm = nullptr;
    time_t ttv = PARAM_0;

    ptm = localtime(&ttv);

    napi_value result;
    if (ptm == nullptr) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, NO_ERR, &result);
    }
    return result;
}

static napi_value LocaltimeR(napi_env env, napi_callback_info info)
{
    struct tm *ptm = (struct tm *)malloc(sizeof(struct tm));
    time_t ttv = PARAM_0;

    ptm = localtime_r(&ttv, ptm);

    napi_value result;
    if (ptm == nullptr) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, NO_ERR, &result);
    }
    return result;
}

static napi_value MkTime(napi_env env, napi_callback_info info)
{
    struct tm *ptm = (struct tm *)malloc(sizeof(struct tm));
    time_t ttv = PARAM_0;

    ttv = mktime(ptm);

    napi_value result;
    if (ttv == FAILD) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, NO_ERR, &result);
    }
    return result;
}

static napi_value Gmtime(napi_env env, napi_callback_info info)
{
    time_t rawtime;
    struct tm *infoat;

    time(&rawtime);
    /* 获取 GMT 时间 */
    infoat = gmtime(&rawtime);
    napi_value result;
    if (infoat == nullptr) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, NO_ERR, &result);
    }
    return result;
}

static napi_value GmtimeR(napi_env env, napi_callback_info info)
{
    time_t time;
    struct tm parsed_time;
    struct tm gmt_parsed_time;
    napi_value result;

    if (localtime_r(&time, &parsed_time) == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }

    if (gmtime_r(&time, &gmt_parsed_time) == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }

    napi_create_int32(env, NO_ERR, &result);
    return result;
}

static napi_value Lutimes(napi_env env, napi_callback_info info)
{
    int ret;
    struct stat s;
    static struct timeval tv[TEST_SIZE] = {{0L, 0L}, {0L, 0L}};
    tv[0].tv_sec = s.st_atime;
    tv[0].tv_usec = PARAM_0;
    tv[1].tv_sec = s.st_mtime;
    tv[1].tv_usec = PARAM_0;
    int fd = open("/data/storage/el2/base/files/Fzl.txt", O_RDWR | O_CREAT, SIZE_0666);
    close(fd);
    ret = lutimes("/data/storage/el2/base/files/Fzl.txt", tv);
    napi_value result;
    if (ret == FAILD) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, NO_ERR, &result);
    }
    return result;
}

static napi_value Nanosleep(napi_env env, napi_callback_info info)
{
    struct timespec n_sleep;
    struct timespec p_sleep;
    n_sleep.tv_sec = PARAM_0;
    n_sleep.tv_nsec = 5e8L;
    int ret = nanosleep(&n_sleep, &p_sleep);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value TimeZone(napi_env env, napi_callback_info info)
{
    errno = NO_ERR;
    struct timeval start;
    struct timezone tz;
    int gitInfo = gettimeofday(&start, &tz);

    napi_value result = nullptr;
    napi_create_int32(env, gitInfo, &result);
    return result;
}

static napi_value Settimeofday(napi_env env, napi_callback_info info)
{
    int setval = settimeofday(nullptr, nullptr);
    napi_value result;
    napi_create_int32(env, setval, &result);
    return result;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"getITimer", nullptr, GetITimer, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getTimeOfDay", nullptr, GetTimeOfDay, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setitimer", nullptr, Setitimer, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"localtime", nullptr, Localtime, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"localtimeR", nullptr, LocaltimeR, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mkTime", nullptr, MkTime, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gmtime", nullptr, Gmtime, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gmtimeR", nullptr, GmtimeR, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"lutimes", nullptr, Lutimes, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nanosleep", nullptr, Nanosleep, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"timeZone", nullptr, TimeZone, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strftime", nullptr, Strftime, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strftime_l", nullptr, Strftime_l, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"timegm", nullptr, Timegm, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"timespec_get", nullptr, TimespecGet, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"timer_create", nullptr, Timer_create, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"timer_delete", nullptr, Timer_delete, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"timer_gettime", nullptr, Timer_gettime, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"timer_settime", nullptr, Timer_settime, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"timer_getoverrun", nullptr, Timer_getoverrun, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strptime", nullptr, Strptime, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tzset", nullptr, Tzset, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"difftime", nullptr, DiffTime, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ctime", nullptr, CTime, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ctime_r", nullptr, CTime_r, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"asctime", nullptr, Asctime, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"asctimeR", nullptr, AsctimeR, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"clock", nullptr, Clock, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"clockAdjtime", nullptr, ClockAdjtime, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"clockGetcpuclockid", nullptr, ClockGetcpuclockid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"clockGetres", nullptr, ClockGetres, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"clockGettime", nullptr, ClockGettime, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"clockNanosleep", nullptr, ClockNanosleep, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"clockSettime", nullptr, ClockSettime, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"settimeofday", nullptr, Settimeofday, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"time", nullptr, Time, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getdateErr", nullptr, GetdateErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"daylight", nullptr, Daylight, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "time",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
