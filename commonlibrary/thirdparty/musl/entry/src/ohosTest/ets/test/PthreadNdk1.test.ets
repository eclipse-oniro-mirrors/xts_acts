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
import pthread from 'libpthreadndk1.so'

export default function muslPThreadNdk1Test() {
  describe('MuslPThread1Test', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.name   testMuslPThreadPThreadAtFork001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATFORK_0100
     * @tc.desc   test pthread_atfork
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadAtFork001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAtFork()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadAttrDestroy001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_DESTROY_0100
     * @tc.desc   test pthread_attr_destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadAttrDestroy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrDestroy()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadAttrGetDetachState001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_GETDETACHSTATE_0100
     * @tc.desc   test pthread_attr_getdetachstate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadAttrGetDetachState001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrGetDetachState()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadAttrGetGuardSize001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_GETGUARDSIZE_0100
     * @tc.desc   test pthread_attr_getguardsize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadAttrGetGuardSize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrGetGuardSize()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadAttrGetInheritSched001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_GETINHERITSCHED_0100
     * @tc.desc   test pthread_attr_getinheritsched
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadAttrGetInheritSched001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrGetInheritSched()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadAttrGetSchedParam001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_GETSCHEDPARAM_0100
     * @tc.desc   test pthread_attr_getschedparam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadAttrGetSchedParam001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrGetSchedParam()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadAttrGetSchedPolicy001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_GETSCHEDPOLICY_0100
     * @tc.desc   test pthread_attr_getschedpolicy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadAttrGetSchedPolicy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrGetSchedPolicy()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadAttrGetScope001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_GETSCOPE_0100
     * @tc.desc   test pthread_attr_getscope
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadAttrGetScope001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrGetScope()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadAttrGetStack001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_GETSTACK_0100
     * @tc.desc   test pthread_attr_getstack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadAttrGetStack001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrGetStack()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadAttrGetStackSize001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_GETSTACKSIZE_0100
     * @tc.desc   test pthread_attr_getstacksize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadAttrGetStackSize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrGetStackSize()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadAttrInit001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_INIT_0100
     * @tc.desc   test pthread_attr_init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadAttrInit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrInit()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadAttrSetDetachState001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_SETDETACHSTATE_0100
     * @tc.desc   test pthread_attr_setdetachstate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadAttrSetDetachState001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrSetDetachState_One()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadAttrSetDetachState002
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_SETDETACHSTATE_0200
     * @tc.desc   test pthread_attr_setdetachstate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadAttrSetDetachState002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrSetDetachState_Two()).assertEqual(22);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadAttrSetGuardSize001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_SETGUARDSIZE_0100
     * @tc.desc   test pthread_attr_setguardsize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadAttrSetGuardSize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrSetGuardSize_One()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadAttrSetGuardSize002
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_SETGUARDSIZE_0200
     * @tc.desc   test pthread_attr_setguardsize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadAttrSetGuardSize002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrSetGuardSize_Two()).assertEqual(22);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadAttrSetInheritSched001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_SETINHERITSCHED_0100
     * @tc.desc   test pthread_attr_setinheritsched
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadAttrSetInheritSched001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrSetInheritSched_One()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadAttrSetInheritSched002
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_SETINHERITSCHED_0200
     * @tc.desc   test pthread_attr_setinheritsched
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadAttrSetInheritSched002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrSetInheritSched_Two()).assertEqual(22);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadAttrSetSchedParam001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_SETSCHEDPARAM_0100
     * @tc.desc   test pthread_attr_setschedparam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadAttrSetSchedParam001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrSetSchedParam()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadAttrSetSchedPolicy001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_SETSCHEDPOLICY_0100
     * @tc.desc   test pthread_attr_setschedpolicy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadAttrSetSchedPolicy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrSetSchedPolicy()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadAttrSetScope001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_SETSCOPE_0100
     * @tc.desc   test pthread_attr_setscope
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadAttrSetScope001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrSetScope_One()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadAttrSetScope002
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_SETSCOPE_0200
     * @tc.desc   test pthread_attr_setscope
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadAttrSetScope002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrSetScope_Two()).assertEqual(22);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadAttrSetStack001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_SETSTACK_0100
     * @tc.desc   test pthread_attr_setstack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadAttrSetStack001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrSetStack_One()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadAttrSetStack002
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_SETSTACK_0200
     * @tc.desc   test pthread_attr_setstack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadAttrSetStack002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrSetStack_Two()).assertEqual(22);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadAttrSetStack003
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_SETSTACK_0300
     * @tc.desc   test pthread_attr_setstack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadAttrSetStack003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrSetStack_Three()).assertEqual(22);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadAttrSetStackSize001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_SETSTACKSIZE_0100
     * @tc.desc   test pthread_attr_setstacksize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadAttrSetStackSize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrSetStackSize_One()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadAttrSetStackSize002
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_SETSTACKSIZE_0200
     * @tc.desc   test pthread_attr_setstacksize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadAttrSetStackSize002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrSetStackSize_Two()).assertEqual(22);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadBarrierDestroy001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_BARRIER_DESTROY_0100
     * @tc.desc   test pthread_barrier_destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadBarrierDestroy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadBarrierDestroy()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadBarrierInit001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_BARRIER_INIT_0100
     * @tc.desc   test pthread_barrier_init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadBarrierInit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadBarrierInit()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadBarrierWait001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_BARRIER_WAIT_0100
     * @tc.desc   test pthread_barrier_wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadBarrierWait001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadBarrierWait()).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadBarrierAttrDestroy001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_BARRIERATTR_DESTROY_0100
     * @tc.desc   test pthread_barrierattr_destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadBarrierAttrDestroy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadBarrierAttrDestroy()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadBarrierAttrInit001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_BARRIERATTR_INIT_0100
     * @tc.desc   test pthread_barrierattr_init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadBarrierAttrInit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadBarrierAttrInit()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadBarrierAttrGetPShared001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_BARRIERATTR_GETPSHARED_0100
     * @tc.desc   test pthread_barrierattr_getpshared
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadBarrierAttrGetPShared001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadBarrierAttrGetPShared()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadBarrierAttrSetPShared001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_BARRIERATTR_SETPSHARED_0100
     * @tc.desc   test pthread_barrierattr_setpshared
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadBarrierAttrSetPShared001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadBarrierAttrSetPShared()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadCondBroadcast001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_COND_BROADCAST_0100
     * @tc.desc   test pthread_cond_broadcast
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadCondBroadcast001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadCondBroadcast()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadCondDestroy001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_COND_DESTROY_0100
     * @tc.desc   test pthread_cond_destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadCondDestroy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadCondDestroy()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadCondInit001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_COND_INIT_0100
     * @tc.desc   test pthread_cond_init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadCondInit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadCondInit()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadCondSignal001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_COND_SIGNAL_0100
     * @tc.desc   test pthread_cond_signal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadCondSignal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadCondSignal()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadCondWait001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_COND_WAIT_0100
     * @tc.desc   test pthread_cond_wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadCondWait001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadCondWait()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadCondAttrDestroy001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_CONDATTR_DESTROY_0100
     * @tc.desc   test pthread_condattr_destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadCondAttrDestroy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadCondAttrDestroy()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadCondAttrGetClock001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_CONDATTR_GETCLOCK_0100
     * @tc.desc   test pthread_condattr_getclock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadCondAttrGetClock001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadCondAttrGetClock()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadCondAttrGetPShared001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_CONDATTR_GETPSHARED_0100
     * @tc.desc   test pthread_condattr_getpshared
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadCondAttrGetPShared001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadCondAttrGetPShared()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadCondAttrInit001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_CONDATTR_INIT_0100
     * @tc.desc   test pthread_condattr_init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadCondAttrInit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadCondAttrInit()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadCondAttrSetClock001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_CONDATTR_SETCLOCK_0100
     * @tc.desc   test pthread_condattr_setclock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadCondAttrSetClock001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadCondAttrSetClock()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadCondAttrSetPShared001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_CONDATTR_SETPSHARED_0100
     * @tc.desc   test pthread_condattr_setpshared
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadCondAttrSetPShared001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadCondAttrSetPShared()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadCreate001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_CREATE_0100
     * @tc.desc   test pthread_create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadCreate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadCreate()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadDetach001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_DETACH_0100
     * @tc.desc   test pthread_detach
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadDetach001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadDetach()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadEqual001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_EQUAL_0100
     * @tc.desc   test pthread_equal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadEqual001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadEqual()).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadExit001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_EXIT_0100
     * @tc.desc   test pthread_exit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadExit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadExit()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadGetAttrNp001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_GETATTR_NP_0100
     * @tc.desc   test pthread_getattr_np
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadGetAttrNp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadGetAttrNp()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadGetCpuClockId001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_GETCPUCLOCKID_0100
     * @tc.desc   test pthread_getcpuclockid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadGetCpuClockId001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadGetCpuClockId()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadGetSchedParam001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_GETSCHEDPARAM_0100
     * @tc.desc   test pthread_getschedparam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadGetSchedParam001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadGetSchedParam()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadGetSpecific001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_GETSPECIFIC_0100
     * @tc.desc   test pthread_getspecific
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadGetSpecific001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadGetSpecific()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadJoin001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_JOIN_0100
     * @tc.desc   test pthread_join
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadJoin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadJoin()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadKeyCreate001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_KEY_CREATE_0100
     * @tc.desc   test pthread_key_create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadKeyCreate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadKeyCreate()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadKeyDelete001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_KEY_DELETE_0100
     * @tc.desc   test pthread_key_delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadKeyDelete001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadKeyDelete()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadMutexDestroy001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_MUTEX_DESTROY_0100
     * @tc.desc   test pthread_mutex_destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadMutexDestroy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadMutexDestroy()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadMutexInit001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_MUTEX_INIT_0100
     * @tc.desc   test pthread_mutex_init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadMutexInit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadMutexInit()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadMutexLock001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_MUTEX_LOCK_0100
     * @tc.desc   test pthread_mutex_lock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadMutexLock001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadMutexLock()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadMutexTimedLock001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_MUTEX_TIMEDLOCK_0100
     * @tc.desc   test pthread_mutex_timedlock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadMutexTimedLock001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadMutexTimedLock()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadMutexTryLock001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_MUTEX_TRYLOCK_0100
     * @tc.desc   test pthread_mutex_trylock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadMutexTryLock001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadMutexTryLock()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadMutexUnLock001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_MUTEX_UNLOCK_0100
     * @tc.desc   test pthread_mutex_unlock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadMutexUnLock001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadMutexUnlock()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadMutexAttrDestroy001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_MUTEXATTR_DESTROY_0100
     * @tc.desc   test pthread_mutexattr_destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadMutexAttrDestroy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadMutexAttrDestroy()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadMutexAttrGetProtocol001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_MUTEXATTR_GETPROTOCOL_0100
     * @tc.desc   test pthread_mutexattr_getprotocol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadMutexAttrGetProtocol001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadMutexAttrGetProtocol()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadMutexAttrGetPShared001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_MUTEXATTR_GETPSHARED_0100
     * @tc.desc   test pthread_mutexattr_getpshared
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadMutexAttrGetPShared001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadMutexAttrGetPShared()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadMutexAttrGetType001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_MUTEXATTR_GETTYPE_0100
     * @tc.desc   test pthread_mutexattr_gettype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadMutexAttrGetType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadMutexAttrGetType()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadMutexAttrInit001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_MUTEXATTR_INIT_0100
     * @tc.desc   test pthread_mutexattr_init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadMutexAttrInit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadMutexAttrInit()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadMutexAttrSetProtocol001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_MUTEXATTR_SETPROTOCOL_0100
     * @tc.desc   test pthread_mutexattr_setprotocol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadMutexAttrSetProtocol001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadMutexAttrSetProtocol()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadMutexAttrSetPShared001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_MUTEXATTR_SETPSHARED_0100
     * @tc.desc   test pthread_mutexattr_setpshared
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadMutexAttrSetPShared001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadMutexAttrSetPShared()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadMutexAttrSetType001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_MUTEXATTR_SETTYPE_0100
     * @tc.desc   test pthread_mutexattr_settype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadMutexAttrSetType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadMutexAttrSetType()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadOnce001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ONCE_0100
     * @tc.desc   test pthread_once
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadOnce001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadOnce()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadRwLockDestroy001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_RWLOCK_DESTROY_0100
     * @tc.desc   test pthread_rwlock_destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadRwLockDestroy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadRwLockDestroy()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadRwLockInit001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_RWLOCK_INIT_0100
     * @tc.desc   test pthread_rwlock_init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadRwLockInit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadRwLockInit()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadRwLockRdLock001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_RWLOCK_RDLOCK_0100
     * @tc.desc   test pthread_rwlock_rdlock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadRwLockRdLock001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadRwLockRdLock()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadRwLockTimedRdLock001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_RWLOCK_TIMEDRDLOCK_0100
     * @tc.desc   test pthread_rwlock_timedrdlock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadRwLockTimedRdLock001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadRwLockTimedRdLock()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadRwLockTimedWrLock001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_RWLOCK_TIMEDWRLOCK_0100
     * @tc.desc   test pthread_rwlock_timedwrlock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadRwLockTimedWrLock001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadRwLockTimedWrLock()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadRwLockTryRdLock001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_RWLOCK_TRYRDLOCK_0100
     * @tc.desc   test pthread_rwlock_tryrdlock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadRwLockTryRdLock001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadRwLockTryRdLock()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadRwLockTryWrLock001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_RWLOCK_TRYWRLOCK_0100
     * @tc.desc   test pthread_rwlock_trywrlock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadRwLockTryWrLock001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadRwLockTryWrLock()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadRwLockUnLock001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_RWLOCK_UNLOCK_0100
     * @tc.desc   test pthread_rwlock_unlock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadRwLockUnLock001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadRwLockUnLock()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadRwLockWrLock001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_RWLOCK_WRLOCK_0100
     * @tc.desc   test pthread_rwlock_wrlock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadRwLockWrLock001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadRwLockWrLock()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadRwLockAttrDestroy001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_RWLOCKATTR_DESTROY_0100
     * @tc.desc   test pthread_rwlockattr_destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadRwLockAttrDestroy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadRwLockAttrDestroy()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadRwLockAttrGetPShared001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_RWLOCKATTR_GETPSHARED_0100
     * @tc.desc   test pthread_rwlockattr_getpshared
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadRwLockAttrGetPShared001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadRwLockAttrGetPShared()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadRwLockAttrInit001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_RWLOCKATTR_INIT_0100
     * @tc.desc   test pthread_rwlockattr_init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadRwLockAttrInit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadRwLockAttrInit()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadRwLockAttrSetPShared001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_RWLOCKATTR_SETPSHARED_0100
     * @tc.desc   test pthread_rwlockattr_setpshared
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadRwLockAttrSetPShared001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadRwLockAttrSetPShared()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadSelf001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_SELF_0100
     * @tc.desc   test pthread_self
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadSelf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadSelf()).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadSetNameNp001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_SETNAME_NP_0100
     * @tc.desc   test pthread_setname_np
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadSetNameNp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadSetNameNp()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadSetSchedParam001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_SETSCHEDPARAM_0100
     * @tc.desc   test pthread_setschedparam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadSetSchedParam001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadSetSchedParam()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadSetSpecific001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_SETSPECIFIC_0100
     * @tc.desc   test pthread_setspecific
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadSetSpecific001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadSetSpecific()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadSpinInit001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_SPIN_INIT_0100
     * @tc.desc   test pthread_spin_init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadSpinInit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadSpinInit()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadSpinDestroy001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_SPIN_DESTROY_0100
     * @tc.desc   test pthread_spin_destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadSpinDestroy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadSpinDestroy()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadSpinLock001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_SPIN_LOCK_0100
     * @tc.desc   test pthread_spin_lock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadSpinLock001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadSpinLock()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadSpinTryLock001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_SPIN_TRY_LOCK_0100
     * @tc.desc   test pthread_spin_trylock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadSpinTryLock001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadSpinTryLock()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPThreadPThreadSpinUnLock001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_SPIN_UNLOCK_0100
     * @tc.desc   test pthread_spin_unlock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPThreadPThreadSpinUnLock001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadSpinUnLock()).assertEqual(0);
      done()
    });
  })
}
