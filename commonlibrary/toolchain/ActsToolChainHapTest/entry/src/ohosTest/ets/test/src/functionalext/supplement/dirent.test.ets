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

export default function dirent_group_test() {
  describe("ActsToolChainHapTest_src_functionalext_supplement_dirent", () => {
    /**
     * @tc.name   readdir
     * @tc.number SUB_THIRDPARTY_MUSL_READDIR_0100
     * @tc.desc   libc-test readdir
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("readdir", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("readdir");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   alphasort
     * @tc.number SUB_THIRDPARTY_MUSL_ALPHASORT_0100
     * @tc.desc   libc-test alphasort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("alphasort", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("alphasort");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   fdopendir
     * @tc.number SUB_THIRDPARTY_MUSL_FDOPENDIR_0100
     * @tc.desc   libc-test fdopendir
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fdopendir", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fdopendir");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   opendir
     * @tc.number SUB_THIRDPARTY_MUSL_OPENDIR_0100
     * @tc.desc   libc-test opendir
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("opendir", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("opendir");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   rewinddir
     * @tc.number SUB_THIRDPARTY_MUSL_REWINDDIR_0100
     * @tc.desc   libc-test rewinddir
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("rewinddir", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("rewinddir");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   seekdir
     * @tc.number SUB_THIRDPARTY_MUSL_SEEKDIR_0100
     * @tc.desc   libc-test seekdir
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("seekdir", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("seekdir");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   telldir
     * @tc.number SUB_THIRDPARTY_MUSL_TELLDIR_0100
     * @tc.desc   libc-test telldir
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("telldir", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("telldir");
      expect(result).assertEqual(0);
      done();
    });
  });
}
