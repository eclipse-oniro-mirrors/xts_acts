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

export default function linux_group_test() {
  describe("ActsToolChainHapTest_src_functionalext_supplement_linux", () => {
    /**
     * @tc.name   brk
     * @tc.number SUB_THIRDPARTY_MUSL_BRK_0100
     * @tc.desc   libc-test brk
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("brk", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("brk");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   capget
     * @tc.number SUB_THIRDPARTY_MUSL_CAPGET_0100
     * @tc.desc   libc-test capget
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("capget", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("capget");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   clone
     * @tc.number SUB_THIRDPARTY_MUSL_CLONE_0100
     * @tc.desc   libc-test clone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("clone", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("clone");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   epoll_create
     * @tc.number SUB_THIRDPARTY_MUSL_EPOLL_CREATE_0100
     * @tc.desc   libc-test epoll_create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("epoll_create", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("epoll_create");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   epoll_create1
     * @tc.number SUB_THIRDPARTY_MUSL_EPOLL_CREATE_ONE_0100
     * @tc.desc   libc-test epoll_create1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("epoll_create1", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("epoll_create1");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   epoll_ctl
     * @tc.number SUB_THIRDPARTY_MUSL_EPOLL_CTL_0100
     * @tc.desc   libc-test epoll_ctl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("epoll_ctl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("epoll_ctl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   epoll_pwait
     * @tc.number SUB_THIRDPARTY_MUSL_EPOLL_PWAIT_0100
     * @tc.desc   libc-test epoll_pwait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("epoll_pwait", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("epoll_pwait");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   epoll_wait
     * @tc.number SUB_THIRDPARTY_MUSL_EPOLL_WAIT_0100
     * @tc.desc   libc-test epoll_wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("epoll_wait", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("epoll_wait");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   eventfd
     * @tc.number SUB_THIRDPARTY_MUSL_EVENTFD_0100
     * @tc.desc   libc-test eventfd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("eventfd", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("eventfd");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   eventfd_read
     * @tc.number SUB_THIRDPARTY_MUSL_EVENTFD_READ_0100
     * @tc.desc   libc-test eventfd_read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("eventfd_read", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("eventfd_read");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   eventfd_write
     * @tc.number SUB_THIRDPARTY_MUSL_EVENTFD_WRITE_0100
     * @tc.desc   libc-test eventfd_write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("eventfd_write", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("eventfd_write");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   flistxattr
     * @tc.number SUB_THIRDPARTY_MUSL_FLISTXATTR_0100
     * @tc.desc   libc-test flistxattr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("flistxattr", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("flistxattr");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   fremovexattr
     * @tc.number SUB_THIRDPARTY_MUSL_FREMOVEXATTR_0100
     * @tc.desc   libc-test fremovexattr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fremovexattr", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fremovexattr");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   fsetxattr
     * @tc.number SUB_THIRDPARTY_MUSL_FSETXATTR_0100
     * @tc.desc   libc-test fsetxattr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fsetxattr", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fsetxattr");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   getdents
     * @tc.number SUB_THIRDPARTY_MUSL_GETDENTS_0100
     * @tc.desc   libc-test getdents
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getdents", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getdents");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   copy_file_range
     * @tc.number SUB_THIRDPARTY_MUSL_COPY_FILE_RANGE_0100
     * @tc.desc   libc-test copy_file_range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("copy_file_range", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("copy_file_range");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   sendfile
     * @tc.number SUB_THIRDPARTY_MUSL_SENDFILE_0100
     * @tc.desc   libc-test sendfile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("sendfile", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("sendfile");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   name_to_handle_at
     * @tc.number SUB_THIRDPARTY_MUSL_NAME_TO_HANDLE_AT_0100
     * @tc.desc   libc-test name_to_handle_at
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("name_to_handle_at", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("name_to_handle_at");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   process_vm
     * @tc.number SUB_THIRDPARTY_MUSL_PROCESS_VM_0100
     * @tc.desc   libc-test process_vm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("process_vm", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("process_vm");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   remap_file_pages
     * @tc.number SUB_THIRDPARTY_MUSL_REMAP_FILE_PAGES_0100
     * @tc.desc   libc-test remap_file_pages
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("remap_file_pages", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("remap_file_pages");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   removexattr
     * @tc.number SUB_THIRDPARTY_MUSL_REMOVEXATTR_0100
     * @tc.desc   libc-test removexattr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("removexattr", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("removexattr");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   sbrk
     * @tc.number SUB_THIRDPARTY_MUSL_SBRK_0100
     * @tc.desc   libc-test sbrk
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("sbrk", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("sbrk");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   setxattr
     * @tc.number SUB_THIRDPARTY_MUSL_SETXATTR_0100
     * @tc.desc   libc-test setxattr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("setxattr", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("setxattr");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   swapoff
     * @tc.number SUB_THIRDPARTY_MUSL_SWAPOFF_0100
     * @tc.desc   libc-test swapoff
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("swapoff", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("swapoff");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   swapon
     * @tc.number SUB_THIRDPARTY_MUSL_SWAPON_0100
     * @tc.desc   libc-test swapon
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("swapon", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("swapon");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   tee
     * @tc.number SUB_THIRDPARTY_MUSL_TEE_0100
     * @tc.desc   libc-test tee
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("tee", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("tee");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   timerfd_gettime
     * @tc.number SUB_THIRDPARTY_MUSL_TIMERFD_GETTIME_0100
     * @tc.desc   libc-test timerfd_gettime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("timerfd_gettime", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("timerfd_gettime");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   timerfd_settime
     * @tc.number SUB_THIRDPARTY_MUSL_TIMERFD_SETTIME_0100
     * @tc.desc   libc-test timerfd_settime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("timerfd_settime", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("timerfd_settime");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   fanotify_init
     * @tc.number SUB_THIRDPARTY_MUSL_FANOTIFY_INIT_0100
     * @tc.desc   libc-test fanotify_init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fanotify_init", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fanotify_init");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   getrandom
     * @tc.number SUB_THIRDPARTY_MUSL_GETRANDOM_0100
     * @tc.desc   libc-test getrandom
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getrandom", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getrandom");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   inotify_init1
     * @tc.number SUB_THIRDPARTY_MUSL_INOTIFY_INIT_ONE_0100
     * @tc.desc   libc-test inotify_init1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("inotify_init1", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("inotify_init1");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   memfd_create
     * @tc.number SUB_THIRDPARTY_MUSL_MEMFD_CREATE_0100
     * @tc.desc   libc-test memfd_create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("memfd_create", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("memfd_create");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   mlock2
     * @tc.number SUB_THIRDPARTY_MUSL_MLOCK_TWO_0100
     * @tc.desc   libc-test mlock2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("mlock2", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("mlock2");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   personality
     * @tc.number SUB_THIRDPARTY_MUSL_PERSONALITY_0100
     * @tc.desc   libc-test personality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("personality", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("personality");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   prctl
     * @tc.number SUB_THIRDPARTY_MUSL_PRCTL_0100
     * @tc.desc   libc-test prctl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("prctl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("prctl");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   prlimit
     * @tc.number SUB_THIRDPARTY_MUSL_PRLIMIT_0100
     * @tc.desc   libc-test prlimit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("prlimit", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("prlimit");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   quotactl
     * @tc.number SUB_THIRDPARTY_MUSL_QUOTACTL_0100
     * @tc.desc   libc-test quotactl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("quotactl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("quotactl");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   setfsgid
     * @tc.number SUB_THIRDPARTY_MUSL_SETFSGID_0100
     * @tc.desc   libc-test setfsgid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("setfsgid", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("setfsgid");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   setfsuid
     * @tc.number SUB_THIRDPARTY_MUSL_SETFSUID_0100
     * @tc.desc   libc-test setfsuid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("setfsuid", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("setfsuid");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   signalfd
     * @tc.number SUB_THIRDPARTY_MUSL_SIGNALFD_0100
     * @tc.desc   libc-test signalfd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("signalfd", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("signalfd");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   sysinfo
     * @tc.number SUB_THIRDPARTY_MUSL_SYSINFO_0100
     * @tc.desc   libc-test sysinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("sysinfo", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("sysinfo");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   timerfd_create
     * @tc.number SUB_THIRDPARTY_MUSL_TIMERFD_CREATE_0100
     * @tc.desc   libc-test timerfd_create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("timerfd_create", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("timerfd_create");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   vmsplice
     * @tc.number SUB_THIRDPARTY_MUSL_VMSPLICE_0100
     * @tc.desc   libc-test vmsplice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("vmsplice", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("vmsplice");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   ppoll_time64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_PPOLL_TIME_SIXTY_FOUR_BASIC_0100
     * @tc.desc   libc-test __ppoll_time64
     */
    it("ppoll_time64", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("__ppoll_time64");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   clock_adjtime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_CLOCK_ADJTIME_0100
     * @tc.desc   libc-test clock_adjtime
     */
    it("clock_adjtime", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("clock_adjtime");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   fallocate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_FALLOCATE_0100
     * @tc.desc   libc-test fallocate
     */
    it("fallocate", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fallocate");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   fgetxattr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_FGETXATTR_0100
     * @tc.desc   libc-test fgetxattr
     */
    it("fgetxattr", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fgetxattr");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   flock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_FLOCK_0100
     * @tc.desc   libc-test flock
     */
    it("flock", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("flock");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   inotify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_INOTIFY_0100
     * @tc.desc   libc-test inotify
     */
    it("inotify", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("inotify");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   membarrier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_MEMBARRIER_0100
     * @tc.desc   libc-test membarrier
     */
    it("membarrier", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("membarrier");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ppoll
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_PPOLL_0100
     * @tc.desc   libc-test ppoll
     */
    it("ppoll", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("ppoll");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   utimes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_UTIMES_0100
     * @tc.desc   libc-test utimes
     */
    it("utimes", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("utimes");
      expect(result).assertEqual(0);
      done();
    });

  });
}
