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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import webSocket from 'libwebsocketndknapitest.so'
export default function webSocketTest() {
  describe('ActsAbilityTest', function () {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(function () {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(function () {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(function () {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(function () {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    it('testWebSocketClientConstruct001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let result = webSocket.oHWebsocketClientConstruct();
      hilog.info(0x0000, 'testTag', 'websocket XTS ClientConstruct001 result=%{public}d', result);
      expect(0).assertEqual(result)
    })

    it('testWebSocketClientAddHeader002',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let result = webSocket.oHWebSocketClientAddHeader();
      hilog.info(0x0000, 'testTag', 'websocket XTS ClientAddHeader002 result=%{public}d', result);
      expect(0).assertEqual(result)
    })

    it('testWebSocketClientConnect003',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let result = webSocket.oHWebSocketClientConnect();
      hilog.info(0x0000, 'testTag', 'websocket XTS ClientConnect003 result=%{public}d', result);
      expect(0).assertEqual(result)
    })

    it('tesWebSocketClientSend004',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', 'websocket XTS ClientConnect004 %{public}s', 'it begin');
      let result = webSocket.oHWebSocketClientSend();
      hilog.info(0x0000, 'testTag', 'websocket XTS Connect004 result=%{public}d', result);
      expect(0).assertEqual(result)
    })

    it('testwebSocketClientClose005',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let result = webSocket.oHWebSocketClientClose();
      hilog.info(0x0000, 'testTag', 'websocket XTS ClientClose005 result=%{public}d', result);
      expect(1002).assertEqual(result)
    })

    it('testWebSocketClientDestroy006',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let result = webSocket.oHWebsocketClientDestroy();
      hilog.info(0x0000, 'testTag', 'websocket XTS ClientDestroy006 result=%{public}d', result);
      expect(1002).assertEqual(result)
    })


  })
}