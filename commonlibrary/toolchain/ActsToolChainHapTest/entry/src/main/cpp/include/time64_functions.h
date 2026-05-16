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

#ifndef TIME64_FUNCTIONS_H
#define TIME64_FUNCTIONS_H

#include <pthread.h>
#include <sys/resource.h>
#include <sys/sem.h>
#include <sys/socket.h>
#include <sys/time.h>
#include <sys/timerfd.h>
#include <threads.h>
#include <time.h>

#ifdef __cplusplus
extern "C" {
#endif

int RecvmmsgTime64(int, struct mmsghdr *, unsigned int, unsigned int, struct timespec *);
int GetitimerTime64(int, struct itimerval *);
int SetitimerTime64(int, const struct itimerval *, struct itimerval *);
int CndTimedwaitTime64(cnd_t *, mtx_t *, const struct timespec *);
int ClockGetresTime64(clockid_t, struct timespec *);
int ClockSettime64(clockid_t, const struct timespec *);
double Difftime64(time_t, time_t);
int SemtimedopTime64(int, struct sembuf *, size_t, const struct timespec *);
int SettimeofdayTime64(const struct timeval *, const struct timezone *);
int TimerfdGettime64(int, struct itimerspec *);
int TimerfdSettime64(int, int, const struct itimerspec *, struct itimerspec *);
int UtimesTime64(const char *, const struct timeval *);
pid_t Wait4Time64(pid_t, int *, int, struct rusage *);
int GetrusageTime64(int, struct rusage *);
int SchedRrGetIntervalTime64(pid_t, struct timespec *);
int SelectTime64(int, fd_set *, fd_set *, fd_set *, struct timeval *);
int FutimesatTime64(int, const char *, const struct timeval *);
int UtimensatTime64(int, const char *, const struct timespec *, int);
int MtxTimedlockTime64(mtx_t *, const struct timespec *);
int PthreadMutexTimedlockTime64(pthread_mutex_t *, const struct timespec *);
int PthreadRwlockTimedrdlockTime64(pthread_rwlock_t *, const struct timespec *);
int PthreadRwlockTimedwrlockTime64(pthread_rwlock_t *, const struct timespec *);
int ThrdSleepTime64(const struct timespec *, struct timespec *);
int GettimeofdayTime64(struct timeval *, void *);
int NanosleepTime64(const struct timespec *, struct timespec *);
int TimespecGetTime64(struct timespec *, int);
int AdjtimexTime64(struct timex *);
int FutimesTime64(int, const struct timeval *);
int LutimesTime64(const char *, const struct timeval *);
time_t Time64(time_t *);
time_t TimegmTime64(struct tm *);
void *DlsymTime64(void *, const char *);
struct tm *Gmtime64(const time_t *);
struct tm *Gmtime64R(const time_t *, struct tm *);
struct tm *Localtime64(const time_t *);
struct tm *Localtime64R(const time_t *, struct tm *);
time_t Mktime64(struct tm *);
int TimerGettime64(timer_t, struct itimerspec *);
int TimerSettime64(timer_t, int, const struct itimerspec *, struct itimerspec *);

#ifdef __cplusplus
}
#endif

#endif
