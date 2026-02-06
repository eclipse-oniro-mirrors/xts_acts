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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import {UtilsTest} from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function colorMetricsTest() {
  describe('colorMetricsTest', () => {

    beforeAll(() => {
      console.info("colorMetricsTest beforeAll start");
      
      await UtilsTest.startAbility("com.open.harmony.acetestcommenventapi20.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Color/colorMetrics',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get colorMetricsTest state pages: ' + JSON.stringify(pages));
        if (!('colorMetrics' == pages.name)) {
          console.info('get colorMetricsTest state pages.name: ' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push colorMetricsTest page error: ' + err);
        expect().assertFail();
      }
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('colorMetrics after each called');
    });
    
    
/**
     * @tc.number   colorMetricsTest_0010
     * @tc.name     colorMetricsTest_0010
     * @tc.desc     colorMetricsTest_0010
     * @tc.level    Level.LEVEL1
     */
it('colorMetricsTest_0010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('colorMetricsTest_0010 START');
      let driver =  Driver.create();

      let text = await driver.findComponent(ON.id('P3backgroundColor'));
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('P3backgroundColor');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson);

      console.info('[colorMetricsTest_0010] backgroundColor: ' + JSON.stringify(obj.getElement('$attrs').getString('backgroundColor')));
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00');
      console.info('[colorMetricsTest_0010] END');
      done();
    });

    
    
/**
     * @tc.number   colorMetricsTest_0020
     * @tc.name     colorMetricsTest_0020
     * @tc.desc     colorMetricsTest_0020
     * @tc.level    Level.LEVEL1
     */
it('colorMetricsTest_0020', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('colorMetricsTest_0020 START');
      let driver =  Driver.create();

      let text1 = await driver.findComponent(ON.id('P3SweepGradient'));
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('P3SweepGradient');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson);

      console.info('[colorMetricsTest_0020] SweepGradient: ' + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('sweepGradient').getElement('colors')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('sweepGradient').getElement('colors'))).assertEqual('[["#FF00FF00","0.000000"],["#FF00FF00","0.500000"],["#FF00FF00","1.000000"]]');
      console.info('[colorMetricsTest_0020] END');
      done();
    });
  })
}