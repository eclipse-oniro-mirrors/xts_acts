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
import events_emitter from '@ohos.events.emitter';

export default function timepickerJsunit() {
  describe('timePickerTest', () => {
     beforeAll(() => {

      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async () => {
      console.info("timepicker beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/timePicker',
      }

      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get timepicker state pages: " + JSON.stringify(pages));
        if (!("timePicker" == pages.name)) {
          console.info("get timepicker state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
         await UtilsTest.msSleep(2000);
        }
      } catch (err) {
        console.error("push timepicker page error: " + err);
      }
    });

    
    
    /**
     * @tc.number   ArkUI_Stage_timepicker_static_1000
     * @tc.name     ArkUI_Stage_timepicker_static_1000
     * @tc.desc     ArkUI_Stage_timepicker_static_1000
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_timepicker_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('timePickerDefault');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_timepicker_static_1000] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getElement('textStyle').getString('color')).assertEqual('#FFFF0000');
      expect(obj.getElement('$attrs').getElement('textStyle').getElement('font').getString('size')).assertEqual('10.00px');
      expect(obj.getElement('$attrs').getElement('textStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Normal');

      done();
    });

    
    
    /**
     * @tc.number   ArkUI_Stage_timepicker_2000
     * @tc.name     ArkUI_Stage_timepicker_2000
     * @tc.desc     ArkUI_Stage_timepicker_2000
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_timepicker_2000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('timePickerDefault');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_timepicker_2000] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getString('color')).assertEqual('#FF0000FF');
      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getElement('font').getString('size')).assertEqual('20.00px');
      expect(obj.getElement('$attrs').getElement('selectedTextStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Bold');
      done();
    });

    
    
    /**
     * @tc.number   ArkUI_Stage_timepicker_3000
     * @tc.name     ArkUI_Stage_timepicker_3000
     * @tc.desc     ArkUI_Stage_timepicker_3000
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_timepicker_3000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('timePickerDefault');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_timepicker_3000] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getString('color')).assertEqual('#FF000000');
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getElement('font').getString('size')).assertEqual('8.00fp');
      expect(obj.getElement('$attrs').getElement('disappearTextStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Lighter');
      done();
    });

    
    
    /**
     * @tc.number   ArkUI_Stage_timepicker_4000
     * @tc.name     ArkUI_Stage_timepicker_4000
     * @tc.desc     ArkUI_Stage_timepicker_4000
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_timepicker_4000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('timePickerDefault');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_timepicker_4000] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('useMilitaryTime')).assertEqual('true');
      done();
    });

    
    
    /**
     * @tc.number   ArkUI_Stage_timepicker_5000
     * @tc.name     ArkUI_Stage_timepicker_5000
     * @tc.desc     ArkUI_Stage_timepicker_5000
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_timepicker_5000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUI_Stage_timepicker_5000 START');
      let driver = Driver.create();
      let button =  await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await button.click();
     await UtilsTest.msSleep(2000)
      let strJson = inspector.getInspectorByKey('timePickerDefault');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_timepicker_5000] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('useMilitaryTime')).assertEqual('false');
      done();
    });

  })
}

