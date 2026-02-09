'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../../hypium/index';
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

export default function datePickerJsunit() {
  describe('ActsAceDatePickerTest', () => {
    beforeAll(() => {
      console.info("datePickerJsunit beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.nowear.api12.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info("datePickerJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DatePicker/datePicker',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get datePicker state success " + JSON.stringify(pages));
        if (!("datePicker" == pages.name)) {
          console.info("get datePicker state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push datePicker page error: " + err);
      }
    });

    
    
/**
     * @tc.number   testDatePicker_static_0021
     * @tc.name     testDatePicker_static_0021
     * @tc.desc     testDatePicker_static_0021
     * @tc.level    Level.LEVEL1
     */
it('testDatePicker_static_0021', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testDatePicker_static_0021] START');
      let strJson = inspector.getInspectorByKey('DatePicker');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testDatePicker] obj is : " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('lunar')).assertEqual('true');
      console.info('[testDatePicker_static_0021] END');
      done();
    });

    
    
/**
     * @tc.number   testDatePicker_static_0022
     * @tc.name     testDatePicker_static_0022
     * @tc.desc     testDatePicker_static_0022
     * @tc.level    Level.LEVEL1
     */
it('testDatePicker_static_0022', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testDatePicker_static_0022] START');
      let strJson = inspector.getInspectorByKey('DatePicker');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testDatePicker] obj is : " + JSON.stringify(obj.getElement('$attrs')));
      let selectedTextStyle = obj.getElement('$attrs').getElement('selectedTextStyle');

      expect(selectedTextStyle.getString('color')).assertEqual("#FF182431");
      expect(selectedTextStyle.getElement('font').getString('size')).assertEqual("18.00fp");
      expect(selectedTextStyle.getElement('font').getString('weight')).assertEqual("FontWeight.Normal");
      console.info('[testDatePicker_static_0022] END');
      done();
    });

    
    
/**
     * @tc.number   testDatePicker_static_0023
     * @tc.name     testDatePicker_static_0023
     * @tc.desc     testDatePicker_static_0023
     * @tc.level    Level.LEVEL1
     */
it('testDatePicker_static_0023', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testDatePicker_static_0023] START');
      let strJson = inspector.getInspectorByKey('DatePicker');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testDatePicker] obj is : " + JSON.stringify(obj.getElement('$attrs')));
      let textStyle = obj.getElement('$attrs').getElement('textStyle');

      expect(textStyle.getString('color')).assertEqual("#FF0000FF");
      expect(textStyle.getElement('font').getString('size')).assertEqual("26.00fp");
      expect(textStyle.getElement('font').getString('weight')).assertEqual("FontWeight.Normal");
      console.info('[testDatePicker_static_0023] END');
      done();
    });

    
    
/**
     * @tc.number   testDatePicker_static_0024
     * @tc.name     testDatePicker_static_0024
     * @tc.desc     testDatePicker_static_0024
     * @tc.level    Level.LEVEL1
     */
it('testDatePicker_static_0024', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testDatePicker_static_0024] START');
      let strJson = inspector.getInspectorByKey('DatePicker');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testDatePicker] obj is : " + JSON.stringify(obj.getElement('$attrs')));
      let disappearTextStyle = obj.getElement('$attrs').getElement('disappearTextStyle');

      expect(disappearTextStyle.getString('color')).assertEqual('#FF000000');
      expect(disappearTextStyle.getElement('font').getString('size')).assertEqual('8.00fp');
      expect(disappearTextStyle.getElement('font').getString('weight')).assertEqual('FontWeight.Lighter');
      console.info('[testDatePicker_static_0024] END');
      done();
    });
  })
}
