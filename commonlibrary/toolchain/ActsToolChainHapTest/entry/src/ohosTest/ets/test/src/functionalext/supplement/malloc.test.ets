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

export default function malloc_group_test() {
  describe("ActsToolChainHapTest_src_functionalext_supplement_malloc", () => {
    /**
     * @tc.name   aligned_alloc
     * @tc.number SUB_THIRDPARTY_MUSL_ALIGNED_ALLOC_0100
     * @tc.desc   libc-test aligned_alloc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("aligned_alloc", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("aligned_alloc");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   malloc_check_from_ptr
     * @tc.number SUB_THIRDPARTY_MUSL_MALLOC_CHECK_FROM_PTR_0100
     * @tc.desc   libc-test malloc_check_from_ptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("malloc_check_from_ptr", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("malloc_check_from_ptr");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   malloc_usable_size
     * @tc.number SUB_THIRDPARTY_MUSL_MALLOC_USABLE_SIZE_0100
     * @tc.desc   libc-test malloc_usable_size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("malloc_usable_size", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("malloc_usable_size");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   memalign
     * @tc.number SUB_THIRDPARTY_MUSL_MEMALIGN_0100
     * @tc.desc   libc-test memalign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("memalign", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("memalign");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   posix_memalign
     * @tc.number SUB_THIRDPARTY_MUSL_POSIX_MEMALIGN_0100
     * @tc.desc   libc-test posix_memalign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("posix_memalign", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("posix_memalign");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   realloc
     * @tc.number SUB_THIRDPARTY_MUSL_REALLOC_0100
     * @tc.desc   libc-test realloc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("realloc", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("realloc");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   resTraceFreeRegion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_RESTRACEFREEREGION_0100
     * @tc.desc   libc-test resTraceFreeRegion
     */
    it("resTraceFreeRegion", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("resTraceFreeRegion");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   resTraceMove
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_RESTRACEMOVE_0100
     * @tc.desc   libc-test resTraceMove
     */
    it("resTraceMove", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("resTraceMove");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   restrace
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_RESTRACE_0100
     * @tc.desc   libc-test restrace
     */
    it("restrace", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("restrace");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   restraceExt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_RESTRACEEXT_0100
     * @tc.desc   libc-test restraceExt
     */
    it("restraceExt", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("restraceExt");
      expect(result).assertEqual(0);
      done();
    });

  });
}
