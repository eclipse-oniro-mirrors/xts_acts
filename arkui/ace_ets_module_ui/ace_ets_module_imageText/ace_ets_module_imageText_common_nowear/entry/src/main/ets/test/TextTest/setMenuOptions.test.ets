/**
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
import { describe, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import { Driver, ON, UiWindow } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function SetMenuOptionsTest() {
  describe('SetMenuOptionsTest', () => {
    beforeEach(async (done: Function) => {
      console.info("SetMenuOptionsTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/setMenuOptions',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SetMenuOptionsTest state pages: " + JSON.stringify(pages));
        if (!("setMenuOptions" == pages.name)) {
          console.info("get SetMenuOptionsTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SetMenuOptionsTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SetMenuOptionsTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SetMenuOptionsTest_0010
     * @tc.number SUB_ACE_SetMenuOptionsTest_0010
     * @tc.desc   get TextInput setMenuOptions: default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetMenuOptionsTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('[SetMenuOptionsTest_0010] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.type('TextInput'));
      await Button.longClick()
      await CommonFunc.sleep(2000);
      console.info('[SetMenuOptionsTest_0010] longClick succ');
      let window: UiWindow = await driver.findWindow({ actived: true });
      let mode = await window.getWindowMode();
      console.info('[SetMenuOptionsTest_0010] mode: ' + JSON.stringify(mode));
      expect('0, 3').assertContain(mode);
      await CommonFunc.sleep(500);
      await driver.triggerKey(2070);
      console.info('[SetMenuOptionsTest_0010] END');
      done();
    });

    /**
     * @tc.name   SetMenuOptionsTest_0020
     * @tc.number SUB_ACE_SetMenuOptionsTest_0020
     * @tc.desc   set TextInput setMenuOptions: TextMenuShowMode.DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetMenuOptionsTest_0020', Level.LEVEL0, async (done: Function) => {
      console.info('[SetMenuOptionsTest_0020] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('button_DEFAULT'));
      await Button.click()
      console.info('[SetMenuOptionsTest_0020] click succ');
      await CommonFunc.sleep(1000);
      let TextInput = await driver.findComponent(ON.type('TextInput'));
      await TextInput.longClick()
      await CommonFunc.sleep(2000);
      console.info('[SetMenuOptionsTest_0020] longClick succ');
      let window: UiWindow = await driver.findWindow({ actived: true });
      let mode = await window.getWindowMode();
      console.info('[SetMenuOptionsTest_0020] mode: ' + JSON.stringify(mode));
      expect('0, 3').assertContain(mode);
      console.info('[SetMenuOptionsTest_0020] END');
      done();
    });

    /**
     * @tc.name   SetMenuOptionsTest_0030
     * @tc.number SUB_ACE_SetMenuOptionsTest_0030
     * @tc.desc   set TextInput setMenuOptions: TextMenuShowMode.PREFER_WINDOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetMenuOptionsTest_0030', Level.LEVEL0, async (done: Function) => {
      console.info('[SetMenuOptionsTest_0030] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('button_PREFER_WINDOW'));
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info('[SetMenuOptionsTest_0030] click succ');
      let TextInput = await driver.findComponent(ON.type('TextInput'));
      await TextInput.longClick()
      await CommonFunc.sleep(500);
      console.info('[SetMenuOptionsTest_0030] longClick succ');
      let window: UiWindow = await driver.findWindow({ actived: true });
      let mode = await window.getWindowMode();
      console.info('[SetMenuOptionsTest_0030] mode: ' + JSON.stringify(mode));
      expect('0, 2, 3').assertContain(mode);
      await CommonFunc.sleep(500);
      await driver.triggerKey(2070);
      console.info('[SetMenuOptionsTest_0030] END');
      done();
    });

    /**
     * @tc.name   SetMenuOptionsTest_0040
     * @tc.number SUB_ACE_SetMenuOptionsTest_0040
     * @tc.desc   set TextInput setMenuOptions: undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetMenuOptionsTest_0040', Level.LEVEL0, async (done: Function) => {
      console.info('[SetMenuOptionsTest_0040] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('button_undefined'));
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info('[SetMenuOptionsTest_0040] click succ');
      let TextInput = await driver.findComponent(ON.type('TextInput'));
      await TextInput.longClick()
      await CommonFunc.sleep(500);
      console.info('[SetMenuOptionsTest_0040] longClick succ');
      let window: UiWindow = await driver.findWindow({ actived: true });
      let mode = await window.getWindowMode();
      console.info('[SetMenuOptionsTest_0040] mode: ' + JSON.stringify(mode));
      expect('0, 3').assertContain(mode);
      await CommonFunc.sleep(500);
      await driver.triggerKey(2070);
      console.info('[SetMenuOptionsTest_0040] END');
      done();
    });

    /**
     * @tc.name   SetMenuOptionsTest_0050
     * @tc.number SUB_ACE_SetMenuOptionsTest_0050
     * @tc.desc   get Text setMenuOptions: default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetMenuOptionsTest_0050', Level.LEVEL0, async (done: Function) => {
      console.info('[SetMenuOptionsTest_0050] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.type('Text'));
      await Button.longClick()
      await CommonFunc.sleep(2000);
      console.info('[SetMenuOptionsTest_0050] longClick succ');
      let window: UiWindow = await driver.findWindow({ actived: true });
      let mode = await window.getWindowMode();
      console.info('[SetMenuOptionsTest_0050] mode: ' + JSON.stringify(mode));
      expect('0, 3').assertContain(mode);
      await CommonFunc.sleep(500);
      await Button.click()
      console.info('[SetMenuOptionsTest_0050] END');
      done();
    });

    /**
     * @tc.name   SetMenuOptionsTest_0060
     * @tc.number SUB_ACE_SetMenuOptionsTest_0060
     * @tc.desc   set Text setMenuOptions: TextMenuShowMode.DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetMenuOptionsTest_0060', Level.LEVEL0, async (done: Function) => {
      console.info('[SetMenuOptionsTest_0060] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('button_DEFAULT'));
      await Button.click()
      console.info('[SetMenuOptionsTest_0060] click succ');
      await CommonFunc.sleep(1000);
      let TextInput = await driver.findComponent(ON.type('Text'));
      await TextInput.longClick()
      await CommonFunc.sleep(2000);
      console.info('[SetMenuOptionsTest_0060] longClick succ');
      let window: UiWindow = await driver.findWindow({ actived: true });
      let mode = await window.getWindowMode();
      console.info('[SetMenuOptionsTest_0060] mode: ' + JSON.stringify(mode));
      expect('0, 3').assertContain(mode);
      await CommonFunc.sleep(500);
      await TextInput.click()
      console.info('[SetMenuOptionsTest_0060] END');
      done();
    });

    /**
     * @tc.name   SetMenuOptionsTest_0070
     * @tc.number SUB_ACE_SetMenuOptionsTest_0070
     * @tc.desc   set Text setMenuOptions: TextMenuShowMode.PREFER_WINDOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetMenuOptionsTest_0070', Level.LEVEL0, async (done: Function) => {
      console.info('[SetMenuOptionsTest_0070] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('button_PREFER_WINDOW'));
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info('[SetMenuOptionsTest_0070] click succ');
      let TextInput = await driver.findComponent(ON.type('Text'));
      await TextInput.longClick()
      await CommonFunc.sleep(500);
      console.info('[SetMenuOptionsTest_0070] longClick succ');
      let window: UiWindow = await driver.findWindow({ actived: true });
      let mode = await window.getWindowMode();
      console.info('[SetMenuOptionsTest_0070] mode: ' + JSON.stringify(mode));
      expect('0, 2, 3').assertContain(mode);
      await CommonFunc.sleep(500);
      await TextInput.click()
      console.info('[SetMenuOptionsTest_0070] END');
      done();
    });

    /**
     * @tc.name   SetMenuOptionsTest_0080
     * @tc.number SUB_ACE_SetMenuOptionsTest_0080
     * @tc.desc   set Text setMenuOptions: undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetMenuOptionsTest_0080', Level.LEVEL0, async (done: Function) => {
      console.info('[SetMenuOptionsTest_0080] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('button_undefined'));
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info('[SetMenuOptionsTest_0080] click succ');
      let TextInput = await driver.findComponent(ON.type('Text'));
      await TextInput.longClick()
      await CommonFunc.sleep(500);
      console.info('[SetMenuOptionsTest_0080] longClick succ');
      let window: UiWindow = await driver.findWindow({ actived: true });
      let mode = await window.getWindowMode();
      console.info('[SetMenuOptionsTest_0080] mode: ' + JSON.stringify(mode));
      expect('0, 3').assertContain(mode);
      await CommonFunc.sleep(500);
      await TextInput.click()
      console.info('[SetMenuOptionsTest_0080] END');
      done();
    });

    /**
     * @tc.name   SetMenuOptionsTest_0090
     * @tc.number SUB_ACE_SetMenuOptionsTest_0090
     * @tc.desc   get TextArea setMenuOptions: default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetMenuOptionsTest_0090', Level.LEVEL0, async (done: Function) => {
      console.info('[SetMenuOptionsTest_0090] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.type('TextArea'));
      await Button.longClick()
      await CommonFunc.sleep(2000);
      console.info('[SetMenuOptionsTest_0090] longClick succ');
      let window: UiWindow = await driver.findWindow({ actived: true });
      let mode = await window.getWindowMode();
      console.info('[SetMenuOptionsTest_0090] mode: ' + JSON.stringify(mode));
      expect('0, 3').assertContain(mode);
      await CommonFunc.sleep(500);
      await driver.triggerKey(2070);
      console.info('[SetMenuOptionsTest_0090] END');
      done();
    });

    /**
     * @tc.name   SetMenuOptionsTest_0100
     * @tc.number SUB_ACE_SetMenuOptionsTest_0100
     * @tc.desc   set TextArea setMenuOptions: TextMenuShowMode.DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetMenuOptionsTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[SetMenuOptionsTest_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('button_DEFAULT'));
      await Button.click()
      console.info('[SetMenuOptionsTest_0100] click succ');
      await CommonFunc.sleep(1000);
      let TextInput = await driver.findComponent(ON.type('TextArea'));
      await TextInput.longClick()
      await CommonFunc.sleep(2000);
      console.info('[SetMenuOptionsTest_0100] longClick succ');
      let window: UiWindow = await driver.findWindow({ actived: true });
      let mode = await window.getWindowMode();
      console.info('[SetMenuOptionsTest_0100] mode: ' + JSON.stringify(mode));
      expect('0, 3').assertContain(mode);
      console.info('[SetMenuOptionsTest_0100] END');
      done();
    });

    /**
     * @tc.name   SetMenuOptionsTest_0110
     * @tc.number SUB_ACE_SetMenuOptionsTest_0110
     * @tc.desc   set TextArea setMenuOptions: TextMenuShowMode.PREFER_WINDOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetMenuOptionsTest_0110', Level.LEVEL0, async (done: Function) => {
      console.info('[SetMenuOptionsTest_0110] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('button_PREFER_WINDOW'));
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info('[SetMenuOptionsTest_0110] click succ');
      let TextInput = await driver.findComponent(ON.type('TextArea'));
      await TextInput.longClick()
      await CommonFunc.sleep(500);
      console.info('[SetMenuOptionsTest_0110] longClick succ');
      let window: UiWindow = await driver.findWindow({ actived: true });
      let mode = await window.getWindowMode();
      console.info('[SetMenuOptionsTest_0110] mode: ' + JSON.stringify(mode));
      expect('0, 2, 3').assertContain(mode);
      await CommonFunc.sleep(500);
      await driver.triggerKey(2070);
      console.info('[SetMenuOptionsTest_0110] END');
      done();
    });

    /**
     * @tc.name   SetMenuOptionsTest_0120
     * @tc.number SUB_ACE_SetMenuOptionsTest_0120
     * @tc.desc   set TextArea setMenuOptions: undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetMenuOptionsTest_0120', Level.LEVEL0, async (done: Function) => {
      console.info('[SetMenuOptionsTest_0120] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('button_undefined'));
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info('[SetMenuOptionsTest_0120] click succ');
      let TextInput = await driver.findComponent(ON.type('TextArea'));
      await TextInput.longClick()
      await CommonFunc.sleep(500);
      console.info('[SetMenuOptionsTest_0120] longClick succ');
      let window: UiWindow = await driver.findWindow({ actived: true });
      let mode = await window.getWindowMode();
      console.info('[SetMenuOptionsTest_0120] mode: ' + JSON.stringify(mode));
      expect('0, 3').assertContain(mode);
      await CommonFunc.sleep(500);
      await driver.triggerKey(2070);
      console.info('[SetMenuOptionsTest_0120] END');
      done();
    });

    /**
     * @tc.name   SetMenuOptionsTest_0130
     * @tc.number SUB_ACE_SetMenuOptionsTest_0130
     * @tc.desc   get Search setMenuOptions: default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetMenuOptionsTest_0130', Level.LEVEL0, async (done: Function) => {
      console.info('[SetMenuOptionsTest_0130] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.type('Search'));
      await Button.longClick()
      await CommonFunc.sleep(2000);
      console.info('[SetMenuOptionsTest_0130] longClick succ');
      let window: UiWindow = await driver.findWindow({ actived: true });
      let mode = await window.getWindowMode();
      console.info('[SetMenuOptionsTest_0130] mode: ' + JSON.stringify(mode));
      expect('0, 3').assertContain(mode);
      await CommonFunc.sleep(500);
      await driver.triggerKey(2070);
      console.info('[SetMenuOptionsTest_0130] END');
      done();
    });

    /**
     * @tc.name   SetMenuOptionsTest_0140
     * @tc.number SUB_ACE_SetMenuOptionsTest_0140
     * @tc.desc   set Search setMenuOptions: TextMenuShowMode.DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetMenuOptionsTest_0140', Level.LEVEL0, async (done: Function) => {
      console.info('[SetMenuOptionsTest_0140] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('button_DEFAULT'));
      await Button.click()
      console.info('[SetMenuOptionsTest_0140] click succ');
      await CommonFunc.sleep(1000);
      let TextInput = await driver.findComponent(ON.type('Search'));
      await TextInput.longClick()
      await CommonFunc.sleep(2000);
      console.info('[SetMenuOptionsTest_0140] longClick succ');
      let window: UiWindow = await driver.findWindow({ actived: true });
      let mode = await window.getWindowMode();
      console.info('[SetMenuOptionsTest_0140] mode: ' + JSON.stringify(mode));
      expect('0, 3').assertContain(mode);
      console.info('[SetMenuOptionsTest_0140] END');
      done();
    });

    /**
     * @tc.name   SetMenuOptionsTest_0150
     * @tc.number SUB_ACE_SetMenuOptionsTest_0150
     * @tc.desc   set Search setMenuOptions: TextMenuShowMode.PREFER_WINDOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetMenuOptionsTest_0150', Level.LEVEL0, async (done: Function) => {
      console.info('[SetMenuOptionsTest_0150] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('button_PREFER_WINDOW'));
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info('[SetMenuOptionsTest_0150] click succ');
      let TextInput = await driver.findComponent(ON.type('Search'));
      await TextInput.longClick()
      await CommonFunc.sleep(500);
      console.info('[SetMenuOptionsTest_0150] longClick succ');
      let window: UiWindow = await driver.findWindow({ actived: true });
      let mode = await window.getWindowMode();
      console.info('[SetMenuOptionsTest_0150] mode: ' + JSON.stringify(mode));
      expect('0, 2, 3').assertContain(mode);
      await CommonFunc.sleep(500);
      await driver.triggerKey(2070);
      console.info('[SetMenuOptionsTest_0150] END');
      done();
    });

    /**
     * @tc.name   SetMenuOptionsTest_0160
     * @tc.number SUB_ACE_SetMenuOptionsTest_0160
     * @tc.desc   set Search setMenuOptions: undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetMenuOptionsTest_0160', Level.LEVEL0, async (done: Function) => {
      console.info('[SetMenuOptionsTest_0160] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('button_undefined'));
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info('[SetMenuOptionsTest_0160] click succ');
      let TextInput = await driver.findComponent(ON.type('Search'));
      await TextInput.longClick()
      await CommonFunc.sleep(500);
      console.info('[SetMenuOptionsTest_0160] longClick succ');
      let window: UiWindow = await driver.findWindow({ actived: true });
      let mode = await window.getWindowMode();
      console.info('[SetMenuOptionsTest_0160] mode: ' + JSON.stringify(mode));
      expect('0, 3').assertContain(mode);
      await CommonFunc.sleep(500);
      await driver.triggerKey(2070);
      console.info('[SetMenuOptionsTest_0160] END');
      done();
    });

    /**
     * @tc.name   SetMenuOptionsTest_0170
     * @tc.number SUB_ACE_SetMenuOptionsTest_0170
     * @tc.desc   get RichEditor setMenuOptions: default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetMenuOptionsTest_0170', Level.LEVEL0, async (done: Function) => {
      console.info('[SetMenuOptionsTest_0170] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.type('RichEditor'));
      await Button.longClick()
      await CommonFunc.sleep(2000);
      console.info('[SetMenuOptionsTest_0170] longClick succ');
      let window: UiWindow = await driver.findWindow({ actived: true });
      let mode = await window.getWindowMode();
      console.info('[SetMenuOptionsTest_0170] mode: ' + JSON.stringify(mode));
      expect('0, 3').assertContain(mode);
      await CommonFunc.sleep(500);
      await driver.triggerKey(2070);
      console.info('[SetMenuOptionsTest_0170] END');
      done();
    });

    /**
     * @tc.name   SetMenuOptionsTest_0180
     * @tc.number SUB_ACE_SetMenuOptionsTest_0180
     * @tc.desc   set RichEditor setMenuOptions: TextMenuShowMode.DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetMenuOptionsTest_0180', Level.LEVEL0, async (done: Function) => {
      console.info('[SetMenuOptionsTest_0180] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('button_DEFAULT'));
      await Button.click()
      console.info('[SetMenuOptionsTest_0180] click succ');
      await CommonFunc.sleep(1000);
      let TextInput = await driver.findComponent(ON.type('RichEditor'));
      await TextInput.longClick()
      await CommonFunc.sleep(2000);
      console.info('[SetMenuOptionsTest_0180] longClick succ');
      let window: UiWindow = await driver.findWindow({ actived: true });
      let mode = await window.getWindowMode();
      console.info('[SetMenuOptionsTest_0180] mode: ' + JSON.stringify(mode));
      expect('0, 3').assertContain(mode);
      await CommonFunc.sleep(500);
      await driver.triggerKey(2070);
      console.info('[SetMenuOptionsTest_0180] END');
      done();
    });

    /**
     * @tc.name   SetMenuOptionsTest_0190
     * @tc.number SUB_ACE_SetMenuOptionsTest_0190
     * @tc.desc   set RichEditor setMenuOptions: TextMenuShowMode.PREFER_WINDOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetMenuOptionsTest_0190', Level.LEVEL0, async (done: Function) => {
      console.info('[SetMenuOptionsTest_0190] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('button_PREFER_WINDOW'));
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info('[SetMenuOptionsTest_0190] click succ');
      let TextInput = await driver.findComponent(ON.type('RichEditor'));
      await TextInput.longClick()
      await CommonFunc.sleep(500);
      console.info('[SetMenuOptionsTest_0190] longClick succ');
      let window: UiWindow = await driver.findWindow({ actived: true });
      let mode = await window.getWindowMode();
      console.info('[SetMenuOptionsTest_0190] mode: ' + JSON.stringify(mode));
      expect('0, 2, 3').assertContain(mode);
      await CommonFunc.sleep(500);
      await driver.triggerKey(2070);
      console.info('[SetMenuOptionsTest_0190] END');
      done();
    });

    /**
     * @tc.name   SetMenuOptionsTest_0200
     * @tc.number SUB_ACE_SetMenuOptionsTest_0200
     * @tc.desc   set RichEditor setMenuOptions: undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetMenuOptionsTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[SetMenuOptionsTest_0200] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('button_undefined'));
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info('[SetMenuOptionsTest_0200] click succ');
      let TextInput = await driver.findComponent(ON.type('RichEditor'));
      await TextInput.longClick()
      await CommonFunc.sleep(500);
      console.info('[SetMenuOptionsTest_0200] longClick succ');
      let window: UiWindow = await driver.findWindow({ actived: true });
      let mode = await window.getWindowMode();
      console.info('[SetMenuOptionsTest_0200] mode: ' + JSON.stringify(mode));
      expect('0, 3').assertContain(mode);
      await CommonFunc.sleep(500);
      await driver.triggerKey(2070);
      console.info('[SetMenuOptionsTest_0200] END');
      done();
    });

    /**
     * @tc.name   SetMenuOptionsTest_0210
     * @tc.number SUB_ACE_SetMenuOptionsTest_0210
     * @tc.desc   set RichEditor setMenuOptions: null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetMenuOptionsTest_0210', Level.LEVEL0, async (done: Function) => {
      console.info('[SetMenuOptionsTest_0210] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('button_null'));
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info('[SetMenuOptionsTest_0210] click succ');
      let TextInput = await driver.findComponent(ON.type('RichEditor'));
      await TextInput.longClick()
      await CommonFunc.sleep(500);
      console.info('[SetMenuOptionsTest_0210] longClick succ');
      let window: UiWindow = await driver.findWindow({ actived: true });
      let mode = await window.getWindowMode();
      console.info('[SetMenuOptionsTest_0210] mode: ' + JSON.stringify(mode));
      expect('0, 3').assertContain(mode);
      await CommonFunc.sleep(500);
      await driver.triggerKey(2070);
      console.info('[SetMenuOptionsTest_0210] END');
      done();
    });

    /**
     * @tc.name   SetMenuOptionsTest_0220
     * @tc.number SUB_ACE_SetMenuOptionsTest_0220
     * @tc.desc   set Text setMenuOptions: null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetMenuOptionsTest_0220', Level.LEVEL0, async (done: Function) => {
      console.info('[SetMenuOptionsTest_0220] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('button_null'));
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info('[SetMenuOptionsTest_0220] click succ');
      let TextInput = await driver.findComponent(ON.type('Text'));
      await TextInput.longClick()
      await CommonFunc.sleep(500);
      console.info('[SetMenuOptionsTest_0220] longClick succ');
      let window: UiWindow = await driver.findWindow({ actived: true });
      let mode = await window.getWindowMode();
      console.info('[SetMenuOptionsTest_0220] mode: ' + JSON.stringify(mode));
      expect('0, 3').assertContain(mode);
      await CommonFunc.sleep(500);
      await TextInput.click()
      console.info('[SetMenuOptionsTest_0220] END');
      done();
    });

    /**
     * @tc.name   SetMenuOptionsTest_0230
     * @tc.number SUB_ACE_SetMenuOptionsTest_0230
     * @tc.desc   set TextInput setMenuOptions: null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetMenuOptionsTest_0230', Level.LEVEL0, async (done: Function) => {
      console.info('[SetMenuOptionsTest_0230] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('button_null'));
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info('[SetMenuOptionsTest_0230] click succ');
      let TextInput = await driver.findComponent(ON.type('TextInput'));
      await TextInput.longClick()
      await CommonFunc.sleep(500);
      console.info('[SetMenuOptionsTest_0230] longClick succ');
      let window: UiWindow = await driver.findWindow({ actived: true });
      let mode = await window.getWindowMode();
      console.info('[SetMenuOptionsTest_0230] mode: ' + JSON.stringify(mode));
      expect('0, 3').assertContain(mode);
      await CommonFunc.sleep(500);
      await driver.triggerKey(2070);
      console.info('[SetMenuOptionsTest_0230] END');
      done();
    });

    /**
     * @tc.name   SetMenuOptionsTest_0240
     * @tc.number SUB_ACE_SetMenuOptionsTest_0240
     * @tc.desc   set TextArea setMenuOptions: null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetMenuOptionsTest_0240', Level.LEVEL0, async (done: Function) => {
      console.info('[SetMenuOptionsTest_0240] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('button_null'));
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info('[SetMenuOptionsTest_0240] click succ');
      let TextInput = await driver.findComponent(ON.type('TextArea'));
      await TextInput.longClick()
      await CommonFunc.sleep(500);
      console.info('[SetMenuOptionsTest_0240] longClick succ');
      let window: UiWindow = await driver.findWindow({ actived: true });
      let mode = await window.getWindowMode();
      console.info('[SetMenuOptionsTest_0240] mode: ' + JSON.stringify(mode));
      expect('0, 3').assertContain(mode);
      await CommonFunc.sleep(500);
      await driver.triggerKey(2070);
      console.info('[SetMenuOptionsTest_0240] END');
      done();
    });

    /**
     * @tc.name   SetMenuOptionsTest_0250
     * @tc.number SUB_ACE_SetMenuOptionsTest_0250
     * @tc.desc   set Search setMenuOptions: null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetMenuOptionsTest_0250', Level.LEVEL0, async (done: Function) => {
      console.info('[SetMenuOptionsTest_0250] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('button_null'));
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info('[SetMenuOptionsTest_0250] click succ');
      let TextInput = await driver.findComponent(ON.type('Search'));
      await TextInput.longClick()
      await CommonFunc.sleep(500);
      console.info('[SetMenuOptionsTest_0250] longClick succ');
      let window: UiWindow = await driver.findWindow({ actived: true });
      let mode = await window.getWindowMode();
      console.info('[SetMenuOptionsTest_0250] mode: ' + JSON.stringify(mode));
      expect('0, 3').assertContain(mode);
      console.info('[SetMenuOptionsTest_0250] END');
      done();
    });
  })
}