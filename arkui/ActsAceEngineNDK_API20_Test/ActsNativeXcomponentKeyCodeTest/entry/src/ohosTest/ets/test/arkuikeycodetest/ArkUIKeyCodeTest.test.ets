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
import arkuikeycodendk from 'libarkuikeycodendk.so'

const KEY_CODE_SAME = true;
const KEY_CODE_ERROR = 1;

export default function ArkUIKeyCodeNdkTest() {
  describe('ArkUIKeyCodeNdkTest', () => {
    let button: Component;
    beforeAll(async (done: Function) => {
      await Utils.pushPageNoClear(`ArkUIKeyCodeTest/ArkUIKeyCodeTest`, () => {});
      button = await Utils.driver.findComponent(ON.id("send"));
      done();
    })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_UNKNOWN_0100
     * @tc.name    : testGetArkUIKeyCodeEventUnknown0100
     * @tc.desc    : testing ARKUI_KEYCODE_UNKNOWN interface
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetArkUIKeyCodeEventUnknown0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testGetArkUIKeyCodeEventUnknown0100 start====");
          globalThis.keyCode = -1;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == -1);
          done();
        } catch (err) {
          console.error("====>testGetArkUIKeyCodeEventUnknown0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_FN_0100
     * @tc.name    : testARKUIKEYCODEFN0100
     * @tc.desc    : testing ARKUI_KEYCODE_FN interface
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testARKUIKEYCODEFN0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUIKEYCODEFN0100 start====");
          globalThis.keyCode = 0;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 0);
          done();
        } catch (err) {
          console.error("====>testARKUIKEYCODEFN0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done()
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_VOLUME_UP_0100
     * @tc.name    : testArkUIKeycodeVolumeUp0100
     * @tc.desc    : testing ARKUI_KEYCODE_VOLUME_UP_0100 interface
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeycodeVolumeUp0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeycodeVolumeUp0100 start====");
          globalThis.keyCode = 16;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 16);
          done();
        } catch (err) {
          console.error("====>testArkUIKeycodeVolumeUp0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_VOLUME_DOWN_0100
     * @tc.name    : testArkUIKeyCodeVolumeDown0100
     * @tc.desc    : testing ARKUI_KEYCODE_VOLUME_DOWN interface
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeVolumeDown0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeVolumeDown0100 start====");
          globalThis.keyCode = 17;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 17);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeVolumeDown0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    // /**
    //  * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_POWER_0100
    //  * @tc.name    : testArkUIKeyCodePower0100
    //  * @tc.desc    : testing ARKUI_KEYCODE_POWER interface
    //  * @tc.level   : Level1
    //  * @tc.size    : MediumTest
    //  * @tc.type    : Function
    //  */
    it('testArkUIKeyCodePower0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodePower0100 start====");
          globalThis.keyCode = 18;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 18);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodePower0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_CAMERA_0100
     * @tc.name    : testArkUIKeyCodeCamera0100
     * @tc.desc    : testing ARKUI_KEYCODE_CAMERA interface
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeCamera0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeCamera0100 start====");
          globalThis.keyCode = 19;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 19);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeCamera0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_VOLUME_MUTE_0100
     * @tc.name    : testArkUIKeyCodeVolumeMute0100
     * @tc.desc    : testing ARKUI_KEYCODE_VOLUME_MUTE interface
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeVolumeMute0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeVolumeMute0100 start====");
          globalThis.keyCode = 22;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 22);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeVolumeMute0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_MUTE_0100
     * @tc.name    : testArkUIKeyCodeMute0100
     * @tc.desc    : testing ARKUI_KEYCODE_MUTE_0100 interface
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeMute0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeMute0100 start====");
          globalThis.keyCode = 23;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 23);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeMute0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_BRIGHTNESS_UP_0100
     * @tc.name    : testArkUIKeyCodeBrightnessUp0100
     * @tc.desc    : testing ARKUI_KEYCODE_BRIGHTNESS_UP interface
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeBrightnessUp0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeBrightnessUp0100 start====");
          globalThis.keyCode = 40;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 40);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeBrightnessUp0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_BRIGHTNESS_DOWN_0100
     * @tc.name    : testArkUIKeyCodeBrightnessDown0100
     * @tc.desc    : testing ARKUI_KEYCODE_BRIGHTNESS_DOWN interface
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeBrightnessDown0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeBrightnessDown0100 start====");
          globalThis.keyCode = 41;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 41);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeBrightnessDown0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_0_0100
     * @tc.name    : testArkUIKeyCode0_0100
     * @tc.desc    : testing ARKUI_KEYCODE_0 interface
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCode0_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCode0_0100 start====");
          globalThis.keyCode = 2000;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2000);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCode0_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_1_0100
     * @tc.name    : testArkUIKeyCode1_0100
     * @tc.desc    : testing ARKUI_KEYCODE_1 interface
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCode1_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCode1_0100 start====");
          globalThis.keyCode = 2001;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2001);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCode1_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_2_0100
     * @tc.name    : testArkUIKeyCode2_0100
     * @tc.desc    : testing ARKUI_KEYCODE_2 interface
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCode2_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCode2_0100 start====");
          globalThis.keyCode = 2002;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2002);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCode2_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_3_0100
     * @tc.name    : testArkUIKeyCode3_0100
     * @tc.desc    : testing ARKUI_KEYCODE_3 interface
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCode3_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCode3_0100 start====");
          globalThis.keyCode = 2003;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2003);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCode3_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_4_0100
     * @tc.name    : testArkUIKeyCode4_0100
     * @tc.desc    : testing ARKUI_KEYCODE_4 interface
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCode4_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCode4_0100 start====");
          globalThis.keyCode = 2004;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2004);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCode4_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_5_0100
     * @tc.name    : testArkUIKeyCode5_0100
     * @tc.desc    : testing ARKUI_KEYCODE_5 interface
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCode5_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCode5_0100 start====");
          globalThis.keyCode = 2005;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2005);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCode5_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_6_0100
     * @tc.name    : testArkUIKeyCode6_0100
     * @tc.desc    : testing ARKUI_KEYCODE_6 interface
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCode6_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCode6_0100 start====");
          globalThis.keyCode = 2006;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2006);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCode6_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_7_0100
     * @tc.name    : testArkUIKeyCode7_0100
     * @tc.desc    : testing ARKUI_KEYCODE_7 interface
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCode7_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCode7_0100 start====");
          globalThis.keyCode = 2007;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2007);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCode7_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_8_0100
     * @tc.name    : testArkUIKeyCode8_0100
     * @tc.desc    : testing ARKUI_KEYCODE_8 interface
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCode8_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCode8_0100 start====");
          globalThis.keyCode = 2008;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2008);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCode8_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_9_0100
     * @tc.name    : testArkUIKeyCode9_0100
     * @tc.desc    : testing ARKUI_KEYCODE_9 interface
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCode9_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCode9_0100 start====");
          globalThis.keyCode = 2009;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2009);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCode9_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_STAR_0100
     * @tc.name    : testArkUIKeyCodeStar0100
     * @tc.desc    : testing ARKUI_KEYCODE_STAR interface
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeStar0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeStar0100 start====");
          globalThis.keyCode = 2010;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2010);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeStar0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_POUND_0100
     * @tc.name    : testArkUIKeyCodePound0100
     * @tc.desc    : testing ARKUI_KEYCODE_POUND interface
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodePound0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodePound0100 start====");
          globalThis.keyCode = 2011;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2011);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodePound0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_DPAD_UP_0100
     * @tc.name    : testArkUIKeyCodeDpadUp0100
     * @tc.desc    : testing ARKUI_KEYCODE_DPAD_UP interface
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeDpadUp0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeDpadUp0100 start====");
          globalThis.keyCode = 2012;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2012);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeDpadUp0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_DPAD_DOWN_0100
     * @tc.name    : testArkUIKeyCodeDpadDown0100
     * @tc.desc    : testing ARKUI_KEYCODE_DPAD_DOWN interface
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeDpadDown0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeDpadDown0100 start====");
          globalThis.keyCode = 2013;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2013);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeDpadDown0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_DPAD_LEFT_0100
     * @tc.name    : testArkUIKeyCodeDpadLeft0100
     * @tc.desc    : testing ARKUI_KEYCODE_DPAD_LEFT interface
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeDpadLeft0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeDpadLeft0100 start====");
          globalThis.keyCode = 2014;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2014);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeDpadLeft0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_DPAD_RIGHT_0100
     * @tc.name    : testArkUIKeyCodeDpadRight0100
     * @tc.desc    : testing ARKUI_KEYCODE_DPAD_RIGHT interface
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeDpadRight0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeDpadRight0100 start====");
          globalThis.keyCode = 2015;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2015);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeDpadRight0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_DPAD_CENTER_0100
     * @tc.name    : testArkUIKeyCodeDpadCenter0100
     * @tc.desc    : testing ARKUI_KEYCODE_DPAD_CENTER interface
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeDpadCenter0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeDpadCenter0100 start====");
          globalThis.keyCode = 2016;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2016);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeDpadCenter0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_A_0100
     * @tc.name    : testArkUIKeycodeA0100
     * @tc.desc    : testing ARKUI_KEYCODE_A interface
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeycodeA0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeycodeA0100 start====");
          globalThis.keyCode = 2017;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2017);
          done();
        } catch (err) {
          console.error("====>testArkUIKeycodeA0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_B_0100
     * @tc.name    : testArkUIKeycodeB0100
     * @tc.desc    : testing ARKUI_KEYCODE_B interface
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeycodeB0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeycodeB0100 start====");
          globalThis.keyCode = 2018;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2018);
          done();
        } catch (err) {
          console.error("====>testArkUIKeycodeB0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_C_0100
     * @tc.name    : testArkUIKeycodeC0100
     * @tc.desc    : testing ARKUI_KEYCODE_C interface
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeycodeC0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeycodeC0100 start====");
          globalThis.keyCode = 2019;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2019);
          done();
        } catch (err) {
          console.error("====>testArkUIKeycodeC0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_D_0100
     * @tc.name    : testArkUIKeycodeD0100
     * @tc.desc    : testing ARKUI_KEYCODE_D interface
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeycodeD0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeycodeD0100 start====");
          globalThis.keyCode = 2020;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2020);
          done();
        } catch (err) {
          console.error("====>testArkUIKeycodeD0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_E_0100
     * @tc.name    : testArkUIKeycodeE0100
     * @tc.desc    : testing ARKUI_KEYCODE_E interface
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeycodeE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeycodeE0100 start====");
          globalThis.keyCode = 2021;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2021);
          done();
        } catch (err) {
          console.error("====>testArkUIKeycodeE0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_F_0100
     * @tc.name    : testArkUIKeycodeF0100
     * @tc.desc    : testing ARKUI_KEYCODE_F interface
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeycodeF0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeycodeF0100 start====");
          globalThis.keyCode = 2022;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2022);
          done();
        } catch (err) {
          console.error("====>testArkUIKeycodeF0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_G_0100
     * @tc.name    : testArkUIKeycodeG0100
     * @tc.desc    : testing ARKUI_KEYCODE_G interface
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeycodeG0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeycodeG0100 start====");
          globalThis.keyCode = 2023;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2023);
          done();
        } catch (err) {
          console.error("====>testArkUIKeycodeG0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_H_0100
     * @tc.name    : testArkUIKeycodeH0100
     * @tc.desc    : testing ARKUI_KEYCODE_H interface
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeycodeH0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeycodeH0100 start====");
          globalThis.keyCode = 2024;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2024);
          done();
        } catch (err) {
          console.error("====>testArkUIKeycodeH0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_I_0100
     * @tc.name    : testArkUIKeycodeI0100
     * @tc.desc    : testing ARKUI_KEYCODE_I interface
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeycodeI0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeycodeI0100 start====");
          globalThis.keyCode = 2025;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2025);
          done();
        } catch (err) {
          console.error("====>testArkUIKeycodeI0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEYCODE_J_0100
     * @tc.name    : testArkuiKeycodeJ0100
     * @tc.desc    : Test whether the key ARKUI_KEYCODE_J are working properly.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkuiKeycodeJ0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkuiKeycodeJ0100 start====");
          globalThis.keyCode = 2026;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2026);
          done();
        } catch (err) {
          console.error("====>testArkuiKeycodeJ0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEYCODE_K_0100
     * @tc.name    : testArkuiKeycodeK0100
     * @tc.desc    : Test whether the key ARKUI_KEYCODE_K are working properly.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkuiKeycodeK0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkuiKeycodeK0100 start====");
          globalThis.keyCode = 2027;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2027);
          done();
        } catch (err) {
          console.error("====>testArkuiKeycodeK0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEYCODE_L_0100
     * @tc.name    : testArkuiKeycodeL0100
     * @tc.desc    : Test whether the key ARKUI_KEYCODE_L are working properly.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkuiKeycodeL0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkuiKeycodeL0100 start====");
          globalThis.keyCode = 2028;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2028);
          done();
        } catch (err) {
          console.error("====>testArkuiKeycodeL0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEYCODE_M_0100
     * @tc.name    : testArkuiKeycodeM0100
     * @tc.desc    : Test whether the key ARKUI_KEYCODE_M are working properly.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkuiKeycodeM0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkuiKeycodeM0100 start====");
          globalThis.keyCode = 2029;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2029);
          done();
        } catch (err) {
          console.error("====>testArkuiKeycodeM0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEYCODE_N_0100
     * @tc.name    : testArkuiKeycodeN0100
     * @tc.desc    : Test whether the key ARKUI_KEYCODE_N are working properly.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkuiKeycodeN0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkuiKeycodeN0100 start====");
          globalThis.keyCode = 2030;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2030);
          done();
        } catch (err) {
          console.error("====>testArkuiKeycodeN0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEYCODE_O_0100
     * @tc.name    : testArkuiKeycodeO0100
     * @tc.desc    : Test whether the key ARKUI_KEYCODE_O are working properly.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkuiKeycodeO0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkuiKeycodeO0100 start====");
          globalThis.keyCode = 2031;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2031);
          done();
        } catch (err) {
          console.error("====>testArkuiKeycodeO0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEYCODE_P_0100
     * @tc.name    : testArkuiKeycodeP0100
     * @tc.desc    : Test whether the key ARKUI_KEYCODE_P are working properly.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkuiKeycodeP0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkuiKeycodeP0100 start====");
          globalThis.keyCode = 2032;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2032);
          done();
        } catch (err) {
          console.error("====>testArkuiKeycodeP0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEYCODE_Q_0100
     * @tc.name    : testArkuiKeycodeQ0100
     * @tc.desc    : Test whether the key ARKUI_KEYCODE_Q are working properly.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkuiKeycodeQ0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkuiKeycodeQ0100 start====");
          globalThis.keyCode = 2033;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2033);
          done();
        } catch (err) {
          console.error("====>testArkuiKeycodeQ0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEYCODE_R_0100
     * @tc.name    : testArkuiKeycodeR0100
     * @tc.desc    : Test whether the key ARKUI_KEYCODE_R are working properly.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkuiKeycodeR0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkuiKeycodeR0100 start====");
          globalThis.keyCode = 2034;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2034);
          done();
        } catch (err) {
          console.error("====>testArkuiKeycodeR0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEYCODE_S_0100
     * @tc.name    : testArkuiKeycodeS0100
     * @tc.desc    : Test whether the key ARKUI_KEYCODE_S are working properly.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkuiKeycodeS0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkuiKeycodeS0100 start====");
          globalThis.keyCode = 2035;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2035);
          done();
        } catch (err) {
          console.error("====>testArkuiKeycodeS0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEYCODE_T_0100
     * @tc.name    : testArkuiKeycodeT0100
     * @tc.desc    : Test whether the key ARKUI_KEYCODE_T are working properly.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkuiKeycodeT0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkuiKeycodeT0100 start====");
          globalThis.keyCode = 2036;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2036);
          done();
        } catch (err) {
          console.error("====>testArkuiKeycodeT0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEYCODE_U_0100
     * @tc.name    : testArkuiKeycodeU0100
     * @tc.desc    : Test whether the key ARKUI_KEYCODE_U are working properly.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkuiKeycodeU0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkuiKeycodeU0100 start====");
          globalThis.keyCode = 2037;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2037);
          done();
        } catch (err) {
          console.error("====>testArkuiKeycodeU0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEYCODE_V_0100
     * @tc.name    : testArkuiKeycodeV0100
     * @tc.desc    : Test whether the key ARKUI_KEYCODE_V are working properly.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkuiKeycodeV0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkuiKeycodeV0100 start====");
          globalThis.keyCode = 2038;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2038);
          done();
        } catch (err) {
          console.error("====>testArkuiKeycodeV0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEYCODE_W_0100
     * @tc.name    : testArkuiKeycodeW0100
     * @tc.desc    : Test whether the key ARKUI_KEYCODE_W are working properly.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkuiKeycodeW0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkuiKeycodeW0100 start====");
          globalThis.keyCode = 2039;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2039);
          done();
        } catch (err) {
          console.error("====>testArkuiKeycodeW0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEYCODE_X_0100
     * @tc.name    : testArkuiKeycodeX0100
     * @tc.desc    : Test whether the key ARKUI_KEYCODE_X are working properly.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkuiKeycodeX0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkuiKeycodeX0100 start====");
          globalThis.keyCode = 2040;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2040);
          done();
        } catch (err) {
          console.error("====>testArkuiKeycodeX0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEYCODE_Y_0100
     * @tc.name    : testArkuiKeycodeY0100
     * @tc.desc    : Test whether the key ARKUI_KEYCODE_Y are working properly.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkuiKeycodeY0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkuiKeycodeY0100 start====");
          globalThis.keyCode = 2041;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2041);
          done();
        } catch (err) {
          console.error("====>testArkuiKeycodeY0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEYCODE_Z_0100
     * @tc.name    : testArkuiKeycodeZ0100
     * @tc.desc    : Test whether the key ARKUI_KEYCODE_Z are working properly.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkuiKeycodeZ0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkuiKeycodeZ0100 start====");
          globalThis.keyCode = 2042;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2042);
          done();
        } catch (err) {
          console.error("====>testArkuiKeycodeZ0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEYCODE_COMMA_0100
     * @tc.name    : testArkuiKeycodeComma0100
     * @tc.desc    : Test whether the key ARKUI_KEYCODE_COMMA are working properly.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkuiKeycodeComma0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkuiKeycodeComma0100 start====");
          globalThis.keyCode = 2043;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2043);
          done();
        } catch (err) {
          console.error("====>testArkuiKeycodeComma0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEYCODE_PERIOD_0100
     * @tc.name    : testArkuiKeycodePeriod0100
     * @tc.desc    : Test whether the key ARKUI_KEYCODE_PERIOD are working properly.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkuiKeycodePeriod0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkuiKeycodePeriod0100 start====");
          globalThis.keyCode = 2044;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2044);
          done();
        } catch (err) {
          console.error("====>testArkuiKeycodePeriod0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEYCODE_ALT_LEFT_0100
     * @tc.name    : testArkuiKeycodeAltLeft0100
     * @tc.desc    : Test whether the key ARKUI_KEYCODE_ALT_LEFT are working properly.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkuiKeycodeAltLeft0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkuiKeycodeAltLeft0100 start====");
          globalThis.keyCode = 2045;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2045);
          done();
        } catch (err) {
          console.error("====>testArkuiKeycodeAltLeft0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEYCODE_ALT_RIGHT_0100
     * @tc.name    : testArkuiKeycodeAltRight0100
     * @tc.desc    : Test whether the key ARKUI_KEYCODE_ALT_RIGHT are working properly.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkuiKeycodeAltRight0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkuiKeycodeAltRight0100 start====");
          globalThis.keyCode = 2046;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2046);
          done();
        } catch (err) {
          console.error("====>testArkuiKeycodeAltRight0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEYCODE_SHIFT_LEFT_0100
     * @tc.name    : testArkuiKeycodeShiftLeft0100
     * @tc.desc    : Test whether the key ARKUI_KEYCODE_SHIFT_LEFT are working properly.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkuiKeycodeShiftLeft0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkuiKeycodeShiftLeft0100 start====");
          globalThis.keyCode = 2047;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2047);
          done();
        } catch (err) {
          console.error("====>testArkuiKeycodeShiftLeft0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEYCODE_SHIFT_RIGHT_0100
     * @tc.name    : testArkuiKeycodeShiftRight0100
     * @tc.desc    : Test whether the key ARKUI_KEYCODE_SHIFT_RIGHT are working properly.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkuiKeycodeShiftRight0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkuiKeycodeShiftRight0100 start====");
          globalThis.keyCode = 2048;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2048);
          done();
        } catch (err) {
          console.error("====>testArkuiKeycodeShiftRight0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEYCODE_TAB_0100
     * @tc.name    : testArkuiKeycodeTab0100
     * @tc.desc    : Test whether the key ARKUI_KEYCODE_TAB are working properly.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkuiKeycodeTab0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkuiKeycodeTab0100 start====");
          globalThis.keyCode = 2049;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2049);
          done();
        } catch (err) {
          console.error("====>testArkuiKeycodeTab0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEYCODE_SPACE_0100
     * @tc.name    : testArkuiKeycodeSpace0100
     * @tc.desc    : Test whether the key ARKUI_KEYCODE_SPACE are working properly.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkuiKeycodeSpace0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkuiKeycodeSpace0100 start====");
          globalThis.keyCode = 2050;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2050);
          done();
        } catch (err) {
          console.error("====>testArkuiKeycodeSpace0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEYCODE_SYM_0100
     * @tc.name    : testArkuiKeycodeSym0100
     * @tc.desc    : Test whether the key ARKUI_KEYCODE_SYM are working properly.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkuiKeycodeSym0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkuiKeycodeSym0100 start====");
          globalThis.keyCode = 2051;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2051);
          done();
        } catch (err) {
          console.error("====>testArkuiKeycodeSym0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEYCODE_EXPLORER_0100
     * @tc.name    : testArkuiKeycodeExplorer0100
     * @tc.desc    : Test whether the key ARKUI_KEYCODE_EXPLORER are working properly.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkuiKeycodeExplorer0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkuiKeycodeExplorer0100 start====");
          globalThis.keyCode = 2052;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2052);
          done();
        } catch (err) {
          console.error("====>testArkuiKeycodeExplorer0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEYCODE_ENVELOPE_0100
     * @tc.name    : testArkuiKeycodeEnvelope0100
     * @tc.desc    : Test whether the key ARKUI_KEYCODE_ENVELOPE are working properly.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkuiKeycodeEnvelope0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkuiKeycodeEnvelope0100 start====");
          globalThis.keyCode = 2053;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2053);
          done();
        } catch (err) {
          console.error("====>testArkuiKeycodeEnvelope0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEYCODE_ENTER_0100
     * @tc.name    : testArkuiKeycodeEnter0100
     * @tc.desc    : Test whether the key ARKUI_KEYCODE_ENTER are working properly.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkuiKeycodeEnter0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkuiKeycodeEnter0100 start====");
          globalThis.keyCode = 2054;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2054);
          done();
        } catch (err) {
          console.error("====>testArkuiKeycodeEnter0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEYCODE_DEL_0100
     * @tc.name    : testArkuiKeycodeDel0100
     * @tc.desc    : Test whether the key ARKUI_KEYCODE_DEL are working properly.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkuiKeycodeDel0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkuiKeycodeDel0100 start====");
          globalThis.keyCode = 2055;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2055);
          done();
        } catch (err) {
          console.error("====>testArkuiKeycodeDel0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEYCODE_GRAVE_0100
     * @tc.name    : testArkuiKeycodeGrave0100
     * @tc.desc    : Test whether the key ARKUI_KEYCODE_GRAVE are working properly.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkuiKeycodeGrave0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkuiKeycodeGrave0100 start====");
          globalThis.keyCode = 2056;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2056);
          done();
        } catch (err) {
          console.error("====>testArkuiKeycodeGrave0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEYCODE_MINUS_0100
     * @tc.name    : testArkuiKeycodeMinus0100
     * @tc.desc    : Test whether the key ARKUI_KEYCODE_MINUS are working properly.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkuiKeycodeMinus0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkuiKeycodeMinus0100 start====");
          globalThis.keyCode = 2057;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2057);
          done();
        } catch (err) {
          console.error("====>testArkuiKeycodeMinus0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEYCODE_EQUALS_0100
     * @tc.name    : testArkuiKeycodeEquals0100
     * @tc.desc    : Test whether the key ARKUI_KEYCODE_EQUALS are working properly.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkuiKeycodeEquals0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkuiKeycodeEquals0100 start====");
          globalThis.keyCode = 2058;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2058);
          done();
        } catch (err) {
          console.error("====>testArkuiKeycodeEquals0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEYCODE_LEFT_BRACKET_0100
     * @tc.name    : testArkuiKeycodeLeftBracket0100
     * @tc.desc    : Test whether the key ARKUI_KEYCODE_LEFT_BRACKET are working properly.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkuiKeycodeLeftBracket0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkuiKeycodeLeftBracket0100 start====");
          globalThis.keyCode = 2059;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2059);
          done();
        } catch (err) {
          console.error("====>testArkuiKeycodeLeftBracket0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEYCODE_RIGHT_BRACKET_0100
     * @tc.name    : testArkuiKeycodeRightBracket0100
     * @tc.desc    : Test whether the key ARKUI_KEYCODE_RIGHT_BRACKET are working properly.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkuiKeycodeRightBracket0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkuiKeycodeRightBracket0100 start====");
          globalThis.keyCode = 2060;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2060);
          done();
        } catch (err) {
          console.error("====>testArkuiKeycodeRightBracket0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_KEYCODE_BACKSLASH_0100
     * @tc.name    : testArkuiKeycodeBacksLash0100
     * @tc.desc    : Test whether the key ARKUI_KEYCODE_BACKSLASH are working properly.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkuiKeycodeBacksLash0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkuiKeycodeBacksLash0100 start====");
          globalThis.keyCode = 2061;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2061);
          done();
        } catch (err) {
          console.error("====>testArkuiKeycodeBacksLash0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_SEMICOLON_0100
     * @tc.name    : testARKUIKEYCODESEMICOLON_0100
     * @tc.desc    : testing ARKUI_KEYCODE_SEMICOLON interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testARKUIKEYCODESEMICOLON_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUIKEYCODESEMICOLON_0100 start====");
          globalThis.keyCode = 2062;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2062);
          done();
        } catch (err) {
          console.error("====>testARKUIKEYCODESEMICOLON_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_APOSTROPHE_0100
     * @tc.name    : testARKUIKEYCODEAPOSTROPHE_0100
     * @tc.desc    : testing ARKUI_KEYCODE_APOSTROPHE interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testARKUIKEYCODEAPOSTROPHE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUIKEYCODEAPOSTROPHE_0100 start====");
          globalThis.keyCode = 2063;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2063);
          done();
        } catch (err) {
          console.error("====>testARKUIKEYCODEAPOSTROPHE_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_SLASH_0100
     * @tc.name    : testARKUIKEYCODESLASH_0100
     * @tc.desc    : testing ARKUI_KEYCODE_SLASH interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testARKUIKEYCODESLASH_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUIKEYCODESLASH_0100 start====");
          globalThis.keyCode = 2064;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2064);
          done();
        } catch (err) {
          console.error("====>testARKUIKEYCODESLASH_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_AT_0100
     * @tc.name    : testARKUIKEYCODEAT_0100
     * @tc.desc    : testing ARKUI_KEYCODE_AT interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testARKUIKEYCODEAT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUIKEYCODEAT_0100 start====");
          globalThis.keyCode = 2065;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2065);
          done();
        } catch (err) {
          console.error("====>testARKUIKEYCODEAT_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_PLUS_0100
     * @tc.name    : testARKUIKEYCODEPLUS_0100
     * @tc.desc    : testing ARKUI_KEYCODE_PLU interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testARKUIKEYCODEPLUS_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUIKEYCODEPLUS_0100 start====");
          globalThis.keyCode = 2066;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2066);
          done();
        } catch (err) {
          console.error("====>testARKUIKEYCODEPLUS_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_MENU_0100
     * @tc.name    : testARKUIKEYCODEMENU_0100
     * @tc.desc    : testing ARKUI_KEYCODE_MENU interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testARKUIKEYCODEMENU_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUIKEYCODEMENU_0100 start====");
          globalThis.keyCode = 2067;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2067);
          done();
        } catch (err) {
          console.error("====>testARKUIKEYCODEMENU_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_PAGE_UP_0100
     * @tc.name    : testARKUIKEYCODEPAGEUP_0100
     * @tc.desc    : testing ARKUI_KEYCODE_PAGE_UP interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testARKUIKEYCODEPAGEUP_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUIKEYCODEPAGEUP_0100 start====");
          globalThis.keyCode = 2068;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2068);
          done();
        } catch (err) {
          console.error("====>testARKUIKEYCODEPAGEUP_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_PAGE_DOWN_0100
     * @tc.name    : testARKUIKEYCODEPAGEDOWN_0100
     * @tc.desc    : testing ARKUI_KEYCODE_PAGE_DOWN interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testARKUIKEYCODEPAGEDOWN_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUIKEYCODEPAGEDOWN_0100 start====");
          globalThis.keyCode = 2069;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2069);
          done();
        } catch (err) {
          console.error("====>testARKUIKEYCODEPAGEDOWN_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_ESCAPE_0100
     * @tc.name    : testARKUIKEYCODEESCAPE_0100
     * @tc.desc    : testing ARKUI_KEYCODE_ESCAPE interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testARKUIKEYCODEESCAPE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUIKEYCODEESCAPE_0100 start====");
          globalThis.keyCode = 2070;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2070);
          done();
        } catch (err) {
          console.error("====>testARKUIKEYCODEESCAPE_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_FORWARD_DEL_0100
     * @tc.name    : testARKUIKEYCODEFORWARDDEL_0100
     * @tc.desc    : testing ARKUI_KEYCODE_FORWARD_DEL interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testARKUIKEYCODEFORWARDDEL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUIKEYCODEFORWARDDEL_0100 start====");
          globalThis.keyCode = 2071;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2071);
          done();
        } catch (err) {
          console.error("====>testARKUIKEYCODEFORWARDDEL_0100  catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_CTRL_LEFT_0100
     * @tc.name    : testARKUIKEYCODECTRLLEFT_0100
     * @tc.desc    : testing ARKUI_KEYCODE_CTRL_LEFT interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testARKUIKEYCODECTRLLEFT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUIKEYCODECTRLLEFT_0100 start====");
          globalThis.keyCode = 2072;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2072);
          done();
        } catch (err) {
          console.error("====>testARKUIKEYCODECTRLLEFT_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_CTRL_RIGHT_0100
     * @tc.name    : testARKUIKEYCODECTRLRIGHT_0100
     * @tc.desc    : testing ARKUI_KEYCODE_CTRL_RIGHT interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testARKUIKEYCODECTRLRIGHT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUIKEYCODECTRLRIGHT_0100 start====");
          globalThis.keyCode = 2073;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2073);
          done();
        } catch (err) {
          console.error("====>testARKUIKEYCODECTRLRIGHT_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_CAPS_LOCK_0100
     * @tc.name    : testARKUIKEYCODECAPSLOCK_0100
     * @tc.desc    : testing ARKUI_KEYCODE_CAPS_LOCK interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testARKUIKEYCODECAPSLOCK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUIKEYCODECAPSLOCK_0100 start====");
          globalThis.keyCode = 2074;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2074);
          done();
        } catch (err) {
          console.error("====>testARKUIKEYCODECAPSLOCK_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_SCROLL_LOCK_0100
     * @tc.name    : testARKUIKEYCODESCROLLLOCK_0100
     * @tc.desc    : testing ARKUI_KEYCODE_SCROLL_LOCK interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testARKUIKEYCODESCROLLLOCK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUIKEYCODESCROLLLOCK_0100 start====");
          globalThis.keyCode = 2075;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2075);
          done();
        } catch (err) {
          console.error("====>testARKUIKEYCODESCROLLLOCK_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_META_LEFT_0100
     * @tc.name    : testARKUIKEYCODEMETALEFT_0100
     * @tc.desc    : testing SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_META_LEFT interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testARKUIKEYCODEMETALEFT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUIKEYCODEMETALEFT_0100 start====");
          globalThis.keyCode = 2076;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2076);
          done();
        } catch (err) {
          console.error("====>testARKUIKEYCODEMETALEFT_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_META_RIGHT_0100
     * @tc.name    : testARKUIKEYCODEMETARIGHT_0100
     * @tc.desc    : testing SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_META_RIGHT interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testARKUIKEYCODEMETARIGHT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUIKEYCODEMETARIGHT_0100 start====");
          globalThis.keyCode = 2077;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2077);
          done();
        } catch (err) {
          console.error("====>testARKUIKEYCODEMETARIGHT_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_FUNCTION_0100
     * @tc.name    : testARKUIKEYCODEFUNCTION_0100
     * @tc.desc    : testing SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_FUNCTION interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testARKUIKEYCODEFUNCTION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUIKEYCODEFUNCTION_0100 start====");
          globalThis.keyCode = 2078;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2078);
          done();
        } catch (err) {
          console.error("====>testARKUIKEYCODEFUNCTION_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_SYSRQ_0100
     * @tc.name    : testARKUIKEYCODESYSRQ_0100
     * @tc.desc    : testing ARKUI_KEYCODE_SYSRQ interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testARKUIKEYCODESYSRQ_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUIKEYCODESYSRQ_0100 start====");
          globalThis.keyCode = 2079;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2079);
          done();
        } catch (err) {
          console.error("====>testARKUIKEYCODESYSRQ_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_BREAK_0100
     * @tc.name    : testARKUIKEYCODEBREAK_0100
     * @tc.desc    : testing ARKUI_KEYCODE_BREAK interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testARKUIKEYCODEBREAK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUIKEYCODEBREAK_0100 start====");
          globalThis.keyCode = 2080;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2080);
          done();
        } catch (err) {
          console.error("====>testARKUIKEYCODEBREAK_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_MOVE_HOME_0100
     * @tc.name    : testARKUIKEYCODEMOVEHOME_0100
     * @tc.desc    : testing ARKUI_KEYCODE_MOVE_HOME interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testARKUIKEYCODEMOVEHOME_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUIKEYCODEMOVEHOME_0100 start====");
          globalThis.keyCode = 2081;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2081);
          done();
        } catch (err) {
          console.error("====>testARKUIKEYCODEMOVEHOME_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_MOVE_END_0100
     * @tc.name    : testARKUIKEYCODEMOVEEND_0100
     * @tc.desc    : testing ARKUI_KEYCODE_MOVE_END interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testARKUIKEYCODEMOVEEND_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUIKEYCODEMOVEEND_0100 start====");
          globalThis.keyCode = 2082;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2082);
          done();
        } catch (err) {
          console.error("====>testARKUIKEYCODEMOVEEND_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_INSERT_0100
     * @tc.name    : testARKUIKEYCODEINSERT_0100
     * @tc.desc    : testing ARKUI_KEYCODE_INSERT interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testARKUIKEYCODEINSERT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUIKEYCODEINSERT_0100 start====");
          globalThis.keyCode = 2083;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2083);
          done();
        } catch (err) {
          console.error("====>testARKUIKEYCODEINSERT_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_FORWARD_0100
     * @tc.name    : testARKUIKEYCODEFORWARD_0100
     * @tc.desc    : testing ARKUI_KEYCODE_FORWARD interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testARKUIKEYCODEFORWARD_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUIKEYCODEFORWARD_0100 start====");
          globalThis.keyCode = 2084;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2084);
          done();
        } catch (err) {
          console.error("====>testARKUIKEYCODEFORWARD_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_MEDIA_PLAY_0100
     * @tc.name    : testARKUIKEYCODEMEDIAPLAY_0100
     * @tc.desc    : testing ARKUI_KEYCODE_MEDIA_PLAY interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testARKUIKEYCODEMEDIAPLAY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUIKEYCODEMEDIAPLAY_0100 start====");
          globalThis.keyCode = 2085;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2085);
          done();
        } catch (err) {
          console.error("====>testARKUIKEYCODEMEDIAPLAY_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_MEDIA_PAUSE_0100
     * @tc.name    : testARKUIKEYCODEMEDIAPAUSE_0100
     * @tc.desc    : testing ARKUI_KEYCODE_MEDIA_PAUSE interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testARKUIKEYCODEMEDIAPAUSE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUIKEYCODEMEDIAPAUSE_0100 start====");
          globalThis.keyCode = 2086;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2086);
          done();
        } catch (err) {
          console.error("====>testARKUIKEYCODEMEDIAPAUSE_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_MEDIA_CLOSE_0100
     * @tc.name    : testARKUIKEYCODEMEDIACLOSE_0100
     * @tc.desc    : testing ARKUI_KEYCODE_MEDIA_CLOSE interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testARKUIKEYCODEMEDIACLOSE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUIKEYCODEMEDIACLOSE_0100 start====");
          globalThis.keyCode = 2087;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2087);
          done();
        } catch (err) {
          console.error("====>testARKUIKEYCODEMEDIACLOSE_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_MEDIA_EJECT_0100
     * @tc.name    : testARKUIKEYCODEMEDIAEJECT_0100
     * @tc.desc    : testing ARKUI_KEYCODE_MEDIA_EJECT interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testARKUIKEYCODEMEDIAEJECT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUIKEYCODEMEDIAEJECT_0100 start====");
          globalThis.keyCode = 2088;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2088);
          done();
        } catch (err) {
          console.error("====>testARKUIKEYCODEMEDIAEJECT_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_MEDIA_RECORD_0100
     * @tc.name    : testARKUIKEYCODEMEDIARECORD_0100
     * @tc.desc    : testing ARKUI_KEYCODE_MEDIA_RECORD interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testARKUIKEYCODEMEDIARECORD_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUIKEYCODEMEDIARECORD_0100 start====");
          globalThis.keyCode = 2089;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2089);
          done();
        } catch (err) {
          console.error("====>testARKUIKEYCODEMEDIARECORD_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_F1_0100
     * @tc.name    : testARKUIKEYCODEF1_0100
     * @tc.desc    : testing ARKUI_KEYCODE_F1 interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testARKUIKEYCODEF1_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUIKEYCODEF1_0100 start====");
          globalThis.keyCode = 2090;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2090);
          done();
        } catch (err) {
          console.error("====>testARKUIKEYCODEF1_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_F2_0100
     * @tc.name    : testARKUIKEYCODEF2_0100
     * @tc.desc    : testing ARKUI_KEYCODE_F2 interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testARKUIKEYCODEF2_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUIKEYCODEF2_0100 start====");
          globalThis.keyCode = 2091;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2091);
          done();
        } catch (err) {
          console.error("====>testARKUIKEYCODEF2_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_F3_0100
     * @tc.name    : testARKUIKEYCODEF3_0100
     * @tc.desc    : testing ARKUI_KEYCODE_F3 interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testARKUIKEYCODEF3_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUIKEYCODEF3_0100 start====");
          globalThis.keyCode = 2092;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2092);
          done();
        } catch (err) {
          console.error("====>testARKUIKEYCODEF3_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_F4_0100
     * @tc.name    : testARKUIKEYCODEF4_0100
     * @tc.desc    : testing ARKUI_KEYCODE_F4 interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testARKUIKEYCODEF4_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUIKEYCODEF4_0100 start====");
          globalThis.keyCode = 2093;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2093);
          done();
        } catch (err) {
          console.error("====>testARKUIKEYCODEF4_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_F5_0100
     * @tc.name    : testARKUIKEYCODEF5_0100
     * @tc.desc    : testing ARKUI_KEYCODE_F5 interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testARKUIKEYCODEF5_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUIKEYCODEF5_0100 start====");
          globalThis.keyCode = 2094;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2094);
          done();
        } catch (err) {
          console.error("====>testARKUIKEYCODEF5_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_F6_0100
     * @tc.name    : testARKUIKEYCODEF6_0100
     * @tc.desc    : testing ARKUI_KEYCODE_F6 interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testARKUIKEYCODEF6_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUIKEYCODEF6_0100 start====");
          globalThis.keyCode = 2095;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2095);
          done();
        } catch (err) {
          console.error("====>testARKUIKEYCODEF6_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_F7_0100
     * @tc.name    : testARKUIKEYCODEF7_0100
     * @tc.desc    : testing ARKUI_KEYCODE_F7 interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testARKUIKEYCODEF7_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUIKEYCODEF7_0100 start====");
          globalThis.keyCode = 2096;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2096);
          done();
        } catch (err) {
          console.error("====>testARKUIKEYCODEF7_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_F8_0100
     * @tc.name    : testARKUIKEYCODEF8_0100
     * @tc.desc    : testing ARKUI_KEYCODE_F8 interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testARKUIKEYCODEF8_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUIKEYCODEF8_0100 start====");
          globalThis.keyCode = 2097;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2097);
          done();
        } catch (err) {
          console.error("====>testARKUIKEYCODEF8_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_F9_0100
     * @tc.name    : testARKUIKEYCODEF9_0100
     * @tc.desc    : testing ARKUI_KEYCODE_F9 interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testARKUIKEYCODEF9_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testARKUIKEYCODEF9_0100 start====");
          globalThis.keyCode = 2098;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2098);
          done();
        } catch (err) {
          console.error("====>testARKUIKEYCODEF9_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_F10_0100
     * @tc.name    : testArkuiKeyCodeF100100
     * @tc.desc    : Test ARKUI_KEYCODE_F10 interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkuiKeyCodeF100100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("testArkuiKeyCodeF100100 start====");
          globalThis.keyCode = 2099;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2099);
          done();
        } catch (err) {
          console.error("testArkuiKeyCodeF100100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_F11_0100
     * @tc.name    : testArkUIKeyCodeF110100
     * @tc.desc    : testing ARKUI_KEYCODE_F11 interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeF110100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeF110100 start====");
          globalThis.keyCode = 2100;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2100);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeF110100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_F12_0100
     * @tc.name    : testArkUIKeyCodeF120100
     * @tc.desc    : testing ARKUI_KEYCODE_F12 interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeF120100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeF120100 start====");
          globalThis.keyCode = 2101;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2101);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeF120100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_NUM_LOCK_0100
     * @tc.name    : testArkUIKeyCodeNumLock0100
     * @tc.desc    : testing ARKUI_KEYCODE_NUM_LOCK interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeNumLock0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeNumLock0100 start====");
          globalThis.keyCode = 2102;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2102);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeNumLock0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_NUMPAD_0_0100
     * @tc.name    : testArkUIKeyCodeNumpad00100
     * @tc.desc    : testing ARKUI_KEYCODE_NUMPAD_0 interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeNumpad00100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeNumpad00100 start====");
          globalThis.keyCode = 2103;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2103);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeNumpad00100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_NUMPAD_1_0100
     * @tc.name    : testArkUIKeyCodeNumpad10100
     * @tc.desc    : testing ARKUI_KEYCODE_NUMPAD_1 interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeNumpad10100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeNumpad10100 start====");
          globalThis.keyCode = 2104;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2104);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeNumpad10100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_NUMPAD_2_0100
     * @tc.name    : testArkUIKeyCodeNumpad20100
     * @tc.desc    : testing ARKUI_KEYCODE_NUMPAD_2 interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeNumpad20100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeNumpad20100 start====");
          globalThis.keyCode = 2105;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2105);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeNumpad20100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_NUMPAD_3_0100
     * @tc.name    : testArkUIKeyCodeNumpad30100
     * @tc.desc    : testing ARKUI_KEYCODE_NUMPAD_3 interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeNumpad30100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeNumpad30100 start====");
          globalThis.keyCode = 2106;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2106);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeNumpad30100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_NUMPAD_4_0100
     * @tc.name    : testArkUIKeyCodeNumpad40100
     * @tc.desc    : testing ARKUI_KEYCODE_NUMPAD_4 interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeNumpad40100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeNumpad40100 start====");
          globalThis.keyCode = 2107;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2107);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeNumpad40100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_NUMPAD_5_0100
     * @tc.name    : testArkUIKeyCodeNumpad50100
     * @tc.desc    : testing ARKUI_KEYCODE_NUMPAD_5 interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeNumpad50100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeNumpad50100 start====");
          globalThis.keyCode = 2108;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2108);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeNumpad50100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_NUMPAD_6_0100
     * @tc.name    : testArkUIKeyCodeNumpad60100
     * @tc.desc    : testing ARKUI_KEYCODE_NUMPAD_6 interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeNumpad60100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeNumpad60100 start====");
          globalThis.keyCode = 2109;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2109);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeNumpad60100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_NUMPAD_7_0100
     * @tc.name    : testArkUIKeyCodeNumpad70100
     * @tc.desc    : testing ARKUI_KEYCODE_NUMPAD_7 interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeNumpad70100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeNumpad70100 start====");
          globalThis.keyCode = 2110;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2110);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeNumpad70100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_NUMPAD_8_0100
     * @tc.name    : testArkUIKeyCodeNumpad80100
     * @tc.desc    : testing ARKUI_KEYCODE_NUMPAD_8 interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeNumpad80100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeNumpad80100 start====");
          globalThis.keyCode = 2111;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2111);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeNumpad80100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_NUMPAD_9_0100
     * @tc.name    : testArkUIKeyCodeNumpad90100
     * @tc.desc    : testing ARKUI_KEYCODE_NUMPAD_9 interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeNumpad90100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeNumpad90100 start====");
          globalThis.keyCode = 2112;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2112);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeNumpad90100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_NUMPAD_DIVIDE_0100
     * @tc.name    : testArkUIKeyCodeNumpadDivide0100
     * @tc.desc    : testing ARKUI_KEYCODE_NUMPAD_DIVIDE interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeNumpadDivide0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeNumpadDivide0100 start====");
          globalThis.keyCode = 2113;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2113);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeNumpadDivide0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_NUMPAD_MULTIPLY_0100
     * @tc.name    : testArkUIKeyCodeNumpadMultiply0100
     * @tc.desc    : testing ARKUI_KEYCODE_NUMPAD_MULTIPLY interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeNumpadMultiply0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeNumpadMultiply0100 start====");
          globalThis.keyCode = 2114;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2114);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeNumpadMultiply0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_NUMPAD_SUBTRACT_0100
     * @tc.name    : testArkUIKeyCodeNumpadSubtract0100
     * @tc.desc    : testing ARKUI_KEYCODE_NUMPAD_SUBTRACT interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeNumpadSubtract0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeNumpadSubtract0100 start====");
          globalThis.keyCode = 2115;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2115);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeNumpadSubtract0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_NUMPAD_ADD_0100
     * @tc.name    : testArkUIKeyCodeNumpadAdd0100
     * @tc.desc    : testing ARKUI_KEYCODE_NUMPAD_ADD interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeNumpadAdd0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeNumpadAdd0100 start====");
          globalThis.keyCode = 2116;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2116);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeNumpadAdd0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_NUMPAD_DOT_0100
     * @tc.name    : testArkUIKeyCodeNumpadDot0100
     * @tc.desc    : testing ARKUI_KEYCODE_NUMPAD_DOT interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeNumpadDot0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeNumpadDot0100 start====");
          globalThis.keyCode = 2117;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2117);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeNumpadDot0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_NUMPAD_COMMA_0100
     * @tc.name    : testArkUIKeyCodeNumpadComma0100
     * @tc.desc    : testing ARKUI_KEYCODE_NUMPAD_COMMA interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeNumpadComma0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeNumpadComma0100 start====");
          globalThis.keyCode = 2118;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2118);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeNumpadComma0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_NUMPAD_ENTER_0100
     * @tc.name    : testArkUIKeyCodeNumpadEnter0100
     * @tc.desc    : testing ARKUI_KEYCODE_NUMPAD_ENTER interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeNumpadEnter0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeNumpadEnter0100 start====");
          globalThis.keyCode = 2119;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2119);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeNumpadEnter0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_NUMPAD_EQUALS_0100
     * @tc.name    : testArkUIKeyCodeNumpadEquals0100
     * @tc.desc    : testing ARKUI_KEYCODE_NUMPAD_EQUALS interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeNumpadEquals0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeNumpadEquals0100 start====");
          globalThis.keyCode = 2120;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2120);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeNumpadEquals0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_NUMPAD_LEFT_PAREN_0100
     * @tc.name    : testArkUIKeyCodeNumpadLeftParen0100
     * @tc.desc    : testing ARKUI_KEYCODE_NUMPAD_LEFT_PAREN interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeNumpadLeftParen0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeNumpadLeftParen0100 start====");
          globalThis.keyCode = 2121;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2121);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeNumpadLeftParen0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_NUMPAD_RIGHT_PAREN_0100
     * @tc.name    : testArkUIKeyCodeNumpadRightParen0100
     * @tc.desc    : testing ARKUI_KEYCODE_NUMPAD_RIGHT_PAREN interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeNumpadRightParen0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeNumpadRightParen0100 start====");
          globalThis.keyCode = 2122;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2122);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeNumpadRightParen0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_BUTTON_A_0100
     * @tc.name    : testArkUIKeyCodeButtonA0100
     * @tc.desc    : testing ARKUI_KEYCODE_BUTTON_A interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeButtonA0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeButtonA0100 start====");
          globalThis.keyCode = 2301;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2301);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeButtonA0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_BUTTON_B_0100
     * @tc.name    : testArkUIKeyCodeButtonB0100
     * @tc.desc    : testing ARKUI_KEYCODE_BUTTON_B interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeButtonB0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeButtonB0100 start====");
          globalThis.keyCode = 2302;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2302);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeButtonB0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_BUTTON_X_0100
     * @tc.name    : testArkUIKeyCodeButtonX0100
     * @tc.desc    : testing ARKUI_KEYCODE_BUTTON_X interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeButtonX0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeButtonX0100 start====");
          globalThis.keyCode = 2304;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2304);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeButtonX0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_BUTTON_Y_0100
     * @tc.name    : testArkUIKeyCodeButtonY0100
     * @tc.desc    : testing ARKUI_KEYCODE_BUTTON_Y interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeButtonY0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeButtonY0100 start====");
          globalThis.keyCode = 2305;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2305);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeButtonY0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_BUTTON_L1_0100
     * @tc.name    : testArkUIKeyCodeButtonL10100
     * @tc.desc    : testing ARKUI_KEYCODE_BUTTON_L1 interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeButtonL10100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeButtonL10100 start====");
          globalThis.keyCode = 2307;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2307);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeButtonL10100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_BUTTON_R1_0100
     * @tc.name    : testArkUIKeyCodeButtonR10100
     * @tc.desc    : testing ARKUI_KEYCODE_BUTTON_R1 interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeButtonR10100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeButtonR10100 start====");
          globalThis.keyCode = 2308;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2308);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeButtonR10100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_BUTTON_L2_0100
     * @tc.name    : testArkUIKeyCodeButtonL20100
     * @tc.desc    : testing ARKUI_KEYCODE_BUTTON_L2 interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeButtonL20100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeButtonL20100 start====");
          globalThis.keyCode = 2309;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2309);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeButtonL20100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_BUTTON_R2_0100
     * @tc.name    : testArkUIKeyCodeButtonR20100
     * @tc.desc    : testing ARKUI_KEYCODE_BUTTON_R2 interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeButtonR20100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeButtonR20100 start====");
          globalThis.keyCode = 2310;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2310);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeButtonR20100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_BUTTON_SELECT_0100
     * @tc.name    : testArkUIKeyCodeButtonSelect0100
     * @tc.desc    : testing ARKUI_KEYCODE_BUTTON_SELECT interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeButtonSelect0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeButtonSelect0100 start====");
          globalThis.keyCode = 2311;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2311);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeButtonSelect0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_BUTTON_START_0100
     * @tc.name    : testArkUIKeyCodeButtonStart0100
     * @tc.desc    : testing ARKUI_KEYCODE_BUTTON_START interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeButtonStart0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeButtonStart0100 start====");
          globalThis.keyCode = 2312;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2312);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeButtonStart0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_BUTTON_MODE_0100
     * @tc.name    : testArkUIKeyCodeButtonMode0100
     * @tc.desc    : testing ARKUI_KEYCODE_BUTTON_MODE interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeButtonMode0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeButtonMode0100 start====");
          globalThis.keyCode = 2313;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2313);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeButtonMode0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_BUTTON_THUMBL_0100
     * @tc.name    : testArkUIKeyCodeButtonThumbl0100
     * @tc.desc    : testing ARKUI_KEYCODE_BUTTON_THUMBL interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeButtonThumbl0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeButtonThumbl0100 start====");
          globalThis.keyCode = 2314;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2314);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeButtonThumbl0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.number  : SUB_ArkUI_ACE_ENGINE_ARKUI_KEYCODE_BUTTON_THUMBR_0100
     * @tc.name    : testArkUIKeyCodeButtonThumbr0100
     * @tc.desc    : testing ARKUI_KEYCODE_BUTTON_THUMBR interface
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIKeyCodeButtonThumbr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>testArkUIKeyCodeButtonThumbr0100 start====");
          globalThis.keyCode = 2315;
          await button.click();
          await Utils.sleep(10);
        let KeyResult: number = arkuikeycodendk.GetKeyCodeResult();
          expect(KEY_CODE_SAME).assertEqual(KeyResult == 2315);
          done();
        } catch (err) {
          console.error("====>testArkUIKeyCodeButtonThumbr0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_ERROR);
          done();
        }
      })
  })
}
