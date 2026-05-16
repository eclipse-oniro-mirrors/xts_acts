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

import * as testNapi from "libentry.so";
import { describe, expect, it, Level } from "@ohos/hypium";

export default function thread_group_test() {
  describe("ActsToolChainHapTest_src_functionalext_supplement_thread", () => {
    /**
     * @tc.name   cnd_init
     * @tc.number SUB_THIRDPARTY_MUSL_CND_INIT_0100
     * @tc.desc   libc-test cnd_init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("cnd_init", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("cnd_init");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   cnd_signal
     * @tc.number SUB_THIRDPARTY_MUSL_CND_SIGNAL_0100
     * @tc.desc   libc-test cnd_signal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("cnd_signal", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("cnd_signal");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   mtx_init
     * @tc.number SUB_THIRDPARTY_MUSL_MTX_INIT_0100
     * @tc.desc   libc-test mtx_init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("mtx_init", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("mtx_init");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   mtx_lock
     * @tc.number SUB_THIRDPARTY_MUSL_MTX_LOCK_0100
     * @tc.desc   libc-test mtx_lock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("mtx_lock", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("mtx_lock");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_atfork
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATFORK_0100
     * @tc.desc   libc-test pthread_atfork
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_atfork", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_atfork");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_attr_destroy
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_DESTROY_0100
     * @tc.desc   libc-test pthread_attr_destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_attr_destroy", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_attr_destroy");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_attr_get
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_GET_0100
     * @tc.desc   libc-test pthread_attr_get
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_attr_get", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_attr_get");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_attr_getstack_test
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_GETSTACK_TEST_0100
     * @tc.desc   libc-test pthread_attr_getstack_test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_attr_getstack_test", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_attr_getstack_test");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_attr_init
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_INIT_0100
     * @tc.desc   libc-test pthread_attr_init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_attr_init", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_attr_init");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_attr_setguardsize
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_SETGUARDSIZE_0100
     * @tc.desc   libc-test pthread_attr_setguardsize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_attr_setguardsize", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_attr_setguardsize");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_attr_setinheritsched
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_SETINHERITSCHED_0100
     * @tc.desc   libc-test pthread_attr_setinheritsched
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_attr_setinheritsched", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_attr_setinheritsched");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_attr_setschedparam
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_SETSCHEDPARAM_0100
     * @tc.desc   libc-test pthread_attr_setschedparam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_attr_setschedparam", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_attr_setschedparam");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_attr_setschedpolicy
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_SETSCHEDPOLICY_0100
     * @tc.desc   libc-test pthread_attr_setschedpolicy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_attr_setschedpolicy", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_attr_setschedpolicy");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_attr_setscope
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_SETSCOPE_0100
     * @tc.desc   libc-test pthread_attr_setscope
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_attr_setscope", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_attr_setscope");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_attr_setstack
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_SETSTACK_0100
     * @tc.desc   libc-test pthread_attr_setstack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_attr_setstack", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_attr_setstack");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_attr_setstacksize_test
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_SETSTACKSIZE_TEST_0100
     * @tc.desc   libc-test pthread_attr_setstacksize_test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "pthread_attr_setstacksize_test",
      Level.LEVEL1,
      async (done: Function) => {
        const result = await testNapi.runTest("pthread_attr_setstacksize_test");
        expect(result).assertEqual(0);
        done();
      },
    );
    /**
     * @tc.name   pthread_barrier_destroy
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_BARRIER_DESTROY_0100
     * @tc.desc   libc-test pthread_barrier_destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_barrier_destroy", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_barrier_destroy");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_barrier_init
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_BARRIER_INIT_0100
     * @tc.desc   libc-test pthread_barrier_init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_barrier_init", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_barrier_init");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_barrierattr_init
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_BARRIERATTR_INIT_0100
     * @tc.desc   libc-test pthread_barrierattr_init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_barrierattr_init", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_barrierattr_init");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_barrierattr_setpshared
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_BARRIERATTR_SETPSHARED_0100
     * @tc.desc   libc-test pthread_barrierattr_setpshared
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "pthread_barrierattr_setpshared",
      Level.LEVEL1,
      async (done: Function) => {
        const result = await testNapi.runTest("pthread_barrierattr_setpshared");
        expect(result).assertEqual(0);
        done();
      },
    );
    /**
     * @tc.name   pthread_cond_broadcast
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_COND_BROADCAST_0100
     * @tc.desc   libc-test pthread_cond_broadcast
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_cond_broadcast", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_cond_broadcast");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_cond_destroy
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_COND_DESTROY_0100
     * @tc.desc   libc-test pthread_cond_destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_cond_destroy", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_cond_destroy");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_cond_signal
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_COND_SIGNAL_0100
     * @tc.desc   libc-test pthread_cond_signal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_cond_signal", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_cond_signal");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_cond_wait
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_COND_WAIT_0100
     * @tc.desc   libc-test pthread_cond_wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_cond_wait", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_cond_wait");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_condattr_destroy_test
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_CONDATTR_DESTROY_TEST_0100
     * @tc.desc   libc-test pthread_condattr_destroy_test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "pthread_condattr_destroy_test",
      Level.LEVEL1,
      async (done: Function) => {
        const result = await testNapi.runTest("pthread_condattr_destroy_test");
        expect(result).assertEqual(0);
        done();
      },
    );
    /**
     * @tc.name   pthread_condattr_init_test
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_CONDATTR_INIT_TEST_0100
     * @tc.desc   libc-test pthread_condattr_init_test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_condattr_init_test", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_condattr_init_test");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_condattr_setclock_sup
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_CONDATTR_SETCLOCK_SUP_0100
     * @tc.desc   libc-test pthread_condattr_setclock_sup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "pthread_condattr_setclock_sup",
      Level.LEVEL1,
      async (done: Function) => {
        const result = await testNapi.runTest("pthread_condattr_setclock_sup");
        expect(result).assertEqual(0);
        done();
      },
    );
    /**
     * @tc.name   pthread_condattr_setpshared
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_CONDATTR_SETPSHARED_0100
     * @tc.desc   libc-test pthread_condattr_setpshared
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_condattr_setpshared", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_condattr_setpshared");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_getcpuclockid
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_GETCPUCLOCKID_0100
     * @tc.desc   libc-test pthread_getcpuclockid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_getcpuclockid", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_getcpuclockid");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_key_delete
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_KEY_DELETE_0100
     * @tc.desc   libc-test pthread_key_delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_key_delete", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_key_delete");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_mutex_destroy
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_MUTEX_DESTROY_0100
     * @tc.desc   libc-test pthread_mutex_destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_mutex_destroy", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_mutex_destroy");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_mutex_init_test
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_MUTEX_INIT_TEST_0100
     * @tc.desc   libc-test pthread_mutex_init_test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_mutex_init_test", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_mutex_init_test");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_mutex_trylock
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_MUTEX_TRYLOCK_0100
     * @tc.desc   libc-test pthread_mutex_trylock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_mutex_trylock", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_mutex_trylock");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_mutexattr_destroy
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_MUTEXATTR_DESTROY_0100
     * @tc.desc   libc-test pthread_mutexattr_destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_mutexattr_destroy", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_mutexattr_destroy");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_mutexattr_setprotocol
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_MUTEXATTR_SETPROTOCOL_0100
     * @tc.desc   libc-test pthread_mutexattr_setprotocol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "pthread_mutexattr_setprotocol",
      Level.LEVEL1,
      async (done: Function) => {
        const result = await testNapi.runTest("pthread_mutexattr_setprotocol");
        expect(result).assertEqual(0);
        done();
      },
    );
    /**
     * @tc.name   pthread_mutexattr_setpshared
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_MUTEXATTR_SETPSHARED_0100
     * @tc.desc   libc-test pthread_mutexattr_setpshared
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_mutexattr_setpshared", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_mutexattr_setpshared");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_mutexattr_settype
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_MUTEXATTR_SETTYPE_0100
     * @tc.desc   libc-test pthread_mutexattr_settype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_mutexattr_settype", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_mutexattr_settype");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_rwlock_destroy_test
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_RWLOCK_DESTROY_TEST_0100
     * @tc.desc   libc-test pthread_rwlock_destroy_test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_rwlock_destroy_test", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_rwlock_destroy_test");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_rwlock_rdlock_sup
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_RWLOCK_RDLOCK_SUP_0100
     * @tc.desc   libc-test pthread_rwlock_rdlock_sup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_rwlock_rdlock_sup", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_rwlock_rdlock_sup");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_rwlock_tryrdlock
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_RWLOCK_TRYRDLOCK_0100
     * @tc.desc   libc-test pthread_rwlock_tryrdlock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_rwlock_tryrdlock", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_rwlock_tryrdlock");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_rwlock_trywrlock
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_RWLOCK_TRYWRLOCK_0100
     * @tc.desc   libc-test pthread_rwlock_trywrlock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_rwlock_trywrlock", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_rwlock_trywrlock");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_rwlockattr_destroy
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_RWLOCKATTR_DESTROY_0100
     * @tc.desc   libc-test pthread_rwlockattr_destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_rwlockattr_destroy", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_rwlockattr_destroy");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_rwlockattr_init
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_RWLOCKATTR_INIT_0100
     * @tc.desc   libc-test pthread_rwlockattr_init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_rwlockattr_init", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_rwlockattr_init");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_rwlockattr_setpshared
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_RWLOCKATTR_SETPSHARED_0100
     * @tc.desc   libc-test pthread_rwlockattr_setpshared
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "pthread_rwlockattr_setpshared",
      Level.LEVEL1,
      async (done: Function) => {
        const result = await testNapi.runTest("pthread_rwlockattr_setpshared");
        expect(result).assertEqual(0);
        done();
      },
    );
    /**
     * @tc.name   pthread_sigmask_test
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_SIGMASK_TEST_0100
     * @tc.desc   libc-test pthread_sigmask_test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_sigmask_test", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_sigmask_test");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   thrd_yield
     * @tc.number SUB_THIRDPARTY_MUSL_THRD_YIELD_0100
     * @tc.desc   libc-test thrd_yield
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("thrd_yield", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("thrd_yield");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   tss_set
     * @tc.number SUB_THIRDPARTY_MUSL_TSS_SET_0100
     * @tc.desc   libc-test tss_set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("tss_set", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("tss_set");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   call_once
     * @tc.number SUB_THIRDPARTY_MUSL_CALL_ONCE_0100
     * @tc.desc   libc-test call_once
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("call_once", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("call_once");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   cnd_broadcast
     * @tc.number SUB_THIRDPARTY_MUSL_CND_BROADCAST_0100
     * @tc.desc   libc-test cnd_broadcast
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("cnd_broadcast", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("cnd_broadcast");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   cnd_timedwait
     * @tc.number SUB_THIRDPARTY_MUSL_CND_TIMEDWAIT_0100
     * @tc.desc   libc-test cnd_timedwait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("cnd_timedwait", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("cnd_timedwait");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   cnd_wait
     * @tc.number SUB_THIRDPARTY_MUSL_CND_WAIT_0100
     * @tc.desc   libc-test cnd_wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("cnd_wait", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("cnd_wait");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   mtx_timedlock
     * @tc.number SUB_THIRDPARTY_MUSL_MTX_TIMEDLOCK_0100
     * @tc.desc   libc-test mtx_timedlock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("mtx_timedlock", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("mtx_timedlock");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   mtx_trylock
     * @tc.number SUB_THIRDPARTY_MUSL_MTX_TRYLOCK_0100
     * @tc.desc   libc-test mtx_trylock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("mtx_trylock", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("mtx_trylock");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   mtx_unlock
     * @tc.number SUB_THIRDPARTY_MUSL_MTX_UNLOCK_0100
     * @tc.desc   libc-test mtx_unlock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("mtx_unlock", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("mtx_unlock");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_barrier_wait
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_BARRIER_WAIT_0100
     * @tc.desc   libc-test pthread_barrier_wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_barrier_wait", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_barrier_wait");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_cond_init
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_COND_INIT_0100
     * @tc.desc   libc-test pthread_cond_init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_cond_init", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_cond_init");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_cond_timedwait_sup
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_COND_TIMEDWAIT_SUP_0100
     * @tc.desc   libc-test pthread_cond_timedwait_sup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_cond_timedwait_sup", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_cond_timedwait_sup");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_detach
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_DETACH_0100
     * @tc.desc   libc-test pthread_detach
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_detach", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_detach");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_equal
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_EQUAL_0100
     * @tc.desc   libc-test pthread_equal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_equal", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_equal");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_join
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_JOIN_0100
     * @tc.desc   libc-test pthread_join
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_join", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_join");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_mutex_timedlock
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_MUTEX_TIMEDLOCK_0100
     * @tc.desc   libc-test pthread_mutex_timedlock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_mutex_timedlock", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_mutex_timedlock");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_rwlock_timedrdlock
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_RWLOCK_TIMEDRDLOCK_0100
     * @tc.desc   libc-test pthread_rwlock_timedrdlock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_rwlock_timedrdlock", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_rwlock_timedrdlock");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_rwlock_timedwrlock
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_RWLOCK_TIMEDWRLOCK_0100
     * @tc.desc   libc-test pthread_rwlock_timedwrlock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_rwlock_timedwrlock", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_rwlock_timedwrlock");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_self
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_SELF_0100
     * @tc.desc   libc-test pthread_self
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_self", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_self");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_setschedprio
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_SETSCHEDPRIO_0100
     * @tc.desc   libc-test pthread_setschedprio
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_setschedprio", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_setschedprio");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_spin_lock
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_SPIN_LOCK_0100
     * @tc.desc   libc-test pthread_spin_lock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_spin_lock", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_spin_lock");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_spin_trylock
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_SPIN_TRYLOCK_0100
     * @tc.desc   libc-test pthread_spin_trylock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_spin_trylock", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_spin_trylock");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_spin_unlock
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_SPIN_UNLOCK_0100
     * @tc.desc   libc-test pthread_spin_unlock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_spin_unlock", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_spin_unlock");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   thrd_create
     * @tc.number SUB_THIRDPARTY_MUSL_THRD_CREATE_0100
     * @tc.desc   libc-test thrd_create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("thrd_create", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("thrd_create");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   thrd_current
     * @tc.number SUB_THIRDPARTY_MUSL_THRD_CURRENT_0100
     * @tc.desc   libc-test thrd_current
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("thrd_current", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("thrd_current");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   thrd_detach
     * @tc.number SUB_THIRDPARTY_MUSL_THRD_DETACH_0100
     * @tc.desc   libc-test thrd_detach
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("thrd_detach", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("thrd_detach");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   thrd_equal
     * @tc.number SUB_THIRDPARTY_MUSL_THRD_EQUAL_0100
     * @tc.desc   libc-test thrd_equal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("thrd_equal", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("thrd_equal");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   thrd_join
     * @tc.number SUB_THIRDPARTY_MUSL_THRD_JOIN_0100
     * @tc.desc   libc-test thrd_join
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("thrd_join", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("thrd_join");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   thrd_sleep
     * @tc.number SUB_THIRDPARTY_MUSL_THRD_SLEEP_0100
     * @tc.desc   libc-test thrd_sleep
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("thrd_sleep", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("thrd_sleep");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_create
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_CREATE_0100
     * @tc.desc   libc-test pthread_create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_create", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_create");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_exit
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_EXIT_0100
     * @tc.desc   libc-test pthread_exit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_exit", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_exit");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_getattr_np
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_GETATTR_NP_0100
     * @tc.desc   libc-test pthread_getattr_np
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_getattr_np", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_getattr_np");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_getschedparam
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_GETSCHEDPARAM_0100
     * @tc.desc   libc-test pthread_getschedparam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_getschedparam", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_getschedparam");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_getspecific
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_GETSPECIFIC_0100
     * @tc.desc   libc-test pthread_getspecific
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_getspecific", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_getspecific");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_key_create
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_KEY_CREATE_0100
     * @tc.desc   libc-test pthread_key_create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_key_create", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_key_create");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_mutex_lock
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_MUTEX_LOCK_0100
     * @tc.desc   libc-test pthread_mutex_lock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_mutex_lock", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_mutex_lock");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_mutex_unlock
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_MUTEX_UNLOCK_0100
     * @tc.desc   libc-test pthread_mutex_unlock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_mutex_unlock", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_mutex_unlock");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_once
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ONCE_0100
     * @tc.desc   libc-test pthread_once
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_once", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_once");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_setspecific
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_SETSPECIFIC_0100
     * @tc.desc   libc-test pthread_setspecific
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_setspecific", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_setspecific");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_setschedparam
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_SETSCHEDPARAM_0100
     * @tc.desc   libc-test pthread_setschedparam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_setschedparam", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_setschedparam");
      expect(result).assertEqual(0);
      done();
    });
  });
}
