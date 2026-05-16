'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeEach, it, expect, Level, beforeAll, afterEach, TestType } from '../../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Component, Driver, ON, MouseButton, Rect } from '@kit.TestKit';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import common from '@ohos.app.ability.common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

const SLEEP_TIME_L = 1000;
export default function UIPickerOnChangeTest() {
  describe('UIPickerOnChangeTest', () => {

    beforeAll(() => {
      console.info("UIPickerOnChangeTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.container.static", "EntryAbility")
      await UtilsTest.msSleep(SLEEP_TIME_L)
    });

    beforeEach(async (): Promise<void> => {
      console.info('UIPickerOnChangeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UIPickerComponent/UIPickerOnChange',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get UIPickerOnChangeTest state pages:' + JSON.stringify(pages));
        if (!('UIPickerOnChange' == pages.name)) {
          console.info('get UIPickerOnChangeTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(SLEEP_TIME_L);
        }
      } catch (err) {
        console.error('push UIPickerOnChangeTest page error:' + err);
      }
      console.info('UIPickerOnChangeTest beforeEach end');
    });

    /**
     * @tc.number   UIPickerOnChange_static_001
     * @tc.name     UIPickerOnChange_static_001
     * @tc.desc     To test the onChange interface
     * @tc.level    Level.LEVEL1
     */
    it('UIPickerOnChange_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('UIPickerOnChange_static_001 START');
      const driver = Driver.create();
      const picker = await driver.findComponent(ON.id('onChange1'));
      console.info('UIPickerOnChange_static_001 findComponent');
      const rect = await (picker?.getBounds() as Promise<Rect>);
      console.info('UIPickerOnChange_static_001 rect');
      let top = rect.top;
      let left = rect.left;
      let right = rect.right;
      let bottom = rect.bottom;
      console.info("rectValue is" + left + " --" + right + "--" + top + "--" + bottom);
      await driver.swipe(
        Math.round((left + right) / 2) as int,
        Math.round((top + bottom) / 2) as int,
        Math.round((left + right) / 2) as int,
        Math.round((top + bottom) / 4) as int,600
      );
      await Utils.sleep(SLEEP_TIME_L);
      let strJson = inspector.getInspectorByKey('onChange1');
      let obj = JSON.parseJsonElement(strJson);
      console.info('UIPickerOnChange_static_001 is: ' + obj.getElement('$attrs').getString('backgroundColor'));
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFF00FF');
      done();
    })
  })
}