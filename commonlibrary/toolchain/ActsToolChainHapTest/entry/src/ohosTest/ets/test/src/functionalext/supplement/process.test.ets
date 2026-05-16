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

export default function process_group_test() {
  describe("ActsToolChainHapTest_src_functionalext_supplement_process", () => {
    /**
     * @tc.name   execl
     * @tc.number SUB_THIRDPARTY_MUSL_EXECL_0100
     * @tc.desc   libc-test execl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("execl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("execl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   fexecve
     * @tc.number SUB_THIRDPARTY_MUSL_FEXECVE_0100
     * @tc.desc   libc-test fexecve
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fexecve", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fexecve");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   fexecverely
     * @tc.number SUB_THIRDPARTY_MUSL_FEXECVERELY_0100
     * @tc.desc   libc-test fexecverely
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fexecverely", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fexecverely");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   fork
     * @tc.number SUB_THIRDPARTY_MUSL_FORK_0100
     * @tc.desc   libc-test fork
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('fork', Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest('fork');
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   posix_spawn
     * @tc.number SUB_THIRDPARTY_MUSL_POSIX_SPAWN_0100
     * @tc.desc   libc-test posix_spawn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("posix_spawn", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("posix_spawn");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   posix_spawnattr_getflags
     * @tc.number SUB_THIRDPARTY_MUSL_POSIX_SPAWNATTR_GETFLAGS_0100
     * @tc.desc   libc-test posix_spawnattr_getflags
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("posix_spawnattr_getflags", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("posix_spawnattr_getflags");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   posix_spawnattr_getpgroup
     * @tc.number SUB_THIRDPARTY_MUSL_POSIX_SPAWNATTR_GETPGROUP_0100
     * @tc.desc   libc-test posix_spawnattr_getpgroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("posix_spawnattr_getpgroup", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("posix_spawnattr_getpgroup");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   posix_spawnattr_getsigdefault
     * @tc.number SUB_THIRDPARTY_MUSL_POSIX_SPAWNATTR_GETSIGDEFAULT_0100
     * @tc.desc   libc-test posix_spawnattr_getsigdefault
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "posix_spawnattr_getsigdefault",
      Level.LEVEL1,
      async (done: Function) => {
        const result = await testNapi.runTest("posix_spawnattr_getsigdefault");
        expect(result).assertEqual(0);
        done();
      },
    );
    /**
     * @tc.name   posix_spawnattr_getsigmask
     * @tc.number SUB_THIRDPARTY_MUSL_POSIX_SPAWNATTR_GETSIGMASK_0100
     * @tc.desc   libc-test posix_spawnattr_getsigmask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("posix_spawnattr_getsigmask", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("posix_spawnattr_getsigmask");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   posix_spawnattr_setflags
     * @tc.number SUB_THIRDPARTY_MUSL_POSIX_SPAWNATTR_SETFLAGS_0100
     * @tc.desc   libc-test posix_spawnattr_setflags
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("posix_spawnattr_setflags", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("posix_spawnattr_setflags");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   posix_spawnattr_setpgroup
     * @tc.number SUB_THIRDPARTY_MUSL_POSIX_SPAWNATTR_SETPGROUP_0100
     * @tc.desc   libc-test posix_spawnattr_setpgroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("posix_spawnattr_setpgroup", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("posix_spawnattr_setpgroup");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   posix_spawnattr_setsigdefault
     * @tc.number SUB_THIRDPARTY_MUSL_POSIX_SPAWNATTR_SETSIGDEFAULT_0100
     * @tc.desc   libc-test posix_spawnattr_setsigdefault
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "posix_spawnattr_setsigdefault",
      Level.LEVEL1,
      async (done: Function) => {
        const result = await testNapi.runTest("posix_spawnattr_setsigdefault");
        expect(result).assertEqual(0);
        done();
      },
    );
    /**
     * @tc.name   posix_spawnattr_setsigmask
     * @tc.number SUB_THIRDPARTY_MUSL_POSIX_SPAWNATTR_SETSIGMASK_0100
     * @tc.desc   libc-test posix_spawnattr_setsigmask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("posix_spawnattr_setsigmask", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("posix_spawnattr_setsigmask");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   posix_spawnp
     * @tc.number SUB_THIRDPARTY_MUSL_POSIX_SPAWNP_0100
     * @tc.desc   libc-test posix_spawnp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("posix_spawnp", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("posix_spawnp");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   waitid
     * @tc.number SUB_THIRDPARTY_MUSL_WAITID_0100
     * @tc.desc   libc-test waitid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("waitid", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("waitid");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   posix_spawn_file_actions_addopen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_POSIX_SPAWN_FILE_ACTIONS_ADDOPEN_0100
     * @tc.desc   libc-test posix_spawn_file_actions_addopen
     */
    it("posix_spawn_file_actions_addopen", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("posix_spawn_file_actions_addopen");
      expect(result).assertEqual(0);
      done();
    });

  });
}
