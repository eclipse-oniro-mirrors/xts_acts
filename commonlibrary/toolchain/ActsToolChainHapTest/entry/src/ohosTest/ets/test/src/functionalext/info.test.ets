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

export default function info_group_test() {
  describe("ActsToolChainHapTest_src_functionalext_info", () => {
    /**
     * @tc.name   application_target_sdk_version_test
     * @tc.number SUB_THIRDPARTY_MUSL_APPLICATION_TARGET_SDK_VERSION_TEST_0100
     * @tc.desc   libc-test application_target_sdk_version_test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "application_target_sdk_version_test",
      Level.LEVEL1,
      async (done: Function) => {
        const result = await testNapi.runTest(
          "application_target_sdk_version_test",
        );
        expect(result).assertEqual(0);
        done();
      },
    );

    /**
     * @tc.name   device_api_version
     * @tc.number SUB_THIRDPARTY_MUSL_DEVICE_API_VERSION_0100
     * @tc.desc   libc-test device_api_version
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("device_api_version", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("device_api_version");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   fatal_message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_FATAL_MESSAGE_0100
     * @tc.desc   libc-test fatal_message
     */
    it("fatal_message", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fatal_message");
      expect(result).assertEqual(0);
      done();
    });

  });
}
