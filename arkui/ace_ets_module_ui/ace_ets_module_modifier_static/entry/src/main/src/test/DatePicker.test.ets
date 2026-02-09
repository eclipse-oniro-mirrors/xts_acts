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

import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver,  ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from './Util.test';

export default function datePickerJsunit() {
  describe('datePickerTest', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/datePicker',
      }

      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get datePicker state success " + JSON.stringify(pages));
        if (!("datePicker" == pages.name)) {
          console.info("get datePicker state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
         await UtilsTest.msSleep(2000);
        }
      } catch (err) {
        console.error("push datePicker page error: " + err);
      }
    });

    
    
    /**
     * @tc.number   testDatePickerStatic0021
     * @tc.name     testDatePickerStatic0021
     * @tc.desc     testDatePickerStatic0021
     * @tc.level    Level.LEVEL0
     */
it('testDatePickerStatic0021', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testDatePickerStatic0021] START');
      let strJson = inspector.getInspectorByKey('DatePicker');
      console.info("[testDatePicker] obj is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('lunar')).assertEqual('true');
      console.info('[testDatePickerStatic0021] END');
      done();
    });

    
    
    /**
     * @tc.number   testDatePickerStatic0022
     * @tc.name     testDatePickerStatic0022
     * @tc.desc     testDatePickerStatic0022
     * @tc.level    Level.LEVEL0
     */
it('testDatePickerStatic0022', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testDatePickerStatic0022] START');
      let strJson = inspector.getInspectorByKey('DatePicker');
      console.info("[testDatePicker] obj is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      let selectedTextStyle = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('selectedTextStyle');
      expect(selectedTextStyle.getString('color')).assertEqual("#FF182431");
      expect(selectedTextStyle.getElement('font').getString('size')).assertEqual("18.00fp");
      expect(selectedTextStyle.getElement('font').getString('weight')).assertEqual("FontWeight.Normal");
      console.info('[testDatePickerStatic0022] END');
      done();
    });

    
    
    /**
     * @tc.number   testDatePickerStatic0023
     * @tc.name     testDatePickerStatic0023
     * @tc.desc     testDatePickerStatic0023
     * @tc.level    Level.LEVEL0
     */
it('testDatePickerStatic0023', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testDatePickerStatic0023] START');
      let strJson = inspector.getInspectorByKey('DatePicker');
      console.info("[testDatePicker] obj is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      let textStyle = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('textStyle');

      expect(textStyle.getString('color')).assertEqual("#FF0000FF");
      expect(textStyle.getElement('font').getString('size')).assertEqual("26.00fp");
      expect(textStyle.getElement('font').getString('weight')).assertEqual("FontWeight.Normal");
      console.info('[testDatePickerStatic0023] END');
      done();
    });

    
    
    /**
     * @tc.number   testDatePickerStatic0024
     * @tc.name     testDatePickerStatic0024
     * @tc.desc     testDatePickerStatic0024
     * @tc.level    Level.LEVEL0
     */
it('testDatePickerStatic0024', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testDatePickerStatic0024] START');
      let strJson = inspector.getInspectorByKey('DatePicker');
      console.info("[testDatePicker] obj is : " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      let disappearTextStyle = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('disappearTextStyle');

      expect(disappearTextStyle.getString('color')).assertEqual('#FF000000');
      expect(disappearTextStyle.getElement('font').getString('size')).assertEqual('8.00fp');
      expect(disappearTextStyle.getElement('font').getString('weight')).assertEqual('FontWeight.Lighter');
      console.info('[testDatePickerStatic0024] END');
      done();
    });

    
    
    /**
     * @tc.number   testDatePickerStatic0025
     * @tc.name     testDatePickerStatic0025
     * @tc.desc     testDatePickerStatic0025
     * @tc.level    Level.LEVEL0
     */
it('testDatePickerStatic0025', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testDatePickerStatic0025 START');
      let driver = Driver.create();
      let button =  await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await button.click();
     await UtilsTest.msSleep(2000)

      let strJsonNew = inspector.getInspectorByKey('DatePicker');
      console.info("testDatePickerStatic0025 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));
      let textStyle = JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('textStyle');
      expect(textStyle.getElement('font').getString('size')).assertEqual("27.00fp");
      console.info('testDatePickerStatic0025 END');
      done();
    });
  })
}
