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
import { describe, beforeEach, it, expect, Level, beforeAll, beforeEach, Size, afterEach, TestType } from '../../../../hypium/index';
import { Color } from '@ohos.arkui.component'
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
const SLEEP_TIME_L = 1000;
const SLEEP_TIME_S = 100;
export default function DataPickerCanLoopTest() {
  describe('DataPickerCanLoopTest', () => {

    beforeAll(() => {
      console.info("DataPickerCanLoopTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.datePicker.static", "EntryAbility")
      await UtilsTest.msSleep(SLEEP_TIME_L)
    });

    beforeEach(async () => {
      console.info('DataPickerCanLoopTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/datePicker/DataPickerCanLoop',
      }
      await Utils.sleep(SLEEP_TIME_L);
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get DataPickerCanLoopTest state pages:' + JSON.stringify(pages));
        if (!('DataPickerCanLoop' == pages.name)) {
          console.info('get DataPickerCanLoopTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(SLEEP_TIME_L);
        }
      } catch (err) {
        console.error('push DataPickerCanLoopTest page error:' + err);
      }
      console.info('DataPickerCanLoopTest beforeEach end');
    });


    /**
     * @tc.number   DataPickerCanLoop_static_001
     * @tc.name     DataPickerCanLoop_static_001
     * @tc.desc     To test the canLoop interface true
     * @tc.level    Level.LEVEL1
     */
    it('DataPickerCanLoop_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('DataPickerCanLoop_static_001 START');
      const driver = Driver.create();
      const button1 = await driver.findComponent(ON.id('trueID'));
      await (button1?.click() as Promise<void>);
      console.info('trueID click success');
      await Utils.sleep(SLEEP_TIME_S);
      let strJson = inspector.getInspectorByKey('datePicker');
      let obj = JSON.parseJsonElement(strJson);
      let obj1 :string = obj.getElement('$attrs').getString('canLoop');
      expect(obj1).assertEqual('true');
      done();
    });
    /**
     * @tc.number   DataPickerCanLoop_static_002
     * @tc.name     DataPickerCanLoop_static_002
     * @tc.desc     To test the canLoop interface false
     * @tc.level    Level.LEVEL1
     */
    it('DataPickerCanLoop_static_002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('DataPickerCanLoop_static_001 START');
      const driver = Driver.create();
      const button1 = await driver.findComponent(ON.id('falseID'));
      await (button1?.click() as Promise<void>);
      console.info('falseID click success');
      await Utils.sleep(SLEEP_TIME_S);
      let strJson = inspector.getInspectorByKey('datePicker');
      let obj = JSON.parseJsonElement(strJson);
      let obj1 :string = obj.getElement('$attrs').getString('canLoop');
      expect(obj1).assertEqual('false');
      done();
    });
    /**
     * @tc.number   DataPickerCanLoop_static_003
     * @tc.name     DataPickerCanLoop_static_003
     * @tc.desc     To test the canLoop interface undefined
     * @tc.level    Level.LEVEL1
     */
    it('DataPickerCanLoop_static_003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('DataPickerCanLoop_static_001 START');
      const driver = Driver.create();
      const button1 = await driver.findComponent(ON.id('undefinedID'));
      await (button1?.click() as Promise<void>);
      console.info('undefinedID click success');
      await Utils.sleep(SLEEP_TIME_S);
      let strJson = inspector.getInspectorByKey('datePicker');
      let obj = JSON.parseJsonElement(strJson);
      let obj1 :string = obj.getElement('$attrs').getString('canLoop');
      expect(obj1).assertEqual('true');
      done();
    });
  })
}