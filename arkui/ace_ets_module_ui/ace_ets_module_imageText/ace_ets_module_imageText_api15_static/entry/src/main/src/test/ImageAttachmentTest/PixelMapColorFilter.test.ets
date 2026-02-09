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


export default function PixelMapColorFilterTest() {
  describe('PixelMapColorFilterTest', () => {
    beforeAll(() => {
      console.info("PixelMapColorFilterTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api15.static", "EntryAbility")

    });
    beforeEach(async (): Promise<void> => {
      console.info("PixelMapColorFilterTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageAttachment/PixelMapColorFilter',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get PixelMapColorFilterTest state pages: " + JSON.stringify(pages));
        if (!("PixelMapColorFilter" == pages.name)) {
          console.info("get PixelMapColorFilterTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push PixelMapColorFilterTest page error: " + err);
        expect().assertFail();
      }
    });


    /**
     * @tc.number   PixelMapColorFilterTest_static_0010
     * @tc.name     PixelMapColorFilterTest_static_0010
     * @tc.desc     PixelMapColorFilterTest_static_0010
     * @tc.level    Level.LEVEL2
     */
    it('PixelMapColorFilterTest_static_0010', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[PixelMapColorFilterTest_static_0010] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button: Component = await driver.findComponent(ON.id('set_colorFilter_append_resource')) as Component;
      await Button.click()
      await CommonFunc.sleep(1000);
      let Button1: Component = await driver.findComponent(ON.id('get_styles')) as Component;
      await Button1.click()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ColorFilter_content');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PixelMapColorFilterTest_static_0010] component obj is: " +
        (JSON.stringifyJsonElement(obj.getElement('$attrs').getArray('imageNodes')[0])));
      expect(obj.getElement('$attrs').getArray('imageNodes')[0].getString('colorFilterMatrix'))
        .assertEqual('[1.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 1.000000,' +
          ' 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 1.000000, 0.000000, 0.000000, 0.000000, ' +
          '0.000000, 0.000000, 1.000000, 0.000000]');
      console.info('[PixelMapColorFilterTest_static_0010] END');
      done();
    });


    /**
     * @tc.number   PixelMapColorFilterTest_static_0020
     * @tc.name     PixelMapColorFilterTest_static_0020
     * @tc.desc     PixelMapColorFilterTest_static_0020
     * @tc.level    Level.LEVEL2
     */
    it('PixelMapColorFilterTest_static_0020', Level.LEVEL2, async (done: () => void): Promise<void> => {

      console.info('[PixelMapColorFilterTest_static_0020] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button: Component = await driver.findComponent(ON.id('set_colorFilter_append_str')) as Component;
      await Button.click()
      await CommonFunc.sleep(1000);
      let Button1: Component = await driver.findComponent(ON.id('get_styles')) as Component;
      await Button1.click()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ColorFilter_content');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PixelMapColorFilterTest_static_0020] component obj is: " +
        (JSON.stringifyJsonElement(obj.getElement('$attrs').getArray('imageNodes')[0])));
      expect(obj.getElement('$attrs').getArray('imageNodes')[0].getString('colorFilterMatrix'))
        .assertEqual('[1.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 1.000000, ' +
          '0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 1.000000, 0.000000, 0.000000, ' +
          '0.000000, 0.000000, 0.000000, 1.000000, 0.000000]');
      console.info('[PixelMapColorFilterTest_static_0020] END');
      done();
    });
  })
}