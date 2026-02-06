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

export default function calendarPickerJsunit() {
  describe('ActsAceCalendarPickerTest', () => {

    beforeAll(() => {
      console.info("calendarPickerJsunit beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.nowear.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("calendarPickerJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CalendarPicker/calendarpicker',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get calendarpicker state pages: " + JSON.stringify(pages));
        if (!("calendarpicker" == pages.name)) {
          console.info("get calendarpicker state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(5000);
        }
      } catch (err) {
        console.error("push calendarpicker page error: " + err);
      }
    });

    
    
/**
     * @tc.number   ArkUI_Stage_CalendarPicker_static_0100
     * @tc.name     ArkUI_Stage_CalendarPicker_static_0100
     * @tc.desc     ArkUI_Stage_CalendarPicker_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_CalendarPicker_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUI_Stage_CalendarPicker_static_0100] START');
      let strJson = inspector.getInspectorByKey('CalendarPickerKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_CalendarPicker_static_0100] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      let edgeAlign = obj.getElement('$attrs').getElement('edgeAlign');

      expect(edgeAlign.getString('alignType')).assertEqual("CalendarAlign.END");
      expect(edgeAlign.getElement('offset').getString('dx')).assertEqual("10.00vp");
      expect(edgeAlign.getElement('offset').getString('dy')).assertEqual("15.00vp");
      console.info('[ArkUI_Stage_CalendarPicker_static_0100] END');
      done();
    });

    
    
/**
     * @tc.number   ArkUI_Stage_CalendarPicker_attributeModifier_static_0101
     * @tc.name     ArkUI_Stage_CalendarPicker_attributeModifier_static_0101
     * @tc.desc     ArkUI_Stage_CalendarPicker_attributeModifier_static_0101
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_CalendarPicker_attributeModifier_static_0101', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUI_Stage_CalendarPicker_attributeModifier_static_0101] START');
      let strJson = inspector.getInspectorByKey('CalendarPickerKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_CalendarPicker_attributeModifier_static_0101] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      let textStyle = obj.getElement('$attrs').getElement('textStyle');

      expect(textStyle.getString('color')).assertEqual("#FF182431");
      expect(textStyle.getElement('font').getString('size')).assertEqual("8.00fp");
      expect(textStyle.getElement('font').getString('weight')).assertEqual("FontWeight.Lighter");
      console.info('[ArkUI_Stage_CalendarPicker_attributeModifier_static_0101] END');
      done();
    });
  })
}
