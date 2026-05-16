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

import { describe, it, expect, TestType, Size, Level, beforeAll } from '@ohos/hypium'
import keyeventndk from 'libkeyeventndk.so'
import Utils from '../common/Utils'
import { IntentionCode } from '@kit.InputKit';

export default function ArkUIKeyEventTypeTest() {
  describe('ArkUIKeyEventTypeTest', () => {
    beforeAll(async (done: Function) => {
      await Utils.pushPage(`ArkUIKeyEventTest/ArkUIKeyEventTypeTest`, done);
    });

    /**
     * @tc.name   testArkUIKeyEventDown0100
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_KEY_EVENT_DOWN_0100
     * @tc.desc   Test whether the key ARKUI_KEY_EVENT_DOWN are working properly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUIKeyEventDown0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testArkUIKeyEventDown0100 start====");
          let keyEvent: KeyEvent = {
            type: KeyType.Down,
            keyCode: 2020,
            keyText: 'tab',
            keySource: 4,
            deviceId: 0,
            metaKey: 0,
            timestamp: 0,
            stopPropagation: () => {
            },
            intentionCode: IntentionCode.INTENTION_DOWN
          };
          sendKeyEvent(keyEvent); // 发送按键事件
          await Utils.sleep(1000)
          let result: number = keyeventndk.GetArkuiKeyEventType(0);
          console.info(`====>testArkUIKeyEventDown0100 result====${result}`);
          expect(1).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testArkUIKeyEventDown0100 catch err: " + err);
          expect(false).assertEqual(err);
        }
      })

    /**
     * @tc.name   testArkUIKeyEventUp0100
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_KEY_EVENT_UP_0100
     * @tc.desc   Test whether the key ARKUI_KEY_EVENT_UP are working properly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUIKeyEventUp0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testArkUIKeyEventUp0100 start====");
          let keyEvent: KeyEvent = {
            type: KeyType.Up,
            keyCode: 2020,
            keyText: 'tab',
            keySource: 4,
            deviceId: 0,
            metaKey: 0,
            timestamp: 0,
            stopPropagation: () => {
            },
            intentionCode: IntentionCode.INTENTION_UP
          };
          sendKeyEvent(keyEvent); // 发送按键事件
          await Utils.sleep(1000)
          let result: number = keyeventndk.GetArkuiKeyEventType(1);
          console.info(`====>testArkUIKeyEventUp0100 result====${result}`);
          expect(1).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testArkUIKeyEventUp0100 catch err: " + err);
          expect(false).assertEqual(err);
        }
      })
  })
}