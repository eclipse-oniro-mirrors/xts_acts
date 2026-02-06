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

import { describe, it, expect, TestType, Size, Level, beforeAll } from '@ohos/hypium';
import Utils from '../common/Utils';
import { ON, Component } from '@kit.TestKit';
import nativexcomopnentkeycode from 'libnativexcomopnentkeycode.so';

const KEY_CODE_SAME = true;
const KEY_CODE_ERROR = false;

export default function KeyCodeNdkTest() {
  describe('KeyCodeNdkTest', () => {
    let button: Component;
    beforeAll(async (done: Function) => {
      await Utils.pushPageNoClear(`KeyCodeTest/KeyCodeTest`, () => {});
      button = await Utils.driver.findComponent(ON.id("send"));
      done();
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_UNKNOWN_0100
     * @tc.name    : testGetKeyCodeEventUnkown0100
     * @tc.desc    : Test whether the key KEY_FN are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventUnkown0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_UNKNOWN_0100 start<====`);
        globalThis.keyCode = -1;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == -1);
        done();
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_HOME_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_FN_0100
     * @tc.name    : testGetKeyCodeEventFn0100
     * @tc.desc    : Test whether the key KEY_FN are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventFn0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_FN_0100 start<====`);
        globalThis.keyCode = 0;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 0);
        done();
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_HOME_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_HOME_0100
     * @tc.name    : testGetKeyCodeEventHome0100
     * @tc.desc    : Test whether the key KEY_HOME are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventHome0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_HOME_0100 start<====`);
        globalThis.keyCode = 1;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 1);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_HOME_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BACK_0100
     * @tc.name    : testGetKeyCodeEventBack0100
     * @tc.desc    : Test whether the key KEY_BACK are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventBack0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_BACK_0100 start<====`);
        globalThis.keyCode = 2;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_BACK_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_MEDIA_PLAY_PAUSE_0100
     * @tc.name    : testGetKeyCodeEventMediaPlayPause0100
     * @tc.desc    : Test whether the key KEY_MEDIA_PLAY_PAUSE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventMediaPlayPause0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_MEDIA_PLAY_PAUSE_0100 start<====`);
        globalThis.keyCode = 10;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 10);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_MEDIA_PLAY_PAUSE_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_MEDIA_STOP_0100
     * @tc.name    : testGetKeyCodeEventMediaStop0100
     * @tc.desc    : Test whether the key KEY_MEDIA_STOP are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventMediaStop0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_MEDIA_STOP_0100 start<====`);
        globalThis.keyCode = 11;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 11);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_MEDIA_STOP_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_MEDIA_NEXT_0100
     * @tc.name    : testGetKeyCodeEventMediaNext0100
     * @tc.desc    : Test whether the key KEY_MEDIA_NEXT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventMediaNext0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_MEDIA_NEXT_0100 start<====`);
        globalThis.keyCode = 12;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 12);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_MEDIA_NEXT_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_MEDIA_PREVIOUS_0100
     * @tc.name    : testGetKeyCodeEventMediaPrevious0100
     * @tc.desc    : Test whether the key KEY_MEDIA_PREVIOUS are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventMediaPrevious0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_MEDIA_PREVIOUS_0100 start<====`);
        globalThis.keyCode = 13;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 13);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_MEDIA_PREVIOUS_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_MEDIA_REWIND_0100
     * @tc.name    : testGetKeyCodeEventMediaRewind0100
     * @tc.desc    : Test whether the key KEY_MEDIA_REWIND are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventMediaRewind0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_MEDIA_REWIND_0100 start<====`);
        globalThis.keyCode = 14;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 14);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_MEDIA_REWIND_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_MEDIA_FAST_FORWARD_0100
     * @tc.name    : testGetKeyCodeEventMediaFastForward0100
     * @tc.desc    : Test whether the key KEY_MEDIA_FAST_FORWARD are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventMediaFastForward0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_MEDIA_FAST_FORWARD_0100 start<====`);
        globalThis.keyCode = 15;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 15);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_MEDIA_FAST_FORWARD_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_VOLUME_UP_0100
     * @tc.name    : testGetKeyCodeEventVolumeUp0100
     * @tc.desc    : Test whether the key KEY_VOLUME_UP are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventVolumeUp0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_VOLUME_UP_0100 start<====`);
        globalThis.keyCode = 16;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 16);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_VOLUME_UP_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_VOLUME_DOWN_0100
     * @tc.name    : testGetKeyCodeEventVolumeDown0100
     * @tc.desc    : Test whether the key KEY_VOLUME_DOWN are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventVolumeDown0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_VOLUME_DOWN_0100 start<====`);
        globalThis.keyCode = 17;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 17);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_VOLUME_DOWN_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_POWER_0100
     * @tc.name    : testGetKeyCodeEventPower0100
     * @tc.desc    : Test whether the key KEY_POWER are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventPower0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_CAMERA_0100 start<====`);
        globalThis.keyCode = 18;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 18);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_CAMERA_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_CAMERA_0100
     * @tc.name    : testGetKeyCodeEventCamera0100
     * @tc.desc    : Test whether the key KEY_CAMERA are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventCamera0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_CAMERA_0100 start<====`);
        globalThis.keyCode = 19;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 19);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_CAMERA_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_VOLUME_MUTE_0100
     * @tc.name    : testGetKeyCodeEventVolumeMute0100
     * @tc.desc    : Test whether the key KEY_VOLUME_MUTE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventVolumeMute0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_VOLUME_MUTE_0100 start<====`);
        globalThis.keyCode = 22;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 22);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_VOLUME_MUTE_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_MUTE_0100
     * @tc.name    : testGetKeyCodeEventMute0100
     * @tc.desc    : Test whether the key KEY_MUTE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventMute0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_MUTE_0100 start<====`);
        globalThis.keyCode = 23;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 23);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_MUTE_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BRIGHTNESS_UP_0100
     * @tc.name    : testGetKeyCodeEventBrightnessUp0100
     * @tc.desc    : Test whether the key KEY_BRIGHTNESS_UP are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventBrightnessUp0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_BRIGHTNESS_UP_0100 start<====`);
        globalThis.keyCode = 40;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 40);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_BRIGHTNESS_UP_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BRIGHTNESS_DOWN_0100
     * @tc.name    : testGetKeyCodeEventBrightnessDown0100
     * @tc.desc    : Test whether the key KEY_BRIGHTNESS_DOWN are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventBrightnessDown0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_BRIGHTNESS_DOWN_0100 start<====`);
        globalThis.keyCode = 41;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 41);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_BRIGHTNESS_DOWN_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_0_0100
     * @tc.name    : testGetKeyCodeEvent00100
     * @tc.desc    : Test whether the key KEY_0 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEvent00100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_0_0100 start<====`);
        globalThis.keyCode = 2000;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2000);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_0_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_1_0100
     * @tc.name    : testGetKeyCodeEvent10100
     * @tc.desc    : Test whether the key KEY_1 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEvent10100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_1_0100 start<====`);
        globalThis.keyCode = 2001;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2001);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_1_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_2_0100
     * @tc.name    : testGetKeyCodeEvent20100
     * @tc.desc    : Test whether the key KEY_2 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEvent20100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_2_0100 start<====`);
        globalThis.keyCode = 2002;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2002);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_2_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_3_0100
     * @tc.name    : testGetKeyCodeEvent30100
     * @tc.desc    : Test whether the key KEY_3 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEvent30100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_3_0100 start<====`);
        globalThis.keyCode = 2003;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2003);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_3_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_4_0100
     * @tc.name    : testGetKeyCodeEvent40100
     * @tc.desc    : Test whether the key KEY_4 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEvent40100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_4_0100 start<====`);
        globalThis.keyCode = 2004;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2004);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_4_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_5_0100
     * @tc.name    : testGetKeyCodeEvent50100
     * @tc.desc    : Test whether the key KEY_5 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEvent50100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_5_0100 start<====`);
        globalThis.keyCode = 2005;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2005);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_5_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_6_0100
     * @tc.name    : testGetKeyCodeEvent60100
     * @tc.desc    : Test whether the key KEY_6 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEvent60100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_6_0100 start<====`);
        globalThis.keyCode = 2006;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2006);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_6_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_7_0100
     * @tc.name    : testGetKeyCodeEvent70100
     * @tc.desc    : Test whether the key KEY_7 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEvent70100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_7_0100 start<====`);
        globalThis.keyCode = 2007;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2007);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_7_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_8_0100
     * @tc.name    : testGetKeyCodeEvent80100
     * @tc.desc    : Test whether the key KEY_8 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEvent80100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_8_0100 start<====`);
        globalThis.keyCode = 2008;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2008);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_8_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_9_0100
     * @tc.name    : testGetKeyCodeEvent90100
     * @tc.desc    : Test whether the key KEY_9 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEvent90100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_9_0100 start<====`);
        globalThis.keyCode = 2009;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2009);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_9_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_STAR_0100
     * @tc.name    : testGetKeyCodeEventStar0100
     * @tc.desc    : Test whether the key KEY_STAR are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventStar0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_STAR_0100 start<====`);
        globalThis.keyCode = 2010;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2010);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_STAR_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_POUND_0100
     * @tc.name    : testGetKeyCodeEventPound0100
     * @tc.desc    : Test whether the key KEY_POUND are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventPound0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_POUND_0100 start<====`);
        globalThis.keyCode = 2011;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2011);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_POUND_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_DPAD_UP_0100
     * @tc.name    : testGetKeyCodeEventDpadUp0100
     * @tc.desc    : Test whether the key KEY_DPAD_UP are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventDpadUp0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_DPAD_UP_0100 start<====`);
        globalThis.keyCode = 2012;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2012);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_DPAD_UP_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_DPAD_DOWN_0100
     * @tc.name    : testGetKeyCodeEventDpadDown0100
     * @tc.desc    : Test whether the key KEY_DPAD_DOWN are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventDpadDown0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_DPAD_DOWN_0100 start<====`);
        globalThis.keyCode = 2013;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2013);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_DPAD_DOWN_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_DPAD_LEFT_0100
     * @tc.name    : testGetKeyCodeEventDpadLeft0100
     * @tc.desc    : Test whether the key KEY_DPAD_LEFT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventDpadLeft0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_DPAD_LEFT_0100 start<====`);
        globalThis.keyCode = 2014;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2014);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_DPAD_LEFT_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_DPAD_RIGHT_0100
     * @tc.name    : testGetKeyCodeEventDpadRight0100
     * @tc.desc    : Test whether the key KEY_DPAD_RIGHT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventDpadRight0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_DPAD_RIGHT_0100 start<====`);
        globalThis.keyCode = 2015;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2015);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_DPAD_RIGHT_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_DPAD_CENTER_0100
     * @tc.name    : testGetKeyCodeEventDpadCenter0100
     * @tc.desc    : Test whether the key KEY_DPAD_CENTER are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventDpadCenter0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_DPAD_CENTER_0100 start<====`);
        globalThis.keyCode = 2016;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2016);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_DPAD_CENTER_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_A_0100
     * @tc.name    : testGetKeyCodeEventA0100
     * @tc.desc    : Test whether the key KEY_A are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventA0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_A_0100 start<====`);
        globalThis.keyCode = 2017;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2017);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_A_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_B_0100
     * @tc.name    : testGetKeyCodeEventB0100
     * @tc.desc    : Test whether the key KEY_B are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventB0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_B_0100 start<====`);
        globalThis.keyCode = 2018;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2018);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_B_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_C_0100
     * @tc.name    : testGetKeyCodeEventC0100
     * @tc.desc    : Test whether the key KEY_C are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventC0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_C_0100 start<====`);
        globalThis.keyCode = 2019;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2019);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_C_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_D_0100
     * @tc.name    : testGetKeyCodeEventD0100
     * @tc.desc    : Test whether the key KEY_D are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventD0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_D_0100 start<====`);
        globalThis.keyCode = 2020;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2020);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_D_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_E_0100
     * @tc.name    : testGetKeyCodeEventE0100
     * @tc.desc    : Test whether the key KEY_E are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventE0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_E_0100 start<====`);
        globalThis.keyCode = 2021;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2021);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_E_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_F_0100
     * @tc.name    : testGetKeyCodeEventF0100
     * @tc.desc    : Test whether the key KEY_F are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventF0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_F_0100 start<====`);
        globalThis.keyCode = 2022;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2022);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_F_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_G_0100
     * @tc.name    : testGetKeyCodeEventG0100
     * @tc.desc    : Test whether the key KEY_G are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventG0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_G_0100 start<====`);
        globalThis.keyCode = 2023;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2023);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_G_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_H_0100
     * @tc.name    : testGetKeyCodeEventH0100
     * @tc.desc    : Test whether the key KEY_H are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventH0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_H_0100 start<====`);
        globalThis.keyCode = 2024;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2024);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_H_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_I_0100
     * @tc.name    : testGetKeyCodeEventI0100
     * @tc.desc    : Test whether the key KEY_I are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventI0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_I_0100 start<====`);
        globalThis.keyCode = 2025;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2025);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_I_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_J_0100
     * @tc.name    : testGetKeyCodeEventJ0100
     * @tc.desc    : Test whether the key KEY_J are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventJ0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_J_0100 start<====`);
        globalThis.keyCode = 2026;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2026);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_J_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_K_0100
     * @tc.name    : testGetKeyCodeEventK0100
     * @tc.desc    : Test whether the key KEY_K are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventK0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_K_0100 start<====`);
        globalThis.keyCode = 2027;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2027);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_K_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_L_0100
     * @tc.name    : testGetKeyCodeEventL0100
     * @tc.desc    : Test whether the key KEY_L are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventL0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_L_0100 start<====`);
        globalThis.keyCode = 2028;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2028);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_L_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_M_0100
     * @tc.name    : testGetKeyCodeEventM0100
     * @tc.desc    : Test whether the key KEY_M are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventM0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_M_0100 start<====`);
        globalThis.keyCode = 2029;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2029);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_M_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_N_0100
     * @tc.name    : testGetKeyCodeEventN0100
     * @tc.desc    : Test whether the key KEY_N are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventN0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_N_0100 start<====`);
        globalThis.keyCode = 2030;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2030);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_N_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_O_0100
     * @tc.name    : testGetKeyCodeEventO0100
     * @tc.desc    : Test whether the key KEY_O are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventO0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_O_0100 start<====`);
        globalThis.keyCode = 2031;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2031);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_O_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_P_0100
     * @tc.name    : testGetKeyCodeEventP0100
     * @tc.desc    : Test whether the key KEY_P are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventP0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_P_0100 start<====`);
        globalThis.keyCode = 2032;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2032);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_P_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_Q_0100
     * @tc.name    : testGetKeyCodeEventQ0100
     * @tc.desc    : Test whether the key KEY_Q are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventQ0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_Q_0100 start<====`);
        globalThis.keyCode = 2033;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2033);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_Q_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_R_0100
     * @tc.name    : testGetKeyCodeEventR0100
     * @tc.desc    : Test whether the key KEY_R are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventR0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_R_0100 start<====`);
        globalThis.keyCode = 2034;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2034);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_R_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_S_0100
     * @tc.name    : testGetKeyCodeEventS0100
     * @tc.desc    : Test whether the key KEY_S are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventS0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_S_0100 start<====`);
        globalThis.keyCode = 2035;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2035);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_S_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_T_0100
     * @tc.name    : testGetKeyCodeEventT0100
     * @tc.desc    : Test whether the key KEY_T are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventT0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_T_0100 start<====`);
        globalThis.keyCode = 2036;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2036);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_T_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_U_0100
     * @tc.name    : testGetKeyCodeEventU0100
     * @tc.desc    : Test whether the key KEY_U are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventU0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_U_0100 start<====`);
        globalThis.keyCode = 2037;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2037);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_U_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_V_0100
     * @tc.name    : testGetKeyCodeEventV0100
     * @tc.desc    : Test whether the key KEY_V are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventV0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_V_0100 start<====`);
        globalThis.keyCode = 2038;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2038);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_V_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_W_0100
     * @tc.name    : testGetKeyCodeEventW0100
     * @tc.desc    : Test whether the key KEY_W are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventW0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_W_0100 start<====`);
        globalThis.keyCode = 2039;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2039);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_W_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_X_0100
     * @tc.name    : testGetKeyCodeEventX0100
     * @tc.desc    : Test whether the key KEY_X are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventX0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_X_0100 start<====`);
        globalThis.keyCode = 2040;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2040);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_X_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_Y_0100
     * @tc.name    : testGetKeyCodeEventY0100
     * @tc.desc    : Test whether the key KEY_Y are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventY0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_Y_0100 start<====`);
        globalThis.keyCode = 2041;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2041);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_Y_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_Z_0100
     * @tc.name    : testGetKeyCodeEventZ0100
     * @tc.desc    : Test whether the key KEY_Z are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventZ0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_Z_0100 start<====`);
        globalThis.keyCode = 2042;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2042);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_Z_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_COMMA_0100
     * @tc.name    : testGetKeyCodeEventComma0100
     * @tc.desc    : Test whether the key KEY_COMMA are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventComma0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_COMMA_0100 start<====`);
        globalThis.keyCode = 2043;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2043);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_COMMA_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_PERIOD_0100
     * @tc.name    : testGetKeyCodeEventPeriod0100
     * @tc.desc    : Test whether the key KEY_PERIOD are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventPeriod0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_PERIOD_0100 start<====`);
        globalThis.keyCode = 2044;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2044);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_PERIOD_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_ALT_LEFT_0100
     * @tc.name    : testGetKeyCodeEventAltLeft0100
     * @tc.desc    : Test whether the key KEY_ALT_LEFT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventAltLeft0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_ALT_LEFT_0100 start<====`);
        globalThis.keyCode = 2045;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2045);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_ALT_LEFT_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_ALT_RIGHT_0100
     * @tc.name    : testGetKeyCodeEventAltRight0100
     * @tc.desc    : Test whether the key KEY_ALT_RIGHT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventAltRight0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_ALT_RIGHT_0100 start<====`);
        globalThis.keyCode = 2046;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2046);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_ALT_RIGHT_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SHIFT_LEFT_0100
     * @tc.name    : testGetKeyCodeEventShiftLeft0100
     * @tc.desc    : Test whether the key KEY_SHIFT_LEFT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventShiftLeft0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_SHIFT_LEFT_0100 start<====`);
        globalThis.keyCode = 2047;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2047);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_SHIFT_LEFT_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SHIFT_RIGHT_0100
     * @tc.name    : testGetKeyCodeEventShiftRight0100
     * @tc.desc    : Test whether the key KEY_SHIFT_RIGHT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventShiftRight0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_SHIFT_RIGHT_0100 start<====`);
        globalThis.keyCode = 2048;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2048);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_SHIFT_RIGHT_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_TAB_0100
     * @tc.name    : testGetKeyCodeEventTab0100
     * @tc.desc    : Test whether the key KEY_TAB are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventTab0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_TAB_0100 start<====`);
        globalThis.keyCode = 2049;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2049);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_TAB_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SPACE_0100
     * @tc.name    : testGetKeyCodeEventSpace0100
     * @tc.desc    : Test whether the key KEY_SPACE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventSpace0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_SPACE_0100 start<====`);
        globalThis.keyCode = 2050;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2050);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_SPACE_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SYM_0100
     * @tc.name    : testGetKeyCodeEventSym0100
     * @tc.desc    : Test whether the key KEY_SYM are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventSym0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_SYM_0100 start<====`);
        globalThis.keyCode = 2051;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2051);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_SYM_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_EXPLORER_0100
     * @tc.name    : testGetKeyCodeEventExplorer0100
     * @tc.desc    : Test whether the key KEY_EXPLORER are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventExplorer0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_EXPLORER_0100 start<====`);
        globalThis.keyCode = 2052;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2052);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_EXPLORER_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_ENVELOPE_0100
     * @tc.name    : testGetKeyCodeEventEnvelope0100
     * @tc.desc    : Test whether the key KEY_ENVELOPE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventEnvelope0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_ENVELOPE_0100 start<====`);
        globalThis.keyCode = 2053;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2053);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_ENVELOPE_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_ENTER_0100
     * @tc.name    : testGetKeyCodeEventEnter0100
     * @tc.desc    : Test whether the key KEY_ENTER are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventEnter0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_ENTER_0100 start<====`);
        globalThis.keyCode = 2054;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2054);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_ENTER_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_DEL_0100
     * @tc.name    : testGetKeyCodeEventDel0100
     * @tc.desc    : Test whether the key KEY_DEL are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventDel0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_DEL_0100 start<====`);
        globalThis.keyCode = 2055;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2055);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_DEL_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_APOSTROPHE_0100
     * @tc.name    : testGetKeyCodeEventApostrophe0100
     * @tc.desc    : Test whether the key KEY_APOSTROPHE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventApostrophe0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_APOSTROPHE_0100 start<====`);
        globalThis.keyCode = 2063;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2063);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_APOSTROPHE_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_GRAVE_0100
     * @tc.name    : testGetKeyCodeEventGrave0100
     * @tc.desc    : Test whether the key KEY_GRAVE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventGrave0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_GRAVE_0100 start<====`);
        globalThis.keyCode = 2056;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2056);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_GRAVE_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_MINUS_0100
     * @tc.name    : testGetKeyCodeEventMinus0100
     * @tc.desc    : Test whether the key KEY_MINUS are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventMinus0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_MINUS_0100 start<====`);
        globalThis.keyCode = 2057;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2057);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_MINUS_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_EQUALS_0100
     * @tc.name    : testGetKeyCodeEventEquals0100
     * @tc.desc    : Test whether the key KEY_EQUALS are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventEquals0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_EQUALS_0100 start<====`);
        globalThis.keyCode = 2058;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2058);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_EQUALS_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_LEFT_BRACKET_0100
     * @tc.name    : testGetKeyCodeEventLeftBracket0100
     * @tc.desc    : Test whether the key KEY_LEFT_BRACKET are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventLeftBracket0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_LEFT_BRACKET_0100 start<====`);
        globalThis.keyCode = 2059;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2059);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_LEFT_BRACKET_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_RIGHT_BRACKET_0100
     * @tc.name    : testGetKeyCodeEventRightBracket0100
     * @tc.desc    : Test whether the key KEY_RIGHT_BRACKET are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventRightBracket0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_RIGHT_BRACKET_0100 start<====`);
        globalThis.keyCode = 2060;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2060);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_RIGHT_BRACKET_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BACKSLASH_0100
     * @tc.name    : testGetKeyCodeEventBackslash0100
     * @tc.desc    : Test whether the key KEY_BACKSLASH are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventBackslash0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_BACKSLASH_0100 start<====`);
        globalThis.keyCode = 2061;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2061);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_BACKSLASH_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SEMICOLON_0100
     * @tc.name    : testGetKeyCodeEventSemicolon0100
     * @tc.desc    : Test whether the key KEY_SEMICOLON are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventSemicolon0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_SEMICOLON_0100 start<====`);
        globalThis.keyCode = 2062;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2062);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_SEMICOLON_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SLASH_0100
     * @tc.name    : testGetKeyCodeEventSlash0100
     * @tc.desc    : Test whether the key KEY_SLASH are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventSlash0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_SLASH_0100 start<====`);
        globalThis.keyCode = 2064;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2064);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_SLASH_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_AT_0100
     * @tc.name    : testGetKeyCodeEventAt0100
     * @tc.desc    : Test whether the key KEY_AT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventAt0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_AT_0100 start<====`);
        globalThis.keyCode = 2065;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2065);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_AT_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_PLUS_0100
     * @tc.name    : testGetKeyCodeEventPlus0100
     * @tc.desc    : Test whether the key KEY_PLUS are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventPlus0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_PLUS_0100 start<====`);
        globalThis.keyCode = 2066;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2066);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_PLUS_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_MENU_0100
     * @tc.name    : testGetKeyCodeEventMenu0100
     * @tc.desc    : Test whether the key KEY_MENU are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventMenu0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_MENU_0100 start<====`);
        globalThis.keyCode = 2067;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2067);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_MENU_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_PAGE_UP_0100
     * @tc.name    : testGetKeyCodeEventPageUp0100
     * @tc.desc    : Test whether the key KEY_PAGE_UP are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventPageUp0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_PAGE_UP_0100 start<====`);
        globalThis.keyCode = 2068;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2068);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_PAGE_UP_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_PAGE_DOWN_0100
     * @tc.name    : testGetKeyCodeEventPageDown0100
     * @tc.desc    : Test whether the key KEY_PAGE_DOWN are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventPageDown0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_PAGE_DOWN_0100 start<====`);
        globalThis.keyCode = 2069;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2069);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_PAGE_DOWN_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_ESCAPE_0100
     * @tc.name    : testGetKeyCodeEventEscape0100
     * @tc.desc    : Test whether the key KEY_ESCAPE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventEscape0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_ESCAPE_0100 start<====`);
        globalThis.keyCode = 2070;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2070);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_ESCAPE_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_FORWARD_DEL_0100
     * @tc.name    : testGetKeyCodeEventForwardDel0100
     * @tc.desc    : Test whether the key KEY_FORWARD_DEL are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventForwardDel0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_FORWARD_DEL_0100 start<====`);
        globalThis.keyCode = 2071;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2071);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_FORWARD_DEL_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_CTRL_LEFT_0100
     * @tc.name    : testGetKeyCodeEventCtrlLeft0100
     * @tc.desc    : Test whether the key KEY_CTRL_LEFT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventCtrlLeft0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_CTRL_LEFT_0100 start<====`);
        globalThis.keyCode = 2072;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2072);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_CTRL_LEFT_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_CTRL_RIGHT_0100
     * @tc.name    : testGetKeyCodeEventCtrlRight0100
     * @tc.desc    : Test whether the key KEY_CTRL_RIGHT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventCtrlRight0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_CTRL_RIGHT_0100 start<====`);
        globalThis.keyCode = 2073;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2073);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_CTRL_RIGHT_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_CAPS_LOCK_0100
     * @tc.name    : testGetKeyCodeEventCapsLock0100
     * @tc.desc    : Test whether the key KEY_CAPS_LOCK are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventCapsLock0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_CAPS_LOCK_0100 start<====`);
        globalThis.keyCode = 2074;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2074);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_CAPS_LOCK_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SCROLL_LOCK_0100
     * @tc.name    : testGetKeyCodeEventScrollLock0100
     * @tc.desc    : Test whether the key KEY_SCROLL_LOCK are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventScrollLock0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_SCROLL_LOCK_0100 start<====`);
        globalThis.keyCode = 2075;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2075);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_SCROLL_LOCK_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_META_LEFT_0100
     * @tc.name    : testGetKeyCodeEventMetaLeft0100
     * @tc.desc    : Test whether the key KEY_META_LEFT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventMetaLeft0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_META_LEFT_0100 start<====`);
        globalThis.keyCode = 2076;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2076);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_META_LEFT_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_META_RIGHT_0100
     * @tc.name    : testGetKeyCodeEventMetaRight0100
     * @tc.desc    : Test whether the key KEY_META_RIGHT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventMetaRight0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_META_RIGHT_0100 start<====`);
        globalThis.keyCode = 2077;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2077);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_META_RIGHT_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_FUNCTION_0100
     * @tc.name    : testGetKeyCodeEventFunction0100
     * @tc.desc    : Test whether the key KEY_FUNCTION are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventFunction0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_FUNCTION_0100 start<====`);
        globalThis.keyCode = 2078;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2078);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_FUNCTION_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SYSRQ_0100
     * @tc.name    : testGetKeyCodeEventSysRq0100
     * @tc.desc    : Test whether the key KEY_SYSRQ are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventSysRq0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_SYSRQ_0100 start<====`);
        globalThis.keyCode = 2079;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2079);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_SYSRQ_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BREAK_0100
     * @tc.name    : testGetKeyCodeEventBreak0100
     * @tc.desc    : Test whether the key KEY_BREAK are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventBreak0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_BREAK_0100 start<====`);
        globalThis.keyCode = 2080;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2080);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_BREAK_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_MOVE_HOME_0100
     * @tc.name    : testGetKeyCodeEventMoveHome0100
     * @tc.desc    : Test whether the key KEY_MOVE_HOME are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventMoveHome0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_MOVE_HOME_0100 start<====`);
        globalThis.keyCode = 2081;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2081);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_MOVE_HOME_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_MOVE_END_0100
     * @tc.name    : testGetKeyCodeEventMoveEnd0100
     * @tc.desc    : Test whether the key KEY_MOVE_END are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventMoveEnd0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_MOVE_END_0100 start<====`);
        globalThis.keyCode = 2082;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2082);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_MOVE_END_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_INSERT_0100
     * @tc.name    : testGetKeyCodeEventInsert0100
     * @tc.desc    : Test whether the key KEY_INSERT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventInsert0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_INSERT_0100 start<====`);
        globalThis.keyCode = 2083;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2083);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_INSERT_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_FORWARD_0100
     * @tc.name    : testGetKeyCodeEventForWord0100
     * @tc.desc    : Test whether the key KEY_FORWARD are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventForWord0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_FORWARD_0100 start<====`);
        globalThis.keyCode = 2084;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2084);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_FORWARD_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_MEDIA_PLAY_0100
     * @tc.name    : testGetKeyCodeEventMediaPlay0100
     * @tc.desc    : Test whether the key KEY_MEDIA_PLAY are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventMediaPlay0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_MEDIA_PLAY_0100 start<====`);
        globalThis.keyCode = 2085;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2085);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_MEDIA_PLAY_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_MEDIA_PAUSE_0100
     * @tc.name    : testGetKeyCodeEventMediaPause0100
     * @tc.desc    : Test whether the key KEY_MEDIA_PAUSE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventMediaPause0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_MEDIA_PAUSE_0100 start<====`);
        globalThis.keyCode = 2086;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2086);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_MEDIA_PAUSE_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_MEDIA_CLOSE_0100
     * @tc.name    : testGetKeyCodeEventMediaClose0100
     * @tc.desc    : Test whether the key KEY_MEDIA_CLOSE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventMediaClose0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_MEDIA_CLOSE_0100 start<====`);
        globalThis.keyCode = 2087;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2087);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_MEDIA_CLOSE_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_MEDIA_EJECT_0100
     * @tc.name    : testGetKeyCodeEventMediaEject0100
     * @tc.desc    : Test whether the key KEY_MEDIA_EJECT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventMediaEject0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_MEDIA_EJECT_0100 start<====`);
        globalThis.keyCode = 2088;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2088);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_MEDIA_EJECT_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_MEDIA_RECORD_0100
     * @tc.name    : testGetKeyCodeEventMediaRecord0100
     * @tc.desc    : Test whether the key KEY_MEDIA_RECORD are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventMediaRecord0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_MEDIA_RECORD_0100 start<====`);
        globalThis.keyCode = 2089;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2089);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_MEDIA_RECORD_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_F1_0100
     * @tc.name    : testGetKeyCodeEventF10100
     * @tc.desc    : Test whether the key KEY_F1 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventF10100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_F1_0100 start<====`);
        globalThis.keyCode = 2090;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2090);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_F1_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_F2_0100
     * @tc.name    : testGetKeyCodeEventF20100
     * @tc.desc    : Test whether the key KEY_F2 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventF20100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_F2_0100 start<====`);
        globalThis.keyCode = 2091;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2091);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_F2_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_F3_0100
     * @tc.name    : testGetKeyCodeEventF30100
     * @tc.desc    : Test whether the key KEY_F3 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventF30100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_F3_0100 start<====`);
        globalThis.keyCode = 2092;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2092);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_F3_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_F4_0100
     * @tc.name    : testGetKeyCodeEventF40100
     * @tc.desc    : Test whether the key KEY_F4 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventF40100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_F4_0100 start<====`);
        globalThis.keyCode = 2093;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2093);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_F4_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_F5_0100
     * @tc.name    : testGetKeyCodeEventF50100
     * @tc.desc    : Test whether the key KEY_F5 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventF50100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_F5_0100 start<====`);
        globalThis.keyCode = 2094;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2094);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_F5_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_F6_0100
     * @tc.name    : testGetKeyCodeEventF60100
     * @tc.desc    : Test whether the key KEY_F6 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventF60100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_F6_0100 start<====`);
        globalThis.keyCode = 2095;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2095);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_F6_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_F7_0100
     * @tc.name    : testGetKeyCodeEventF70100
     * @tc.desc    : Test whether the key KEY_F7 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventF70100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_F7_0100 start<====`);
        globalThis.keyCode = 2096;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2096);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_F7_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_F8_0100
     * @tc.name    : testGetKeyCodeEventF80100
     * @tc.desc    : Test whether the key KEY_F8 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventF80100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_F8_0100 start<====`);
        globalThis.keyCode = 2097;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2097);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_F8_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_F9_0100
     * @tc.name    : testGetKeyCodeEventF90100
     * @tc.desc    : Test whether the key KEY_F9 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventF90100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_F9_0100 start<====`);
        globalThis.keyCode = 2098;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2098);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_F9_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_F10_0100
     * @tc.name    : testGetKeyCodeEventF100100
     * @tc.desc    : Test whether the key KEY_F10 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventF100100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_F10_0100 start<====`);
        globalThis.keyCode = 2099;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2099);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_F10_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_F11_0100
     * @tc.name    : testGetKeyCodeEventF110100
     * @tc.desc    : Test whether the key KEY_F11 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventF110100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_F11_0100 start<====`);
        globalThis.keyCode = 2100;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2100);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_F11_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_F12_0100
     * @tc.name    : testGetKeyCodeEventF120100
     * @tc.desc    : Test whether the key KEY_F12 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventF120100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_F12_0100 start<====`);
        globalThis.keyCode = 2101;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2101);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_F12_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_NUM_LOCK_0100
     * @tc.name    : testGetKeyCodeEventNumLock0100
     * @tc.desc    : Test whether the key KEY_NUM_LOCK are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventNumLock0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUM_LOCK_0100 start<====`);
        globalThis.keyCode = 2102;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2102);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUM_LOCK_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_0_0100
     * @tc.name    : testGetKeyCodeEventNumpad00100
     * @tc.desc    : Test whether the key KEY_NUMPAD_0 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventNumpad00100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_0_0100 start<====`);
        globalThis.keyCode = 2103;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2103);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_0_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_1_0100
     * @tc.name    : testGetKeyCodeEventNumpad10100
     * @tc.desc    : Test whether the key KEY_NUMPAD_1 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventNumpad10100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_1_0100 start<====`);
        globalThis.keyCode = 2104;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2104);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_1_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_2_0100
     * @tc.name    : testGetKeyCodeEventNumpad20100
     * @tc.desc    : Test whether the key KEY_NUMPAD_2 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventNumpad20100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_2_0100 start<====`);
        globalThis.keyCode = 2105;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2105);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_2_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_3_0100
     * @tc.name    : testGetKeyCodeEventNumpad30100
     * @tc.desc    : Test whether the key KEY_NUMPAD_3 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventNumpad30100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_3_0100 start<====`);
        globalThis.keyCode = 2106;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2106);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_3_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_4_0100
     * @tc.name    : testGetKeyCodeEventNumpad40100
     * @tc.desc    : Test whether the key KEY_NUMPAD_4 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventNumpad40100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_4_0100 start<====`);
        globalThis.keyCode = 2107;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2107);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_4_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_5_0100
     * @tc.name    : testGetKeyCodeEventNumpad50100
     * @tc.desc    : Test whether the key KEY_NUMPAD_5 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventNumpad50100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_5_0100 start<====`);
        globalThis.keyCode = 2108;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2108);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_5_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_6_0100
     * @tc.name    : testGetKeyCodeEventNumpad60100
     * @tc.desc    : Test whether the key KEY_NUMPAD_6 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventNumpad60100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_6_0100 start<====`);
        globalThis.keyCode = 2109;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2109);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_6_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_7_0100
     * @tc.name    : testGetKeyCodeEventNumpad70100
     * @tc.desc    : Test whether the key KEY_NUMPAD_7 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventNumpad70100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_7_0100 start<====`);
        globalThis.keyCode = 2110;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2110);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_7_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_8_0100
     * @tc.name    : testGetKeyCodeEventNumpad80100
     * @tc.desc    : Test whether the key KEY_NUMPAD_8 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventNumpad80100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_8_0100 start<====`);
        globalThis.keyCode = 2111;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2111);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_8_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_9_0100
     * @tc.name    : testGetKeyCodeEventNumpad90100
     * @tc.desc    : Test whether the key KEY_NUMPAD_9 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventNumpad90100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_9_0100 start<====`);
        globalThis.keyCode = 2112;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2112);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_9_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_DIVIDE_0100
     * @tc.name    : testGetKeyCodeEventNumpadDivide0100
     * @tc.desc    : Test whether the key KEY_NUMPAD_DIVIDE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventNumpadDivide0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_DIVIDE_0100 start<====`);
        globalThis.keyCode = 2113;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2113);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_DIVIDE_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_MULTIPLY_0100
     * @tc.name    : testGetKeyCodeEventNumpadMultiply0100
     * @tc.desc    : Test whether the key KEY_NUMPAD_MULTIPLY are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventNumpadMultiply0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_MULTIPLY_0100 start<====`);
        globalThis.keyCode = 2114;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2114);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_MULTIPLY_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_SUBTRACT_0100
     * @tc.name    : testGetKeyCodeEventNumpadSubtract0100
     * @tc.desc    : Test whether the key KEY_NUMPAD_SUBTRACT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventNumpadSubtract0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_SUBTRACT_0100 start<====`);
        globalThis.keyCode = 2115;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2115);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_SUBTRACT_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_ADD_0100
     * @tc.name    : testGetKeyCodeEventNumpadAdd0100
     * @tc.desc    : Test whether the key KEY_NUMPAD_ADD are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventNumpadAdd0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_ADD_0100 start<====`);
        globalThis.keyCode = 2116;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2116);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_ADD_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_DOT_0100
     * @tc.name    : testGetKeyCodeEventNumpadDot0100
     * @tc.desc    : Test whether the key KEY_NUMPAD_DOT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventNumpadDot0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_DOT_0100 start<====`);
        globalThis.keyCode = 2117;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2117);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_DOT_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_COMMA_0100
     * @tc.name    : testGetKeyCodeEventNumpadComma0100
     * @tc.desc    : Test whether the key KEY_NUMPAD_COMMA are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventNumpadComma0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_COMMA_0100 start<====`);
        globalThis.keyCode = 2118;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2118);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_COMMA_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_ENTER_0100
     * @tc.name    : testGetKeyCodeEventNumpadEnter0100
     * @tc.desc    : Test whether the key KEY_NUMPAD_ENTER are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventNumpadEnter0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_ENTER_0100 start<====`);
        globalThis.keyCode = 2119;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2119);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_ENTER_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_EQUALS_0100
     * @tc.name    : testGetKeyCodeEventNumpadEquals0100
     * @tc.desc    : Test whether the key KEY_NUMPAD_EQUALS are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventNumpadEquals0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_EQUALS_0100 start<====`);
        globalThis.keyCode = 2120;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2120);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_EQUALS_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_LEFT_PAREN_0100
     * @tc.name    : testGetKeyCodeEventNumpadLeftParen0100
     * @tc.desc    : Test whether the key KEY_NUMPAD_LEFT_PAREN are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventNumpadLeftParen0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_LEFT_PAREN_0100 start<====`);
        globalThis.keyCode = 2121;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2121);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_LEFT_PAREN_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_RIGHT_PAREN_0100
     * @tc.name    : testGetKeyCodeEventNumpadRightParen0100
     * @tc.desc    : Test whether the key KEY_NUMPAD_RIGHT_PAREN are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventNumpadRightParen0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_RIGHT_PAREN_0100 start<====`);
        globalThis.keyCode = 2122;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2122);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_RIGHT_PAREN_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_VIRTUAL_MULTITASK_0100
     * @tc.name    : testGetKeyCodeEventVirtualMultitask0100
     * @tc.desc    : Test whether the key KEY_VIRTUAL_MULTITASK are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventVirtualMultitask0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_VIRTUAL_MULTITASK_0100 start<====`);
        globalThis.keyCode = 2210;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2210);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_VIRTUAL_MULTITASK_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SLEEP_0100
     * @tc.name    : testGetKeyCodeEventSleep0100
     * @tc.desc    : Test whether the key KEY_SLEEP are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventSleep0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_SLEEP_0100 start<====`);
        globalThis.keyCode = 2600;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2600);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_SLEEP_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_ZENKAKU_HANKAKU_0100
     * @tc.name    : testGetKeyCodeEventZenkakuHanKaKu0100
     * @tc.desc    : Test whether the key KEY_ZENKAKU_HANKAKU are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventZenkakuHanKaKu0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_ZENKAKU_HANKAKU_0100 start<====`);
        globalThis.keyCode = 2601;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2601);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_ZENKAKU_HANKAKU_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_102ND_0100
     * @tc.name    : testGetKeyCodeEvent102nd0100
     * @tc.desc    : Test whether the key KEY_102ND are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEvent102nd0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_102ND_0100 start<====`);
        globalThis.keyCode = 2602;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2602);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_102ND_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_RO_0100
     * @tc.name    : testGetKeyCodeEventRO0100
     * @tc.desc    : Test whether the key KEY_RO are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventRO0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_RO_0100 start<====`);
        globalThis.keyCode = 2603;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2603);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_RO_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_KATAKANA_0100
     * @tc.name    : testGetKeyCodeEventKatakana0100
     * @tc.desc    : Test whether the key KEY_KATAKANA are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventKatakana0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_KATAKANA_0100 start<====`);
        globalThis.keyCode = 2604;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2604);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_KATAKANA_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_HIRAGANA_0100
     * @tc.name    : testGetKeyCodeEventHiragana0100
     * @tc.desc    : Test whether the key KEY_HIRAGANA are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventHiragana0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_HIRAGANA_0100 start<====`);
        globalThis.keyCode = 2605;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2605);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_HIRAGANA_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_HENKAN_0100
     * @tc.name    : testGetKeyCodeEventHenKan0100
     * @tc.desc    : Test whether the key KEY_HENKAN are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventHenKan0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_HENKAN_0100 start<====`);
        globalThis.keyCode = 2606;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2606);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_HENKAN_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_KATAKANA_HIRAGANA_0100
     * @tc.name    : testGetKeyCodeEventKatakanaHiragana0100
     * @tc.desc    : Test whether the key KEY_KATAKANA_HIRAGANA are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventKatakanaHiragana0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_KATAKANA_HIRAGANA_0100 start<====`);
        globalThis.keyCode = 2607;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2607);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_KATAKANA_HIRAGANA_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_MUHENKAN_0100
     * @tc.name    : testGetKeyCodeEventMuhenkan0100
     * @tc.desc    : Test whether the key KEY_MUHENKAN are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventMuhenkan0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_MUHENKAN_0100 start<====`);
        globalThis.keyCode = 2608;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2608);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_MUHENKAN_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_LINEFEED_0100
     * @tc.name    : testGetKeyCodeEventLinefeed0100
     * @tc.desc    : Test whether the key KEY_LINEFEED are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventLinefeed0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_LINEFEED_0100 start<====`);
        globalThis.keyCode = 2609;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2609);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_LINEFEED_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_MACRO_0100
     * @tc.name    : testGetKeyCodeEventMacro0100
     * @tc.desc    : Test whether the key KEY_MACRO are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventMacro0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_MACRO_0100 start<====`);
        globalThis.keyCode = 2610;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2610);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_MACRO_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_PLUSMINUS_0100
     * @tc.name    : testGetKeyCodeEventNumpadPlusminus0100
     * @tc.desc    : Test whether the key KEY_NUMPAD_PLUSMINUS are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventNumpadPlusminus0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_PLUSMINUS_0100 start<====`);
        globalThis.keyCode = 2611;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2611);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_NUMPAD_PLUSMINUS_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SCALE_0100
     * @tc.name    : testGetKeyCodeEventScale0100
     * @tc.desc    : Test whether the key KEY_SCALE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventScale0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_SCALE_0100 start<====`);
        globalThis.keyCode = 2612;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2612);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_SCALE_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_HANGUEL_0100
     * @tc.name    : testGetKeyCodeEventHanguel0100
     * @tc.desc    : Test whether the key KEY_HANGUEL are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventHanguel0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_HANGUEL_0100 start<====`);
        globalThis.keyCode = 2613;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2613);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_HANGUEL_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_HANJA_0100
     * @tc.name    : testGetKeyCodeEventHanJa0100
     * @tc.desc    : Test whether the key KEY_HANJA are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventHanJa0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_HANJA_0100 start<====`);
        globalThis.keyCode = 2614;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2614);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_HANJA_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_YEN_0100
     * @tc.name    : testGetKeyCodeEventYen0100
     * @tc.desc    : Test whether the key KEY_YEN are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventYen0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_YEN_0100 start<====`);
        globalThis.keyCode = 2615;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2615);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_YEN_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_STOP_0100
     * @tc.name    : testGetKeyCodeEventStop0100
     * @tc.desc    : Test whether the key KEY_STOP are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventStop0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_STOP_0100 start<====`);
        globalThis.keyCode = 2616;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2616);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_STOP_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_AGAIN_0100
     * @tc.name    : testGetKeyCodeEventAgain0100
     * @tc.desc    : Test whether the key KEY_AGAIN are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventAgain0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_AGAIN_0100 start<====`);
        globalThis.keyCode = 2617;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2617);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_AGAIN_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_PROPS_0100
     * @tc.name    : testGetKeyCodeEventProps0100
     * @tc.desc    : Test whether the key KEY_PROPS are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventProps0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_PROPS_0100 start<====`);
        globalThis.keyCode = 2618;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2618);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_PROPS_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_UNDO_0100
     * @tc.name    : testGetKeyCodeEventUndo0100
     * @tc.desc    : Test whether the key KEY_UNDO are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventUndo0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_UNDO_0100 start<====`);
        globalThis.keyCode = 2619;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2619);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_UNDO_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_COPY_0100
     * @tc.name    : testGetKeyCodeEventCopy0100
     * @tc.desc    : Test whether the key KEY_COPY are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventCopy0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_COPY_0100 start<====`);
        globalThis.keyCode = 2620;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2620);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_COPY_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_OPEN_0100
     * @tc.name    : testGetKeyCodeEventOpen0100
     * @tc.desc    : Test whether the key KEY_OPEN are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventOpen0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_OPEN_0100 start<====`);
        globalThis.keyCode = 2621;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2621);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_OPEN_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_PASTE_0100
     * @tc.name    : testGetKeyCodeEventPaste0100
     * @tc.desc    : Test whether the key KEY_PASTE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventPaste0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_PASTE_0100 start<====`);
        globalThis.keyCode = 2622;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2622);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_PASTE_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_FIND_0100
     * @tc.name    : testGetKeyCodeEventFind0100
     * @tc.desc    : Test whether the key KEY_FIND are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventFind0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_FIND_0100 start<====`);
        globalThis.keyCode = 2623;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2623);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_FIND_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_CUT_0100
     * @tc.name    : testGetKeyCodeEventCut0100
     * @tc.desc    : Test whether the key KEY_CUT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventCut0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_CUT_0100 start<====`);
        globalThis.keyCode = 2624;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2624);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_CUT_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_HELP_0100
     * @tc.name    : testGetKeyCodeEventHelp0100
     * @tc.desc    : Test whether the key KEY_HELP are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventHelp0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_HELP_0100 start<====`);
        globalThis.keyCode = 2625;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2625);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_HELP_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_CALC_0100
     * @tc.name    : testGetKeyCodeEventCalc0100
     * @tc.desc    : Test whether the key KEY_CALC are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventCalc0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_CALC_0100 start<====`);
        globalThis.keyCode = 2626;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2626);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_CALC_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_FILE_0100
     * @tc.name    : testGetKeyCodeEventFile0100
     * @tc.desc    : Test whether the key KEY_FILE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventFile0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_FILE_0100 start<====`);
        globalThis.keyCode = 2627;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2627);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_FILE_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BOOKMARKS_0100
     * @tc.name    : testGetKeyCodeEventBookmarks0100
     * @tc.desc    : Test whether the key KEY_BOOKMARKS are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventBookmarks0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_BOOKMARKS_0100 start<====`);
        globalThis.keyCode = 2628;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2628);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_BOOKMARKS_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_NEXT_0100
     * @tc.name    : testGetKeyCodeEventNext0100
     * @tc.desc    : Test whether the key KEY_NEXT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventNext0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_NEXT_0100 start<====`);
        globalThis.keyCode = 2629;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2629);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_NEXT_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_PLAYPAUSE_0100
     * @tc.name    : testGetKeyCodeEventPlaypause0100
     * @tc.desc    : Test whether the key KEY_PLAYPAUSE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventPlaypause0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_PLAYPAUSE_0100 start<====`);
        globalThis.keyCode = 2630;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2630);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_PLAYPAUSE_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_PREVIOUS_0100
     * @tc.name    : testGetKeyCodeEventPrevious0100
     * @tc.desc    : Test whether the key KEY_PREVIOUS are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventPrevious0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_PREVIOUS_0100 start<====`);
        globalThis.keyCode = 2631;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2631);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_PREVIOUS_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_STOPCD_0100
     * @tc.name    : testGetKeyCodeEventStopcd0100
     * @tc.desc    : Test whether the key KEY_STOPCD are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventStopcd0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_STOPCD_0100 start<====`);
        globalThis.keyCode = 2632;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2632);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_STOPCD_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_CONFIG_0100
     * @tc.name    : testGetKeyCodeEventConfig0100
     * @tc.desc    : Test whether the key KEY_CONFIG are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventConfig0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_CONFIG_0100 start<====`);
        globalThis.keyCode = 2634;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2634);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_CONFIG_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_REFRESH_0100
     * @tc.name    : testGetKeyCodeEventRefresh0100
     * @tc.desc    : Test whether the key KEY_REFRESH are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventRefresh0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_REFRESH_0100 start<====`);
        globalThis.keyCode = 2635;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2635);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_REFRESH_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_EXIT_0100
     * @tc.name    : testGetKeyCodeEventExit0100
     * @tc.desc    : Test whether the key KEY_EXIT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventExit0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_EXIT_0100 start<====`);
        globalThis.keyCode = 2636;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2636);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_EXIT_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_EDIT_0100
     * @tc.name    : testGetKeyCodeEventEdit0100
     * @tc.desc    : Test whether the key KEY_EDIT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventEdit0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_EDIT_0100 start<====`);
        globalThis.keyCode = 2637;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2637);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_EDIT_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SCROLLUP_0100
     * @tc.name    : testGetKeyCodeEventScrollup0100
     * @tc.desc    : Test whether the key KEY_SCROLLUP are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventScrollup0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_SCROLLUP_0100 start<====`);
        globalThis.keyCode = 2638;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2638);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_SCROLLUP_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SCROLLDOWN_0100
     * @tc.name    : testGetKeyCodeEventScrolldown0100
     * @tc.desc    : Test whether the key KEY_SCROLLDOWN are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventScrolldown0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_SCROLLDOWN_0100 start<====`);
        globalThis.keyCode = 2639;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2639);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_SCROLLDOWN_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_NEW_0100
     * @tc.name    : testGetKeyCodeEventNew0100
     * @tc.desc    : Test whether the key KEY_NEW are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventNew0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_NEW_0100 start<====`);
        globalThis.keyCode = 2640;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2640);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_NEW_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_REDO_0100
     * @tc.name    : testGetKeyCodeEventRedo0100
     * @tc.desc    : Test whether the key KEY_REDO are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventRedo0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_REDO_0100 start<====`);
        globalThis.keyCode = 2641;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2641);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_REDO_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_CLOSE_0100
     * @tc.name    : testGetKeyCodeEventClose0100
     * @tc.desc    : Test whether the key KEY_CLOSE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventClose0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_CLOSE_0100 start<====`);
        globalThis.keyCode = 2642;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2642);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_CLOSE_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_PLAY_0100
     * @tc.name    : testGetKeyCodeEventPlay0100
     * @tc.desc    : Test whether the key KEY_PLAY are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventPlay0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_PLAY_0100 start<====`);
        globalThis.keyCode = 2643;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2643);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_PLAY_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BASSBOOST_0100
     * @tc.name    : testGetKeyCodeEventBassboost0100
     * @tc.desc    : Test whether the key KEY_BASSBOOST are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventBassboost0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_BASSBOOST_0100 start<====`);
        globalThis.keyCode = 2644;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2644);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_BASSBOOST_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_PRINT_0100
     * @tc.name    : testGetKeyCodeEventPrint0100
     * @tc.desc    : Test whether the key KEY_PRINT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventPrint0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_PRINT_0100 start<====`);
        globalThis.keyCode = 2645;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2645);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_PRINT_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_CHAT_0100
     * @tc.name    : testGetKeyCodeEventChat0100
     * @tc.desc    : Test whether the key KEY_CHAT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventChat0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_CHAT_0100 start<====`);
        globalThis.keyCode = 2646;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2646);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_CHAT_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_FINANCE_0100
     * @tc.name    : testGetKeyCodeEventFinance0100
     * @tc.desc    : Test whether the key KEY_FINANCE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventFinance0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_FINANCE_0100 start<====`);
        globalThis.keyCode = 2647;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2647);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_FINANCE_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_CANCEL_0100
     * @tc.name    : testGetKeyCodeEventCancel0100
     * @tc.desc    : Test whether the key KEY_CANCEL are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventCancel0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_CANCEL_0100 start<====`);
        globalThis.keyCode = 2648;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2648);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_CANCEL_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_KBDILLUM_TOGGLE_0100
     * @tc.name    : testGetKeyCodeEventKbdillumToggle0100
     * @tc.desc    : Test whether the key KEY_KBDILLUM_TOGGLE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventKbdillumToggle0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_KBDILLUM_TOGGLE_0100 start<====`);
        globalThis.keyCode = 2649;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2649);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_KBDILLUM_TOGGLE_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_KBDILLUM_DOWN_0100
     * @tc.name    : testGetKeyCodeEventKbdillumDown0100
     * @tc.desc    : Test whether the key KEY_KBDILLUM_DOWN are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventKbdillumDown0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_KBDILLUM_DOWN_0100 start<====`);
        globalThis.keyCode = 2650;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2650);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_KBDILLUM_DOWN_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_KBDILLUM_UP_0100
     * @tc.name    : testGetKeyCodeEventKbdillumUp0100
     * @tc.desc    : Test whether the key KEY_KBDILLUM_UP are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventKbdillumUp0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_KBDILLUM_UP_0100 start<====`);
        globalThis.keyCode = 2651;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2651);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_KBDILLUM_UP_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SEND_0100
     * @tc.name    : testGetKeyCodeEventSend0100
     * @tc.desc    : Test whether the key KEY_SEND are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventSend0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_SEND_0100 start<====`);
        globalThis.keyCode = 2652;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2652);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_SEND_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_REPLY_0100
     * @tc.name    : testGetKeyCodeEventReply0100
     * @tc.desc    : Test whether the key KEY_REPLY are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventReply0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_REPLY_0100 start<====`);
        globalThis.keyCode = 2653;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2653);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_REPLY_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_FORWARDMAIL_0100
     * @tc.name    : testGetKeyCodeEventForwardmail0100
     * @tc.desc    : Test whether the key KEY_FORWARDMAIL are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventForwardmail0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_FORWARDMAIL_0100 start<====`);
        globalThis.keyCode = 2654;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2654);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_FORWARDMAIL_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SAVE_0100
     * @tc.name    : testGetKeyCodeEventSave0100
     * @tc.desc    : Test whether the key KEY_SAVE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventSave0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_SAVE_0100 start<====`);
        globalThis.keyCode = 2655;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2655);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_SAVE_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_DOCUMENTS_0100
     * @tc.name    : testGetKeyCodeEventDocuments0100
     * @tc.desc    : Test whether the key KEY_DOCUMENTS are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventDocuments0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_DOCUMENTS_0100 start<====`);
        globalThis.keyCode = 2656;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2656);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_DOCUMENTS_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_VIDEO_NEXT_0100
     * @tc.name    : testGetKeyCodeEventVideoNext0100
     * @tc.desc    : Test whether the key KEY_VIDEO_NEXT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventVideoNext0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_VIDEO_NEXT_0100 start<====`);
        globalThis.keyCode = 2657;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2657);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_VIDEO_NEXT_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_VIDEO_PREV_0100
     * @tc.name    : testGetKeyCodeEventVideoPrev0100
     * @tc.desc    : Test whether the key KEY_VIDEO_PREV are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventVideoPrev0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_VIDEO_PREV_0100 start<====`);
        globalThis.keyCode = 2658;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2658);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_VIDEO_PREV_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BRIGHTNESS_CYCLE_0100
     * @tc.name    : testGetKeyCodeEventBrightnessCycle0100
     * @tc.desc    : Test whether the key KEY_BRIGHTNESS_CYCLE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventBrightnessCycle0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_BRIGHTNESS_CYCLE_0100 start<====`);
        globalThis.keyCode = 2659;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2659);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_BRIGHTNESS_CYCLE_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BRIGHTNESS_ZERO_0100
     * @tc.name    : testGetKeyCodeEventBrightnessZero0100
     * @tc.desc    : Test whether the key KEY_BRIGHTNESS_ZERO are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventBrightnessZero0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_BRIGHTNESS_ZERO_0100 start<====`);
        globalThis.keyCode = 2660;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2660);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_BRIGHTNESS_ZERO_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_DISPLAY_OFF_0100
     * @tc.name    : testGetKeyCodeEventDisplayOff0100
     * @tc.desc    : Test whether the key KEY_DISPLAY_OFF are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventDisplayOff0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_DISPLAY_OFF_0100 start<====`);
        globalThis.keyCode = 2661;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2661);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_DISPLAY_OFF_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BTN_MISC_0100
     * @tc.name    : testGetKeyCodeEventBtnMisc0100
     * @tc.desc    : Test whether the key KEY_BTN_MISC are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventBtnMisc0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_BTN_MISC_0100 start<====`);
        globalThis.keyCode = 2662;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2662);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_BTN_MISC_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_GOTO_0100
     * @tc.name    : testGetKeyCodeEventGoto0100
     * @tc.desc    : Test whether the key KEY_GOTO are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventGoto0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_GOTO_0100 start<====`);
        globalThis.keyCode = 2663;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2663);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_GOTO_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_INFO_0100
     * @tc.name    : testGetKeyCodeEventInfo0100
     * @tc.desc    : Test whether the key KEY_INFO are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventInfo0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_INFO_0100 start<====`);
        globalThis.keyCode = 2664;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2664);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_INFO_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_PROGRAM_0100
     * @tc.name    : testGetKeyCodeEventProgram0100
     * @tc.desc    : Test whether the key KEY_PROGRAM are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventProgram0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_PROGRAM_0100 start<====`);
        globalThis.keyCode = 2665;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2665);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_PROGRAM_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_PVR_0100
     * @tc.name    : testGetKeyCodeEventPvr0100
     * @tc.desc    : Test whether the key KEY_PVR are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventPvr0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_PVR_0100 start<====`);
        globalThis.keyCode = 2666;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2666);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_PVR_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SUBTITLE_0100
     * @tc.name    : testGetKeyCodeEventSubtitle0100
     * @tc.desc    : Test whether the key KEY_SUBTITLE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventSubtitle0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_SUBTITLE_0100 start<====`);
        globalThis.keyCode = 2667;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2667);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_SUBTITLE_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_FULL_SCREEN_0100
     * @tc.name    : testGetKeyCodeEventFullScreen0100
     * @tc.desc    : Test whether the key KEY_FULL_SCREEN are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventFullScreen0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_FULL_SCREEN_0100 start<====`);
        globalThis.keyCode = 2668;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2668);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_FULL_SCREEN_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_KEYBOARD_0100
     * @tc.name    : testGetKeyCodeEventKeyboard0100
     * @tc.desc    : Test whether the key KEY_KEYBOARD are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventKeyboard0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_KEYBOARD_0100 start<====`);
        globalThis.keyCode = 2669;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2669);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_KEYBOARD_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_ASPECT_RATIO_0100
     * @tc.name    : testGetKeyCodeEventAspectRatio0100
     * @tc.desc    : Test whether the key KEY_ASPECT_RATIO are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventAspectRatio0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_ASPECT_RATIO_0100 start<====`);
        globalThis.keyCode = 2670;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2670);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_ASPECT_RATIO_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_PC_0100
     * @tc.name    : testGetKeyCodeEventPc0100
     * @tc.desc    : Test whether the key KEY_PC are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventPc0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_PC_0100 start<====`);
        globalThis.keyCode = 2671;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2671);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_PC_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_TV_0100
     * @tc.name    : testGetKeyCodeEventTv0100
     * @tc.desc    : Test whether the key KEY_TV are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventTv0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_TV_0100 start<====`);
        globalThis.keyCode = 2672;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2672);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_TV_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_TV2_0100
     * @tc.name    : testGetKeyCodeEventTv20100
     * @tc.desc    : Test whether the key KEY_TV2 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventTv20100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_TV2_0100 start<====`);
        globalThis.keyCode = 2673;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2673);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_TV2_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_VCR_0100
     * @tc.name    : testGetKeyCodeEventVcr0100
     * @tc.desc    : Test whether the key KEY_VCR are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventVcr0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_VCR_0100 start<====`);
        globalThis.keyCode = 2674;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2674);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_VCR_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_VCR2_0100
     * @tc.name    : testGetKeyCodeEventVcr20100
     * @tc.desc    : Test whether the key KEY_VCR2 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventVcr20100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_VCR2_0100 start<====`);
        globalThis.keyCode = 2675;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2675);
        done();
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_VCR2_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SAT_0100
     * @tc.name    : testGetKeyCodeEventSat0100
     * @tc.desc    : Test whether the key KEY_SAT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventSat0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_SAT_0100 start<====`);
        globalThis.keyCode = 2676;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2676);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_SAT_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_CD_0100
     * @tc.name    : testGetKeyCodeEventCd0100
     * @tc.desc    : Test whether the key KEY_CD are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventCd0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_CD_0100 start<====`);
        globalThis.keyCode = 2677;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2677);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_CD_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_TAPE_0100
     * @tc.name    : testGetKeyCodeEventTape0100
     * @tc.desc    : Test whether the key KEY_TAPE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventTape0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_TAPE_0100 start<====`);
        globalThis.keyCode = 2678;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2678);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_TAPE_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_TUNER_0100
     * @tc.name    : testGetKeyCodeEventTuner0100
     * @tc.desc    : Test whether the key KEY_TUNER are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventTuner0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_TUNER_0100 start<====`);
        globalThis.keyCode = 2679;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2679);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_TUNER_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_PLAYER_0100
     * @tc.name    : testGetKeyCodeEventPlayer0100
     * @tc.desc    : Test whether the key KEY_PLAYER are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventPlayer0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_PLAYER_0100 start<====`);
        globalThis.keyCode = 2680;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2680);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_PLAYER_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_DVD_0100
     * @tc.name    : testGetKeyCodeEventDvd0100
     * @tc.desc    : Test whether the key KEY_DVD are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventDvd0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_DVD_0100 start<====`);
        globalThis.keyCode = 2681;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2681);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_DVD_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_AUDIO_0100
     * @tc.name    : testGetKeyCodeEventAudio0100
     * @tc.desc    : Test whether the key KEY_AUDIO are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventAudio0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_AUDIO_0100 start<====`);
        globalThis.keyCode = 2682;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2682);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_AUDIO_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_VIDEO_0100
     * @tc.name    : testGetKeyCodeEventVideo0100
     * @tc.desc    : Test whether the key KEY_VIDEO are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventVideo0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_VIDEO_0100 start<====`);
        globalThis.keyCode = 2683;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2683);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_VIDEO_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_MEMO_0100
     * @tc.name    : testGetKeyCodeEventMemo0100
     * @tc.desc    : Test whether the key KEY_MEMO are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventMemo0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_MEMO_0100 start<====`);
        globalThis.keyCode = 2684;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2684);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_MEMO_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_CALENDAR_0100
     * @tc.name    : testGetKeyCodeEventCalendar0100
     * @tc.desc    : Test whether the key KEY_CALENDAR are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventCalendar0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_CALENDAR_0100 start<====`);
        globalThis.keyCode = 2685;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2685);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_CALENDAR_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_RED_0100
     * @tc.name    : testGetKeyCodeEventRed0100
     * @tc.desc    : Test whether the key KEY_RED are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventRed0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_RED_0100 start<====`);
        globalThis.keyCode = 2686;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2686);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_RED_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_GREEN_0100
     * @tc.name    : testGetKeyCodeEventGreen0100
     * @tc.desc    : Test whether the key KEY_GREEN are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventGreen0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_GREEN_0100 start<====`);
        globalThis.keyCode = 2687;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2687);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_GREEN_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_YELLOW_0100
     * @tc.name    : testGetKeyCodeEventYellow0100
     * @tc.desc    : Test whether the key KEY_YELLOW are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventYellow0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_YELLOW_0100 start<====`);
        globalThis.keyCode = 2688;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2688);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_YELLOW_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BLUE_0100
     * @tc.name    : testGetKeyCodeEventBlue0100
     * @tc.desc    : Test whether the key KEY_BLUE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventBlue0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_BLUE_0100 start<====`);
        globalThis.keyCode = 2689;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2689);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_BLUE_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_CHANNELUP_0100
     * @tc.name    : testGetKeyCodeEventChannelup0100
     * @tc.desc    : Test whether the key KEY_CHANNELUP are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventChannelup0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_CHANNELUP_0100 start<====`);
        globalThis.keyCode = 2690;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2690);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_CHANNELUP_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_CHANNELDOWN_0100
     * @tc.name    : testGetKeyCodeEventChanneldown0100
     * @tc.desc    : Test whether the key KEY_CHANNELDOWN are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventChanneldown0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_CHANNELDOWN_0100 start<====`);
        globalThis.keyCode = 2691;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2691);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_CHANNELDOWN_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_LAST_0100
     * @tc.name    : testGetKeyCodeEventLast0100
     * @tc.desc    : Test whether the key KEY_LAST are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventLast0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_LAST_0100 start<====`);
        globalThis.keyCode = 2692;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2692);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_LAST_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_RESTART_0100
     * @tc.name    : testGetKeyCodeEventRestart0100
     * @tc.desc    : Test whether the key KEY_RESTART are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventRestart0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_RESTART_0100 start<====`);
        globalThis.keyCode = 2693;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2693);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_RESTART_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SLOW_0100
     * @tc.name    : testGetKeyCodeEventSlow0100
     * @tc.desc    : Test whether the key KEY_SLOW are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventSlow0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_SLOW_0100 start<====`);
        globalThis.keyCode = 2694;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2694);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_SLOW_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SHUFFLE_0100
     * @tc.name    : testGetKeyCodeEventShuffle0100
     * @tc.desc    : Test whether the key KEY_SHUFFLE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventShuffle0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_SHUFFLE_0100 start<====`);
        globalThis.keyCode = 2695;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2695);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_SHUFFLE_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_VIDEOPHONE_0100
     * @tc.name    : testGetKeyCodeEventVideophone0100
     * @tc.desc    : Test whether the key KEY_VIDEOPHONE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventVideophone0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_VIDEOPHONE_0100 start<====`);
        globalThis.keyCode = 2696;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2696);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_VIDEOPHONE_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_GAMES_0100
     * @tc.name    : testGetKeyCodeEventGames0100
     * @tc.desc    : Test whether the key KEY_GAMES are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventGames0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_GAMES_0100 start<====`);
        globalThis.keyCode = 2697;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2697);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_GAMES_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_ZOOMIN_0100
     * @tc.name    : testGetKeyCodeEventZoomin0100
     * @tc.desc    : Test whether the key KEY_ZOOMIN are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventZoomin0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_ZOOMIN_0100 start<====`);
        globalThis.keyCode = 2698;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2698);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_ZOOMIN_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_ZOOMOUT_0100
     * @tc.name    : testGetKeyCodeEventZoomout0100
     * @tc.desc    : Test whether the key KEY_ZOOMOUT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventZoomout0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_ZOOMOUT_0100 start<====`);
        globalThis.keyCode = 2699;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2699);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_ZOOMOUT_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_ZOOMRESET_0100
     * @tc.name    : testGetKeyCodeEventZoomreset0100
     * @tc.desc    : Test whether the key KEY_ZOOMRESET are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventZoomreset0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_ZOOMRESET_0100 start<====`);
        globalThis.keyCode = 2700;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2700);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_ZOOMRESET_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_WORDPROCESSOR_0100
     * @tc.name    : testGetKeyCodeEventWordprocessor0100
     * @tc.desc    : Test whether the key KEY_WORDPROCESSOR are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventWordprocessor0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_WORDPROCESSOR_0100 start<====`);
        globalThis.keyCode = 2701;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2701);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_WORDPROCESSOR_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_EDITOR_0100
     * @tc.name    : testGetKeyCodeEventEditor0100
     * @tc.desc    : Test whether the key KEY_EDITOR are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventEditor0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_EDITOR_0100 start<====`);
        globalThis.keyCode = 2702;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2702);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_EDITOR_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SPREADSHEET_0100
     * @tc.name    : testGetKeyCodeEventSpreadsheet0100
     * @tc.desc    : Test whether the key KEY_SPREADSHEET are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventSpreadsheet0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_SPREADSHEET_0100 start<====`);
        globalThis.keyCode = 2703;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2703);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_SPREADSHEET_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_GRAPHICSEDITOR_0100
     * @tc.name    : testGetKeyCodeEventGraphicseditor0100
     * @tc.desc    : Test whether the key KEY_GRAPHICSEDITOR are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventGraphicseditor0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_GRAPHICSEDITOR_0100 start<====`);
        globalThis.keyCode = 2704;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2704);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_GRAPHICSEDITOR_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_PRESENTATION_0100
     * @tc.name    : testGetKeyCodeEventPresentation0100
     * @tc.desc    : Test whether the key KEY_PRESENTATION are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventPresentation0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_PRESENTATION_0100 start<====`);
        globalThis.keyCode = 2705;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2705);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_PRESENTATION_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_DATABASE_0100
     * @tc.name    : testGetKeyCodeEventDatabase0100
     * @tc.desc    : Test whether the key KEY_DATABASE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventDatabase0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_DATABASE_0100 start<====`);
        globalThis.keyCode = 2706;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2706);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_DATABASE_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_NEWS_0100
     * @tc.name    : testGetKeyCodeEventNews0100
     * @tc.desc    : Test whether the key KEY_NEWS are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventNews0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_NEWS_0100 start<====`);
        globalThis.keyCode = 2707;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2707);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_NEWS_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_VOICEMAIL_0100
     * @tc.name    : testGetKeyCodeEventVoicemail0100
     * @tc.desc    : Test whether the key KEY_VOICEMAIL are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventVoicemail0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_VOICEMAIL_0100 start<====`);
        globalThis.keyCode = 2708;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2708);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_VOICEMAIL_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_ADDRESSBOOK_0100
     * @tc.name    : testGetKeyCodeEventAddressbook0100
     * @tc.desc    : Test whether the key KEY_ADDRESSBOOK are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventAddressbook0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_ADDRESSBOOK_0100 start<====`);
        globalThis.keyCode = 2709;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2709);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_ADDRESSBOOK_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_MESSENGER_0100
     * @tc.name    : testGetKeyCodeEventMessenger0100
     * @tc.desc    : Test whether the key KEY_MESSENGER are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventMessenger0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_MESSENGER_0100 start<====`);
        globalThis.keyCode = 2710;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2710);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_MESSENGER_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BRIGHTNESS_TOGGLE_0100
     * @tc.name    : testGetKeyCodeEventBrightnessToggle0100
     * @tc.desc    : Test whether the key KEY_BRIGHTNESS_TOGGLE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventBrightnessToggle0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_BRIGHTNESS_TOGGLE_0100 start<====`);
        globalThis.keyCode = 2711;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2711);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_BRIGHTNESS_TOGGLE_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SPELLCHECK_0100
     * @tc.name    : testGetKeyCodeEventSpellcheck0100
     * @tc.desc    : Test whether the key KEY_SPELLCHECK are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventSpellcheck0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_SPELLCHECK_0100 start<====`);
        globalThis.keyCode = 2712;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2712);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_SPELLCHECK_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_COFFEE_0100
     * @tc.name    : testGetKeyCodeEventCoffee0100
     * @tc.desc    : Test whether the key KEY_COFFEE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventCoffee0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_COFFEE_0100 start<====`);
        globalThis.keyCode = 2713;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2713);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_COFFEE_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_MEDIA_REPEAT_0100
     * @tc.name    : testGetKeyCodeEventMediaRepeat0100
     * @tc.desc    : Test whether the key KEY_MEDIA_REPEAT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventMediaRepeat0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_MEDIA_REPEAT_0100 start<====`);
        globalThis.keyCode = 2714;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2714);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_MEDIA_REPEAT_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_IMAGES_0100
     * @tc.name    : testGetKeyCodeEventImages0100
     * @tc.desc    : Test whether the key KEY_IMAGES are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventImages0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_IMAGES_0100 start<====`);
        globalThis.keyCode = 2715;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2715);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_IMAGES_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BUTTONCONFIG_0100
     * @tc.name    : testGetKeyCodeEventButtonconfig0100
     * @tc.desc    : Test whether the key KEY_BUTTONCONFIG are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventButtonconfig0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_BUTTONCONFIG_0100 start<====`);
        globalThis.keyCode = 2716;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2716);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_BUTTONCONFIG_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_TASKMANAGER_0100
     * @tc.name    : testGetKeyCodeEventTaskmanager0100
     * @tc.desc    : Test whether the key KEY_TASKMANAGER are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventTaskmanager0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_TASKMANAGER_0100 start<====`);
        globalThis.keyCode = 2717;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2717);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_TASKMANAGER_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_JOURNAL_0100
     * @tc.name    : testGetKeyCodeEventJournal0100
     * @tc.desc    : Test whether the key KEY_JOURNAL are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventJournal0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_JOURNAL_0100 start<====`);
        globalThis.keyCode = 2718;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2718);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_JOURNAL_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_CONTROLPANEL_0100
     * @tc.name    : testGetKeyCodeEventControlpanel0100
     * @tc.desc    : Test whether the key KEY_CONTROLPANEL are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventControlpanel0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_CONTROLPANEL_0100 start<====`);
        globalThis.keyCode = 2719;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2719);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_CONTROLPANEL_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_APPSELECT_0100
     * @tc.name    : testGetKeyCodeEventAppselect0100
     * @tc.desc    : Test whether the key KEY_APPSELECT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventAppselect0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_APPSELECT_0100 start<====`);
        globalThis.keyCode = 2720;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2720);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_APPSELECT_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SCREENSAVER_0100
     * @tc.name    : testGetKeyCodeEventScreensaver0100
     * @tc.desc    : Test whether the key KEY_SCREENSAVER are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventScreensaver0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_SCREENSAVER_0100 start<====`);
        globalThis.keyCode = 2721;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2721);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_SCREENSAVER_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_ASSISTANT_0100
     * @tc.name    : testGetKeyCodeEventAssistant0100
     * @tc.desc    : Test whether the key KEY_ASSISTANT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventAssistant0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_ASSISTANT_0100 start<====`);
        globalThis.keyCode = 2722;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2722);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_ASSISTANT_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_KBD_LAYOUT_NEXT_0100
     * @tc.name    : testGetKeyCodeEventKbdLayoutNext0100
     * @tc.desc    : Test whether the key KEY_KBD_LAYOUT_NEXT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventKbdLayoutNext0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_KBD_LAYOUT_NEXT_0100 start<====`);
        globalThis.keyCode = 2723;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2723);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_KBD_LAYOUT_NEXT_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BRIGHTNESS_MIN_0100
     * @tc.name    : testGetKeyCodeEventBrightnessMin0100
     * @tc.desc    : Test whether the key KEY_BRIGHTNESS_MIN are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventBrightnessMin0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_BRIGHTNESS_MIN_0100 start<====`);
        globalThis.keyCode = 2724;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2724);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_BRIGHTNESS_MIN_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BRIGHTNESS_MAX_0100
     * @tc.name    : testGetKeyCodeEventBrightnessMax0100
     * @tc.desc    : Test whether the key KEY_BRIGHTNESS_MAX are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventBrightnessMax0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_BRIGHTNESS_MAX_0100 start<====`);
        globalThis.keyCode = 2725;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2725);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_BRIGHTNESS_MAX_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_KBDINPUTASSIST_PREV_0100
     * @tc.name    : testGetKeyCodeEventKbdinputassistPrev0100
     * @tc.desc    : Test whether the key KEY_KBDINPUTASSIST_PREV are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventKbdinputassistPrev0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_KBDINPUTASSIST_PREV_0100 start<====`);
        globalThis.keyCode = 2726;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2726);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_KBDINPUTASSIST_PREV_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_KBDINPUTASSIST_NEXT_0100
     * @tc.name    : testGetKeyCodeEventKbdinputassistNext0100
     * @tc.desc    : Test whether the key KEY_KBDINPUTASSIST_NEXT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventKbdinputassistNext0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_KBDINPUTASSIST_NEXT_0100 start<====`);
        globalThis.keyCode = 2727;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2727);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_KBDINPUTASSIST_NEXT_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_KBDINPUTASSIST_PREVGROUP_0100
     * @tc.name    : testGetKeyCodeEventKbdinputassistPrevgroup0100
     * @tc.desc    : Test whether the key KEY_KBDINPUTASSIST_PREVGROUP are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventKbdinputassistPrevgroup0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_KBDINPUTASSIST_PREVGROUP_0100 start<====`);
        globalThis.keyCode = 2728;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2728);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_KBDINPUTASSIST_PREVGROUP_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_KBDINPUTASSIST_NEXTGROUP_0100
     * @tc.name    : testGetKeyCodeEventKbdinputassistNextgroup0100
     * @tc.desc    : Test whether the key KEY_KBDINPUTASSIST_NEXTGROUP are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventKbdinputassistNextgroup0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_KBDINPUTASSIST_NEXTGROUP_0100 start<====`);
        globalThis.keyCode = 2729;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2729);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_KBDINPUTASSIST_NEXTGROUP_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_KBDINPUTASSIST_ACCEPT_0100
     * @tc.name    : testGetKeyCodeEventKbdinputassistAccept0100
     * @tc.desc    : Test whether the key KEY_KBDINPUTASSIST_ACCEPT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventKbdinputassistAccept0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_KBDINPUTASSIST_ACCEPT_0100 start<====`);
        globalThis.keyCode = 2730;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2730);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_KBDINPUTASSIST_ACCEPT_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_KBDINPUTASSIST_CANCEL_0100
     * @tc.name    : testGetKeyCodeEventKbdinputassistCancel0100
     * @tc.desc    : Test whether the key KEY_KBDINPUTASSIST_CANCEL are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventKbdinputassistCancel0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_KBDINPUTASSIST_CANCEL_0100 start<====`);
        globalThis.keyCode = 2731;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2731);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_KBDINPUTASSIST_CANCEL_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_FRONT_0100
     * @tc.name    : testGetKeyCodeEventFront0100
     * @tc.desc    : Test whether the key KEY_FRONT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventFront0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_FRONT_0100 start<====`);
        globalThis.keyCode = 2800;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2800);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_FRONT_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SETUP_0100
     * @tc.name    : testGetKeyCodeEventSetup0100
     * @tc.desc    : Test whether the key KEY_SETUP are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventSetup0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_SETUP_0100 start<====`);
        globalThis.keyCode = 2801;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2801);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_SETUP_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_WAKEUP_0100
     * @tc.name    : testGetKeyCodeEventWakeup0100
     * @tc.desc    : Test whether the key KEY_WAKEUP are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventWakeup0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_WAKEUP_0100 start<====`);
        globalThis.keyCode = 2802;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2802);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_WAKEUP_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SENDFILE_0100
     * @tc.name    : testGetKeyCodeEventSendfile0100
     * @tc.desc    : Test whether the key KEY_SENDFILE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventSendfile0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_SENDFILE_0100 start<====`);
        globalThis.keyCode = 2803;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2803);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_SENDFILE_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_DELETEFILE_0100
     * @tc.name    : testGetKeyCodeEventDeletefile0100
     * @tc.desc    : Test whether the key KEY_DELETEFILE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventDeletefile0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_DELETEFILE_0100 start<====`);
        globalThis.keyCode = 2804;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2804);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_DELETEFILE_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_XFER_0100
     * @tc.name    : testGetKeyCodeEventXfer0100
     * @tc.desc    : Test whether the key KEY_XFER are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventXfer0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_XFER_0100 start<====`);
        globalThis.keyCode = 2805;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2805);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_XFER_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_PROG1_0100
     * @tc.name    : testGetKeyCodeEventProg10100
     * @tc.desc    : Test whether the key KEY_PROG1 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventProg10100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_PROG1_0100 start<====`);
        globalThis.keyCode = 2806;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2806);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_PROG1_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_PROG2_0100
     * @tc.name    : testGetKeyCodeEventProg20100
     * @tc.desc    : Test whether the key KEY_PROG2 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventProg20100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_PROG2_0100 start<====`);
        globalThis.keyCode = 2807;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2807);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_PROG2_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_MSDOS_0100
     * @tc.name    : testGetKeyCodeEventMsdos0100
     * @tc.desc    : Test whether the key KEY_MSDOS are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventMsdos0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_MSDOS_0100 start<====`);
        globalThis.keyCode = 2808;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2808);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_MSDOS_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SCREENLOCK_0100
     * @tc.name    : testGetKeyCodeEventScreenlock0100
     * @tc.desc    : Test whether the key KEY_SCREENLOCK are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventScreenlock0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_SCREENLOCK_0100 start<====`);
        globalThis.keyCode = 2809;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2809);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_SCREENLOCK_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_DIRECTION_ROTATE_DISPLAY_0100
     * @tc.name    : testGetKeyCodeEventDirectionRotateDisplay0100
     * @tc.desc    : Test whether the key KEY_DIRECTION_ROTATE_DISPLAY are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventDirectionRotateDisplay0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_DIRECTION_ROTATE_DISPLAY_0100 start<====`);
        globalThis.keyCode = 2810;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2810);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_DIRECTION_ROTATE_DISPLAY_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_CYCLEWINDOWS_0100
     * @tc.name    : testGetKeyCodeEventCyclewindows0100
     * @tc.desc    : Test whether the key KEY_CYCLEWINDOWS are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventCyclewindows0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_CYCLEWINDOWS_0100 start<====`);
        globalThis.keyCode = 2811;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2811);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_CYCLEWINDOWS_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_COMPUTER_0100
     * @tc.name    : testGetKeyCodeEventComputer0100
     * @tc.desc    : Test whether the key KEY_COMPUTER are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventComputer0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_COMPUTER_0100 start<====`);
        globalThis.keyCode = 2812;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2812);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_COMPUTER_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_EJECTCLOSECD_0100
     * @tc.name    : testGetKeyCodeEventEjectclosecd0100
     * @tc.desc    : Test whether the key KEY_EJECTCLOSECD are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventEjectclosecd0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_EJECTCLOSECD_0100 start<====`);
        globalThis.keyCode = 2813;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2813);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_EJECTCLOSECD_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_ISO_0100
     * @tc.name    : testGetKeyCodeEventIso0100
     * @tc.desc    : Test whether the key KEY_ISO are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventIso0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_ISO_0100 start<====`);
        globalThis.keyCode = 2814;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2814);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_ISO_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_MOVE_0100
     * @tc.name    : testGetKeyCodeEventMove0100
     * @tc.desc    : Test whether the key KEY_MOVE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventMove0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_MOVE_0100 start<====`);
        globalThis.keyCode = 2815;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2815);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_MOVE_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_F13_0100
     * @tc.name    : testGetKeyCodeEventF130100
     * @tc.desc    : Test whether the key KEY_F13 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventF130100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_F13_0100 start<====`);
        globalThis.keyCode = 2816;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2816);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_F13_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_F14_0100
     * @tc.name    : testGetKeyCodeEventF140100
     * @tc.desc    : Test whether the key KEY_F14 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventF140100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_F14_0100 start<====`);
        globalThis.keyCode = 2817;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2817);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_F14_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_F15_0100
     * @tc.name    : testGetKeyCodeEventF150100
     * @tc.desc    : Test whether the key KEY_F15 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventF150100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_F15_0100 start<====`);
        globalThis.keyCode = 2818;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2818);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_F15_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_F16_0100
     * @tc.name    : testGetKeyCodeEventF160100
     * @tc.desc    : Test whether the key KEY_F16 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventF160100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_F16_0100 start<====`);
        globalThis.keyCode = 2819;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2819);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_F16_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_F17_0100
     * @tc.name    : testGetKeyCodeEventF170100
     * @tc.desc    : Test whether the key KEY_F17 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventF170100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_F17_0100 start<====`);
        globalThis.keyCode = 2820;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2820);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_F17_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_F18_0100
     * @tc.name    : testGetKeyCodeEventF180100
     * @tc.desc    : Test whether the key KEY_F18 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventF180100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_F18_0100 start<====`);
        globalThis.keyCode = 2821;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2821);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_F18_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_F19_0100
     * @tc.name    : testGetKeyCodeEventF190100
     * @tc.desc    : Test whether the key KEY_F19 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventF190100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_F19_0100 start<====`);
        globalThis.keyCode = 2822;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2822);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_F19_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_F20_0100
     * @tc.name    : testGetKeyCodeEventF200100
     * @tc.desc    : Test whether the key KEY_F20 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventF200100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_F20_0100 start<====`);
        globalThis.keyCode = 2823;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2823);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_F20_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_F21_0100
     * @tc.name    : testGetKeyCodeEventF210100
     * @tc.desc    : Test whether the key KEY_F21 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventF210100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_F21_0100 start<====`);
        globalThis.keyCode = 2824;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2824);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_F21_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_F22_0100
     * @tc.name    : testGetKeyCodeEventF220100
     * @tc.desc    : Test whether the key KEY_F22 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventF220100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_F22_0100 start<====`);
        globalThis.keyCode = 2825;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2825);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_F22_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_F23_0100
     * @tc.name    : testGetKeyCodeEventF230100
     * @tc.desc    : Test whether the key KEY_F23 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventF230100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_F23_0100 start<====`);
        globalThis.keyCode = 2826;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2826);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_F23_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_F24_0100
     * @tc.name    : testGetKeyCodeEventF240100
     * @tc.desc    : Test whether the key KEY_F24 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventF240100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_F24_0100 start<====`);
        globalThis.keyCode = 2827;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2827);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_F24_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_PROG3_0100
     * @tc.name    : testGetKeyCodeEventProg30100
     * @tc.desc    : Test whether the key KEY_PROG3 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventProg30100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_PROG3_0100 start<====`);
        globalThis.keyCode = 2828;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2828);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_PROG3_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_PROG4_0100
     * @tc.name    : testGetKeyCodeEventProg40100
     * @tc.desc    : Test whether the key KEY_PROG4 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventProg40100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_PROG4_0100 start<====`);
        globalThis.keyCode = 2829;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2829);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_PROG4_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_DASHBOARD_0100
     * @tc.name    : testGetKeyCodeEventDashboard0100
     * @tc.desc    : Test whether the key KEY_DASHBOARD are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventDashboard0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_DASHBOARD_0100 start<====`);
        globalThis.keyCode = 2830;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2830);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_DASHBOARD_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SUSPEND_0100
     * @tc.name    : testGetKeyCodeEventSuspend0100
     * @tc.desc    : Test whether the key KEY_SUSPEND are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventSuspend0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_SUSPEND_0100 start<====`);
        globalThis.keyCode = 2831;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2831);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_SUSPEND_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_HP_0100
     * @tc.name    : testGetKeyCodeEventHp0100
     * @tc.desc    : Test whether the key KEY_HP are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventHp0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_HP_0100 start<====`);
        globalThis.keyCode = 2832;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2832);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_HP_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SOUND_0100
     * @tc.name    : testGetKeyCodeEventSound0100
     * @tc.desc    : Test whether the key KEY_SOUND are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventSound0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_SOUND_0100 start<====`);
        globalThis.keyCode = 2833;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2833);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_SOUND_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_QUESTION_0100
     * @tc.name    : testGetKeyCodeEventQuestion0100
     * @tc.desc    : Test whether the key KEY_QUESTION are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventQuestion0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_QUESTION_0100 start<====`);
        globalThis.keyCode = 2834;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2834);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_QUESTION_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_CONNECT_0100
     * @tc.name    : testGetKeyCodeEventConnect0100
     * @tc.desc    : Test whether the key KEY_CONNECT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventConnect0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_CONNECT_0100 start<====`);
        globalThis.keyCode = 2836;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2836);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_CONNECT_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SPORT_0100
     * @tc.name    : testGetKeyCodeEventSport0100
     * @tc.desc    : Test whether the key KEY_SPORT are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventSport0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_SPORT_0100 start<====`);
        globalThis.keyCode = 2837;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2837);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_SPORT_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SHOP_0100
     * @tc.name    : testGetKeyCodeEventShop0100
     * @tc.desc    : Test whether the key KEY_SHOP are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventShop0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_SHOP_0100 start<====`);
        globalThis.keyCode = 2838;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2838);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_SHOP_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_ALTERASE_0100
     * @tc.name    : testGetKeyCodeEventAlterase0100
     * @tc.desc    : Test whether the key KEY_ALTERASE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventAlterase0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_ALTERASE_0100 start<====`);
        globalThis.keyCode = 2839;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2839);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_ALTERASE_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_SWITCHVIDEOMODE_0100
     * @tc.name    : testGetKeyCodeEventSwitchvideomode0100
     * @tc.desc    : Test whether the key KEY_SWITCHVIDEOMODE are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventSwitchvideomode0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_SWITCHVIDEOMODE_0100 start<====`);
        globalThis.keyCode = 2841;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2841);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_SWITCHVIDEOMODE_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BATTERY_0100
     * @tc.name    : testGetKeyCodeEventBattery0100
     * @tc.desc    : Test whether the key KEY_BATTERY are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventBattery0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_BATTERY_0100 start<====`);
        globalThis.keyCode = 2842;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2842);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_BATTERY_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BLUETOOTH_0100
     * @tc.name    : testGetKeyCodeEventBluetooth0100
     * @tc.desc    : Test whether the key KEY_BLUETOOTH are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventBluetooth0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_BLUETOOTH_0100 start<====`);
        globalThis.keyCode = 2843;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2843);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_BLUETOOTH_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_WLAN_0100
     * @tc.name    : testGetKeyCodeEventWlan0100
     * @tc.desc    : Test whether the key KEY_WLAN are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventWlan0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_WLAN_0100 start<====`);
        globalThis.keyCode = 2844;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2844);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_WLAN_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_UWB_0100
     * @tc.name    : testGetKeyCodeEventUwb0100
     * @tc.desc    : Test whether the key KEY_UWB are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventUwb0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_UWB_0100 start<====`);
        globalThis.keyCode = 2845;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2845);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_UWB_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_WWAN_WIMAX_0100
     * @tc.name    : testGetKeyCodeEventWwanWimax0100
     * @tc.desc    : Test whether the key KEY_WWAN_WIMAX are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventWwanWimax0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_WWAN_WIMAX_0100 start<====`);
        globalThis.keyCode = 2846;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2846);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_WWAN_WIMAX_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_RFKILL_0100
     * @tc.name    : testGetKeyCodeEventRfkill0100
     * @tc.desc    : Test whether the key KEY_RFKILL are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventRfkill0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_RFKILL_0100 start<====`);
        globalThis.keyCode = 2847;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 2847);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_RFKILL_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_CHANNEL_0100
     * @tc.name    : testGetKeyCodeEventChannel0100
     * @tc.desc    : Test whether the key KEY_CHANNEL are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventChannel0100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_CHANNEL_0100 start<====`);
        globalThis.keyCode = 3001;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 3001);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_CHANNEL_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BTN_0_0100
     * @tc.name    : testGetKeyCodeEventBtn00100
     * @tc.desc    : Test whether the key KEY_BTN_0 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventBtn00100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_BTN_0_0100 start<====`);
        globalThis.keyCode = 3100;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 3100);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_BTN_0_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BTN_1_0100
     * @tc.name    : testGetKeyCodeEventBtn10100
     * @tc.desc    : Test whether the key KEY_BTN_1 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventBtn10100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_BTN_1_0100 start<====`);
        globalThis.keyCode = 3101;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 3101);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_BTN_1_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BTN_2_0100
     * @tc.name    : testGetKeyCodeEventBtn20100
     * @tc.desc    : Test whether the key KEY_BTN_2 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventBtn20100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_BTN_2_0100 start<====`);
        globalThis.keyCode = 3102;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 3102);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_BTN_2_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BTN_3_0100
     * @tc.name    : testGetKeyCodeEventBtn30100
     * @tc.desc    : Test whether the key KEY_BTN_3 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventBtn30100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_BTN_3_0100 start<====`);
        globalThis.keyCode = 3103;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 3103);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_BTN_3_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BTN_4_0100
     * @tc.name    : testGetKeyCodeEventBtn40100
     * @tc.desc    : Test whether the key KEY_BTN_4 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventBtn40100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_BTN_4_0100 start<====`);
        globalThis.keyCode = 3104;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 3104);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_BTN_4_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BTN_5_0100
     * @tc.name    : testGetKeyCodeEventBtn50100
     * @tc.desc    : Test whether the key KEY_BTN_5 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventBtn50100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_BTN_5_0100 start<====`);
        globalThis.keyCode = 3105;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 3105);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_BTN_5_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BTN_6_0100
     * @tc.name    : testGetKeyCodeEventBtn60100
     * @tc.desc    : Test whether the key KEY_BTN_6 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventBtn60100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_BTN_6_0100 start<====`);
        globalThis.keyCode = 3106;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 3106);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_BTN_6_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BTN_7_0100
     * @tc.name    : testGetKeyCodeEventBtn70100
     * @tc.desc    : Test whether the key KEY_BTN_7 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventBtn70100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_BTN_7_0100 start<====`);
        globalThis.keyCode = 3107;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 3107);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_BTN_7_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BTN_8_0100
     * @tc.name    : testGetKeyCodeEventBtn80100
     * @tc.desc    : Test whether the key KEY_BTN_8 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventBtn80100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_BTN_8_0100 start<====`);
        globalThis.keyCode = 3108;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 3108);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_BTN_8_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_KEY_BTN_9_0100
     * @tc.name    : testGetKeyCodeEventBtn90100
     * @tc.desc    : Test whether the key KEY_BTN_9 are working properly.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetKeyCodeEventBtn90100', TestType.FUNCTION |Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_KEY_BTN_9_0100 start<====`);
        globalThis.keyCode = 3109;
        await button.click();
        await Utils.sleep(10);
        let KeyResult: number = nativexcomopnentkeycode.GetKeyCodeResult();
        expect(KEY_CODE_SAME).assertEqual(KeyResult == 3109);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_KEY_BTN_9_0100 catch err: ` + err);
        expect(false).assertEqual(KEY_CODE_ERROR);
        done()
      }
    })
  })
}
