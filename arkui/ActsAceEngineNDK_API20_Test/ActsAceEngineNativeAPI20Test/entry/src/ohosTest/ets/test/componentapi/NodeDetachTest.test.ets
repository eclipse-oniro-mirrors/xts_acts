/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { afterEach,beforeAll, describe, expect, it, Level, Size, TestType } from "@ohos/hypium";
import Utils from '../common/Utils';
import nativexcomponent from 'libnativexcomponent.so';


export default function NodeDetachTest() {
  describe('NodeDetachTest', () => {
    beforeAll(async (done: Function) => {
      await Utils.pushPageNoClear("componentapi/NodeDetachTest", done)
    })
    /**
     * @tc.name   testNodeContentEventType0100
     * @tc.number SUB_ARKUI_ACE_ENGINE_NODE_CONTENT_EVENT_ON_DETACH_FROM_WINDOW_0100
     * @tc.desc   Test the NativeDisplayManager_SourceMode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNodeContentEventType0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      try{
        console.info("====>SUB_ARKUI_ACE_ENGINE_NODE_CONTENT_EVENT_ON_DETACH_FROM_WINDOW_0100 start====");
        let result  = nativexcomponent.NodeDetachTest();
        console.info(`====>SUB_ARKUI_ACE_ENGINE_NODE_CONTENT_EVENT_ON_DETACH_FROM_WINDOW_0100 result====${result}`);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>SUB_ARKUI_ACE_ENGINE_NODE_CONTENT_EVENT_ON_DETACH_FROM_WINDOW_0100 catch err: " + err);
        expect(false).assertEqual(err);
        done();
      }
    })
  })
}