'use static';
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

import { describe, beforeEach, it, expect, Level, beforeAll, beforeEach, Size, TestType } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

export default function TextPickerTextStyleAnimationTest() {
  describe('TextPickerTextStyleAnimationTest', () => {

    beforeAll(() => {
      console.info("TextPickerTextStyle beforeAll start");
      await UtilsTest.startAbility("com.open.harmony.picker.api15.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPicker/TextStyleAnimation',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get TextStyleAnimation state success ' + JSON.stringify(pages));
        if (!('TextStyleAnimation' == pages.name)) {
          console.info('get TextStyle state success ' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options)
          await UtilsTest.msSleep(2000)
          
        }
      } catch (err) {
        console.error('push TextStyleAnimation page error ' + JSON.stringify(err));
      }
    });

    
    
    
    
    /**
     * @tc.number   TextStyleAnimationTest_static_0100
     * @tc.name     TextStyleAnimationTest_static_0100
     * @tc.desc     TextStyleAnimationTest_static_0100
     * @tc.level    Level.LEVEL1
     */
it('TextStyleAnimationTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {

      console.info('TextStyleAnimationTest_static_0100 start');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('TextStyleAnimation_TRUE'));
      await btn!.click()
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('TextPickerAnimation');
      console.info('[TextStyleAnimationTest_static_0100]:' + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextStyleAnimationTest_static_0100 obj $attrs]:' + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      console.info('[TextStyleAnimationTest_static_0100 obj TRUE $attrs.disableTextStyleAnimation]:' +
      JSON.stringify(obj.getElement('$attrs').getString('disableTextStyleAnimation')));
      expect(obj.getElement('$attrs').getString('disableTextStyleAnimation')).assertEqual('true');
      await CommonFunc.sleep(1000);
      console.info('[TextStyleAnimationTest_static_0100] END');
      done();
    });

    
    
    
    
    /**
     * @tc.number   TextStyleAnimationTest_static_0200
     * @tc.name     TextStyleAnimationTest_static_0200
     * @tc.desc     TextStyleAnimationTest_static_0200
     * @tc.level    Level.LEVEL1
     */
it('TextStyleAnimationTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {

      console.info('TextStyleAnimationTest_static_0200 start');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('TextStyleAnimation_FALSE'));
      await btn!.click()
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('TextPickerAnimation');
      console.info('[TextStyleAnimationTest_static_0200]:' + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextStyleAnimationTest_static_0200 obj $attrs]:' + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      console.info('[TextStyleAnimationTest_static_0200 obj FALSE $attrs.disableTextStyleAnimation]:' +
      JSON.stringify(obj.getElement('$attrs').getString('disableTextStyleAnimation')));
      expect(obj.getElement('$attrs').getString('disableTextStyleAnimation')).assertEqual('false');
      await CommonFunc.sleep(1000);
      console.info('[TextStyleAnimationTest_static_0200] END');
      done();
    });

    
    
    
    
    /**
     * @tc.number   TextStyleAnimationTest_static_0300
     * @tc.name     TextStyleAnimationTest_static_0300
     * @tc.desc     TextStyleAnimationTest_static_0300
     * @tc.level    Level.LEVEL1
     */
it('TextStyleAnimationTest_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {

      console.info('TextStyleAnimationTest_static_0300 start');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('TextStyleAnimation_UNDEFINED'));
      await btn!.click()
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('TextPickerAnimation');
      console.info('[TextStyleAnimationTest_static_0300]:' + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextStyleAnimationTest_static_0300 obj $attrs]:' + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      console.info('[TextStyleAnimationTest_static_0300 obj UNDEFINED $attrs.disableTextStyleAnimation]:' +
      JSON.stringify(obj.getElement('$attrs').getString('disableTextStyleAnimation')));
      expect(obj.getElement('$attrs').getString('disableTextStyleAnimation')).assertEqual('false');
      await CommonFunc.sleep(1000);
      console.info('[TextStyleAnimationTest_static_0300] END');
      done();
    });

    
    
    
    
    /**
     * @tc.number   TextStyleAnimationTest_static_0400
     * @tc.name     TextStyleAnimationTest_static_0400
     * @tc.desc     TextStyleAnimationTest_static_0400
     * @tc.level    Level.LEVEL1
     */
it('TextStyleAnimationTest_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {

      console.info('TextStyleAnimationTest_static_0400 start');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('TextStyleAnimation_NULL'));
      await btn!.click()
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('TextPickerAnimation');
      console.info('[TextStyleAnimationTest_static_0400]:' + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextStyleAnimationTest_static_0400 obj $attrs]:' + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      console.info('[TextStyleAnimationTest_static_0400 obj NULL $attrs.disableTextStyleAnimation]:' +
      JSON.stringify(obj.getElement('$attrs').getString('disableTextStyleAnimation')));
      expect(obj.getElement('$attrs').getString('disableTextStyleAnimation')).assertEqual('false');
      await CommonFunc.sleep(1000);
      console.info('[TextStyleAnimationTest_static_0400] END');
      done();
    });
  })
}
