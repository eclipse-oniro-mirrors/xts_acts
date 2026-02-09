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

export default function TextPickerTextStyleTest() {
  describe('TextPickerTextStyleTest', () => {

    beforeAll(() => {
      console.info("TextPickerTextStyle beforeAll start");
      await UtilsTest.startAbility("com.open.harmony.picker.api15.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPicker/TextPickerTextStyle',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get TextPickerTextStyle state success ' + JSON.stringify(pages));
        if (!('TextPickerTextStyle' == pages.name)) {
          console.info('get TextStyle state success ' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options)
          await UtilsTest.msSleep(2000)
          
        }
      } catch (err) {
        console.error('push TextPickerTextStyle page error ' + JSON.stringify(err));
      }
    });
    
    
    
    
    /**
     * @tc.number   TextPickerTextStyleTest_static_0100
     * @tc.name     TextPickerTextStyleTest_static_0100
     * @tc.desc     TextPickerTextStyleTest_static_0100
     * @tc.level    Level.LEVEL1
     */
it('TextPickerTextStyleTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {

      console.info('TextPickerTextStyleTest_static_0100 start');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('TextPickerTextStyle_Normal1'));
      await btn!.click()
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('TextPickerTextStyle');
      console.info('[TextPickerTextStyleTest_static_0100]:' + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextPickerTextStyleTest_static_0100 obj $attrs]:' + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      console.info('[TextPickerTextStyleTest_static_0100 obj Normal1 $attrs.defaultTextStyle]:' +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('defaultTextStyle')));
      expect(obj.getElement('$attrs').getElement('defaultTextStyle').getString('minFontSize')).assertEqual('18.00fp');
      expect(obj.getElement('$attrs').getElement('defaultTextStyle').getString('maxFontSize')).assertEqual('28.00fp');  //maxFontSize默认单位变成vp
      expect(obj.getElement('$attrs').getElement('defaultTextStyle').getString('overflow')).assertEqual('TextOverflow.Ellipsis');
      await CommonFunc.sleep(1000);
      console.info('[TextPickerTextStyleTest_static_0100] END');
      done();
    });

    
    
    
    
    /**
     * @tc.number   TextPickerTextStyleTest_static_0200
     * @tc.name     TextPickerTextStyleTest_static_0200
     * @tc.desc     TextPickerTextStyleTest_static_0200
     * @tc.level    Level.LEVEL1
     */
it('TextPickerTextStyleTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {

      console.info('TextPickerTextStyleTest_static_0200 start');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('TextPickerTextStyle_Normal2'));
      await btn!.click()
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('TextPickerTextStyle');
      console.info('[TextPickerTextStyleTest_static_0200]:' + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextPickerTextStyleTest_static_0200 obj $attrs]:' + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      console.info('[TextPickerTextStyleTest_static_0200 obj Normal2 $attrs.defaultTextStyle]:' +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('defaultTextStyle')));
      expect(obj.getElement('$attrs').getElement('defaultTextStyle').getString('minFontSize')).assertEqual('18.00fp');
      expect(obj.getElement('$attrs').getElement('defaultTextStyle').getString('maxFontSize')).assertEqual('18.00fp');
      expect(obj.getElement('$attrs').getElement('defaultTextStyle').getString('overflow')).assertEqual('TextOverflow.Ellipsis');
      await CommonFunc.sleep(1000);
      console.info('[TextPickerTextStyleTest_static_0200] END');
      done();
    });

    
    
    
    
    /**
     * @tc.number   TextPickerTextStyleTest_static_0300
     * @tc.name     TextPickerTextStyleTest_static_0300
     * @tc.desc     TextPickerTextStyleTest_static_0300
     * @tc.level    Level.LEVEL1
     */
it('TextPickerTextStyleTest_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {

      console.info('TextPickerTextStyleTest_static_0300 start');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('TextPickerTextStyle_Normal3'));
      await btn!.click()
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('TextPickerTextStyle');
      console.info('[TextPickerTextStyleTest_static_0300]:' + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextPickerTextStyleTest_static_0300 obj $attrs]:' + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      console.info('[TextPickerTextStyleTest_static_0300 obj Normal3 $attrs.defaultTextStyle]:' +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('defaultTextStyle')));
      expect(obj.getElement('$attrs').getElement('defaultTextStyle').getString('minFontSize')).assertEqual('28.00fp');
      expect(obj.getElement('$attrs').getElement('defaultTextStyle').getString('maxFontSize')).assertEqual('18.00fp');
      expect(obj.getElement('$attrs').getElement('defaultTextStyle').getString('overflow')).assertEqual('TextOverflow.Ellipsis');
      await CommonFunc.sleep(1000);
      console.info('[TextPickerTextStyleTest_static_0300] END');
      done();
    });

    
    
    
    
    /**
     * @tc.number   TextPickerTextStyleTest_static_0400
     * @tc.name     TextPickerTextStyleTest_static_0400
     * @tc.desc     TextPickerTextStyleTest_static_0400
     * @tc.level    Level.LEVEL1
     */
it('TextPickerTextStyleTest_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {

      console.info('TextPickerTextStyleTest_static_0400 start');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('TextPickerTextStyle_Undefined'));
      await btn!.click()
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('TextPickerTextStyle');
      console.info('[TextPickerTextStyleTest_static_0400]:' + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextPickerTextStyleTest_static_0400 obj $attrs]:' + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      console.info('[TextPickerTextStyleTest_static_0400 obj Undefined $attrs.defaultTextStyle]:' +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('defaultTextStyle')));
      expect(obj.getElement('$attrs').getElement('defaultTextStyle').getString('minFontSize')).assertEqual('0.00px');
      expect(obj.getElement('$attrs').getElement('defaultTextStyle').getString('maxFontSize')).assertEqual('0.00px');
      expect(obj.getElement('$attrs').getElement('defaultTextStyle').getString('overflow')).assertEqual('TextOverflow.Clip');
      await CommonFunc.sleep(1000);
      console.info('[TextPickerTextStyleTest_static_0400] END');
      done();
    });

    
    
    
    
    /**
     * @tc.number   TextPickerTextStyleTest_static_0500
     * @tc.name     TextPickerTextStyleTest_static_0500
     * @tc.desc     TextPickerTextStyleTest_static_0500
     * @tc.level    Level.LEVEL1
     */
it('TextPickerTextStyleTest_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {

      console.info('TextPickerTextStyleTest_static_0500 start');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('TextPickerTextStyle_Null'));
      await btn!.click()
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('TextPickerTextStyle');
      console.info('[TextPickerTextStyleTest_static_0500]:' + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextPickerTextStyleTest_static_0500 obj $attrs]:' + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      console.info('[TextPickerTextStyleTest_static_0500 obj Null $attrs.defaultTextStyle]:' +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('defaultTextStyle')));
      expect(obj.getElement('$attrs').getElement('defaultTextStyle').getString('minFontSize')).assertEqual('0.00px');
      expect(obj.getElement('$attrs').getElement('defaultTextStyle').getString('maxFontSize')).assertEqual('0.00px');
      expect(obj.getElement('$attrs').getElement('defaultTextStyle').getString('overflow')).assertEqual('TextOverflow.Clip');
      await CommonFunc.sleep(1000);
      console.info('[TextPickerTextStyleTest_static_0500] END');
      done();
    });

    
    
    
    
    /**
     * @tc.number   TextPickerTextStyleTest_static_0600
     * @tc.name     TextPickerTextStyleTest_static_0600
     * @tc.desc     TextPickerTextStyleTest_static_0600
     * @tc.level    Level.LEVEL1
     */
it('TextPickerTextStyleTest_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {

      console.info('TextPickerTextStyleTest_static_0600 start');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('TextPickerTextStyle_Negative'));
      await btn!.click()
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('TextPickerTextStyle');
      console.info('[TextPickerTextStyleTest_static_0600]:' + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextPickerTextStyleTest_static_0600 obj $attrs]:' + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      console.info('[TextPickerTextStyleTest_static_0600 obj Negative $attrs.defaultTextStyle]:' +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('defaultTextStyle')));
      expect(obj.getElement('$attrs').getElement('defaultTextStyle').getString('minFontSize')).assertEqual('0.00px');
      expect(obj.getElement('$attrs').getElement('defaultTextStyle').getString('maxFontSize')).assertEqual('0.00px');
      expect(obj.getElement('$attrs').getElement('defaultTextStyle').getString('overflow')).assertEqual('TextOverflow.Clip');
      await CommonFunc.sleep(1000);
      console.info('[TextPickerTextStyleTest_static_0600] END');
      done();
    });
  })
}
