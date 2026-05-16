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

export default function FunctionalextQueueTestGroupTest() {
  describe("ActsToolChainHapTest_src_functionalext_queue", () => {
    /**
     * @tc.name   sys_queue
     * @tc.number SUB_THIRDPARTY_MUSL_SYS_QUEUE_0100
     * @tc.desc   libc-test sys_queue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("sys_queue", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("sys_queue");
      expect(result).assertEqual(0);
      done();
    });
  });
}
