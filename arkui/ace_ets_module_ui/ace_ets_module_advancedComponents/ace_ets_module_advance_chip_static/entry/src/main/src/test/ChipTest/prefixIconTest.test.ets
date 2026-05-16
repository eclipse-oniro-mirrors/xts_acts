'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation,
  ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import {UtilsTest,startAbility} from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Color, FontWeight, $r, Resource } from '@ohos.arkui.component'

export default function prefixIconTest() {
  describe('prefixIconTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("prefixIconTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.advance.chip.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("prefixIconTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Chip/prefixIconTest",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get prefixIconTest state pages:" + JSON.stringify(pages));
        if (!("prefixIconTest" == pages.name)) {
          console.info("get prefixIconTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push prefixIconTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push prefixIconTest page error:" + err);
      }
      console.info("prefixIconTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("prefixIconTest after each called");
    });


    /**
     * @tc.number   prefixIconTest_static_0010
     * @tc.name     prefixIconTest_static_0010
     * @tc.desc     prefixIconTest_static_0010
     * @tc.level    Level.LEVEL1
     */
    it('prefixIconTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[prefixIconTest_static_0010] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btnElement1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
      console.info("[prefixIconTest_static_0010] btnElement1 fontColor is: " +
      JSON.stringify(btnElement1.getElement('$attrs').getString('fontColor')));
      expect(btnElement1.getElement('$attrs').getString('fontColor')).assertEqual("#FF008000");

      let btn1 = await driver.findComponent(ON.id('prefixIcon_isActivated_true'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let btnElement2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
      console.info("[prefixIconTest_static_0010] btnElement2 fontColor2 is: " +
      JSON.stringify(btnElement2.getElement('$attrs').getString('fontColor')));
      expect(btnElement2.getElement('$attrs').getString('fontColor')).assertEqual("#FFFF0000");

      let btn2 = await driver.findComponent(ON.id('prefixIcon_isActivated_false'));
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      console.info('[prefixIconTest_static_0010] END');
      done();
    });

    /**
     * @tc.number   prefixIconTest_static_0020
     * @tc.name     prefixIconTest_static_0020
     * @tc.desc     prefixIconTest_static_0020
     * @tc.level    Level.LEVEL1
     */
    it('prefixIconTest_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[prefixIconTest_static_0020] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btnElement1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[1]
        .getArray("$children")[0]
        .getArray("$children")[0]
      console.info("[prefixIconTest_static_0020] btnElement1 fillColor is: " +
      JSON.stringify(btnElement1.getElement('$attrs').getString('fillColor')));
      expect(btnElement1.getElement('$attrs').getString('fillColor')).assertEqual("#FFFFC0CB");

      let btn1 = await driver.findComponent(ON.id('prefixIcon_isActivated_true'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let btnElement2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[1]
        .getArray("$children")[0]
        .getArray("$children")[0]
      console.info("[prefixIconTest_static_0020] btnElement2 fillColor2 is: " +
      JSON.stringify(btnElement2.getElement('$attrs').getString('fillColor')));
      expect(btnElement2.getElement('$attrs').getString('fillColor')).assertEqual("#FFFF0000");
      
      let btn2 = await driver.findComponent(ON.id('prefixIcon_isActivated_false'));
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      console.info('[prefixIconTest_static_0020] END');
      done();
    });

    /**
     * @tc.number   prefixIconTest_static_0030
     * @tc.name     prefixIconTest_static_0030
     * @tc.desc     prefixIconTest_static_0030
     * @tc.level    Level.LEVEL1
     */
    it('prefixIconTest_static_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[prefixIconTest_static_0030] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btnElement1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getArray("$children")[0]
        .getArray("$children")[0]
      console.info("[prefixIconTest_static_0030] btnElement1 fillColor is: " +
      JSON.stringify(btnElement1.getElement('$attrs').getString('fillColor')));
      expect(btnElement1.getElement('$attrs').getString('fillColor')).assertEqual("#FFFFC0CB");

      let btn1 = await driver.findComponent(ON.id('prefixIcon_isActivated_true'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let btnElement2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getArray("$children")[0]
        .getArray("$children")[0]
      console.info("[prefixIconTest_static_0030] btnElement2 fillColor2 is: " +
      JSON.stringify(btnElement2.getElement('$attrs').getString('fillColor')));
      expect(btnElement2.getElement('$attrs').getString('fillColor')).assertEqual("#FFFF0000");
      
      let btn2 = await driver.findComponent(ON.id('prefixIcon_isActivated_false'));
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      console.info('[prefixIconTest_static_0030] END');
      done();
    });

    /**
     * @tc.number   prefixIconTest_static_0040
     * @tc.name     prefixIconTest_static_0040
     * @tc.desc     prefixIconTest_static_0040
     * @tc.level    Level.LEVEL1
     */
    it('prefixIconTest_static_0040', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[prefixIconTest_static_0040] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btnElement1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[3]
        .getArray("$children")[0]
        .getArray("$children")[0]
      console.info("[prefixIconTest_static_0040] btnElement1 fillColor is: " +
      JSON.stringify(btnElement1.getElement('$attrs').getString('fillColor')));
      expect(btnElement1.getElement('$attrs').getString('fillColor')).assertEqual("#FFFFC0CB");

      let btn1 = await driver.findComponent(ON.id('prefixIcon_isActivated_true'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let btnElement2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[3]
        .getArray("$children")[0]
        .getArray("$children")[0]
      console.info("[prefixIconTest_static_0040] btnElement2 fillColor2 is: " +
      JSON.stringify(btnElement2.getElement('$attrs').getString('fillColor')));
      expect(btnElement2.getElement('$attrs').getString('fillColor')).assertEqual("#FFFF0000");
      
      let btn2 = await driver.findComponent(ON.id('prefixIcon_isActivated_false'));
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      console.info('[prefixIconTest_static_0040] END');
      done();
    });

    /**
     * @tc.number   prefixIconTest_static_0050
     * @tc.name     prefixIconTest_static_0050
     * @tc.desc     prefixIconTest_static_0050
     * @tc.level    Level.LEVEL1
     */
    it('prefixIconTest_static_0050', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[prefixIconTest_static_0050] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btnElement = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[4]
        .getArray("$children")[0]
        .getArray("$children")[0]
      let btnUn = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[5]
        .getArray("$children")[0]
        .getArray("$children")[0]

      console.info("[prefixIconTest_static_0050] btnElement fillColor is: " +
      JSON.stringify(btnElement.getElement('$attrs').getString('fillColor')));
      console.info("[prefixIconTest_static_0050] btnUn fillColor is: " +
      JSON.stringify(btnUn.getElement('$attrs').getString('fillColor')));
      expect(btnElement.getElement('$attrs').getString('fillColor'))
        .assertEqual(btnUn.getElement('$attrs').getString('fillColor'));

      let btn1 = await driver.findComponent(ON.id('prefixIcon_isActivated_true'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      console.info("[prefixIconTest_static_0050] btnElement fillColor2 is: " +
      JSON.stringify(btnElement.getElement('$attrs').getString('fillColor')));
      console.info("[prefixIconTest_static_0050] btnUn fillColor2 is: " +
      JSON.stringify(btnUn.getElement('$attrs').getString('fillColor')));
      expect(btnElement.getElement('$attrs').getString('fillColor'))
        .assertEqual(btnUn.getElement('$attrs').getString('fillColor'));
      
      let btn2 = await driver.findComponent(ON.id('prefixIcon_isActivated_false'));
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      console.info('[prefixIconTest_static_0050] END');
      done();
    });

  })
}