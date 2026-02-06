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
export default function webSocketTest() {
  describe('ActsAbilityTest', () => {  
  
    /**
     * @tc.name   testWebSocketClientAddHeader002
     * @tc.number SUB_testWebSocketClientAddHeader002
     * @tc.desc   test webSocket OHWebSocketClientAddHeader
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebSocketClientAddHeader002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let result:number = webSocket.OHWebSocketClientAddHeader();
      hilog.info(0x0000, 'testTag', 'websocket XTS ClientAddHeader002 result=%{public}d', result);
      expect(0).assertEqual(result);
      done()
    })

    /**
     * @tc.name   tesWebSocketClientSend004
     * @tc.number SUB_tesWebSocketClientSend004
     * @tc.desc   test webSocket OHWebSocketClientSend
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('tesWebSocketClientSend004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', 'websocket XTS ClientConnect004 %{public}s', 'it begin');
      let result:number = webSocket.OHWebSocketClientSend();
      hilog.info(0x0000, 'testTag', 'websocket XTS Connect004 result=%{public}d', result);
      expect(0).assertEqual(result);
      done()
    })

    /**
     * @tc.name   testwebSocketClientClose005
     * @tc.number testwebSocketClientClose005
     * @tc.desc   testwebSocketClientClose005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testwebSocketClientClose005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let result:number = webSocket.OHWebSocketClientClose();
      hilog.info(0x0000, 'testTag', 'websocket XTS ClientClose005 result=%{public}d', result);
      expect(1002).assertEqual(result);
      done()
    })

    /**
     * @tc.name   testWebSocketClientDestroy006
     * @tc.number testWebSocketClientDestroy006
     * @tc.desc   testWebSocketClientDestroy006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebSocketClientDestroy006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let result:number = webSocket.OHWebSocketClientDestroy();
      hilog.info(0x0000, 'testTag', 'websocket XTS ClientDestroy006 result=%{public}d', result);
      expect(1002).assertEqual(result);
      done()
    })
  })
}
