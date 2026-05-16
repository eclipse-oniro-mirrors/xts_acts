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

#include "time64_functions.h"
#include <sys/time.h>
#include <cstring>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/stat.h>
#include <sys/timex.h>
#include <dlfcn.h>

#ifdef __cplusplus
extern "C" {
#endif

int RecvmmsgTime64(int sockfd, struct mmsghdr *msgvec, unsigned int vlen, unsigned int flags, struct timespec *timeout)
{
    return recvmmsg(sockfd, msgvec, vlen, flags, timeout);
}

int GetitimerTime64(int which, struct itimerval *currValue)
{
    return getitimer(which, currValue);
}

int SetitimerTime64(int which, const struct itimerval *newValue, struct itimerval *oldValue)
{
    return setitimer(which, newValue, oldValue);
}

int CndTimedwaitTime64(cnd_t *cond, mtx_t *mutex, const struct timespec *timePoint)
{
    return cnd_timedwait(cond, mutex, timePoint);
}

int ClockGetresTime64(clockid_t clock_id, struct timespec *res)
{
    return clock_getres(clock_id, res);
}

int ClockSettime64(clockid_t clock_id, const struct timespec *tp)
{
    return clock_settime(clock_id, tp);
}

double Difftime64(time_t time1, time_t time0)
{
    return difftime(time1, time0);
}

int SemtimedopTime64(int semid, struct sembuf *sops, size_t nsops, const struct timespec *timeout)
{
    return semtimedop(semid, sops, nsops, timeout);
}

int SettimeofdayTime64(const struct timeval *tv, const struct timezone *tz)
{
    return settimeofday(tv, tz);
}

int TimerfdGettime64(int fd, struct itimerspec *currValue)
{
    return timerfd_gettime(fd, currValue);
}

int TimerfdSettime64(int fd, int flags, const struct itimerspec *newValue, struct itimerspec *oldValue)
{
    return timerfd_settime(fd, flags, newValue, oldValue);
}

int UtimesTime64(const char *filename, const struct timeval times[2])
{
    return utimes(filename, times);
}

pid_t Wait4Time64(pid_t pid, int *wstatus, int options, struct rusage *rusage)
{
    return wait4(pid, wstatus, options, rusage);
}

int GetrusageTime64(int who, struct rusage *usage)
{
    return getrusage(who, usage);
}

int SchedRrGetIntervalTime64(pid_t pid, struct timespec *tp)
{
    return sched_rr_get_interval(pid, tp);
}

int SelectTime64(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exceptfds, struct timeval *timeout)
{
    return select(nfds, readfds, writefds, exceptfds, timeout);
}

int FutimesatTime64(int dirfd, const char *pathname, const struct timeval times[2])
{
    return futimesat(dirfd, pathname, times);
}

int UtimensatTime64(int dirfd, const char *pathname, const struct timespec times[2], int flags)
{
    return utimensat(dirfd, pathname, times, flags);
}

int MtxTimedlockTime64(mtx_t *mutex, const struct timespec *timePoint)
{
    return mtx_timedlock(mutex, timePoint);
}

int PthreadMutexTimedlockTime64(pthread_mutex_t *mutex, const struct timespec *abstime)
{
    return pthread_mutex_timedlock(mutex, abstime);
}

int PthreadRwlockTimedrdlockTime64(pthread_rwlock_t *rwlock, const struct timespec *abstime)
{
    return pthread_rwlock_timedrdlock(rwlock, abstime);
}

int PthreadRwlockTimedwrlockTime64(pthread_rwlock_t *rwlock, const struct timespec *abstime)
{
    return pthread_rwlock_timedwrlock(rwlock, abstime);
}

int ThrdSleepTime64(const struct timespec *timePoint, struct timespec *remaining)
{
    return thrd_sleep(timePoint, remaining);
}

int GettimeofdayTime64(struct timeval *tv, void *tz)
{
    return gettimeofday(tv, tz);
}

int NanosleepTime64(const struct timespec *req, struct timespec *rem)
{
    return nanosleep(req, rem);
}

int TimespecGetTime64(struct timespec *ts, int base)
{
    return timespec_get(ts, base);
}

int AdjtimexTime64(struct timex *buf)
{
    return adjtimex(buf);
}

int FutimesTime64(int fd, const struct timeval tv[2])
{
    return futimes(fd, tv);
}

int LutimesTime64(const char *filename, const struct timeval tv[2])
{
    return lutimes(filename, tv);
}

time_t Time64(time_t *tloc)
{
    return time(tloc);
}

time_t TimegmTime64(struct tm *tm)
{
    return timegm(tm);
}

void *DlsymTime64(void *handle, const char *symbol)
{
    return dlsym(handle, symbol);
}

struct tm *Gmtime64(const time_t *timer)
{
    return gmtime(timer);
}

struct tm *Gmtime64R(const time_t *timer, struct tm *result)
{
    return gmtime_r(timer, result);
}

struct tm *Localtime64(const time_t *timer)
{
    return localtime(timer);
}

struct tm *Localtime64R(const time_t *timer, struct tm *result)
{
    return localtime_r(timer, result);
}

time_t Mktime64(struct tm *tm)
{
    return mktime(tm);
}

int TimerGettime64(timer_t timerid, struct itimerspec *currValue)
{
    return timer_gettime(timerid, currValue);
}

int TimerSettime64(timer_t timerid, int flags, const struct itimerspec *newValue, struct itimerspec *oldValue)
{
    return timer_settime(timerid, flags, newValue, oldValue);
}

#ifdef __cplusplus
}
#endif
