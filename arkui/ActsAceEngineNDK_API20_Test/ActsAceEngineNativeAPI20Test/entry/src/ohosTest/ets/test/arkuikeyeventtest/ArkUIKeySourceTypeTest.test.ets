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

export default function ArkUIKeySourceTypeTest() {
  describe('ArkUIKeySourceTypeTest', () => {
    beforeAll(async (done: Function) => {
      await Utils.pushPage(`ArkUIKeyEventTest/ArkUIKeySourceTypeTest`, done);
    });

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEY_SOURCE_UNKNOWN_0100
     * @tc.name    : testArkUIKeySourceUnknown0100
     * @tc.desc    : Test whether the key ARKUI_KEY_SOURCE_UNKNOWN are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeySourceUnknown0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testArkUIKeySourceUnknown0100 start====");
          let keyEvent: KeyEvent = {
            type: KeyType.Down,
            keyCode: 1,
            keyText: 'tab',
            keySource: 0,
            deviceId: 0,
            metaKey: 0,
            timestamp: 0,
            stopPropagation: () => {
            },
            intentionCode: IntentionCode.INTENTION_DOWN
          };
          sendKeyEvent(keyEvent);
          await Utils.sleep(1000);
          let result: number = keyeventndk.GetKeySourceType(0);
          console.info(`====>testArkUIKeySourceUnknown0100 result====${result}`);
          expect(1).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testArkUIKeySourceUnknown0100 catch err: " + err);
          expect(false).assertEqual(err);
        }
      })


    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEY_SOURCE_TYPE_MOUSE_0100
     * @tc.name    : testArkUIKeySourceTypeMouse0100
     * @tc.desc    : Test whether the key ARKUI_KEY_SOURCE_TYPE_MOUSE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeySourceTypeMouse0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testArkUIKeySourceTypeMouse0100 start====");
          let keyEvent: KeyEvent = {
            type: KeyType.Down,
            keyCode: 1,
            keyText: 'tab',
            keySource: 1,
            deviceId: 0,
            metaKey: 0,
            timestamp: 0,
            stopPropagation: () => {
            },
            intentionCode: IntentionCode.INTENTION_DOWN
          };
          sendKeyEvent(keyEvent);
          await Utils.sleep(1000);
          let result: number = keyeventndk.GetKeySourceType(1);
          console.info(`====>testArkUIKeySourceTypeMouse0100 result====${result}`);
          expect(1).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testArkUIKeySourceTypeMouse0100 catch err: " + err);
          expect(false).assertEqual(err);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEY_SOURCE_TYPE_KEYBOARD_0100
     * @tc.name    : testArkUIKeySourceTypeKeyboard0100
     * @tc.desc    : Test whether the key ARKUI_KEY_SOURCE_TYPE_KEYBOARD are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeySourceTypeKeyboard0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testArkUIKeySourceTypeKeyboard0100 start====");
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
          sendKeyEvent(keyEvent);
          await Utils.sleep(1000)
          let result: number = keyeventndk.GetKeySourceType(4);
          console.info(`====>testArkUIKeySourceTypeKeyboard0100 result====${result}`);
          expect(1).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testArkUIKeySourceTypeKeyboard0100 catch err: " + err);
          expect(false).assertEqual(err);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEY_SOURCE_TYPE_JOYSTICK_0100
     * @tc.name    : testArkUIKeySourceTypeJoystick0100
     * @tc.desc    : Test whether the key ARKUI_KEY_SOURCE_TYPE_JOYSTICK are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeySourceTypeJoystick0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testArkUIKeySourceTypeJoystick0100 start====");
          let keyEvent: KeyEvent = {
            type: KeyType.Down,
            keyCode: 2311,
            keyText: 'Select',
            keySource: 5,
            deviceId: 0,
            metaKey: 0,
            timestamp: 0,
            stopPropagation: () => {
            },
            intentionCode: IntentionCode.INTENTION_DOWN
          };
          sendKeyEvent(keyEvent);
          await Utils.sleep(1000)
          let result: number = keyeventndk.GetKeySourceType(5);
          console.info(`====>testArkUIKeySourceTypeJoystick0100 result====${result}`);
          expect(1).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testArkUIKeySourceTypeJoystick0100 catch err: " + err);
          expect(false).assertEqual(err);
        }
      })

  })
}