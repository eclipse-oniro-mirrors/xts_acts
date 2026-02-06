'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeEach, it, expect, Level, beforeAll, beforeEach, Size, TestType } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton,  Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

export default function timePickerSelectedAreaTest() {
  describe('timePickerSelectedAreaTest', () => {

    beforeAll(() => {
      console.info("TimePickerAddApi beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.api18.static", "EntryAbility")

    });

    beforeEach(async (done: () => void): Promise<void> => {
      console.info('timePickerSelectedAreaTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/timePicker/timePickerSelectedArea',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        // routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get timePickerSelectedAreaTest state pages:' + JSON.stringify(pages));
        if (!('timePickerSelectedArea' == pages.name)) {
          console.info('get timePickerSelectedAreaTest pages.name:' + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await Utils.sleep(2500);
          // console.info('push timePickerSelectedAreaTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push timePickerSelectedAreaTest page error:' + err);
      }
      console.info('timePickerSelectedAreaTest beforeEach end');
      done();
    });
    
    
    
    
    
/**
     * @tc.number   timePickerSelectedAreaTest_static_001
     * @tc.name     timePickerSelectedAreaTest_static_001
     * @tc.desc     timePickerSelectedAreaTest_static_001
     * @tc.level    Level.LEVEL0
     */
it('timePickerSelectedAreaTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('timePickerSelectedAreaTest_static_001 START');
      let driver = Driver.create();
      await Utils.sleep(2000);
      let timePicker = await driver.findComponent(ON.id('timePicker'));
      let rect = await timePicker!.getBounds();
      let top = rect.top;
      let left = rect.left;
      let right = rect.right;
      let bottom = rect.bottom;
      let middle = (top + bottom) / 2

      await driver.swipe(
        Math.round(left + (right - left) / 6) as int,
        Math.round(top + (bottom - top) / 2) as int,
        Math.round(left + (right - left) / 6) as int,
        Math.round(top) as int);
      await Utils.sleep(6000);

      let textStr = await driver.findComponent(ON.id('textFlag'));
      let eText = await textStr!.getText();
      console.info("[timePickerSelectedAreaTest_static_001] text: " + JSON.stringify(eText));
      expect(eText).assertEqual('enter');
      console.info('[timePickerSelectedAreaTest_static_001] END');
      done();
    });
  })
}
