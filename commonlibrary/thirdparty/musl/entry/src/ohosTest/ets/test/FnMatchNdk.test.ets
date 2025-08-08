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

import { beforeEach, describe, expect, it , TestType, Size, Level } from "@ohos/hypium"
import Utils from './Utils'
import fnmatchndk from 'libfnmatchndk.so'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import fs from '@ohos.file.fs'

export default function fnmatchNdkTest() {
  describe('FnMatchNdkTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UTIME_UTIME64_0100
     * @tc.name       : testMuslUTimeUTime64001
     * @tc.desc       : test __utime64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUTimeUTime64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;

      let file = fs.openSync(filesDir + '/utime3.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);

      let result: number = fnmatchndk.__utime64(filesDir + '/utime3.txt');
      console.info("Test result= " + result);
      expect(result).assertEqual(1);
      fs.closeSync(file);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FNMATCH_FNMATCH_0100
     * @tc.name       : testMuslFnMatchFnMatch001
     * @tc.desc       : test fnmatch
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslFnMatchFnMatch001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.fnmatch()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_CLOCK_GETTIME64_0100
     * @tc.name       : testMuslTimeClockGettime64001
     * @tc.desc       : test __clock_gettime64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeClockGettime64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__clock_gettime64()).assertEqual(0);
      done()
    });


    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_NANOSLEEP_TIME64_0100
     * @tc.name       : testMuslTimeNanosleepTime64001
     * @tc.desc       : test __nanosleep_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeNanosleepTime64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__nanosleep_time64()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STAT_FSTAT_TIME64_0100
     * @tc.name       : testMuslStatFstatTime64001
     * @tc.desc       : test __fstat_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStatFstatTime64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__fstat_time64()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STAT_LSTAT_TIME64_0100
     * @tc.name       : testMuslStatLstatTime64001
     * @tc.desc       : test __lstat_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStatLstatTime64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__lstat_time64()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STAT_STAT_TIME64_0100
     * @tc.name       : testMuslStatStatTime64001
     * @tc.desc       : test __stat_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStatStatTime64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__stat_time64()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_CLOCK_GETRES_TIME64_0100
     * @tc.name       : testMuslTimeClockGetresTime64001
     * @tc.desc       : test __clock_getres_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeClockGetresTime64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__clock_getres_time64()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_CLOCKNANOSLEEP_TIME64_0100
     * @tc.name       : testMuslTimeClockNanoSleepTime64001
     * @tc.desc       : test __clock_nanosleep_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeClockNanoSleepTime64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__clock_nanosleep_time64()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_CTIME64_0100
     * @tc.name       : testMuslTimeCTime64001
     * @tc.desc       : test __ctime64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeCTime64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__ctime64()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_CTIME64_R_0100
     * @tc.name       : testMuslTimeCTime64R001
     * @tc.desc       : test __ctime64_r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeCTime64R001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__ctime64_r()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_DIFFTIME64_0100
     * @tc.name       : testMuslTimeDiffTime64001
     * @tc.desc       : test __difftime64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeDiffTime64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__difftime64()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_DLFCN_DLSYM_TIME64_0100
     * @tc.name       : testMuslDlfcnDlSymTime64001
     * @tc.desc       : test __dlsym_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslDlfcnDlSymTime64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__dlsym_time64()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STAT_FUTIMENS_TIME64_0100
     * @tc.name       : testMuslStatFutimensTime64001
     * @tc.desc       : test __futimens_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStatFutimensTime64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__futimens_time64()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_FUTIMES_TIME64_0100
     * @tc.name       : testMuslTimeFutimesTime64001
     * @tc.desc       : test __futimes_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeFutimesTime64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__futimes_time64()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_FUTIMESAT_TIME64_0100
     * @tc.name       : testMuslTimeFutimesatTime64001
     * @tc.desc       : test __futimesat_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeFutimesatTime64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__futimesat_time64()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_GMTIME64_0100
     * @tc.name       : testMuslTimeGmtime64001
     * @tc.desc       : test __gmtime64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeGmtime64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__gmtime64()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_GMTIME64_R_0100
     * @tc.name       : testMuslTimeGmTime64R001
     * @tc.desc       : test __gmtime64_r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeGmTime64R001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__gmtime64_r()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LOCALTIME64_0100
     * @tc.name       : testMusLocaleLocalTime64001
     * @tc.desc       : test __localtime64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMusLocaleLocalTime64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__localtime64()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_LOCALTIME64_R_0100
     * @tc.name       : testMusLocaleLocalTime64R001
     * @tc.desc       : test __localtime64_r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMusLocaleLocalTime64R001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__localtime64_r()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_LUTIMES_TIME64_0100
     * @tc.name       : testMuslTimeLutimesTime64001
     * @tc.desc       : test __lutimes_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeLutimesTime64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__lutimes_time64()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_MKTIME64_0100
     * @tc.name       : testMuslTimeMkTime64001
     * @tc.desc       : test __mktime64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeMkTime64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__mktime64()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_MTX_TIMEDLOCK_TIME64_0100
     * @tc.name       : testMuslThreadsMtxTimedLockTime64001
     * @tc.desc       : test __mtx_timedlock_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslThreadsMtxTimedLockTime64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__mtx_timedlock_time64()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_POLL_PPOLL_TIME64_0100
     * @tc.name       : testMuslPollPPollTime64001
     * @tc.desc       : test __ppoll_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslPollPPollTime64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__ppoll_time64()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_MUTEX_TIMEDLOCK_TIME64_0100
     * @tc.name       : testMuslPthreadPthreadMutexTimedLockTime64001
     * @tc.desc       : test __pthread_mutex_timedlock_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslPthreadPthreadMutexTimedLockTime64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__pthread_mutex_timedlock_time64()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_RWLOCK_TIMEDRDLOCK_TIME64_0100
     * @tc.name       : testMuslPthreadPthreadRwlockTimedrdLockTime64001
     * @tc.desc       : test __pthread_rwlock_timedrdlock_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslPthreadPthreadRwlockTimedrdLockTime64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__pthread_rwlock_timedrdlock_time64()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_RWLOCK_TIMEDWRLOCK_TIME64_0100
     * @tc.name       : testMuslPthreadPthreadRwlockTimedwrlockTime64001
     * @tc.desc       : test __pthread_rwlock_timedwrlock_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslPthreadPthreadRwlockTimedwrlockTime64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__pthread_rwlock_timedwrlock_time64()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SOCKET_RECVMMSG_TIME64_0100
     * @tc.name       : testMuslSocketReCvmMsgTime64001
     * @tc.desc       : test __recvmmsg_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSocketReCvmMsgTime64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__recvmmsg_time64()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SCHED_SCHEDRRGETINTERVAL_TIME64_0100
     * @tc.name       : testMuslSchedSchedRrGetIntervalTime64001
     * @tc.desc       : test __sched_rr_get_interval_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSchedSchedRrGetIntervalTime64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__sched_rr_get_interval_time64()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_DIRENT_SELECT_TIME64_0100
     * @tc.name       : testMuslDirentSelectTime64001
     * @tc.desc       : test __select_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslDirentSelectTime64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__select_time64()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_THRD_SLEEP_TIME64_0100
     * @tc.name       : testMuslThreadsThrdSleepTime64001
     * @tc.desc       : test __thrd_sleep_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslThreadsThrdSleepTime64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__thrd_sleep_time64()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_TIME64_0100
     * @tc.name       : testMuslTimeTime64001
     * @tc.desc       : test __time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeTime64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__time64()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_TIMEGM_TIME64_0100
     * @tc.name       : testMuslTimeTimeGmTime64001
     * @tc.desc       : test __timegm_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeTimeGmTime64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__timegm_time64()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIMERFD_TIMERFD_GETTIME64_0100
     * @tc.name       : testMuslTimerfdTimerFdGetTime64001
     * @tc.desc       : test __timerfd_gettime64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimerfdTimerFdGetTime64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__timerfd_gettime64()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIMERFD_TIMERFD_SETTIME64_0100
     * @tc.name       : testMuslTimerfdTimerFdSetTime64001
     * @tc.desc       : test __timerfd_settime64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimerfdTimerFdSetTime64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__timerfd_settime64()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_TIMESPECGET_TIME64_0100
     * @tc.name       : testMuslTimeTimeSpecGetTime64001
     * @tc.desc       : test __timespec_get_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeTimeSpecGetTime64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__timespec_get_time64()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_UTIMES_TIME64_0100
     * @tc.name       : testMuslTimeUTimesTime64001
     * @tc.desc       : test __utimes_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeUTimesTime64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__utimes_time64()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STAT_UTIMENSAT_TIME64_0100
     * @tc.name       : testMuslStatUTimeNSatTime64001
     * @tc.desc       : test __utimensat_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStatUTimeNSatTime64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;

      let file = fs.openSync(filesDir + '/utimensattime64.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);

      let result: number = fnmatchndk.__utimensat_time64(filesDir + '/utimensattime64.txt');
      fs.closeSync(file);
      expect(result).assertEqual(1);
      done();
    });
  })
}
