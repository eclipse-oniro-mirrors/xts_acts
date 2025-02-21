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
import threads from 'libthreadsndk1.so'

export default function threadsNdk1Test() {
  describe('MuslthreadsNdk1Test', () => {

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_CALL_ONCE_0100
     * @tc.name       : testMuslThreadsCallOnce001
     * @tc.desc       : test call_once
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslThreadsCallOnce001', 0, async (done: Function) => {
      expect(threads.callOnce()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_CND_BROADCAST_0100
     * @tc.name       : testMuslThreadsCndBroadcast001
     * @tc.desc       : test cnd_broadcast
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslThreadsCndBroadcast001', 0, async (done: Function) => {
      expect(threads.cnd_broadcast()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_CND_DESTROY_0100
     * @tc.name       : testMuslThreadsCndDestroy001
     * @tc.desc       : test cnd_destroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslThreadsCndDestroy001', 0, async (done: Function) => {
      expect(threads.cnd_destroy()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_CND_INIT_0100
     * @tc.name       : testMuslThreadsCndInit001
     * @tc.desc       : test cnd_init
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslThreadsCndInit001', 0, async (done: Function) => {
      expect(threads.cnd_init()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_CND_SIGNAL_0100
     * @tc.name       : testMuslThreadsCndSignal001
     * @tc.desc       : test cnd_signal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslThreadsCndSignal001', 0, async (done: Function) => {
      expect(threads.cnd_signal_One()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_CND_SIGNAL_0200
     * @tc.name       : testMuslThreadsCndSignal002
     * @tc.desc       : test cnd_signal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslThreadsCndSignal002', 0, async (done: Function) => {
      expect(threads.cnd_signal_Two()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_MTXDESTORY_0100
     * @tc.name       : testMuslThreadsMtxDestroy001
     * @tc.desc       : test mtx_destroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslThreadsMtxDestroy001', 0, async (done: Function) => {
      expect(threads.mtxDestroy()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_MTXINIT_0100
     * @tc.name       : testMuslThreadsMtxInit001
     * @tc.desc       : test mtx_init
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslThreadsMtxInit001', 0, async (done: Function) => {
      expect(threads.mtxInit_One()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_MTXINIT_0200
     * @tc.name       : testMuslThreadsMtxInit002
     * @tc.desc       : test mtx_init
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslThreadsMtxInit002', 0, async (done: Function) => {
      expect(threads.mtxInit_Two()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_MTXINIT_0300
     * @tc.name       : testMuslThreadsMtxInit003
     * @tc.desc       : test mtx_init
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslThreadsMtxInit003', 0, async (done: Function) => {
      expect(threads.mtxInit_Three()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_MTXINIT_0400
     * @tc.name       : testMuslThreadsMtxInit004
     * @tc.desc       : test mtx_init
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslThreadsMtxInit004', 0, async (done: Function) => {
      expect(threads.mtxInit_Four()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_MTXLOCK_0100
     * @tc.name       : testMuslThreadsMtxLock001
     * @tc.desc       : test mtx_lock
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslThreadsMtxLock001', 0, async (done: Function) => {
      expect(threads.mtxLock_One()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_MTXLOCK_0200
     * @tc.name       : testMuslThreadsMtxLock002
     * @tc.desc       : test mtx_lock
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslThreadsMtxLock002', 0, async (done: Function) => {
      expect(threads.mtxLock_Two()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_MTXLOCK_0300
     * @tc.name       : testMuslThreadsMtxLock003
     * @tc.desc       : test mtx_lock
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslThreadsMtxLock003', 0, async (done: Function) => {
      expect(threads.mtxLock_Three()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_MTXLOCK_0400
     * @tc.name       : testMuslThreadsMtxLock004
     * @tc.desc       : test mtx_lock
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslThreadsMtxLock004', 0, async (done: Function) => {
      expect(threads.mtxLock_Four()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_MTXTIMEDLOCK_0100
     * @tc.name       : testMuslThreadsMtxTimedLock001
     * @tc.desc       : test mtx_timedlock
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslThreadsMtxTimedLock001', 0, async (done: Function) => {
      expect(threads.mtxTimedLock_One()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_MTXTIMEDLOCK_0200
     * @tc.name       : testMuslThreadsMtxTimedLock002
     * @tc.desc       : test mtx_timedlock
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslThreadsMtxTimedLock002', 0, async (done: Function) => {
      expect(threads.mtxTimedLock_Two()).assertEqual(4);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_MTXTRYLOCK_0100
     * @tc.name       : testMuslThreadsMtxTryLock001
     * @tc.desc       : test mtx_trylock
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslThreadsMtxTryLock001', 0, async (done: Function) => {
      expect(threads.mtxTryLock_One()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_MTXTRYLOCK_0200
     * @tc.name       : testMuslThreadsMtxTryLock002
     * @tc.desc       : test mtx_trylock
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslThreadsMtxTryLock002', 0, async (done: Function) => {
      expect(threads.mtxTryLock_Two()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_MTXUNLOCK_0100
     * @tc.name       : testMuslThreadsMtxUnLock001
     * @tc.desc       : test mtx_unlock
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslThreadsMtxUnLock001', 0, async (done: Function) => {
      expect(threads.mtxUnlock_One()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_MTXUNLOCK_0200
     * @tc.name       : testMuslThreadsMtxUnLock002
     * @tc.desc       : test mtx_unlock
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslThreadsMtxUnLock002', 0, async (done: Function) => {
      expect(threads.mtxUnlock_Two()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_THRD_CREATE_0100
     * @tc.name       : testMuslThreadsThrdCreate001
     * @tc.desc       : test thrd_create
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslThreadsThrdCreate001', 0, async (done: Function) => {
      expect(threads.thrd_create()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_THRD_CURRENT_0100
     * @tc.name       : testMuslThreadsThrdCurrent001
     * @tc.desc       : test thrd_current
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslThreadsThrdCurrent001', 0, async (done: Function) => {
      expect(threads.thrd_current()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_THRD_DETACH_0100
     * @tc.name       : testMuslThreadsThrdDetach001
     * @tc.desc       : test thrd_detach
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslThreadsThrdDetach001', 0, async (done: Function) => {
      expect(threads.thrd_detach_One()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_THRD_DETACH_0200
     * @tc.name       : testMuslThreadsThrdDetach002
     * @tc.desc       : test thrd_detach
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslThreadsThrdDetach002', 0, async (done: Function) => {
      expect(threads.thrd_detach_Two()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_THRD_EQUAL_0100
     * @tc.name       : testMuslThreadsThrdEqual001
     * @tc.desc       : test thrd_equal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslThreadsThrdEqual001', 0, async (done: Function) => {
      expect(threads.thrd_equal_One()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_THRD_EQUAL_0200
     * @tc.name       : testMuslThreadsThrdEqual002
     * @tc.desc       : test thrd_equal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslThreadsThrdEqual002', 0, async (done: Function) => {
      expect(threads.thrd_equal_Two()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_THRD_EXIT_0100
     * @tc.name       : testMuslThreadsThrdExit001
     * @tc.desc       : test thrd_exit
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslThreadsThrdExit001', 0, async (done: Function) => {
      expect(threads.thrd_exit()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_THRD_JOIN_0100
     * @tc.name       : testMuslThreadsThrdJoin001
     * @tc.desc       : test thrd_join
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslThreadsThrdJoin001', 0, async (done: Function) => {
      expect(threads.thrd_join_One()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_THRD_JOIN_0200
     * @tc.name       : testMuslThreadsThrdJoin002
     * @tc.desc       : test thrd_join
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslThreadsThrdJoin002', 0, async (done: Function) => {
      expect(threads.thrd_join_Two()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_THRD_SLEEP_0100
     * @tc.name       : testMuslThreadsThrdSleep001
     * @tc.desc       : test thrd_sleep
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslThreadsThrdSleep001', 0, async (done: Function) => {
      expect(threads.thrd_sleep()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_THRD_YIELD_0100
     * @tc.name       : testMuslThreadsThrdYield001
     * @tc.desc       : test thrd_yield
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslThreadsThrdYield001', 0, async (done: Function) => {
      expect(threads.thrd_yield()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_TSS_CREATE_0100
     * @tc.name       : testMuslThreadsTssCreate001
     * @tc.desc       : test tss_create
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslThreadsTssCreate001', 0, async (done: Function) => {
      expect(threads.tss_create()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_TSS_DELETE_0100
     * @tc.name       : testMuslThreadsTssDelete001
     * @tc.desc       : test tss_delete
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslThreadsTssDelete001', 0, async (done: Function) => {
      expect(threads.tss_delete()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_TSS_GET_0100
     * @tc.name       : testMuslThreadsTssGet001
     * @tc.desc       : test tss_get
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslThreadsTssGet001', 0, async (done: Function) => {
      expect(threads.tss_get()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_TSS_SET_0100
     * @tc.name       : testMuslThreadsTssSet001
     * @tc.desc       : test tss_set
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslThreadsTssSet001', 0, async (done: Function) => {
      expect(threads.tss_set()).assertEqual(0);
      done()
    });

  })
}
