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

export default function timePickerLoopTest() {
  describe('timePickerLoopTest', () => {

    beforeAll(() => {
      console.info("TimePickerAddApi beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.api18.static", "EntryAbility")

    });

    beforeEach(async (done: () => void): Promise<void> => {
      console.info('timePickerLoopTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/timePicker/timePickerLoop',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        // routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get timePickerLoopTest state pages:' + JSON.stringify(pages));
        if (!('timePickerLoop' == pages.name)) {
          console.info('get timePickerLoopTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          await Utils.sleep(2500);
          // console.info('push timePickerLoopTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push timePickerLoopTest page error:' + err);
      }
      console.info('timePickerLoopTest beforeEach end');
      done();
    });
    
    
    
    
    
/**
     * @tc.number   timePickerLoopTest_static_001
     * @tc.name     timePickerLoopTest_static_001
     * @tc.desc     timePickerLoopTest_static_001
     * @tc.level    Level.LEVEL0
     */
it('timePickerLoopTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('timePickerLoopTest_static_001 START');
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('trueFlag'));
      await Utils.sleep(1000);
      await button!.click()
      await Utils.sleep(1000);

      let strJson = inspector.getInspectorByKey('timePicker');
      let obj = JSON.parseJsonElement(strJson);
      console.info('timePickerLoopTest_static_001 component obj is: ' + obj.getElement('$attrs').getString('loop'));
      expect(obj.getElement('$attrs').getString('loop')).assertEqual('true');
      console.info('[timePickerLoopTest_static_001] END');
      done();
    });
    
    
    
    
    
/**
     * @tc.number   timePickerLoopTest_static_002
     * @tc.name     timePickerLoopTest_static_002
     * @tc.desc     timePickerLoopTest_static_002
     * @tc.level    Level.LEVEL0
     */
it('timePickerLoopTest_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('timePickerLoopTest_static_002 START');
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('falseFlag'));
      await Utils.sleep(1000);
      await button!.click()
      await Utils.sleep(1000);

      let strJson = inspector.getInspectorByKey('timePicker');
      let obj = JSON.parseJsonElement(strJson);
      console.info('timePickerLoopTest_static_002 component obj is: ' + obj.getElement('$attrs').getString('loop'));
      expect(obj.getElement('$attrs').getString('loop')).assertEqual('false');
      console.info('[timePickerLoopTest_static_002] END');
      done();
    });
    
    
    
    
    
/**
     * @tc.number   timePickerLoopTest_static_003
     * @tc.name     timePickerLoopTest_static_003
     * @tc.desc     timePickerLoopTest_static_003
     * @tc.level    Level.LEVEL0
     */
it('timePickerLoopTest_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('timePickerLoopTest_static_003 START');
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('undefinedFlag'));
      await Utils.sleep(1000);
      await button!.click()
      await Utils.sleep(1000);

      let strJson = inspector.getInspectorByKey('timePicker');
      let obj = JSON.parseJsonElement(strJson);
      console.info('timePickerLoopTest_static_003 component obj is: ' + obj.getElement('$attrs').getString('loop'));
      expect(obj.getElement('$attrs').getString('loop')).assertEqual('true');
      console.info('[timePickerLoopTest_static_003] END');
      done();
    });
  })
}
