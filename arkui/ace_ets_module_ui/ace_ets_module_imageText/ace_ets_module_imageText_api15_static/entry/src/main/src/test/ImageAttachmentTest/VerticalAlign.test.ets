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


export default function VerticalAlignTest() {
  describe('VerticalAlignTest', () => {
    beforeAll(() => {
      console.info("VerticalAlignTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api15.static", "EntryAbility")

    });
    beforeEach(async (): Promise<void> => {
      console.info("VerticalAlignTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageAttachment/VerticalAlign',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        // routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get VerticalAlignTest state pages: " + JSON.stringify(pages));
        if (!("VerticalAlign" == pages.name)) {
          console.info("get VerticalAlignTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push VerticalAlignTest page error: " + err);
        expect().assertFail();
      }
    });


    /**
     * @tc.number   VerticalAlignTest_static_0010
     * @tc.name     VerticalAlignTest_static_0010
     * @tc.desc     VerticalAlignTest_static_0010
     * @tc.level    Level.LEVEL2
     */
    it('VerticalAlignTest_static_0010', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[VerticalAlignTest_0010] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button: Component = await driver.findComponent(ON.id('set_VerticalAlign_append')) as Component;
      await Button.click()
      await CommonFunc.sleep(1000);
      let Button1: Component = await driver.findComponent(ON.id('get_VerticalAlign_styles')) as Component;
      await Button1.click()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('get_verticalAlign');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[VerticalAlignTest_0010] component obj is: " +
      JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('4');
      console.info('[VerticalAlignTest_0010] END');
      done();
    });


    /**
     * @tc.number   VerticalAlignTest_static_0020
     * @tc.name     VerticalAlignTest_static_0020
     * @tc.desc     VerticalAlignTest_static_0020
     * @tc.level    Level.LEVEL2
     */
    it('VerticalAlignTest_static_0020', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[VerticalAlignTest_0020] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button: Component = await driver.findComponent(ON.id('Set_VerticalAlign_TOP')) as Component;
      await Button.click()
      await CommonFunc.sleep(1000);
      let Button1: Component = await driver.findComponent(ON.id('set_VerticalAlign_append')) as Component;
      await Button1.click()
      await CommonFunc.sleep(1000);
      let Button2: Component = await driver.findComponent(ON.id('get_VerticalAlign_styles')) as Component;
      await Button2.click()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('get_verticalAlign');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[VerticalAlignTest_0020] component obj is: " +
      JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('1');
      console.info('[VerticalAlignTest_0020] END');
      done();
    });


    /**
     * @tc.number   VerticalAlignTest_static_0030
     * @tc.name     VerticalAlignTest_static_0030
     * @tc.desc     VerticalAlignTest_static_0030
     * @tc.level    Level.LEVEL2
     */
    it('VerticalAlignTest_static_0030', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[VerticalAlignTest_0030] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button: Component = await driver.findComponent(ON.id('Set_VerticalAlign_CENTER')) as Component;
      await Button.click()
      await CommonFunc.sleep(1000);
      let Button1: Component = await driver.findComponent(ON.id('set_VerticalAlign_append')) as Component;
      await Button1.click()
      await CommonFunc.sleep(1000);
      let Button2: Component = await driver.findComponent(ON.id('get_VerticalAlign_styles')) as Component;
      await Button2.click()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('get_verticalAlign');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[VerticalAlignTest_0030] component obj is: " +
      JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('2');
      console.info('[VerticalAlignTest_0030] END');
      done();
    });


    /**
     * @tc.number   VerticalAlignTest_static_0040
     * @tc.name     VerticalAlignTest_static_0040
     * @tc.desc     VerticalAlignTest_static_0040
     * @tc.level    Level.LEVEL2
     */
    it('VerticalAlignTest_static_0040', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[VerticalAlignTest_0040] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button: Component = await driver.findComponent(ON.id('Set_VerticalAlign_BOTTOM')) as Component;
      await Button.click()
      await CommonFunc.sleep(1000);
      let Button1: Component = await driver.findComponent(ON.id('set_VerticalAlign_append')) as Component;
      await Button1.click()
      await CommonFunc.sleep(1000);
      let Button2: Component = await driver.findComponent(ON.id('get_VerticalAlign_styles')) as Component;
      await Button2.click()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('get_verticalAlign');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[VerticalAlignTest_0040] component obj is: " +
      JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('3');
      console.info('[VerticalAlignTest_0040] END');
      done();
    });
  })
}