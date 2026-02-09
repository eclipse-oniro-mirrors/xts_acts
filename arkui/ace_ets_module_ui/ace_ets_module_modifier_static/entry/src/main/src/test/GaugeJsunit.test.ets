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

export default function gaugeJsunit() {
  describe('gaugeTest', () => {
     beforeAll(() => {

      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/gauge',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get gauge state success " + JSON.stringify(pages));
        if (!("gauge" == pages.name)) {
          console.info("get gauge state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
         await UtilsTest.msSleep(2000);
        }
      } catch (err) {
        console.error("push gauge page error " + err);
      }
    });

    
    
    /**
     * @tc.number   testGaugeStatic0121
     * @tc.name     testGaugeStatic0121
     * @tc.desc     testGaugeStatic0121
     * @tc.level    Level.LEVEL0
     */
it('testGaugeStatic0121', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGaugeStatic0121] START');
      let strJsonNew = inspector.getInspectorByKey('GaugeKey1');

      console.info("[testGaugeStatic0121] JSON.parseJsonElement(strJsonNew) testGaugeStatic0121JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('strokeWidth')).assertEqual('5.00vp');

      console.info('[testGaugeStatic0121] END');
      done();
    });

    
    
    /**
     * @tc.number   testGaugeStatic0122
     * @tc.name     testGaugeStatic0122
     * @tc.desc     testGaugeStatic0122
     * @tc.level    Level.LEVEL0
     */
it('testGaugeStatic0122', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGaugeStatic0122] START');
      let strJsonNew = inspector.getInspectorByKey('GaugeKey1');

      console.info("[testGaugeStatic0122] JSON.parseJsonElement(strJsonNew) testGaugeStatic0122JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('endAngle')).assertEqual('360.00');

      console.info('[testGaugeStatic0122] END');
      done();
    });

    
    
    /**
     * @tc.number   testGaugeStatic0123
     * @tc.name     testGaugeStatic0123
     * @tc.desc     testGaugeStatic0123
     * @tc.level    Level.LEVEL0
     */
it('testGaugeStatic0123', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGaugeStatic0123] START');
      let strJsonNew = inspector.getInspectorByKey('GaugeKey1');

      console.info("[testGaugeStatic0123] JSON.parseJsonElement(strJsonNew) testGaugeStatic0123JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('startAngle')).assertEqual('0.00');

      console.info('[testGaugeStatic0123] END');
      done();
    });

    
    
    /**
     * @tc.number   testGaugeStatic0124
     * @tc.name     testGaugeStatic0124
     * @tc.desc     testGaugeStatic0124
     * @tc.level    Level.LEVEL0
     */
it('testGaugeStatic0124', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGaugeStatic0124] START');
      let strJsonNew = inspector.getInspectorByKey('GaugeKey1');

      console.info("[testGaugeStatic0124] JSON.parseJsonElement(strJsonNew) testGaugeStatic0124JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('value')).assertEqual('1.00');

      console.info('[testGaugeStatic0124] END');
      done();
    });

    
    
    /**
     * @tc.number   testGaugeStatic0125
     * @tc.name     testGaugeStatic0125
     * @tc.desc     testGaugeStatic0125
     * @tc.level    Level.LEVEL0
     */
it('testGaugeStatic0125', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGaugeStatic0125] START');
      let strJsonNew = inspector.getInspectorByKey('GaugeKey1');

      console.info("[testGaugeStatic0125] JSON.parseJsonElement(strJsonNew) testGaugeStatic0125JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('colors')).assertEqual('[[[["#FF123456","0.000000"]],1],[[["#FF654321","0.000000"]],2]]');

      console.info('[testGaugeStatic0125] END');
      done();
    });

    
    
    /**
     * @tc.number   testGaugeStatic0126
     * @tc.name     testGaugeStatic0126
     * @tc.desc     testGaugeStatic0126
     * @tc.level    Level.LEVEL0
     */
it('testGaugeStatic0126', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGaugeStatic0126] START');
      let strJsonNew = inspector.getInspectorByKey('GaugeKey1');

      console.info("[testGaugeStatic0126] JSON.parseJsonElement(strJsonNew) testGaugeStatic0126JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')));
      let indicator = JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('indicator');
      expect(indicator?.getString('icon')).assertEqual("abc");
      expect(indicator?.getString('space')).assertEqual("15.00px");
      console.info('[testGaugeStatic0126] END');
      done();
    });

    
    
    /**
     * @tc.number   testGaugeStatic0127
     * @tc.name     testGaugeStatic0127
     * @tc.desc     testGaugeStatic0127
     * @tc.level    Level.LEVEL0
     */
it('testGaugeStatic0127', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGaugeStatic0127] START');
      let strJsonNew = inspector.getInspectorByKey('GaugeKey1');

      console.info("[testGaugeStatic0127] JSON.parseJsonElement(strJsonNew) testGaugeStatic0127JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')));
      let trackShadow = JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('trackShadow');
      expect(Number(trackShadow?.getString('radius'))).assertEqual(5);
      expect(Number(trackShadow?.getString('offsetX'))).assertEqual(15);
      expect(Number(trackShadow?.getString('offsetY'))).assertEqual(15);
      console.info('[testGaugeStatic0127] END');
      done();
    });

    
    
    /**
     * @tc.number   testGaugeStatic0128
     * @tc.name     testGaugeStatic0128
     * @tc.desc     testGaugeStatic0128
     * @tc.level    Level.LEVEL0
     */
it('testGaugeStatic0128', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGaugeStatic0128] START');
      let strJsonNew = inspector.getInspectorByKey('GaugeKey1');

      console.info("[testGaugeStatic0128] JSON.parseJsonElement(strJsonNew) testGaugeStatic0128 is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').tryGetElement('description')).assertEqual(undefined);
      console.info('[testGaugeStatic0128] END');
      done();
    });

    
    
    /**
     * @tc.number   testGaugeStatic0129
     * @tc.name     testGaugeStatic0129
     * @tc.desc     testGaugeStatic0129
     * @tc.level    Level.LEVEL0
     */
it('testGaugeStatic0129', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testGaugeStatic0129 START');
      let driver = Driver.create();
      let button =  await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await button.click();
     await UtilsTest.msSleep(2000)

      let strJsonNew = inspector.getInspectorByKey('GaugeKey1');
      console.info("testGaugeStatic0129 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('strokeWidth')).assertEqual('5.00vp');
      console.info('testGaugeStatic0129 END');
      done();
    });
  })
}
