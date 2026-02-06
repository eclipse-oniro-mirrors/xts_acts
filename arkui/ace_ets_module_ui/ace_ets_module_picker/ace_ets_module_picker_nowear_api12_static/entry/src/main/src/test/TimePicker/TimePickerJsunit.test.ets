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

import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType } from '../../../../hypium/index';
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
import events_emitter from '@ohos.events.emitter';

export default function timepickerJsunit() {
  describe('ActsAceTimePickerTest', () => {
    beforeAll(() => {
      console.info("timepickerJsunit beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.nowear.api12.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info("timepickerJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TimePicker/timePicker',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get timepicker state pages: " + JSON.stringify(pages));
        if (!("timepicker" == pages.name)) {
          console.info("get timepicker state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push timepicker page error: " + err);
      }
    });

    
    
/**
     * @tc.number   ArkUI_Stage_timepicker_static_1000
     * @tc.name     ArkUI_Stage_timepicker_static_1000
     * @tc.desc     ArkUI_Stage_timepicker_static_1000
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_timepicker_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('timePickerDefault');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_timepicker_static_1000] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      let textStyle = obj.getElement('$attrs').getElement('textStyle');

      expect(textStyle.getString('color')).assertEqual('#FFFF0000');
      expect(textStyle.getElement('font').getString('size')).assertEqual('10.00px');
      expect(textStyle.getElement('font').getString('weight')).assertEqual('FontWeight.Normal');

      done();
    });

    
    
/**
     * @tc.number   ArkUI_Stage_timepicker_static_2000
     * @tc.name     ArkUI_Stage_timepicker_static_2000
     * @tc.desc     ArkUI_Stage_timepicker_static_2000
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_timepicker_static_2000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('timePickerDefault');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_timepicker_static_2000] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      let selectedTextStyle = obj.getElement('$attrs').getElement('selectedTextStyle');

      expect(selectedTextStyle.getString('color')).assertEqual('#FF0000FF');
      expect(selectedTextStyle.getElement('font').getString('size')).assertEqual('20.00px');
      expect(selectedTextStyle.getElement('font').getString('weight')).assertEqual('FontWeight.Bold');
      
      done();
    });

    
    
/**
     * @tc.number   ArkUI_Stage_timepicker_static_3000
     * @tc.name     ArkUI_Stage_timepicker_static_3000
     * @tc.desc     ArkUI_Stage_timepicker_static_3000
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_timepicker_static_3000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('timePickerDefault');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_timepicker_static_3000] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      let disappearTextStyle = obj.getElement('$attrs').getElement('disappearTextStyle');
     
      expect(disappearTextStyle.getString('color')).assertEqual('#FF000000');
      expect(disappearTextStyle.getElement('font').getString('size')).assertEqual('8.00fp');
      expect(disappearTextStyle.getElement('font').getString('weight')).assertEqual('FontWeight.Lighter');
      done();
    });

    
  })
}

