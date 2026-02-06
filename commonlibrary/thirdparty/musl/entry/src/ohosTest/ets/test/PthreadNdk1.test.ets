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
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATFORK_0100
     * @tc.name       : testMuslPThreadPThreadAtFork001
     * @tc.desc       : test pthread_atfork
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadAtFork001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAtFork()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_DESTROY_0100
     * @tc.name       : testMuslPThreadPThreadAttrDestroy001
     * @tc.desc       : test pthread_attr_destroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadAttrDestroy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrDestroy()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_GETDETACHSTATE_0100
     * @tc.name       : testMuslPThreadPThreadAttrGetDetachState001
     * @tc.desc       : test pthread_attr_getdetachstate
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadAttrGetDetachState001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrGetDetachState()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_GETGUARDSIZE_0100
     * @tc.name       : testMuslPThreadPThreadAttrGetGuardSize001
     * @tc.desc       : test pthread_attr_getguardsize
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadAttrGetGuardSize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrGetGuardSize()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_GETINHERITSCHED_0100
     * @tc.name       : testMuslPThreadPThreadAttrGetInheritSched001
     * @tc.desc       : test pthread_attr_getinheritsched
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadAttrGetInheritSched001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrGetInheritSched()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_GETSCHEDPARAM_0100
     * @tc.name       : testMuslPThreadPThreadAttrGetSchedParam001
     * @tc.desc       : test pthread_attr_getschedparam
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadAttrGetSchedParam001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrGetSchedParam()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_GETSCHEDPOLICY_0100
     * @tc.name       : testMuslPThreadPThreadAttrGetSchedPolicy001
     * @tc.desc       : test pthread_attr_getschedpolicy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadAttrGetSchedPolicy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrGetSchedPolicy()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_GETSCOPE_0100
     * @tc.name       : testMuslPThreadPThreadAttrGetScope001
     * @tc.desc       : test pthread_attr_getscope
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadAttrGetScope001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrGetScope()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_GETSTACK_0100
     * @tc.name       : testMuslPThreadPThreadAttrGetStack001
     * @tc.desc       : test pthread_attr_getstack
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadAttrGetStack001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrGetStack()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_GETSTACKSIZE_0100
     * @tc.name       : testMuslPThreadPThreadAttrGetStackSize001
     * @tc.desc       : test pthread_attr_getstacksize
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadAttrGetStackSize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrGetStackSize()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_INIT_0100
     * @tc.name       : testMuslPThreadPThreadAttrInit001
     * @tc.desc       : test pthread_attr_init
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadAttrInit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrInit()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_SETDETACHSTATE_0100
     * @tc.name       : testMuslPThreadPThreadAttrSetDetachState001
     * @tc.desc       : test pthread_attr_setdetachstate
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadAttrSetDetachState001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrSetDetachState_One()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_SETDETACHSTATE_0200
     * @tc.name       : testMuslPThreadPThreadAttrSetDetachState002
     * @tc.desc       : test pthread_attr_setdetachstate
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadAttrSetDetachState002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrSetDetachState_Two()).assertEqual(22);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_SETGUARDSIZE_0100
     * @tc.name       : testMuslPThreadPThreadAttrSetGuardSize001
     * @tc.desc       : test pthread_attr_setguardsize
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadAttrSetGuardSize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrSetGuardSize_One()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_SETGUARDSIZE_0200
     * @tc.name       : testMuslPThreadPThreadAttrSetGuardSize002
     * @tc.desc       : test pthread_attr_setguardsize
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadAttrSetGuardSize002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrSetGuardSize_Two()).assertEqual(22);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_SETINHERITSCHED_0100
     * @tc.name       : testMuslPThreadPThreadAttrSetInheritSched001
     * @tc.desc       : test pthread_attr_setinheritsched
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadAttrSetInheritSched001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrSetInheritSched_One()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_SETINHERITSCHED_0200
     * @tc.name       : testMuslPThreadPThreadAttrSetInheritSched002
     * @tc.desc       : test pthread_attr_setinheritsched
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadAttrSetInheritSched002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrSetInheritSched_Two()).assertEqual(22);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_SETSCHEDPARAM_0100
     * @tc.name       : testMuslPThreadPThreadAttrSetSchedParam001
     * @tc.desc       : test pthread_attr_setschedparam
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadAttrSetSchedParam001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrSetSchedParam()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_SETSCHEDPOLICY_0100
     * @tc.name       : testMuslPThreadPThreadAttrSetSchedPolicy001
     * @tc.desc       : test pthread_attr_setschedpolicy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadAttrSetSchedPolicy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrSetSchedPolicy()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_SETSCOPE_0100
     * @tc.name       : testMuslPThreadPThreadAttrSetScope001
     * @tc.desc       : test pthread_attr_setscope
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadAttrSetScope001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrSetScope_One()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_SETSCOPE_0200
     * @tc.name       : testMuslPThreadPThreadAttrSetScope002
     * @tc.desc       : test pthread_attr_setscope
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadAttrSetScope002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrSetScope_Two()).assertEqual(22);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_SETSTACK_0100
     * @tc.name       : testMuslPThreadPThreadAttrSetStack001
     * @tc.desc       : test pthread_attr_setstack
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadAttrSetStack001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrSetStack_One()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_SETSTACK_0200
     * @tc.name       : testMuslPThreadPThreadAttrSetStack002
     * @tc.desc       : test pthread_attr_setstack
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadAttrSetStack002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrSetStack_Two()).assertEqual(22);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_SETSTACK_0300
     * @tc.name       : testMuslPThreadPThreadAttrSetStack003
     * @tc.desc       : test pthread_attr_setstack
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadAttrSetStack003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrSetStack_Three()).assertEqual(22);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_SETSTACKSIZE_0100
     * @tc.name       : testMuslPThreadPThreadAttrSetStackSize001
     * @tc.desc       : test pthread_attr_setstacksize
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadAttrSetStackSize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrSetStackSize_One()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_SETSTACKSIZE_0200
     * @tc.name       : testMuslPThreadPThreadAttrSetStackSize002
     * @tc.desc       : test pthread_attr_setstacksize
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadAttrSetStackSize002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadAttrSetStackSize_Two()).assertEqual(22);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_BARRIER_DESTROY_0100
     * @tc.name       : testMuslPThreadPThreadBarrierDestroy001
     * @tc.desc       : test pthread_barrier_destroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadBarrierDestroy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadBarrierDestroy()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_BARRIER_INIT_0100
     * @tc.name       : testMuslPThreadPThreadBarrierInit001
     * @tc.desc       : test pthread_barrier_init
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadBarrierInit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadBarrierInit()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_BARRIER_WAIT_0100
     * @tc.name       : testMuslPThreadPThreadBarrierWait001
     * @tc.desc       : test pthread_barrier_wait
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadBarrierWait001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadBarrierWait()).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_BARRIERATTR_DESTROY_0100
     * @tc.name       : testMuslPThreadPThreadBarrierAttrDestroy001
     * @tc.desc       : test pthread_barrierattr_destroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadBarrierAttrDestroy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadBarrierAttrDestroy()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_BARRIERATTR_INIT_0100
     * @tc.name       : testMuslPThreadPThreadBarrierAttrInit001
     * @tc.desc       : test pthread_barrierattr_init
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadBarrierAttrInit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadBarrierAttrInit()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_BARRIERATTR_GETPSHARED_0100
     * @tc.name       : testMuslPThreadPThreadBarrierAttrGetPShared001
     * @tc.desc       : test pthread_barrierattr_getpshared
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadBarrierAttrGetPShared001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadBarrierAttrGetPShared()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_BARRIERATTR_SETPSHARED_0100
     * @tc.name       : testMuslPThreadPThreadBarrierAttrSetPShared001
     * @tc.desc       : test pthread_barrierattr_setpshared
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadBarrierAttrSetPShared001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadBarrierAttrSetPShared()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_COND_BROADCAST_0100
     * @tc.name       : testMuslPThreadPThreadCondBroadcast001
     * @tc.desc       : test pthread_cond_broadcast
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadCondBroadcast001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadCondBroadcast()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_COND_DESTROY_0100
     * @tc.name       : testMuslPThreadPThreadCondDestroy001
     * @tc.desc       : test pthread_cond_destroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadCondDestroy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadCondDestroy()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_COND_INIT_0100
     * @tc.name       : testMuslPThreadPThreadCondInit001
     * @tc.desc       : test pthread_cond_init
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadCondInit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadCondInit()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_COND_SIGNAL_0100
     * @tc.name       : testMuslPThreadPThreadCondSignal001
     * @tc.desc       : test pthread_cond_signal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadCondSignal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadCondSignal()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_COND_WAIT_0100
     * @tc.name       : testMuslPThreadPThreadCondWait001
     * @tc.desc       : test pthread_cond_wait
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadCondWait001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadCondWait()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_CONDATTR_DESTROY_0100
     * @tc.name       : testMuslPThreadPThreadCondAttrDestroy001
     * @tc.desc       : test pthread_condattr_destroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadCondAttrDestroy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadCondAttrDestroy()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_CONDATTR_GETCLOCK_0100
     * @tc.name       : testMuslPThreadPThreadCondAttrGetClock001
     * @tc.desc       : test pthread_condattr_getclock
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadCondAttrGetClock001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadCondAttrGetClock()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_CONDATTR_GETPSHARED_0100
     * @tc.name       : testMuslPThreadPThreadCondAttrGetPShared001
     * @tc.desc       : test pthread_condattr_getpshared
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadCondAttrGetPShared001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadCondAttrGetPShared()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_CONDATTR_INIT_0100
     * @tc.name       : testMuslPThreadPThreadCondAttrInit001
     * @tc.desc       : test pthread_condattr_init
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadCondAttrInit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadCondAttrInit()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_CONDATTR_SETCLOCK_0100
     * @tc.name       : testMuslPThreadPThreadCondAttrSetClock001
     * @tc.desc       : test pthread_condattr_setclock
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadCondAttrSetClock001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadCondAttrSetClock()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_CONDATTR_SETPSHARED_0100
     * @tc.name       : testMuslPThreadPThreadCondAttrSetPShared001
     * @tc.desc       : test pthread_condattr_setpshared
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadCondAttrSetPShared001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadCondAttrSetPShared()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_CREATE_0100
     * @tc.name       : testMuslPThreadPThreadCreate001
     * @tc.desc       : test pthread_create
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadCreate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadCreate()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_DETACH_0100
     * @tc.name       : testMuslPThreadPThreadDetach001
     * @tc.desc       : test pthread_detach
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadDetach001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadDetach()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_EQUAL_0100
     * @tc.name       : testMuslPThreadPThreadEqual001
     * @tc.desc       : test pthread_equal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadEqual001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadEqual()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_EXIT_0100
     * @tc.name       : testMuslPThreadPThreadExit001
     * @tc.desc       : test pthread_exit
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadExit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadExit()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_GETATTR_NP_0100
     * @tc.name       : testMuslPThreadPThreadGetAttrNp001
     * @tc.desc       : test pthread_getattr_np
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadGetAttrNp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadGetAttrNp()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_GETCPUCLOCKID_0100
     * @tc.name       : testMuslPThreadPThreadGetCpuClockId001
     * @tc.desc       : test pthread_getcpuclockid
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadGetCpuClockId001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadGetCpuClockId()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_GETSCHEDPARAM_0100
     * @tc.name       : testMuslPThreadPThreadGetSchedParam001
     * @tc.desc       : test pthread_getschedparam
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadGetSchedParam001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadGetSchedParam()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_GETSPECIFIC_0100
     * @tc.name       : testMuslPThreadPThreadGetSpecific001
     * @tc.desc       : test pthread_getspecific
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadGetSpecific001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadGetSpecific()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_JOIN_0100
     * @tc.name       : testMuslPThreadPThreadJoin001
     * @tc.desc       : test pthread_join
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadJoin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadJoin()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_KEY_CREATE_0100
     * @tc.name       : testMuslPThreadPThreadKeyCreate001
     * @tc.desc       : test pthread_key_create
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadKeyCreate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadKeyCreate()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_KEY_DELETE_0100
     * @tc.name       : testMuslPThreadPThreadKeyDelete001
     * @tc.desc       : test pthread_key_delete
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadKeyDelete001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadKeyDelete()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_MUTEX_DESTROY_0100
     * @tc.name       : testMuslPThreadPThreadMutexDestroy001
     * @tc.desc       : test pthread_mutex_destroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadMutexDestroy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadMutexDestroy()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_MUTEX_INIT_0100
     * @tc.name       : testMuslPThreadPThreadMutexInit001
     * @tc.desc       : test pthread_mutex_init
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadMutexInit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadMutexInit()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_MUTEX_LOCK_0100
     * @tc.name       : testMuslPThreadPThreadMutexLock001
     * @tc.desc       : test pthread_mutex_lock
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadMutexLock001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadMutexLock()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_MUTEX_TIMEDLOCK_0100
     * @tc.name       : testMuslPThreadPThreadMutexTimedLock001
     * @tc.desc       : test pthread_mutex_timedlock
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadMutexTimedLock001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadMutexTimedLock()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_MUTEX_TRYLOCK_0100
     * @tc.name       : testMuslPThreadPThreadMutexTryLock001
     * @tc.desc       : test pthread_mutex_trylock
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadMutexTryLock001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadMutexTryLock()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_MUTEX_UNLOCK_0100
     * @tc.name       : testMuslPThreadPThreadMutexUnLock001
     * @tc.desc       : test pthread_mutex_unlock
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadMutexUnLock001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadMutexUnlock()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_MUTEXATTR_DESTROY_0100
     * @tc.name       : testMuslPThreadPThreadMutexAttrDestroy001
     * @tc.desc       : test pthread_mutexattr_destroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadMutexAttrDestroy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadMutexAttrDestroy()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_MUTEXATTR_GETPROTOCOL_0100
     * @tc.name       : testMuslPThreadPThreadMutexAttrGetProtocol001
     * @tc.desc       : test pthread_mutexattr_getprotocol
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadMutexAttrGetProtocol001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadMutexAttrGetProtocol()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_MUTEXATTR_GETPSHARED_0100
     * @tc.name       : testMuslPThreadPThreadMutexAttrGetPShared001
     * @tc.desc       : test pthread_mutexattr_getpshared
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadMutexAttrGetPShared001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadMutexAttrGetPShared()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_MUTEXATTR_GETTYPE_0100
     * @tc.name       : testMuslPThreadPThreadMutexAttrGetType001
     * @tc.desc       : test pthread_mutexattr_gettype
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadMutexAttrGetType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadMutexAttrGetType()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_MUTEXATTR_INIT_0100
     * @tc.name       : testMuslPThreadPThreadMutexAttrInit001
     * @tc.desc       : test pthread_mutexattr_init
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadMutexAttrInit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadMutexAttrInit()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_MUTEXATTR_SETPROTOCOL_0100
     * @tc.name       : testMuslPThreadPThreadMutexAttrSetProtocol001
     * @tc.desc       : test pthread_mutexattr_setprotocol
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadMutexAttrSetProtocol001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadMutexAttrSetProtocol()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_MUTEXATTR_SETPSHARED_0100
     * @tc.name       : testMuslPThreadPThreadMutexAttrSetPShared001
     * @tc.desc       : test pthread_mutexattr_setpshared
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadMutexAttrSetPShared001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadMutexAttrSetPShared()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_MUTEXATTR_SETTYPE_0100
     * @tc.name       : testMuslPThreadPThreadMutexAttrSetType001
     * @tc.desc       : test pthread_mutexattr_settype
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadMutexAttrSetType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadMutexAttrSetType()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ONCE_0100
     * @tc.name       : testMuslPThreadPThreadOnce001
     * @tc.desc       : test pthread_once
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadOnce001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadOnce()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_RWLOCK_DESTROY_0100
     * @tc.name       : testMuslPThreadPThreadRwLockDestroy001
     * @tc.desc       : test pthread_rwlock_destroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadRwLockDestroy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadRwLockDestroy()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_RWLOCK_INIT_0100
     * @tc.name       : testMuslPThreadPThreadRwLockInit001
     * @tc.desc       : test pthread_rwlock_init
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadRwLockInit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadRwLockInit()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_RWLOCK_RDLOCK_0100
     * @tc.name       : testMuslPThreadPThreadRwLockRdLock001
     * @tc.desc       : test pthread_rwlock_rdlock
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadRwLockRdLock001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadRwLockRdLock()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_RWLOCK_TIMEDRDLOCK_0100
     * @tc.name       : testMuslPThreadPThreadRwLockTimedRdLock001
     * @tc.desc       : test pthread_rwlock_timedrdlock
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadRwLockTimedRdLock001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadRwLockTimedRdLock()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_RWLOCK_TIMEDWRLOCK_0100
     * @tc.name       : testMuslPThreadPThreadRwLockTimedWrLock001
     * @tc.desc       : test pthread_rwlock_timedwrlock
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadRwLockTimedWrLock001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadRwLockTimedWrLock()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_RWLOCK_TRYRDLOCK_0100
     * @tc.name       : testMuslPThreadPThreadRwLockTryRdLock001
     * @tc.desc       : test pthread_rwlock_tryrdlock
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadRwLockTryRdLock001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadRwLockTryRdLock()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_RWLOCK_TRYWRLOCK_0100
     * @tc.name       : testMuslPThreadPThreadRwLockTryWrLock001
     * @tc.desc       : test pthread_rwlock_trywrlock
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadRwLockTryWrLock001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadRwLockTryWrLock()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_RWLOCK_UNLOCK_0100
     * @tc.name       : testMuslPThreadPThreadRwLockUnLock001
     * @tc.desc       : test pthread_rwlock_unlock
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadRwLockUnLock001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadRwLockUnLock()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_RWLOCK_WRLOCK_0100
     * @tc.name       : testMuslPThreadPThreadRwLockWrLock001
     * @tc.desc       : test pthread_rwlock_wrlock
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadRwLockWrLock001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadRwLockWrLock()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_RWLOCKATTR_DESTROY_0100
     * @tc.name       : testMuslPThreadPThreadRwLockAttrDestroy001
     * @tc.desc       : test pthread_rwlockattr_destroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadRwLockAttrDestroy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadRwLockAttrDestroy()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_RWLOCKATTR_GETPSHARED_0100
     * @tc.name       : testMuslPThreadPThreadRwLockAttrGetPShared001
     * @tc.desc       : test pthread_rwlockattr_getpshared
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadRwLockAttrGetPShared001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadRwLockAttrGetPShared()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_RWLOCKATTR_INIT_0100
     * @tc.name       : testMuslPThreadPThreadRwLockAttrInit001
     * @tc.desc       : test pthread_rwlockattr_init
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadRwLockAttrInit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadRwLockAttrInit()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_RWLOCKATTR_SETPSHARED_0100
     * @tc.name       : testMuslPThreadPThreadRwLockAttrSetPShared001
     * @tc.desc       : test pthread_rwlockattr_setpshared
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadRwLockAttrSetPShared001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadRwLockAttrSetPShared()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_SELF_0100
     * @tc.name       : testMuslPThreadPThreadSelf001
     * @tc.desc       : test pthread_self
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadSelf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadSelf()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_SETNAME_NP_0100
     * @tc.name       : testMuslPThreadPThreadSetNameNp001
     * @tc.desc       : test pthread_setname_np
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadSetNameNp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadSetNameNp()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_SETSCHEDPARAM_0100
     * @tc.name       : testMuslPThreadPThreadSetSchedParam001
     * @tc.desc       : test pthread_setschedparam
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadSetSchedParam001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadSetSchedParam()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_SETSPECIFIC_0100
     * @tc.name       : testMuslPThreadPThreadSetSpecific001
     * @tc.desc       : test pthread_setspecific
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadSetSpecific001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadSetSpecific()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_SPIN_INIT_0100
     * @tc.name       : testMuslPThreadPThreadSpinInit001
     * @tc.desc       : test pthread_spin_init
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadSpinInit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadSpinInit()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_SPIN_DESTROY_0100
     * @tc.name       : testMuslPThreadPThreadSpinDestroy001
     * @tc.desc       : test pthread_spin_destroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadSpinDestroy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadSpinDestroy()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_SPIN_LOCK_0100
     * @tc.name       : testMuslPThreadPThreadSpinLock001
     * @tc.desc       : test pthread_spin_lock
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadSpinLock001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadSpinLock()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_SPIN_TRY_LOCK_0100
     * @tc.name       : testMuslPThreadPThreadSpinTryLock001
     * @tc.desc       : test pthread_spin_trylock
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadSpinTryLock001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadSpinTryLock()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_SPIN_UNLOCK_0100
     * @tc.name       : testMuslPThreadPThreadSpinUnLock001
     * @tc.desc       : test pthread_spin_unlock
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadSpinUnLock001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pthread.pThreadSpinUnLock()).assertEqual(0);
      done()
    });
  })
}
