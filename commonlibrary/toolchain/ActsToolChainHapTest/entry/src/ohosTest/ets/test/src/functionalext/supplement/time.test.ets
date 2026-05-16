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

export default function time_group_test() {
  describe("ActsToolChainHapTest_src_functionalext_supplement_time", () => {
    /**
     * @tc.name   clock
     * @tc.number SUB_THIRDPARTY_MUSL_CLOCK_0100
     * @tc.desc   libc-test clock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("clock", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("clock");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   clock_getcpuclockid
     * @tc.number SUB_THIRDPARTY_MUSL_CLOCK_GETCPUCLOCKID_0100
     * @tc.desc   libc-test clock_getcpuclockid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("clock_getcpuclockid", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("clock_getcpuclockid");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   clock_getres
     * @tc.number SUB_THIRDPARTY_MUSL_CLOCK_GETRES_0100
     * @tc.desc   libc-test clock_getres
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("clock_getres", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("clock_getres");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   gmtime_r_sup
     * @tc.number SUB_THIRDPARTY_MUSL_GMTIME_R_SUP_0100
     * @tc.desc   libc-test gmtime_r_sup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("gmtime_r_sup", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("gmtime_r_sup");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   gmtime_sup
     * @tc.number SUB_THIRDPARTY_MUSL_GMTIME_SUP_0100
     * @tc.desc   libc-test gmtime_sup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("gmtime_sup", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("gmtime_sup");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   nanosleep
     * @tc.number SUB_THIRDPARTY_MUSL_NANOSLEEP_0100
     * @tc.desc   libc-test nanosleep
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("nanosleep", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("nanosleep");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   timer_getoverrun
     * @tc.number SUB_THIRDPARTY_MUSL_TIMER_GETOVERRUN_0100
     * @tc.desc   libc-test timer_getoverrun
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("timer_getoverrun", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("timer_getoverrun");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   timer_gettime
     * @tc.number SUB_THIRDPARTY_MUSL_TIMER_GETTIME_0100
     * @tc.desc   libc-test timer_gettime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("timer_gettime", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("timer_gettime");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   timer_settime
     * @tc.number SUB_THIRDPARTY_MUSL_TIMER_SETTIME_0100
     * @tc.desc   libc-test timer_settime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("timer_settime", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("timer_settime");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   timespec_get
     * @tc.number SUB_THIRDPARTY_MUSL_TIMESPEC_GET_0100
     * @tc.desc   libc-test timespec_get
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("timespec_get", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("timespec_get");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   utime_sup
     * @tc.number SUB_THIRDPARTY_MUSL_UTIME_SUP_0100
     * @tc.desc   libc-test utime_sup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("utime_sup", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("utime_sup");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   difftime_sup
     * @tc.number SUB_THIRDPARTY_MUSL_DIFFTIME_SUP_0100
     * @tc.desc   libc-test difftime_sup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("difftime_sup", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("difftime_sup");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   mktime_sup
     * @tc.number SUB_THIRDPARTY_MUSL_MKTIME_SUP_0100
     * @tc.desc   libc-test mktime_sup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("mktime_sup", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("mktime_sup");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   timer_delete
     * @tc.number SUB_THIRDPARTY_MUSL_TIMER_DELETE_0100
     * @tc.desc   libc-test timer_delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("timer_delete", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("timer_delete");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   times
     * @tc.number SUB_THIRDPARTY_MUSL_TIMES_0100
     * @tc.desc   libc-test times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("times", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("times");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wcsftime_l
     * @tc.number SUB_THIRDPARTY_MUSL_WCSFTIME_L_0100
     * @tc.desc   libc-test wcsftime_l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wcsftime_l", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wcsftime_l");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   timer_create
     * @tc.number SUB_THIRDPARTY_MUSL_TIMER_CREATE_0100
     * @tc.desc   libc-test timer_create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("timer_create", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("timer_create");
      expect(result).assertEqual(0);
      done();
    });
  });
}
