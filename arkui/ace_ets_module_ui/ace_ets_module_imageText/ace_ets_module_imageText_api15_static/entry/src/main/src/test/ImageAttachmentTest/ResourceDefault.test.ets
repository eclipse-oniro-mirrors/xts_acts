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

export default function ResourceDefaultTest() {
  describe('ResourceDefaultTest', () => {
    beforeAll(() => {
      console.info("ResourceDefaultTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api15.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("ResourceDefaultTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ImageAttachment/ResourceDefault",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get ResourceDefaultTest state pages:" + JSON.stringify(pages));
        if (!("ResourceDefault" == pages.name)) {
          console.info("get ResourceDefaultTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ResourceDefaultTest page error:" + err);
      }
      console.info("ResourceDefaultTest beforeEach end");
    });

    /**
         * @tc.number   ResourceDefaultTest_static_0030
         * @tc.name     ResourceDefaultTest_static_0030
         * @tc.desc     ResourceDefaultTest_static_0030
         * @tc.level    Level.LEVEL2
         */
    it('ResourceDefaultTest_static_0030', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ResourceDefaultTest_0030] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button: Component = await driver.findComponent(ON.id('set_default_append_resource')) as Component;
      await Button.click()
      await CommonFunc.sleep(1000);
      let Button1: Component = await driver.findComponent(ON.id('get_default_styles')) as Component;
      await Button1.click()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('default_size');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ResourceDefaultTest_0030] component obj is: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('undefined');
      console.info('[ResourceDefaultTest_0030] END');
      done();
    });


    /**
         * @tc.number   ResourceDefaultTest_static_0040
         * @tc.name     ResourceDefaultTest_static_0040
         * @tc.desc     ResourceDefaultTest_static_0040
         * @tc.level    Level.LEVEL2
         */
    it('ResourceDefaultTest_static_0040', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ResourceDefaultTest_0040] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button: Component = await driver.findComponent(ON.id('set_default_append_resource')) as Component;
      await Button.click()
      await CommonFunc.sleep(1000);
      let Button1: Component = await driver.findComponent(ON.id('get_default_styles')) as Component;
      await Button1.click()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('default_verticalAlign');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ResourceDefaultTest_0040] component obj is: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('3');
      console.info('[ResourceDefaultTest_0040] END');
      done();
    });


    /**
         * @tc.number   ResourceDefaultTest_static_0050
         * @tc.name     ResourceDefaultTest_static_0050
         * @tc.desc     ResourceDefaultTest_static_0050
         * @tc.level    Level.LEVEL2
         */
    it('ResourceDefaultTest_static_0050', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ResourceDefaultTest_0050] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button: Component = await driver.findComponent(ON.id('set_default_append_resource')) as Component;
      await Button.click()
      await CommonFunc.sleep(1000);
      let Button1: Component = await driver.findComponent(ON.id('get_default_styles')) as Component;
      await Button1.click()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('default_objectFit');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ResourceDefaultTest_0050] component obj is: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertContain('2');
      console.info('[ResourceDefaultTest_0050] END');
      done();
    });


    /**
         * @tc.number   ResourceDefaultTest_static_0060
         * @tc.name     ResourceDefaultTest_static_0060
         * @tc.desc     ResourceDefaultTest_static_0060
         * @tc.level    Level.LEVEL2
         */
    it('ResourceDefaultTest_static_0060', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ResourceDefaultTest_0060] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button: Component = await driver.findComponent(ON.id('set_default_append_resource')) as Component;
      await Button.click()
      await CommonFunc.sleep(1000);
      let Button1: Component = await driver.findComponent(ON.id('get_default_styles')) as Component;
      await Button1.click()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('default_layoutStyle');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ResourceDefaultTest_0060] component obj is: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('{}');
      console.info('[ResourceDefaultTest_0060] END');
      done();
    });


    /**
         * @tc.number   ResourceDefaultTest_static_0070
         * @tc.name     ResourceDefaultTest_static_0070
         * @tc.desc     ResourceDefaultTest_static_0070
         * @tc.level    Level.LEVEL2
         */
    it('ResourceDefaultTest_static_0070', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ResourceDefaultTest_static_0070] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button: Component = await driver.findComponent(ON.id('set_default_append_resource')) as Component;
      await Button.click()
      await CommonFunc.sleep(1000);
      let Button1: Component = await driver.findComponent(ON.id('get_default_styles')) as Component;
      await Button1.click()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('default_colorFilter');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ResourceDefaultTest_static_0070] component obj is: " +
        (JSON.stringifyJsonElement(obj.getElement('$attrs').getArray('imageNodes')[0])));
      expect(obj.getElement('$attrs').getArray('imageNodes')[0].getString('colorFilterMatrix'))
        .assertEqual('[1.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 1.000000, 0.000000,' +
          ' 0.000000, 0.000000, 0.000000, 0.000000, 1.000000, 0.000000, 0.000000, 0.000000, 0.000000, ' +
          '0.000000, 1.000000, 0.000000]');
      console.info('[ResourceDefaultTest_static_0070] END');
      done();
    });


    /**
         * @tc.number   ResourceDefaultTest_static_0080
         * @tc.name     ResourceDefaultTest_static_0080
         * @tc.desc     ResourceDefaultTest_static_0080
         * @tc.level    Level.LEVEL2
         */
    it('ResourceDefaultTest_static_0080', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ResourceDefaultTest_0080] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button: Component = await driver.findComponent(ON.id('set_colorFilter_append_str')) as Component;
      await Button.click()
      await CommonFunc.sleep(1000);
      let Button1: Component = await driver.findComponent(ON.id('get_default_styles')) as Component;
      await Button1.click()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('default_size');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ResourceDefaultTest_0080] component obj is: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('undefined');
      console.info('[ResourceDefaultTest_0080] END');
      done();
    });


    /**
         * @tc.number   ResourceDefaultTest_static_0090
         * @tc.name     ResourceDefaultTest_static_0090
         * @tc.desc     ResourceDefaultTest_static_0090
         * @tc.level    Level.LEVEL2
         */
    it('ResourceDefaultTest_static_0090', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ResourceDefaultTest_0090] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button: Component = await driver.findComponent(ON.id('set_colorFilter_append_str')) as Component;
      await Button.click()
      await CommonFunc.sleep(1000);
      let Button1: Component = await driver.findComponent(ON.id('get_default_styles')) as Component;
      await Button1.click()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('default_verticalAlign');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ResourceDefaultTest_0090] component obj is: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('3');
      console.info('[ResourceDefaultTest_0090] END');
      done();
    });


    /**
         * @tc.number   ResourceDefaultTest_static_0100
         * @tc.name     ResourceDefaultTest_static_0100
         * @tc.desc     ResourceDefaultTest_static_0100
         * @tc.level    Level.LEVEL2
         */
    it('ResourceDefaultTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ResourceDefaultTest_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button: Component = await driver.findComponent(ON.id('set_colorFilter_append_str')) as Component;
      await Button.click()
      await CommonFunc.sleep(1000);
      let Button1: Component = await driver.findComponent(ON.id('get_default_styles')) as Component;
      await Button1.click()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('default_objectFit');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ResourceDefaultTest_0100] component obj is: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertContain('2');
      console.info('[ResourceDefaultTest_0100] END');
      done();
    });


    /**
         * @tc.number   ResourceDefaultTest_static_0110
         * @tc.name     ResourceDefaultTest_static_0110
         * @tc.desc     ResourceDefaultTest_static_0110
         * @tc.level    Level.LEVEL2
         */
    it('ResourceDefaultTest_static_0110', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ResourceDefaultTest_0110] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button: Component = await driver.findComponent(ON.id('set_colorFilter_append_str')) as Component;
      await Button.click()
      await CommonFunc.sleep(1000);
      let Button1: Component = await driver.findComponent(ON.id('get_default_styles')) as Component;
      await Button1.click()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('default_layoutStyle');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ResourceDefaultTest_0110] component obj is: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('{}');
      console.info('[ResourceDefaultTest_0110] END');
      done();
    });


    /**
         * @tc.number   ResourceDefaultTest_static_0120
         * @tc.name     ResourceDefaultTest_static_0120
         * @tc.desc     ResourceDefaultTest_static_0120
         * @tc.level    Level.LEVEL2
         */
    it('ResourceDefaultTest_static_0120', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ResourceDefaultTest_static_0120] START');
      await CommonFunc.sleep(500);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('set_colorFilter_append_str')) as Component;
      await btn.click()
      await CommonFunc.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id('get_default_styles')) as Component;
      await btn1.click()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('default_colorFilter');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ResourceDefaultTest_static_0120] component obj is: " +
        (JSON.stringifyJsonElement(obj.getElement('$attrs').getArray('imageNodes')[0])));
      expect(obj.getElement('$attrs').getArray('imageNodes')[0].getString('colorFilterMatrix'))
        .assertEqual('[1.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 1.000000, ' +
          '0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 1.000000, 0.000000, 0.000000, 0.000000, ' +
          '0.000000, 0.000000, 1.000000, 0.000000]');
      console.info('[ResourceDefaultTest_static_0070] END');
      done();
    });
  })
}