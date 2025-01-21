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

import { describe, expect, it } from '@ohos/hypium'
import pthread from 'libpthreadndk.so'

export default function muslPThreadNdkTest() {
  describe('MuslPThreadTest', () => {
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATFORK_0100
     * @tc.name       : testMuslPThreadPThreadAtFork001
     * @tc.desc       : test pthread_atfork
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadAtFork001', 0, async (done: Function) => {
      let result:number = pthread.pThreadAtFork(0);
      console.info("pthread.pThreadAtFork result = " + result);
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_DESTROY_0100
     * @tc.name       : testMuslPThreadPThreadAttrDestroy001
     * @tc.desc       : test pthread_attr_destroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslPThreadPThreadAttrDestroy001', 0, async (done: Function) => {
      let result:number = pthread.pThreadAttrDestory(0);
      console.info("pthread.pThreadAttrDestory result = " + result);
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_GETDETACHSTATE_0100
     * @tc.name       : testMuslPThreadPThreadAttrGetDetachState001
     * @tc.desc       : test pthread_attr_getdetachstate
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslPThreadPThreadAttrGetDetachState001', 0, async (done: Function) => {
      let result:number = pthread.pThreadAttrGetDetachState(0);
      console.info("pthread.pThreadAttrGetDetachState result = " + result);
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_GETGUARDSIZE_0100
     * @tc.name       : testMuslPThreadPThreadAttrGetGuardSize001
     * @tc.desc       : test pthread_attr_getguardsize
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslPThreadPThreadAttrGetGuardSize001', 0, async (done: Function) => {
      let result:number = pthread.pThreadAttrGetGuardSize(0);
      console.info("pthread.pThreadAttrGetDetachState result = " + result);
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_GETINHERITSCHED_0100
     * @tc.name       : testMuslPThreadPThreadAttrGetInheritSched001
     * @tc.desc       : test pthread_attr_getinheritsched
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslPThreadPThreadAttrGetInheritSched001', 0, async (done: Function) => {
      let result:number = pthread.pThreadAttrGetInheritSched(0);
      console.info("pthread.pThreadAttrGetInheritSched result = " + result);
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_GETSCHEDPARAM_0100
     * @tc.name       : testMuslPThreadPThreadAttrGetSchedParam001
     * @tc.desc       : test pthread_attr_getschedparam
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslPThreadPThreadAttrGetSchedParam001', 0, async (done: Function) => {
      let result:number = pthread.pThreadAttrGetSchedParam(0);
      console.info("pthread.pThreadAttrGetSchedParam result = " + result);
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_GETSCHEDPOLICY_0100
     * @tc.name       : testMuslPThreadPThreadAttrGetSchedPolicy001
     * @tc.desc       : test pthread_attr_getschedpolicy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslPThreadPThreadAttrGetSchedPolicy001', 0, async (done: Function) => {
      let result:number = pthread.pThreadAttrGetSchedPolicy(0);
      console.info("pthread.pThreadAttrGetSchedPolicy result = " + result);
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_GETSCOPE_0100
     * @tc.name       : testMuslPThreadPThreadAttrGetScope001
     * @tc.desc       : test pthread_attr_getscope
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslPThreadPThreadAttrGetScope001', 0, async (done: Function) => {
      let result:number = pthread.pThreadAttrGetScope(0);
      console.info("pthread.pThreadAttrGetScope result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadAttrGetStack001', 0, async (done: Function) => {
      let result:number = pthread.pThreadAttrGetStack(0);
      console.info("pthread.pThreadAttrGetStack result = " + result);
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_ATTR_GETSTACKSIZE_0100
     * @tc.name       : testMuslPThreadPThreadAttrGetStackSize001
     * @tc.desc       : test pthread_attr_getstacksize
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslPThreadPThreadAttrGetStackSize001', 0, async (done: Function) => {
      let result:number = pthread.pThreadAttrGetStackSize(0);
      console.info("pthread.pThreadAttrGetStackSize result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadAttrInit001', 0, async (done: Function) => {
      let result:number = pthread.pThreadAttrInit(0);
      console.info("pthread.PThreadPThreadAttrInit result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadAttrSetDetachState001', 0, async (done: Function) => {
      let result:number = pthread.pThreadAttrSetDetachState(0);
      console.info("pthread.pThreadAttrSetDetachState result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadAttrSetGuardSize001', 0, async (done: Function) => {
      let result:number = pthread.pThreadAttrSetGuardSize(0);
      console.info("pthread.pThreadAttrSetGuardSize result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadAttrSetInheritSched001', 0, async (done: Function) => {
      let result:number = pthread.pThreadAttrSetInheritSched(0);
      console.info("pthread.pThreadAttrSetInheritSched result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadAttrSetSchedParam001', 0, async (done: Function) => {
      let result:number = pthread.pThreadAttrSetSchedParam(0);
      console.info("pthread.pThreadAttrSetSchedParam result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadAttrSetSchedPolicy001', 0, async (done: Function) => {
      let result:number = pthread.pThreadAttrSetSchedPolicy(0);
      console.info("pthread.pThreadAttrSetSchedPolicy result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadAttrSetScope001', 0, async (done: Function) => {
      let result:number = pthread.pThreadAttrSetScope(0);
      console.info("pthread.pThreadAttrSetScope result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadAttrSetStack001', 0, async (done: Function) => {
      let result:number = pthread.pThreadAttrSetStack(0);
      console.info("pthread.pThreadAttrSetStack result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadAttrSetStackSize001', 0, async (done: Function) => {
      let result:number = pthread.pThreadAttrSetStackSize(0);
      console.info("pthread.pThreadAttrSetStackSize result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadBarrierInit001', 0, async (done: Function) => {
      let result:number = pthread.pThreadBarrierInit(0);
      console.info("pthread.pThreadBarrierInit result = " + result);
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_BARRIER_DESTROY_0100
     * @tc.name       : testMuslPThreadPThreadBarrierDestroy001
     * @tc.desc       : test pthread_barrier_destroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslPThreadPThreadBarrierDestroy001', 0, async (done: Function) => {
      let result:number = pthread.pThreadBarrierDestroy(0);
      console.info("pthread.pThreadBarrierDestroy result = " + result);
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_BARRIER_WAIT_0100
     * @tc.name       : testMuslPThreadPThreadBarrierWait001
     * @tc.desc       : test pthread_barrier_wait
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslPThreadPThreadBarrierWait001', 0, async (done: Function) => {
      let result:number = pthread.pThreadBarrierWait(0);
      console.info("pthread.pThreadBarrierWait result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadBarrierAttrInit001', 0, async (done: Function) => {
      let result:number = pthread.pThreadBarrierAttrInit(0);
      console.info("pthread.pThreadBarrierAttrInit result = " + result);
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_BARRIERATTR_GETPSHARED_0100
     * @tc.name       : testMuslPThreadPThreadBarrierAttrGetPShared001
     * @tc.desc       : test pthread_barrierattr_getpshared.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslPThreadPThreadBarrierAttrGetPShared001', 0, async (done: Function) => {
      let result:number = pthread.pThreadBarrierAttrGetPShared(0);
      console.info("pthread.pThreadBarrierAttrGetPShared result = " + result);
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_BARRIERATTR_DESTROY_0100
     * @tc.name       : testMuslPThreadPThreadBarrierAttrDestroy001
     * @tc.desc       : test pthread_barrierattr_destroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslPThreadPThreadBarrierAttrDestroy001', 0, async (done: Function) => {
      let result:number = pthread.pThreadBarrierAttrDestroy(0);
      console.info("pthread.pThreadBarrierAttrDestroy result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadBarrierAttrSetPShared001', 0, async (done: Function) => {
      let result:number = pthread.pThreadBarrierAttrSetPShared(0);
      console.info("pthread.pThreadBarrierAttrSetPShared result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadCondInit001', 0, async (done: Function) => {
      let result:number = pthread.pThreadCondInit(0);
      console.info("pthread.pThreadCondInit result = " + result);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_COND_DESTROY_0100
     * @tc.name       : testMuslPThreadPThreadCondDestroy001
     * @tc.desc       : test pthread_cond_destroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslPThreadPThreadCondDestroy001', 0, async (done: Function) => {
      let result:number = pthread.pThreadCondDestroy(0);
      console.info("pthread.pThreadCondDestroy result = " + result);
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_COND_TIMEDWAIT_0100
     * @tc.name       : testMuslPThreadPThreadCondTimedWait001
     * @tc.desc       : test pthread_cond_timedwait
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslPThreadPThreadCondTimedWait001', 0, async (done: Function) => {
      let result:number = pthread.pThreadCondTimedWait(0);
      console.info("pthread.pThreadCondTimedWait result = " + result);
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_COND_WAIT_0100
     * @tc.name       : testMuslPThreadPThreadCondWait001
     * @tc.desc       : test pthread_cond_timedwait
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslPThreadPThreadCondWait001', 0, async (done: Function) => {
      let result:number = pthread.pThreadCondWait(0);
      console.info("pthread.pThreadCondWait result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadCondBroadcast001', 0, async (done: Function) => {
      let result:number = pthread.pThreadCondBroadcast(0);
      console.info("pthread.pThreadCondBroadcast result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadCondSignal001', 0, async (done: Function) => {
      let result:number = pthread.pThreadCondSignal(0);
      console.info("pthread.pThreadCondSignal result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadCondAttrInit001', 0, async (done: Function) => {
      let result:number = pthread.pThreadCondAttrInit(0);
      console.info("pthread.pThreadCondAttrInit result = " + result);
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_CONDATTR_DESTROY_0100
     * @tc.name       : testMuslPThreadPThreadCondAttrDestroy001
     * @tc.desc       : test pthread_condattr_destroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslPThreadPThreadCondAttrDestroy001', 0, async (done: Function) => {
      let result:number = pthread.pThreadCondAttrDestroy(0);
      console.info("pthread.pThreadCondAttrDestroy result = " + result);
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_CONDATTR_GETCLOCK_0100
     * @tc.name       : testMuslPThreadPThreadCondAttrGetClock001
     * @tc.desc       : test pthread_condattr_getclock
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslPThreadPThreadCondAttrGetClock001', 0, async (done: Function) => {
      let result:number = pthread.pThreadCondAttrGetClock(0);
      console.info("pthread.pThreadCondAttrGetClock result = " + result);
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_CONDATTR_GETPSHARED_0100
     * @tc.name       : testMuslPThreadPThreadCondAttrGetPShared001
     * @tc.desc       : test pthread_condattr_getpshared
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslPThreadPThreadCondAttrGetPShared001', 0, async (done: Function) => {
      let result:number = pthread.pThreadCondAttrGetPShared(0);
      console.info("pthread.pThreadCondAttrGetPShared result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadCondAttrSetClock001', 0, async (done: Function) => {
      let result:number = pthread.pThreadCondAttrSetClock(0);
      console.info("pthread.pThreadCondAttrSetClock result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadCondAttrSetPShared001', 0, async (done: Function) => {
      let result:number = pthread.pThreadCondAttrSetPShared(0);
      console.info("pthread.pThreadCondAttrSetPShared result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadCreate001', 0, async (done: Function) => {
      let result:number = pthread.pThreadCreate(0);
      console.info("pthread.pThreadCreate result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadDetach001', 0, async (done: Function) => {
      let result:number = pthread.pThreadDetach(0);
      console.info("pthread.pThreadDetach result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadEqual001', 0, async (done: Function) => {
      let result:number = pthread.pThreadEqual(0);
      console.info("pthread.pThreadEqual result = " + result);
      expect(result).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_EQUAL_0200
     * @tc.name       : testMuslPThreadPThreadEqual002
     * @tc.desc       : test pthread_equal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadEqual002', 0, async (done: Function) => {
      let result:number = pthread.pThreadEqual2(0);
      console.info("pthread.pThreadEqual2 result = " + result);
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_EXIT_0100
     * @tc.name       : testMuslPThreadPThreadExit001
     * @tc.desc       : test pthread_exit
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslPThreadPThreadExit001', 0, async (done: Function) => {
      let result:number = pthread.pThreadExit(0);
      console.info("pthread.pThreadExit result = " + result);
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_GETATTR_NP_0100
     * @tc.name       : testMuslPThreadPThreadGetAttrNp001
     * @tc.desc       : test pthread_getattr_np
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslPThreadPThreadGetAttrNp001', 0, async (done: Function) => {
      let result:number = pthread.pThreadGetAttrNp(0);
      console.info("pthread.pThreadGetAttrNp result = " + result);
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_GETCPUCLOCKID_0100
     * @tc.name       : testMuslPThreadPThreadGetCpuClockId001
     * @tc.desc       : test pthread_getcpuclockid
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslPThreadPThreadGetCpuClockId001', 0, async (done: Function) => {
      let result:number = pthread.pThreadGetCpuClockId(0);
      console.info("pthread.pThreadGetCpuClockId result = " + result);
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_GETSCHEDPARAM_0100
     * @tc.name       : testMuslPThreadPThreadGetSchedParam001
     * @tc.desc       : test pthread_getschedparam
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslPThreadPThreadGetSchedParam001', 0, async (done: Function) => {
      let result:number = pthread.pThreadGetSchedParam(0);
      console.info("pthread.pThreadGetSchedParam result = " + result);
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_GETSPECIFIC_0100
     * @tc.name       : testMuslPThreadPThreadGetSpecific001
     * @tc.desc       : test pthread_getspecific
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslPThreadPThreadGetSpecific001', 0, async (done: Function) => {
      let result:number = pthread.pThreadGetSpecific(0);
      console.info("pthread.pThreadGetSpecific result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadJoin001', 0, async (done: Function) => {
      let result:number = pthread.pThreadJoin(0);
      console.info("pthread.pThreadJoin result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadKeyCreate001', 0, async (done: Function) => {
      let result:number = pthread.pThreadKeyCreate(0);
      console.info("pthread.pThreadKeyCreate result = " + result);
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_KEY_DELETE_0100
     * @tc.name       : testMuslPThreadPThreadKeyDelete001
     * @tc.desc       : test pthread_key_delete
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslPThreadPThreadKeyDelete001', 0, async (done: Function) => {
      let result:number = pthread.pThreadKeyDelete(0);
      console.info("pthread.pThreadKeyDelete result = " + result);
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_KILL_0100
     * @tc.name       : testMuslPThreadPThreadKill001
     * @tc.desc       : test pthread_kill
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadKill001', 0, async (done: Function) => {
      let result:number = pthread.pThreadKill(0);
      console.info("pthread.pThreadKill result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadMutexInit001', 0, async (done: Function) => {
      let result:number = pthread.pThreadMutexInit(0);
      console.info("pthread.pThreadMutexInit result = " + result);
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_MUTEX_DESTROY_0100
     * @tc.name       : testMuslPThreadPThreadMutexDestroy001
     * @tc.desc       : test pthread_mutex_destroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslPThreadPThreadMutexDestroy001', 0, async (done: Function) => {
      let result:number = pthread.pThreadMutexDestroy(0);
      console.info("pthread.pThreadMutexDestroy result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadMutexLock001', 0, async (done: Function) => {
      let result:number = pthread.pThreadMutexLock(0);
      console.info("pthread.pThreadMutexLock result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadMutexTimedLock001', 0, async (done: Function) => {
      let result:number = pthread.pThreadMutexTimedLock(0);
      console.info("pthread.pThreadMutexTimedLock result = " + result);
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_MUTEX_TRYLOCK_0100
     * @tc.name       : testMuslPThreadPThreadTryLock001
     * @tc.desc       : test pthread_mutex_trylock
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslPThreadPThreadTryLock001', 0, async (done: Function) => {
      let result:number = pthread.pThreadMutexTryLock(0);
      console.info("pthread.pThreadMutexTryLock result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadMutexUnLock001', 0, async (done: Function) => {
      let result:number = pthread.pThreadMutexUnLock(0);
      console.info("pthread.pThreadMutexUnLock result = " + result);
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_MUTEXATTR_DESTROY_0100
     * @tc.name       : testMuslPThreadPThreadMutexAttrDestroy001
     * @tc.desc       : test pthread_mutexattr_destroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslPThreadPThreadMutexAttrDestroy001', 0, async (done: Function) => {
      let result:number = pthread.pThreadMutexAttrDestroy(0);
      console.info("pthread.pThreadMutexAttrDestroy result = " + result);
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_MUTEXATTR_GETPROTOCOL_0100
     * @tc.name       : testMuslPThreadPThreadMutexAttrGetProtocol001
     * @tc.desc       : test pthread_mutexattr_getprotocol
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslPThreadPThreadMutexAttrGetProtocol001', 0, async (done: Function) => {
      let result:number = pthread.pThreadMutexAttrGetProtocol(0);
      console.info("pthread.pThreadMutexAttrGetProtocol result = " + result);
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_MUTEXATTR_GETPSHARED_0100
     * @tc.name       : testMuslPThreadPThreadMutexAttrGetPShared001
     * @tc.desc       : test pthread_mutexattr_getpshared
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslPThreadPThreadMutexAttrGetPShared001', 0, async (done: Function) => {
      let result:number = pthread.pThreadMutexAttrGetPShared(0);
      console.info("pthread.pThreadMutexAttrGetPshared result = " + result);
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_MUTEXATTR_GETTYPE_0100
     * @tc.name       : testMuslPThreadPThreadMutexAttrGetType001
     * @tc.desc       : test pthread_mutexattr_gettype
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslPThreadPThreadMutexAttrGetType001', 0, async (done: Function) => {
      let result:number = pthread.pThreadMutexAttrGetType(0);
      console.info("pthread.pThreadMutexAttrGetType result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadMutexAttrInit001', 0, async (done: Function) => {
      let result:number = pthread.pThreadMutexAttrInit(0);
      console.info("pthread.pThreadMutexAttrInit result = " + result);
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_MUTEXATTR_SETPROTOCOL_0100
     * @tc.name       : testMuslPThreadPThreadMutexSetProtocol001
     * @tc.desc       : test pthread_mutexattr_setprotocol
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadMutexSetProtocol001', 0, async (done: Function) => {
      let result:number = pthread.pThreadMutexAttrSetProtocol(0);
      console.info("pthread.pThreadMutexAttrSetProtocol result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadMutexAttrSetPShared001', 0, async (done: Function) => {
      let result:number = pthread.pThreadMutexAttrSetPShared(0);
      console.info("pthread.pThreadMutexAttrSetPShared result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadMutexAttrSetType001', 0, async (done: Function) => {
      let result:number = pthread.pThreadMutexAttrSetType(0);
      console.info("pthread.pThreadMutexAttrSetType result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadOnce001', 0, async (done: Function) => {
      let result:number = pthread.pThreadOnce(0);
      console.info("pthread.pThreadOnce result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadRwLockInit001', 0, async (done: Function) => {
      let result:number = pthread.pThreadRwLockInit(0);
      console.info("pthread.pThreadRwLockInit result = " + result);
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_RWLOCK_DESTROY_0100
     * @tc.name       : testMuslPThreadPThreadRwLockDestroy001
     * @tc.desc       : test pthread_rwlock_destroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslPThreadPThreadRwLockDestroy001', 0, async (done: Function) => {
      let result:number = pthread.pThreadRwLockDestroy(0);
      console.info("pthread.pThreadRwLockDestroy result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadRwLockRdLock001', 0, async (done: Function) => {
      let result:number = pthread.pThreadRwLockRdLock(0);
      console.info("pthread.pThreadRwLockRdLock result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadRwLockTimedRdLock001', 0, async (done: Function) => {
      let result:number = pthread.pThreadRwLockTimedRdLock(0);
      console.info("pthread.pThreadRwLockTimedRdLock result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadRwLockTimedWrLock001', 0, async (done: Function) => {
      let result:number = pthread.pThreadRwLockTimedWrLock(0);
      console.info("pthread.pThreadRwLockTimedWrLock result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadRwLockTryRdLock001', 0, async (done: Function) => {
      let result:number = pthread.pThreadRwLockTryRdLock(0);
      console.info("pthread.pThreadRwLockTryRdLock result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadRwLockTryWrLock001', 0, async (done: Function) => {
      let result:number = pthread.pThreadRwLockTryWrLock(0);
      console.info("pthread.pThreadRwLockTryWrLock result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadRwLockUnLock001', 0, async (done: Function) => {
      let result:number = pthread.pThreadRwLockUnLock(0);
      console.info("pthread.pThreadRwLockUnLock result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadRwLockWrLock001', 0, async (done: Function) => {
      let result:number = pthread.pThreadRwLockWrLock(0);
      console.info("pthread.pThreadRwLockWrLock result = " + result);
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_RWLOCKATTR_DESTROY_0100
     * @tc.name       : testMuslPThreadPThreadRwLockAttrDestroy001
     * @tc.desc       : test pthread_rwlockattr_destroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslPThreadPThreadRwLockAttrDestroy001', 0, async (done: Function) => {
      let result:number = pthread.pThreadRwLockAttrDestroy(0);
      console.info("pthread.pThreadRwLockAttrDestroy result = " + result);
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_RWLOCKATTR_GETPSHARED_0100
     * @tc.name       : testMuslPThreadPThreadRwLockAttrGetPShared001
     * @tc.desc       : test pthread_rwlockattr_getpshared
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslPThreadPThreadRwLockAttrGetPShared001', 0, async (done: Function) => {
      let result:number = pthread.pThreadRwLockAttrGetPShared(0);
      console.info("pthread.pThreadRwLockAttrGetPShared result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadRwLockAttrInit001', 0, async (done: Function) => {
      let result:number = pthread.pThreadRwLockAttrInit(0);
      console.info("pthread.pThreadRwLockAttrInit result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadRwLockAttrSetPShared001', 0, async (done: Function) => {
      let result:number = pthread.pThreadRwLockAttrSetPShared(0);
      console.info("pthread.pThreadRwLockAttrSetPShared result = " + result);
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_SELF_0100
     * @tc.name       : testMuslPThreadPThreadSelf001
     * @tc.desc       : test pthread_self
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslPThreadPThreadSelf001', 0, async (done: Function) => {
      let result:number = pthread.pThreadSelf(0);
      console.info("pthread.pThreadSelf result = " + result);
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_SETNAME_NP_0100
     * @tc.name       : testMuslPThreadPThreadSetNameNp001
     * @tc.desc       : test pthread_setname_np
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslPThreadPThreadSetNameNp001', 0, async (done: Function) => {
      let result:number = pthread.pThreadSetNameNp(0);
      console.info("pthread.pThreadSetNameNp result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadSetSchedParam001', 0, async (done: Function) => {
      let result:number = pthread.pThreadSetSchedParam(0);
      console.info("pthread.pThreadSetSchedParam result = " + result);
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_SETSCHEDPRIO_0100
     * @tc.name       : testMuslPThreadPThreadSetSchedPrio001
     * @tc.desc       : test pthread_setschedprio
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPThreadPThreadSetSchedPrio001', 0, async (done: Function) => {
      let result:number = pthread.pThreadSetSchedPrio(0);
      console.info("pthread.pThreadSetSchedPrio result = " + result);
      expect(result).assertEqual(0);
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
    it('testMuslPThreadPThreadSetSpecific001', 0, async (done: Function) => {
      let result:number = pthread.pThreadSetSpecific(0);
      console.info("pthread.pThreadSetSpecific result = " + result);
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_SIG_MASK_0100
     * @tc.name       : testMuslPThreadPThreadSigMask001
     * @tc.desc       : test pthread_sigmask
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslPThreadPThreadSigMask001', 0, async (done: Function) => {
      let result:number = pthread.pThreadSigmask();
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_SPIN_INIT_0100
     * @tc.name       : testMuslPThreadPThreadSpinInit001
     * @tc.desc       : test pthread_spin_init
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslPThreadPThreadSpinInit001', 0, async (done: Function) => {
      let result:number = pthread.pThreadSpinInit();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_SPIN_DESTROY_0100
     * @tc.name       : testMuslPThreadPThreadSpinDestroy001
     * @tc.desc       : test pthread_spin_destroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslPThreadPThreadSpinDestroy001', 0, async (done: Function) => {
      let result:number = pthread.pThreadSpinDestroy();
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_SPIN_LOCK_0100
     * @tc.name       : testMuslPThreadPThreadSpinLock001
     * @tc.desc       : test pthread_spin_lock
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslPThreadPThreadSpinLock001', 0, async (done: Function) => {
      let result:number = pthread.pThreadSpinLock();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_SPIN_TRY_LOCK_0100
     * @tc.name       : testMuslPThreadPThreadSpinTryLock001
     * @tc.desc       : test pthread_spin_trylock
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslPThreadPThreadSpinTryLock001', 0, async (done: Function) => {
      let result:number = pthread.pThreadSpinTrylock();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_SPIN_UNLOCK_0100
     * @tc.name       : testMuslPThreadPThreadSpinUnLock001
     * @tc.desc       : test pthread_spin_unlock
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslPThreadPThreadSpinUnLock001', 0, async (done: Function) => {
      let result:number = pthread.pThreadSpinUnlock();
      expect(result).assertEqual(0);
      done()
    });
  })
}