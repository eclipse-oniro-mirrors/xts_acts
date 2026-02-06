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
import { beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import inspector from '@ohos.arkui.inspector'
import { Component, Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import router from '@ohos.router';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;


export default function ObjectFitTest() {
  describe('ObjectFitTest', () => {
    beforeAll(() => {
      console.info("ObjectFitTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api15.static", "EntryAbility")

    });
    beforeEach(async (): Promise<void> => {
      console.info("ObjectFitTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageAttachment/ObjectFit',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get ObjectFitTest state pages: " + JSON.stringify(pages));
        if (!("ObjectFit" == pages.name)) {
          console.info("get ObjectFitTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ObjectFitTest page error: " + err);
        expect().assertFail();
      }
    });


    /**
     * @tc.number   ObjectFitTest_static_0010
     * @tc.name     ObjectFitTest_static_0010
     * @tc.desc     ObjectFitTest_static_0010
     * @tc.level    Level.LEVEL2
     */
    it('ObjectFitTest_static_0010', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ObjectFitTest_0010] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button: Component = await driver.findComponent(ON.id('set_ObjectFit_append')) as Component;
      await Button.click()
      await CommonFunc.sleep(1000);
      let Button1: Component = await driver.findComponent(ON.id('get_ObjectFit_styles')) as Component;
      await Button1.click()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('get_ObjectFit');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ObjectFitTest_0010] component obj is: " +
      JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertContain('3');
      console.info('[ObjectFitTest_0010] END');
      done();
    });


    /**
     * @tc.number   ObjectFitTest_static_0020
     * @tc.name     ObjectFitTest_static_0020
     * @tc.desc     ObjectFitTest_static_0020
     * @tc.level    Level.LEVEL2
     */
    it('ObjectFitTest_static_0020', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ObjectFitTest_0020] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button: Component = await driver.findComponent(ON.id('Set_ImageFit_Contain')) as Component;
      await Button.click()
      await CommonFunc.sleep(1000);
      let Button1: Component = await driver.findComponent(ON.id('set_ObjectFit_append')) as Component;
      await Button1.click()
      await CommonFunc.sleep(1000);
      let Button2: Component = await driver.findComponent(ON.id('get_ObjectFit_styles')) as Component;
      await Button2.click()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('get_ObjectFit');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ObjectFitTest_0020] component obj is: " +
      JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertContain('1');
      console.info('[ObjectFitTest_0020] END');
      done();
    });


    /**
     * @tc.number   ObjectFitTest_static_0030
     * @tc.name     ObjectFitTest_static_0030
     * @tc.desc     ObjectFitTest_static_0030
     * @tc.level    Level.LEVEL2
     */
    it('ObjectFitTest_static_0030', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ObjectFitTest_0030] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button: Component = await driver.findComponent(ON.id('Set_ImageFit_Cover')) as Component;
      await Button.click()
      await CommonFunc.sleep(1000);
      let Button1: Component = await driver.findComponent(ON.id('set_ObjectFit_append')) as Component;
      await Button1.click()
      await CommonFunc.sleep(1000);
      let Button2: Component = await driver.findComponent(ON.id('get_ObjectFit_styles')) as Component;
      await Button2.click()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('get_ObjectFit');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ObjectFitTest_0030] component obj is: " +
      JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('2');
      console.info('[ObjectFitTest_0030] END');
      done();
    });


    /**
     * @tc.number   ObjectFitTest_static_0040
     * @tc.name     ObjectFitTest_static_0040
     * @tc.desc     ObjectFitTest_static_0040
     * @tc.level    Level.LEVEL2
     */
    it('ObjectFitTest_static_0040', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ObjectFitTest_0040] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button: Component = await driver.findComponent(ON.id('Set_ImageFit_Fill')) as Component;
      await Button.click()
      await CommonFunc.sleep(1000);
      let Button1: Component = await driver.findComponent(ON.id('set_ObjectFit_append')) as Component;
      await Button1.click()
      await CommonFunc.sleep(1000);
      let Button2: Component = await driver.findComponent(ON.id('get_ObjectFit_styles')) as Component;
      await Button2.click()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('get_ObjectFit');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ObjectFitTest_0040] component obj is: " +
      JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('0');
      console.info('[ObjectFitTest_0040] END');
      done();
    });


    /**
     * @tc.number   ObjectFitTest_static_0050
     * @tc.name     ObjectFitTest_static_0050
     * @tc.desc     ObjectFitTest_static_0050
     * @tc.level    Level.LEVEL2
     */
    it('ObjectFitTest_static_0050', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ObjectFitTest_0050] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button: Component = await driver.findComponent(ON.id('Set_ImageFit_ScaleDown')) as Component;
      await Button.click()
      await CommonFunc.sleep(1000);
      let Button1: Component = await driver.findComponent(ON.id('set_ObjectFit_append')) as Component;
      await Button1.click()
      await CommonFunc.sleep(1000);
      let Button2: Component = await driver.findComponent(ON.id('get_ObjectFit_styles')) as Component;
      await Button2.click()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('get_ObjectFit');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ObjectFitTest_0050] component obj is: " +
      JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('6');
      console.info('[ObjectFitTest_0050] END');
      done();
    });


    //     /*
    //      * @tc.number   ObjectFitTest_static_0060
    //      * @tc.name     ObjectFitTest_static_0060
    //      * @tc.desc     ObjectFitTest_static_0060
    //      * @tc.level    Level.LEVEL2
    //      */
    // it('ObjectFitTest_static_0060', Level.LEVEL2, async (done: () => void): Promise<void> => {
    //       console.info('[ObjectFitTest_0060] START');
    //       let driver = Driver.create();
    //       await CommonFunc.sleep(500);
    //       let Button:Component = await driver.findComponent(ON.id('Set_ImageFit_None')) as Component;
    //       await Button.click()
    //       await CommonFunc.sleep(1000);
    //       let Button1:Component = await driver.findComponent(ON.id('set_ObjectFit_append')) as Component;
    //       await Button1.click()
    //       await CommonFunc.sleep(1000);
    //       let Button2:Component = await driver.findComponent(ON.id('get_ObjectFit_styles')) as Component;
    //       await Button2.click()
    //       await CommonFunc.sleep(1000);
    //       let strJson = inspector.getInspectorByKey('get_ObjectFit');
    //       let obj = JSON.parseJsonElement(strJson);
    //       console.info("[ObjectFitTest_0060] component obj is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
    //       expect(obj.getElement('$attrs').getString('content')).assertEqual('5');
    //       console.info('[ObjectFitTest_0060] END');
    //       done();
    //     });
    //
    //
    //     /*
    //      * @tc.number   ObjectFitTest_static_0070
    //      * @tc.name     ObjectFitTest_static_0070
    //      * @tc.desc     ObjectFitTest_static_0070
    //      * @tc.level    Level.LEVEL2
    //      */
    // it('ObjectFitTest_static_0070', Level.LEVEL2, async (done: () => void): Promise<void> => {
    //       console.info('[ObjectFitTest_0070] START');
    //       let driver = Driver.create();
    //       await CommonFunc.sleep(500);
    //       let Button:Component = await driver.findComponent(ON.id('Set_ImageFit_TOP_START')) as Component;
    //       await Button.click()
    //       await CommonFunc.sleep(1000);
    //       let Button1:Component = await driver.findComponent(ON.id('set_ObjectFit_append')) as Component;
    //       await Button1.click()
    //       await CommonFunc.sleep(1000);
    //       let Button2:Component = await driver.findComponent(ON.id('get_ObjectFit_styles')) as Component;
    //       await Button2.click()
    //       await CommonFunc.sleep(1000);
    //       let strJson = inspector.getInspectorByKey('get_ObjectFit');
    //       let obj = JSON.parseJsonElement(strJson);
    //       console.info("[ObjectFitTest_0070] component obj is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
    //       expect(obj.getElement('$attrs').getString('content')).assertEqual('7');
    //       console.info('[ObjectFitTest_0070] END');
    //       done();
    //     });
    //
    //
    //     /*
    //      * @tc.number   ObjectFitTest_static_0080
    //      * @tc.name     ObjectFitTest_static_0080
    //      * @tc.desc     ObjectFitTest_static_0080
    //      * @tc.level    Level.LEVEL2
    //      */
    // it('ObjectFitTest_static_0080', Level.LEVEL2, async (done: () => void): Promise<void> => {
    //       console.info('[ObjectFitTest_0080] START');
    //       let driver = Driver.create();
    //       await CommonFunc.sleep(500);
    //       let Button:Component = await driver.findComponent(ON.id('Set_ImageFit_TOP')) as Component;
    //       await Button.click()
    //       await CommonFunc.sleep(1000);
    //       let Button1:Component = await driver.findComponent(ON.id('set_ObjectFit_append')) as Component;
    //       await Button1.click()
    //       await CommonFunc.sleep(1000);
    //       let Button2:Component = await driver.findComponent(ON.id('get_ObjectFit_styles')) as Component;
    //       await Button2.click()
    //       await CommonFunc.sleep(1000);
    //       let strJson = inspector.getInspectorByKey('get_ObjectFit');
    //       let obj = JSON.parseJsonElement(strJson);
    //       console.info("[ObjectFitTest_0080] component obj is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
    //       expect(obj.getElement('$attrs').getString('content')).assertEqual('8');
    //       console.info('[ObjectFitTest_0080] END');
    //       done();
    //     });
    //
    //
    //     /*
    //      * @tc.number   ObjectFitTest_static_0090
    //      * @tc.name     ObjectFitTest_static_0090
    //      * @tc.desc     ObjectFitTest_static_0090
    //      * @tc.level    Level.LEVEL2
    //      */
    // it('ObjectFitTest_static_0090', Level.LEVEL2, async (done: () => void): Promise<void> => {
    //       console.info('[ObjectFitTest_0090] START');
    //       let driver = Driver.create();
    //       await CommonFunc.sleep(500);
    //       let Button:Component = await driver.findComponent(ON.id('Set_ImageFit_TOP_END')) as Component;
    //       await Button.click()
    //       await CommonFunc.sleep(1000);
    //       let Button1:Component = await driver.findComponent(ON.id('set_ObjectFit_append')) as Component;
    //       await Button1.click()
    //       await CommonFunc.sleep(1000);
    //       let Button2:Component = await driver.findComponent(ON.id('get_ObjectFit_styles')) as Component;
    //       await Button2.click()
    //       await CommonFunc.sleep(1000);
    //       let strJson = inspector.getInspectorByKey('get_ObjectFit');
    //       let obj = JSON.parseJsonElement(strJson);
    //       console.info("[ObjectFitTest_0090] component obj is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
    //       expect(obj.getElement('$attrs').getString('content')).assertEqual('9');
    //       console.info('[ObjectFitTest_0090] END');
    //       done();
    //     });
    //
    //
    //     /*
    //      * @tc.number   ObjectFitTest_static_0100
    //      * @tc.name     ObjectFitTest_static_0100
    //      * @tc.desc     ObjectFitTest_static_0100
    //      * @tc.level    Level.LEVEL2
    //      */
    // it('ObjectFitTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
    //       console.info('[ObjectFitTest_0100] START');
    //       let driver = Driver.create();
    //       await CommonFunc.sleep(500);
    //       let Button:Component = await driver.findComponent(ON.id('Set_ImageFit_START')) as Component;
    //       await Button.click()
    //       await CommonFunc.sleep(1000);
    //       let Button1:Component = await driver.findComponent(ON.id('set_ObjectFit_append')) as Component;
    //       await Button1.click()
    //       await CommonFunc.sleep(1000);
    //       let Button2:Component = await driver.findComponent(ON.id('get_ObjectFit_styles')) as Component;
    //       await Button2.click()
    //       await CommonFunc.sleep(1000);
    //       let strJson = inspector.getInspectorByKey('get_ObjectFit');
    //       let obj = JSON.parseJsonElement(strJson);
    //       console.info("[ObjectFitTest_0100] component obj is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
    //       expect(obj.getElement('$attrs').getString('content')).assertEqual('10');
    //       console.info('[ObjectFitTest_0100] END');
    //       done();
    //     });
    //
    //
    //     /*
    //      * @tc.number   ObjectFitTest_static_0110
    //      * @tc.name     ObjectFitTest_static_0110
    //      * @tc.desc     ObjectFitTest_static_0110
    //      * @tc.level    Level.LEVEL2
    //      */
    // it('ObjectFitTest_static_0110', Level.LEVEL2, async (done: () => void): Promise<void> => {
    //       console.info('[ObjectFitTest_0110] START');
    //       let driver = Driver.create();
    //       await CommonFunc.sleep(500);
    //       let Button:Component = await driver.findComponent(ON.id('Set_ImageFit_CENTER')) as Component;
    //       await Button.click()
    //       await CommonFunc.sleep(1000);
    //       let Button1:Component = await driver.findComponent(ON.id('set_ObjectFit_append')) as Component;
    //       await Button1.click()
    //       await CommonFunc.sleep(1000);
    //       let Button2:Component = await driver.findComponent(ON.id('get_ObjectFit_styles')) as Component;
    //       await Button2.click()
    //       await CommonFunc.sleep(1000);
    //       let strJson = inspector.getInspectorByKey('get_ObjectFit');
    //       let obj = JSON.parseJsonElement(strJson);
    //       console.info("[ObjectFitTest_0110] component obj is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
    //       expect(obj.getElement('$attrs').getString('content')).assertEqual('11');
    //       console.info('[ObjectFitTest_0110] END');
    //       done();
    //     });
    //
    //
    //     /*
    //      * @tc.number   ObjectFitTest_static_0120
    //      * @tc.name     ObjectFitTest_static_0120
    //      * @tc.desc     ObjectFitTest_static_0120
    //      * @tc.level    Level.LEVEL2
    //      */
    // it('ObjectFitTest_static_0120', Level.LEVEL2, async (done: () => void): Promise<void> => {
    //       console.info('[ObjectFitTest_0120] START');
    //       let driver = Driver.create();
    //       await CommonFunc.sleep(500);
    //       let Button:Component = await driver.findComponent(ON.id('Set_ImageFit_END')) as Component;
    //       await Button.click()
    //       await CommonFunc.sleep(1000);
    //       let Button1:Component = await driver.findComponent(ON.id('set_ObjectFit_append')) as Component;
    //       await Button1.click()
    //       await CommonFunc.sleep(1000);
    //       let Button2:Component = await driver.findComponent(ON.id('get_ObjectFit_styles')) as Component;
    //       await Button2.click()
    //       await CommonFunc.sleep(1000);
    //       let strJson = inspector.getInspectorByKey('get_ObjectFit');
    //       let obj = JSON.parseJsonElement(strJson);
    //       console.info("[ObjectFitTest_0120] component obj is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
    //       expect(obj.getElement('$attrs').getString('content')).assertEqual('12');
    //       console.info('[ObjectFitTest_0120] END');
    //       done();
    //     });
    //
    //
    //     /*
    //      * @tc.number   ObjectFitTest_static_0130
    //      * @tc.name     ObjectFitTest_static_0130
    //      * @tc.desc     ObjectFitTest_static_0130
    //      * @tc.level    Level.LEVEL2
    //      */
    // it('ObjectFitTest_static_0130', Level.LEVEL2, async (done: () => void): Promise<void> => {
    //       console.info('[ObjectFitTest_0130] START');
    //       let driver = Driver.create();
    //       await CommonFunc.sleep(500);
    //       let Button:Component = await driver.findComponent(ON.id('Set_ImageFit_BOTTOM_START')) as Component;
    //       await Button.click()
    //       await CommonFunc.sleep(1000);
    //       let Button1:Component = await driver.findComponent(ON.id('set_ObjectFit_append')) as Component;
    //       await Button1.click()
    //       await CommonFunc.sleep(1000);
    //       let Button2:Component = await driver.findComponent(ON.id('get_ObjectFit_styles')) as Component;
    //       await Button2.click()
    //       await CommonFunc.sleep(1000);
    //       let strJson = inspector.getInspectorByKey('get_ObjectFit');
    //       let obj = JSON.parseJsonElement(strJson);
    //       console.info("[ObjectFitTest_0130] component obj is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
    //       expect(obj.getElement('$attrs').getString('content')).assertEqual('13');
    //       console.info('[ObjectFitTest_0130] END');
    //       done();
    //     });
    //
    //
    //     /*
    //      * @tc.number   ObjectFitTest_static_0140
    //      * @tc.name     ObjectFitTest_static_0140
    //      * @tc.desc     ObjectFitTest_static_0140
    //      * @tc.level    Level.LEVEL2
    //      */
    // it('ObjectFitTest_static_0140', Level.LEVEL2, async (done: () => void): Promise<void> => {
    //       console.info('[ObjectFitTest_0140] START');
    //       let driver = Driver.create();
    //       await CommonFunc.sleep(500);
    //       let Button:Component = await driver.findComponent(ON.id('Set_ImageFit_BOTTOM')) as Component;
    //       await Button.click()
    //       await CommonFunc.sleep(1000);
    //       let Button1:Component = await driver.findComponent(ON.id('set_ObjectFit_append')) as Component;
    //       await Button1.click()
    //       await CommonFunc.sleep(1000);
    //       let Button2:Component = await driver.findComponent(ON.id('get_ObjectFit_styles')) as Component;
    //       await Button2.click()
    //       await CommonFunc.sleep(1000);
    //       let strJson = inspector.getInspectorByKey('get_ObjectFit');
    //       let obj = JSON.parseJsonElement(strJson);
    //       console.info("[ObjectFitTest_0140] component obj is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
    //       expect(obj.getElement('$attrs').getString('content')).assertEqual('14');
    //       console.info('[ObjectFitTest_0140] END');
    //       done();
    //     });
    //
    //
    //     /*
    //      * @tc.number   ObjectFitTest_static_0150
    //      * @tc.name     ObjectFitTest_static_0150
    //      * @tc.desc     ObjectFitTest_static_0150
    //      * @tc.level    Level.LEVEL2
    //      */
    // it('ObjectFitTest_static_0150', Level.LEVEL2, async (done: () => void): Promise<void> => {
    //       console.info('[ObjectFitTest_0150] START');
    //       let driver = Driver.create();
    //       await CommonFunc.sleep(500);
    //       let Button:Component = await driver.findComponent(ON.id('Set_ImageFit_BOTTOM_END')) as Component;
    //       await Button.click()
    //       await CommonFunc.sleep(1000);
    //       let Button1:Component = await driver.findComponent(ON.id('set_ObjectFit_append')) as Component;
    //       await Button1.click()
    //       await CommonFunc.sleep(1000);
    //       let Button2:Component = await driver.findComponent(ON.id('get_ObjectFit_styles')) as Component;
    //       await Button2.click()
    //       await CommonFunc.sleep(1000);
    //       let strJson = inspector.getInspectorByKey('get_ObjectFit');
    //       let obj = JSON.parseJsonElement(strJson);
    //       console.info("[ObjectFitTest_0150] component obj is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
    //       expect(obj.getElement('$attrs').getString('content')).assertEqual('15');
    //       console.info('[ObjectFitTest_0150] END');
    //       done();
    //     });
  })
}