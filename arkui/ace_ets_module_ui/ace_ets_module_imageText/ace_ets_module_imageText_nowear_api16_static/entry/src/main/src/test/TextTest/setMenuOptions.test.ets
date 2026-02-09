'use static';
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
import { describe, beforeEach, beforeAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Driver, ON, UiWindow,Component,WindowMode } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function SetMenuOptionsTest() {
  describe('SetMenuOptionsTest', () : void => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.api16.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("SetMenuOptionsTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/setMenuOptions",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SetMenuOptionsTest state pages:" + "");
        if (!("setMenuOptions" == pages.name)) {
          console.info("get SetMenuOptionsTest pages.name:" + "");
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SetMenuOptionsTest page error:" + err);
      }
      console.info("SetMenuOptionsTest beforeEach end");
    });
    
    
    /**
     * @tc.number   SetMenuOptionsTest_static_0010
     * @tc.name     SetMenuOptionsTest_static_0010
     * @tc.desc     SetMenuOptionsTest_static_0010
     * @tc.level    Level.LEVEL0
     */
it('SetMenuOptionsTest_static_0010', Level.LEVEL0, async (done: () =>void) : Promise<void> => {
      console.info('[SetMenuOptionsTest_0010] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await (driver.findComponent(ON.type('TextInput')) as Promise<Component>);
      await Button.longClick()
      await CommonFunc.sleep(2000);
      console.info('[SetMenuOptionsTest_0010] longClick succ');
      let window = await (driver.findWindow({ active: true }) as Promise<UiWindow>);
      let mode = await window.getWindowMode();
      console.info('[SetMenuOptionsTest_0010] mode: ' + JSON.stringify(mode));
      expect([0, 3]).assertContain(mode);
      console.info('[SetMenuOptionsTest_0010] END');
      done();
    });


    /**
     * @tc.number   SetMenuOptionsTest_static_0020
     * @tc.name     SetMenuOptionsTest_static_0020
     * @tc.desc     SetMenuOptionsTest_static_0020
     * @tc.level    Level.LEVEL0
     */
it('SetMenuOptionsTest_static_0020', Level.LEVEL0, async ( done: () =>void) : Promise<void> => {
      console.info('[SetMenuOptionsTest_0020] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await (driver.findComponent(ON.id('button_DEFAULT')) as Promise<Component>);
      await Button.click()
      console.info('[SetMenuOptionsTest_0020] click succ');
      await CommonFunc.sleep(1000);
      let TextInput = await (driver.findComponent(ON.type('TextInput')) as Promise<Component>);
      await TextInput.longClick()
      await CommonFunc.sleep(2000);
      console.info('[SetMenuOptionsTest_0020] longClick succ');
      let window = await (driver.findWindow({ active: true }) as Promise<UiWindow>);
      let mode = await window.getWindowMode();
      console.info('[SetMenuOptionsTest_0020] mode: ' + JSON.stringify(mode));
      expect([0, 3]).assertContain(mode);
      console.info('[SetMenuOptionsTest_0020] END');
      done();
    });


    /**
     * @tc.number   SetMenuOptionsTest_static_0030
     * @tc.name     SetMenuOptionsTest_static_0030
     * @tc.desc     SetMenuOptionsTest_static_0030
     * @tc.level    Level.LEVEL0
     */
it('SetMenuOptionsTest_static_0030', Level.LEVEL0, async (done: () =>void) : Promise<void> => {
      console.info('[SetMenuOptionsTest_0030] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await (driver.findComponent(ON.id('button_PREFER_WINDOW')) as Promise<Component>);
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info('[SetMenuOptionsTest_0030] click succ');
      let TextInput = await (driver.findComponent(ON.type('TextInput')) as Promise<Component>);
      await TextInput.longClick()
      await CommonFunc.sleep(2000);
      console.info('[SetMenuOptionsTest_0030] longClick succ');
      let window = await (driver.findWindow({ active: true }) as Promise<UiWindow>);


        let mode = await window.getWindowMode();
        console.info('[SetMenuOptionsTest_0030] mode: ' + JSON.stringify(mode));
        expect([0, 2, 3]).assertContain(mode);

      console.info('[SetMenuOptionsTest_0030] END');
      done();
    });


    /**
     * @tc.number   SetMenuOptionsTest_static_0040
     * @tc.name     SetMenuOptionsTest_static_0040
     * @tc.desc     SetMenuOptionsTest_static_0040
     * @tc.level    Level.LEVEL0
     */
it('SetMenuOptionsTest_static_0040', Level.LEVEL0, async (done: () =>void) : Promise<void> => {
      console.info('[SetMenuOptionsTest_0040] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await (driver.findComponent(ON.id('button_undefined')) as Promise<Component>);
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info('[SetMenuOptionsTest_0040] click succ');
      let TextInput = await (driver.findComponent(ON.type('TextInput')) as Promise<Component>);
      await TextInput.longClick()
      await CommonFunc.sleep(500);
      console.info('[SetMenuOptionsTest_0040] longClick succ');
      let window = await (driver.findWindow({ active: true }) as Promise<UiWindow>);


        let mode = await window.getWindowMode();
        console.info('[SetMenuOptionsTest_0040] mode: ' + JSON.stringify(mode));
        expect([0, 3]).assertContain(mode);

      console.info('[SetMenuOptionsTest_0040] END');
      done();
    });


    /**
     * @tc.number   SetMenuOptionsTest_static_0050
     * @tc.name     SetMenuOptionsTest_static_0050
     * @tc.desc     SetMenuOptionsTest_static_0050
     * @tc.level    Level.LEVEL0
     */
it('SetMenuOptionsTest_static_0050', Level.LEVEL0, async (done: () =>void) : Promise<void> => {
      console.info('[SetMenuOptionsTest_0050] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await (driver.findComponent(ON.type('Text')) as Promise<Component>);
      await Button.longClick()
      await CommonFunc.sleep(2000);
      console.info('[SetMenuOptionsTest_0050] longClick succ');
      let window = await (driver.findWindow({ active: true }) as Promise<UiWindow>);


        let mode = await window.getWindowMode();
        console.info('[SetMenuOptionsTest_0050] mode: ' + JSON.stringify(mode));
        expect([0, 3]).assertContain(mode);

      console.info('[SetMenuOptionsTest_0050] END');
      done();
    });


    /**
     * @tc.number   SetMenuOptionsTest_static_0060
     * @tc.name     SetMenuOptionsTest_static_0060
     * @tc.desc     SetMenuOptionsTest_static_0060
     * @tc.level    Level.LEVEL0
     */
it('SetMenuOptionsTest_static_0060', Level.LEVEL0, async (done: () =>void) : Promise<void> => {
      console.info('[SetMenuOptionsTest_0060] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await (driver.findComponent(ON.id('button_DEFAULT')) as Promise<Component>);
      await Button.click()
      console.info('[SetMenuOptionsTest_0060] click succ');
      await CommonFunc.sleep(1000);
      let TextInput = await (driver.findComponent(ON.type('Text')) as Promise<Component>);
      await TextInput.longClick()
      await CommonFunc.sleep(2000);
      console.info('[SetMenuOptionsTest_0060] longClick succ');
      let window = await (driver.findWindow({ active: true }) as Promise<UiWindow>);


        let mode = await window.getWindowMode();
        console.info('[SetMenuOptionsTest_0060] mode: ' + JSON.stringify(mode));
        expect([0, 3]).assertContain(mode);

      console.info('[SetMenuOptionsTest_0060] END');
      done();
    });


    /**
     * @tc.number   SetMenuOptionsTest_static_0070
     * @tc.name     SetMenuOptionsTest_static_0070
     * @tc.desc     SetMenuOptionsTest_static_0070
     * @tc.level    Level.LEVEL0
     */
it('SetMenuOptionsTest_static_0070', Level.LEVEL0, async (done: () =>void) : Promise<void> => {
      console.info('[SetMenuOptionsTest_0070] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await (driver.findComponent(ON.id('button_PREFER_WINDOW')) as Promise<Component>);
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info('[SetMenuOptionsTest_0070] click succ');
      let TextInput = await driver.findComponent(ON.type('Text'));
      await (TextInput?.longClick() as Promise<void>)
      await CommonFunc.sleep(2000);
      console.info('[SetMenuOptionsTest_0070] longClick succ');
      let window = await (driver.findWindow({ active: true }) as Promise<UiWindow>);


        let mode = await window.getWindowMode();
        console.info('[SetMenuOptionsTest_0070] mode: ' + JSON.stringify(mode));
        expect([0, 2, 3]).assertContain(mode);

      console.info('[SetMenuOptionsTest_0070] END');
      done();
    });


    /**
     * @tc.number   SetMenuOptionsTest_static_0080
     * @tc.name     SetMenuOptionsTest_static_0080
     * @tc.desc     SetMenuOptionsTest_static_0080
     * @tc.level    Level.LEVEL0
     */
it('SetMenuOptionsTest_static_0080', Level.LEVEL0, async (done: () =>void) : Promise<void> => {
      console.info('[SetMenuOptionsTest_0080] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('button_undefined'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      console.info('[SetMenuOptionsTest_0080] click succ');
      let TextInput = await driver.findComponent(ON.type('Text'));
      await (TextInput?.longClick() as Promise<void>)
      await CommonFunc.sleep(500);
      console.info('[SetMenuOptionsTest_0080] longClick succ');
      let window = await (driver.findWindow({ active: true }) as Promise<UiWindow>);


        let mode = await window.getWindowMode();
        console.info('[SetMenuOptionsTest_0080] mode: ' + JSON.stringify(mode));
        expect([0, 3]).assertContain(mode);

      console.info('[SetMenuOptionsTest_0080] END');
      done();
    });


    /**
     * @tc.number   SetMenuOptionsTest_static_0090
     * @tc.name     SetMenuOptionsTest_static_0090
     * @tc.desc     SetMenuOptionsTest_static_0090
     * @tc.level    Level.LEVEL0
     */
it('SetMenuOptionsTest_static_0090', Level.LEVEL0, async (done: () =>void) : Promise<void> => {
      console.info('[SetMenuOptionsTest_0090] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.type('TextArea'));
      await (Button?.longClick() as Promise<void>)
      await CommonFunc.sleep(2000);
      console.info('[SetMenuOptionsTest_0090] longClick succ');
      let window = await (driver.findWindow({ active: true }) as Promise<UiWindow>);


        let mode = await window.getWindowMode();
        console.info('[SetMenuOptionsTest_0090] mode: ' + JSON.stringify(mode));
        expect([0, 3]).assertContain(mode);

      console.info('[SetMenuOptionsTest_0090] END');
      done();
    });


    /**
     * @tc.number   SetMenuOptionsTest_static_0100
     * @tc.name     SetMenuOptionsTest_static_0100
     * @tc.desc     SetMenuOptionsTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SetMenuOptionsTest_static_0100', Level.LEVEL0, async (done: () =>void) : Promise<void> => {
      console.info('[SetMenuOptionsTest_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('button_DEFAULT'));
      await (Button?.click() as Promise<void>)
      console.info('[SetMenuOptionsTest_0100] click succ');
      await CommonFunc.sleep(1000);
      let TextInput = await driver.findComponent(ON.type('TextArea'));
      await (TextInput?.longClick() as Promise<void>)
      await CommonFunc.sleep(2000);
      console.info('[SetMenuOptionsTest_0100] longClick succ');
      let window = await (driver.findWindow({ active: true }) as Promise<UiWindow>);


        let mode = await window.getWindowMode();
        console.info('[SetMenuOptionsTest_0100] mode: ' + JSON.stringify(mode));
        expect([0, 3]).assertContain(mode);

      console.info('[SetMenuOptionsTest_0100] END');
      done();
    });


    /**
     * @tc.number   SetMenuOptionsTest_static_0110
     * @tc.name     SetMenuOptionsTest_static_0110
     * @tc.desc     SetMenuOptionsTest_static_0110
     * @tc.level    Level.LEVEL0
     */
it('SetMenuOptionsTest_static_0110', Level.LEVEL0, async (done: () =>void) : Promise<void> => {
      console.info('[SetMenuOptionsTest_0110] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('button_PREFER_WINDOW'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      console.info('[SetMenuOptionsTest_0110] click succ');
      let TextInput = await driver.findComponent(ON.type('TextArea'));
      await (TextInput?.longClick() as Promise<void>)
      await CommonFunc.sleep(2000);
      console.info('[SetMenuOptionsTest_0110] longClick succ');
      let window = await (driver.findWindow({ active: true }) as Promise<UiWindow>);


        let mode = await window.getWindowMode();
        console.info('[SetMenuOptionsTest_0110] mode: ' + JSON.stringify(mode));
        expect([0, 2, 3]).assertContain(mode);

      console.info('[SetMenuOptionsTest_0110] END');
      done();
    });


    /**
     * @tc.number   SetMenuOptionsTest_static_0120
     * @tc.name     SetMenuOptionsTest_static_0120
     * @tc.desc     SetMenuOptionsTest_static_0120
     * @tc.level    Level.LEVEL0
     */
it('SetMenuOptionsTest_static_0120', Level.LEVEL0, async (done: () =>void) : Promise<void> => {
      console.info('[SetMenuOptionsTest_0120] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('button_undefined'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      console.info('[SetMenuOptionsTest_0120] click succ');
      let TextInput = await driver.findComponent(ON.type('TextArea'));
      await (TextInput?.longClick() as Promise<void>)
      await CommonFunc.sleep(500);
      console.info('[SetMenuOptionsTest_0120] longClick succ');
      let window = await (driver.findWindow({ active: true }) as Promise<UiWindow>);


        let mode = await window.getWindowMode();
        console.info('[SetMenuOptionsTest_0120] mode: ' + JSON.stringify(mode));
        expect([0, 3]).assertContain(mode);

      console.info('[SetMenuOptionsTest_0120] END');
      done();
    });


    /**
     * @tc.number   SetMenuOptionsTest_static_0130
     * @tc.name     SetMenuOptionsTest_static_0130
     * @tc.desc     SetMenuOptionsTest_static_0130
     * @tc.level    Level.LEVEL0
     */
it('SetMenuOptionsTest_static_0130', Level.LEVEL0, async (done: () =>void) : Promise<void> => {
      console.info('[SetMenuOptionsTest_0130] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.type('Search'));
      await (Button?.longClick() as Promise<void>)
      await CommonFunc.sleep(2000);
      console.info('[SetMenuOptionsTest_0130] longClick succ');
      let window = await (driver.findWindow({ active: true }) as Promise<UiWindow>);


        let mode = await window.getWindowMode();
        console.info('[SetMenuOptionsTest_0130] mode: ' + JSON.stringify(mode));
        expect([0, 3]).assertContain(mode);

      console.info('[SetMenuOptionsTest_0130] END');
      done();
    });


    /**
     * @tc.number   SetMenuOptionsTest_static_0140
     * @tc.name     SetMenuOptionsTest_static_0140
     * @tc.desc     SetMenuOptionsTest_static_0140
     * @tc.level    Level.LEVEL0
     */
it('SetMenuOptionsTest_static_0140', Level.LEVEL0, async (done: () =>void) : Promise<void> => {
      console.info('[SetMenuOptionsTest_0140] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('button_DEFAULT'));
      await (Button?.click() as Promise<void>)
      console.info('[SetMenuOptionsTest_0140] click succ');
      await CommonFunc.sleep(1000);
      let TextInput = await driver.findComponent(ON.type('Search'));
      await (TextInput?.longClick() as Promise<void>)
      await CommonFunc.sleep(2000);
      console.info('[SetMenuOptionsTest_0140] longClick succ');
      let window = await (driver.findWindow({ active: true }) as Promise<UiWindow>);


        let mode = await window.getWindowMode();
        console.info('[SetMenuOptionsTest_0140] mode: ' + JSON.stringify(mode));
        expect([0, 3]).assertContain(mode);

      console.info('[SetMenuOptionsTest_0140] END');
      done();
    });


    /**
     * @tc.number   SetMenuOptionsTest_static_0150
     * @tc.name     SetMenuOptionsTest_static_0150
     * @tc.desc     SetMenuOptionsTest_static_0150
     * @tc.level    Level.LEVEL0
     */
it('SetMenuOptionsTest_static_0150', Level.LEVEL0, async (done: () =>void) : Promise<void> => {
      console.info('[SetMenuOptionsTest_0150] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('button_PREFER_WINDOW'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      console.info('[SetMenuOptionsTest_0150] click succ');
      let TextInput = await driver.findComponent(ON.type('Search'));
      await (TextInput?.longClick() as Promise<void>)
      await CommonFunc.sleep(2000);
      console.info('[SetMenuOptionsTest_0150] longClick succ');
      let window = await (driver.findWindow({ active: true }) as Promise<UiWindow>);


        let mode = await window.getWindowMode();
        console.info('[SetMenuOptionsTest_0150] mode: ' + JSON.stringify(mode));
        expect([0, 2, 3]).assertContain(mode);

      console.info('[SetMenuOptionsTest_0150] END');
      done();
    });


    /**
     * @tc.number   SetMenuOptionsTest_static_0160
     * @tc.name     SetMenuOptionsTest_static_0160
     * @tc.desc     SetMenuOptionsTest_static_0160
     * @tc.level    Level.LEVEL0
     */
it('SetMenuOptionsTest_static_0160', Level.LEVEL0, async (done: () =>void) : Promise<void> => {
      console.info('[SetMenuOptionsTest_0160] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('button_undefined'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      console.info('[SetMenuOptionsTest_0160] click succ');
      let TextInput = await driver.findComponent(ON.type('Search'));
      await (TextInput?.longClick() as Promise<void>)
      await CommonFunc.sleep(500);
      console.info('[SetMenuOptionsTest_0160] longClick succ');
      let window = await (driver.findWindow({ active: true }) as Promise<UiWindow>);


        let mode = await window.getWindowMode();
        console.info('[SetMenuOptionsTest_0160] mode: ' + JSON.stringify(mode));
        expect([0, 3]).assertContain(mode);

      console.info('[SetMenuOptionsTest_0160] END');
      done();
    });


    /**
     * @tc.number   SetMenuOptionsTest_static_0170
     * @tc.name     SetMenuOptionsTest_static_0170
     * @tc.desc     SetMenuOptionsTest_static_0170
     * @tc.level    Level.LEVEL0
     */
it('SetMenuOptionsTest_static_0170', Level.LEVEL0, async (done: () =>void) : Promise<void> => {
      console.info('[SetMenuOptionsTest_0170] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.type('RichEditor'));
      await (Button?.longClick() as Promise<void>)
      await CommonFunc.sleep(2000);
      console.info('[SetMenuOptionsTest_0170] longClick succ');
      let window = await (driver.findWindow({ active: true }) as Promise<UiWindow>);


        let mode = await window.getWindowMode();
        console.info('[SetMenuOptionsTest_0170] mode: ' + JSON.stringify(mode));
        expect([0, 3]).assertContain(mode);

      console.info('[SetMenuOptionsTest_0170] END');
      done();
    });


    /**
     * @tc.number   SetMenuOptionsTest_static_0180
     * @tc.name     SetMenuOptionsTest_static_0180
     * @tc.desc     SetMenuOptionsTest_static_0180
     * @tc.level    Level.LEVEL0
     */
it('SetMenuOptionsTest_static_0180', Level.LEVEL0, async (done: () =>void) : Promise<void> => {
      console.info('[SetMenuOptionsTest_0180] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('button_DEFAULT'));
      await (Button?.click() as Promise<void>)
      console.info('[SetMenuOptionsTest_0180] click succ');
      await CommonFunc.sleep(1000);
      let TextInput = await driver.findComponent(ON.type('RichEditor'));
      await (TextInput?.longClick() as Promise<void>)
      await CommonFunc.sleep(2000);
      console.info('[SetMenuOptionsTest_0180] longClick succ');
      let window = await (driver.findWindow({ active: true }) as Promise<UiWindow>);


        let mode = await window.getWindowMode();
        console.info('[SetMenuOptionsTest_0180] mode: ' + JSON.stringify(mode));
        expect([0, 3]).assertContain(mode);

      console.info('[SetMenuOptionsTest_0180] END');
      done();
    });


    /**
     * @tc.number   SetMenuOptionsTest_static_0190
     * @tc.name     SetMenuOptionsTest_static_0190
     * @tc.desc     SetMenuOptionsTest_static_0190
     * @tc.level    Level.LEVEL0
     */
it('SetMenuOptionsTest_static_0190', Level.LEVEL0, async (done: () =>void) : Promise<void> => {
      console.info('[SetMenuOptionsTest_0190] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('button_PREFER_WINDOW'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      console.info('[SetMenuOptionsTest_0190] click succ');
      let TextInput = await driver.findComponent(ON.type('RichEditor'));
      await (TextInput?.longClick() as Promise<void>)
      await CommonFunc.sleep(2000);
      console.info('[SetMenuOptionsTest_0190] longClick succ');
      let window = await (driver.findWindow({ active: true }) as Promise<UiWindow>);
        let mode = await window.getWindowMode();
        console.info('[SetMenuOptionsTest_0190] mode: ' + JSON.stringify(mode));
        expect([0, 2, 3]).assertContain(mode);

      console.info('[SetMenuOptionsTest_0190] END');
      done();
    });


    /**
     * @tc.number   SetMenuOptionsTest_static_0200
     * @tc.name     SetMenuOptionsTest_static_0200
     * @tc.desc     SetMenuOptionsTest_static_0200
     * @tc.level    Level.LEVEL0
     */
it('SetMenuOptionsTest_static_0200', Level.LEVEL0, async (done: () =>void) : Promise<void> => {
      console.info('[SetMenuOptionsTest_0200] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('button_undefined'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      console.info('[SetMenuOptionsTest_0200] click succ');
      let TextInput = await driver.findComponent(ON.type('RichEditor'));
      await (TextInput?.longClick() as Promise<void>)
      await CommonFunc.sleep(500);
      console.info('[SetMenuOptionsTest_0200] longClick succ');
      let window = await (driver.findWindow({ active: true }) as Promise<UiWindow>);


        let mode = await window.getWindowMode();
        console.info('[SetMenuOptionsTest_0200] mode: ' + JSON.stringify(mode));
        expect([0, 3]).assertContain(mode);

      console.info('[SetMenuOptionsTest_0200] END');
      done();
    });


    /**
     * @tc.number   SetMenuOptionsTest_static_0210
     * @tc.name     SetMenuOptionsTest_static_0210
     * @tc.desc     SetMenuOptionsTest_static_0210
     * @tc.level    Level.LEVEL0
     */
it('SetMenuOptionsTest_static_0210', Level.LEVEL0, async (done: () =>void) : Promise<void> => {
      console.info('[SetMenuOptionsTest_0210] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('button_null'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      console.info('[SetMenuOptionsTest_0210] click succ');
      let TextInput = await driver.findComponent(ON.type('RichEditor'));
      await (TextInput?.longClick() as Promise<void>)
      await CommonFunc.sleep(500);
      console.info('[SetMenuOptionsTest_0210] longClick succ');
      let window = await (driver.findWindow({ active: true }) as Promise<UiWindow>);


        let mode = await window.getWindowMode();
        console.info('[SetMenuOptionsTest_0210] mode: ' + JSON.stringify(mode));
        expect([0, 3]).assertContain(mode);

      console.info('[SetMenuOptionsTest_0210] END');
      done();
    });


    /**
     * @tc.number   SetMenuOptionsTest_static_0220
     * @tc.name     SetMenuOptionsTest_static_0220
     * @tc.desc     SetMenuOptionsTest_static_0220
     * @tc.level    Level.LEVEL0
     */
it('SetMenuOptionsTest_static_0220', Level.LEVEL0, async (done: () =>void) : Promise<void> => {
      console.info('[SetMenuOptionsTest_0220] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('button_null'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      console.info('[SetMenuOptionsTest_0220] click succ');
      let TextInput = await driver.findComponent(ON.type('Text'));
      await (TextInput?.longClick() as Promise<void>)
      await CommonFunc.sleep(500);
      console.info('[SetMenuOptionsTest_0220] longClick succ');
      let window = await (driver.findWindow({ active: true }) as Promise<UiWindow>);


        let mode = await window.getWindowMode();
        console.info('[SetMenuOptionsTest_0220] mode: ' + JSON.stringify(mode));
        expect([0, 3]).assertContain(mode);

      console.info('[SetMenuOptionsTest_0220] END');
      done();
    });


    /**
     * @tc.number   SetMenuOptionsTest_static_0230
     * @tc.name     SetMenuOptionsTest_static_0230
     * @tc.desc     SetMenuOptionsTest_static_0230
     * @tc.level    Level.LEVEL0
     */
it('SetMenuOptionsTest_static_0230', Level.LEVEL0, async (done: () =>void) : Promise<void> => {
      console.info('[SetMenuOptionsTest_0230] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('button_null'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      console.info('[SetMenuOptionsTest_0230] click succ');
      let TextInput = await driver.findComponent(ON.type('TextInput'));
      await (TextInput?.longClick() as Promise<void>)
      await CommonFunc.sleep(500);
      console.info('[SetMenuOptionsTest_0230] longClick succ');
      let window = await (driver.findWindow({ active: true }) as Promise<UiWindow>);


        let mode = await window.getWindowMode();
        console.info('[SetMenuOptionsTest_0230] mode: ' + JSON.stringify(mode));
        expect([0, 3]).assertContain(mode);

      console.info('[SetMenuOptionsTest_0230] END');
      done();
    });


    /**
     * @tc.number   SetMenuOptionsTest_static_0240
     * @tc.name     SetMenuOptionsTest_static_0240
     * @tc.desc     SetMenuOptionsTest_static_0240
     * @tc.level    Level.LEVEL0
     */
it('SetMenuOptionsTest_static_0240', Level.LEVEL0, async (done: () =>void) : Promise<void> => {
      console.info('[SetMenuOptionsTest_0240] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('button_null'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      console.info('[SetMenuOptionsTest_0240] click succ');
      let TextInput = await driver.findComponent(ON.type('TextArea'));
      await (TextInput?.longClick() as Promise<void>)
      await CommonFunc.sleep(500);
      console.info('[SetMenuOptionsTest_0240] longClick succ');
      let window = await (driver.findWindow({ active: true }) as Promise<UiWindow>);
        let mode = await window.getWindowMode();
        console.info('[SetMenuOptionsTest_0240] mode: ' + JSON.stringify(mode));
        expect([0, 3]).assertContain(mode);

      console.info('[SetMenuOptionsTest_0240] END');
      done();
    });


    /**
     * @tc.number
     * @tc.name     SetMenuOptionsTest_static_0250
     * @tc.desc     SetMenuOptionsTest_static_0250
     * @tc.level    Level.LEVEL0
     */
it('SetMenuOptionsTest_static_0250', Level.LEVEL0, async (done: () =>void) : Promise<void> => {
      console.info('[SetMenuOptionsTest_0250] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('button_null'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      console.info('[SetMenuOptionsTest_0250] click succ');
      let TextInput = await driver.findComponent(ON.type('Search'));
      await (TextInput?.longClick() as Promise<void>)
      await CommonFunc.sleep(500);
      console.info('[SetMenuOptionsTest_0250] longClick succ');
      let window = await (driver.findWindow({ active: true }) as Promise<UiWindow>);


        let mode = await window.getWindowMode();
        console.info('[SetMenuOptionsTest_0250] mode: ' + JSON.stringify(mode));
        expect([0, 3]).assertContain(mode);

      console.info('[SetMenuOptionsTest_0250] END');
      done();
    });
  })
}