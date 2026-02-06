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

export default function ArkUIKeyIntensionTest() {
  describe('ArkUIKeyIntensionTest', () => {
    const x1: number = Math.floor(globalThis.winWidth / 2 + globalThis.winLeft);
    const y1: number = Math.floor(globalThis.winHeight / 2 + globalThis.winTop);
    const x2: number = Math.floor(globalThis.winWidth / 4 + globalThis.winLeft);
    const y2: number = Math.floor(globalThis.winHeight / 4 + globalThis.winTop);
    beforeAll(async (done: Function) => {
      await Utils.pushPage(`ArkUIKeyEventTest/ArkUIKeyIntensionTest`, done);
    });

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEY_INTENSION_UNKNOWN_0100
     * @tc.name    : testArkUIKeyIntensionUnknown0100
     * @tc.desc    : Test whether the key ARKUI_KEY_INTENSION_UNKNOWN are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyIntensionUnknown0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testArkUIKeyIntensionUnknown0100 start====");
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
            intentionCode: IntentionCode.INTENTION_UNKNOWN
          };
          sendKeyEvent(keyEvent);
          await Utils.sleep(1000);
          let result: number = keyeventndk.GetKeyIntensionType(-1);
          console.info(`====>testArkUIKeyIntensionUnknown0100 result====${result}`);
          expect(1).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testArkUIKeyIntensionUnknown0100 catch err: " + err);
          expect(false).assertEqual(err);
        }
      })


    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEY_INTENSION_UP_0100
     * @tc.name    : testArkUIKeyIntensionUp0100
     * @tc.desc    : Test whether the key ARKUI_KEY_INTENSION_UP are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyIntensionUp0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testArkUIKeyIntensionUp0100 start====");
          await Utils.driver.triggerKey(2012);
          let result: number = keyeventndk.GetKeyIntensionType(1);
          console.info(`====>testArkUIKeyIntensionUp0100 result====${result}`);
          expect(1).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testArkUIKeyIntensionUp0100 catch err: " + err);
          expect(false).assertEqual(err);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEY_INTENSION_DOWN_0100
     * @tc.name    : testArkUIKeyIntensionDown0100
     * @tc.desc    : Test whether the key ARKUI_KEY_INTENSION_DOWN are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyIntensionDown0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testArkUIKeyIntensionDown0100 start====");
          await Utils.driver.triggerKey(2013);
          let result: number = keyeventndk.GetKeyIntensionType(2);
          console.info(`====>testArkUIKeyIntensionDown0100 result====${result}`);
          expect(1).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testArkUIKeyIntensionDown0100 catch err: " + err);
          expect(false).assertEqual(err);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEY_INTENSION_LEFT_0100
     * @tc.name    : testArkUIKeyIntensionLeft0100
     * @tc.desc    : Test whether the key ARKUI_KEY_INTENSION_LEFT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyIntensionLeft0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testArkUIKeyIntensionLeft0100 start====");
          await Utils.driver.triggerKey(2014);
          let result: number = keyeventndk.GetKeyIntensionType(3);
          console.info(`====>testArkUIKeyIntensionLeft0100 result====${result}`);
          expect(1).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testArkUIKeyIntensionLeft0100 catch err: " + err);
          expect(false).assertEqual(err);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEY_INTENSION_RIGHT_0100
     * @tc.name    : testArkUIKeyIntensionRight0100
     * @tc.desc    : Test whether the key ARKUI_KEY_INTENSION_RIGHT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyIntensionRight0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testArkUIKeyIntensionRight0100 start====");
          await Utils.driver.triggerKey(2015);
          let result: number = keyeventndk.GetKeyIntensionType(4);
          console.info(`====>testArkUIKeyIntensionRight0100 result====${result}`);
          expect(1).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testArkUIKeyIntensionRight0100 catch err: " + err);
          expect(false).assertEqual(err);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEY_INTENSION_SELECT_0100
     * @tc.name    : testArkUIKeyIntensionSelect0100
     * @tc.desc    : Test whether the key ARKUI_KEY_INTENSION_SELECT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyIntensionSelect0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testArkUIKeyIntensionSelect0100 start====");
          await Utils.driver.triggerKey(2054);
          let result: number = keyeventndk.GetKeyIntensionType(5);
          console.info(`====>testArkUIKeyIntensionSelect0100 result====${result}`);
          expect(1).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testArkUIKeyIntensionSelect0100 catch err: " + err);
          expect(false).assertEqual(err);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEY_INTENSION_ESCAPE_0100
     * @tc.name    : testArkUIKeyIntensionEscape0100
     * @tc.desc    : Test whether the key ARKUI_KEY_INTENSION_ESCAPE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyIntensionEscape0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testArkUIKeyIntensionEscape0100 start====");
          await Utils.driver.triggerKey(2070);
          let result: number = keyeventndk.GetKeyIntensionType(6);
          console.info(`====>testArkUIKeyIntensionEscape0100 result====${result}`);
          expect(1).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testArkUIKeyIntensionEscape0100 catch err: " + err);
          expect(false).assertEqual(err);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEY_INTENSION_BACK_0100
     * @tc.name    : testArkUIKeyIntensionBack0100
     * @tc.desc    : Test whether the key ARKUI_KEY_INTENSION_BACK are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyIntensionBack0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testArkUIKeyIntensionBack0100 start====");
          await Utils.driver.triggerKey(2302);
          let result: number = keyeventndk.GetKeyIntensionType(7);
          console.info(`====>testArkUIKeyIntensionBack0100 result====${result}`);
          expect(1).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testArkUIKeyIntensionBack0100 catch err: " + err);
          expect(false).assertEqual(err);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEY_INTENSION_MENU_0100
     * @tc.name    : testArkUIKeyIntensionMenu0100
     * @tc.desc    : Test whether the key ARKUI_KEY_INTENSION_MENU are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyIntensionMenu0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testArkUIKeyIntensionMenu0100 start====");
          await Utils.driver.triggerKey(2311);
          let result: number = keyeventndk.GetKeyIntensionType(9);
          console.info(`====>testArkUIKeyIntensionMenu0100 result====${result}`);
          expect(1).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testArkUIKeyIntensionMenu0100 catch err: " + err);
          expect(false).assertEqual(err);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEY_INTENSION_HOME_0100
     * @tc.name    : testArkUIKeyIntensionHome0100
     * @tc.desc    : Test whether the key ARKUI_KEY_INTENSION_HOME are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyIntensionHome0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testArkUIKeyIntensionHome0100 start====");
          await Utils.driver.triggerKey(2081);
          let result: number = keyeventndk.GetKeyIntensionType(10);
          console.info(`====>testArkUIKeyIntensionHome0100 result====${result}`);
          expect(1).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testArkUIKeyIntensionHome0100 catch err: " + err);
          expect(false).assertEqual(err);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEY_INTENSION_PAGE_UP_0100
     * @tc.name    : testArkUIKeyIntensionPageUp0100
     * @tc.desc    : Test whether the key ARKUI_KEY_INTENSION_PAGE_UP are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyIntensionPageUp0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testArkUIKeyIntensionPageUp0100 start====");
          await Utils.driver.triggerKey(2068);
          let result: number = keyeventndk.GetKeyIntensionType(11);
          console.info(`====>testArkUIKeyIntensionPageUp0100 result====${result}`);
          expect(1).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testArkUIKeyIntensionPageUp0100 catch err: " + err);
          expect(false).assertEqual(err);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEY_INTENSION_PAGE_DOWN_0100
     * @tc.name    : testArkUIKeyIntensionPageDown0100
     * @tc.desc    : Test whether the key ARKUI_KEY_INTENSION_PAGE_DOWN are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyIntensionPageDown0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testArkUIKeyIntensionPageDown0100 start====");
          await Utils.driver.triggerKey(2069);
          let result: number = keyeventndk.GetKeyIntensionType(12);
          console.info(`====>testArkUIKeyIntensionPageDown0100 result====${result}`);
          expect(1).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testArkUIKeyIntensionPageDown0100 catch err: " + err);
          expect(false).assertEqual(err);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEY_INTENSION_ZOOM_OUT_0100
     * @tc.name    : testArkUIKeyIntensionZoomOut0100
     * @tc.desc    : Test whether the key ARKUI_KEY_INTENSION_ZOOM_OUT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyIntensionZoomOut0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testArkUIKeyIntensionZoomOut0100 start====");
          await Utils.driver.triggerCombineKeys(2072,2066);
          let result: number = keyeventndk.GetKeyIntensionType(13);
          console.info(`====>testArkUIKeyIntensionZoomOut0100 result====${result}`);
          expect(1).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testArkUIKeyIntensionZoomOut0100 catch err: " + err);
          expect(false).assertEqual(err);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEY_INTENSION_ZOOM_IN_0100
     * @tc.name    : testArkUIKeyIntensionZoomIn0100
     * @tc.desc    : Test whether the key ARKUI_KEY_INTENSION_ZOOM_IN are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyIntensionZoomIn0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testArkUIKeyIntensionZoomIn0100 start====");
          await Utils.driver.triggerCombineKeys(2072,2057);
          let result: number = keyeventndk.GetKeyIntensionType(14);
          console.info(`====>testArkUIKeyIntensionZoomIn0100 result====${result}`);
          expect(1).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testArkUIKeyIntensionZoomIn0100 catch err: " + err);
          expect(false).assertEqual(err);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEY_INTENSION_MEDIA_MUTE_0100
     * @tc.name    : testArkUIKeyIntensionMediaMute0100
     * @tc.desc    : Test whether the key ARKUI_KEY_INTENTION_MEDIA_MUTE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyIntensionMediaMute0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testArkUIKeyIntensionMediaMute0100 start====");
          await Utils.driver.triggerKey(23);
          let result: number = keyeventndk.GetKeyIntensionType(106);
          console.info(`====>testArkUIKeyIntensionMediaMute0100 result====${result}`);
          expect(1).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testArkUIKeyIntensionMediaMute0100 catch err: " + err);
          expect(false).assertEqual(err);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEY_INTENSION_VOLUME_UP_0100
     * @tc.name    : testArkUIKeyIntensionVolumeUp0100
     * @tc.desc    : Test whether the key ARKUI_KEY_INTENTION_VOLUME_UP are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyIntensionVolumeUp0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testArkUIKeyIntensionVolumeUp0100 start====");
          await Utils.driver.triggerKey(16);
          await Utils.driver.doubleClick(x1, y1);
          let result: number = keyeventndk.GetKeyIntensionType(107);
          console.info(`====>testArkUIKeyIntensionVolumeUp0100 result====${result}`);
          expect(1).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testArkUIKeyIntensionVolumeUp0100 catch err: " + err);
          expect(false).assertEqual(err);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEY_INTENSION_VOLUME_DOWN_0100
     * @tc.name    : testArkUIKeyIntensionVolumeDown0100
     * @tc.desc    : Test whether the key ARKUI_KEY_INTENTION_VOLUME_DOWN are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyIntensionVolumeDown0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testArkUIKeyIntensionVolumeDown0100 start====");
          await Utils.driver.triggerKey(17);
          let result: number = keyeventndk.GetKeyIntensionType(108);
          console.info(`====>testArkUIKeyIntensionVolumeDown0100 result====${result}`);
          expect(1).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testArkUIKeyIntensionVolumeDown0100 catch err: " + err);
          expect(false).assertEqual(err);
        }
      })
  })
}