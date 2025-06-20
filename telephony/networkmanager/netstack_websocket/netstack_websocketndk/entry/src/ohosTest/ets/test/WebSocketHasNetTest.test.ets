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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium'
import webSocket from 'libtestNetStackWebsocketNdk.so'
export default function webSocketHasNetTest() {
  describe('webSocketHasNetTest', () => {    
    /*
     * @tc.number:SUB_testWebSocketClientConstruct001
     * @tc.name: testWebSocketClientConstruct001
     * @tc.desc:test webSocket OHWebSocketClientConstruct 
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('testWebSocketClientConstruct001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let result:number = webSocket.OHWebSocketClientConstruct();
      hilog.info(0x0000, 'testTag', 'websocket XTS ClientConstruct001 result=%{public}d', result);
      expect(0).assertEqual(result);
      done()
    })
    
   /*
     * @tc.number:SUB_testWebSocketClientConnect003
     * @tc.name: testWebSocketClientConnect003
     * @tc.desc:test webSocket OHWebSocketClientConnect 
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('testWebSocketClientConnect003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let result:number = webSocket.OHWebSocketClientConnect();
      hilog.info(0x0000, 'testTag', 'websocket XTS ClientConnect003 result=%{public}d', result);
      expect(0).assertEqual(result);
      done()
    })
  })
}
