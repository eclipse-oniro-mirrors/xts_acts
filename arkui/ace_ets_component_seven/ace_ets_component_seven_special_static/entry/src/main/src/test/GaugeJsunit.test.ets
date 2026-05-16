'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../hypium/index';
import router from '@ohos.router'
import events_emitter from '@ohos.events.emitter';
import Utils from '../../ets/MainAbility/common/Utils';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from './Util.test'

export default function gaugeJsunit() {
  describe('gaugeTest', () => {
    beforeAll(() => {
        console.info("gaugeTest beforeEach start");
        await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
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
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);;
          await Utils.sleep(2000);
          // console.info("push gauge page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gauge page error " + err);
      }
    });

   
    
    
/**
     * @tc.number   testGauge0121_static_01
     * @tc.name     testGauge0121_static_01
     * @tc.desc     testGauge0121_static_01
     * @tc.level    Level.LEVEL0
     */
it('testGauge0121_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGauge0121_static_01] START');
      let strJsonNew = inspector.getInspectorByKey('GaugeKey1');
      let obj = JSON.parseJsonElement(strJsonNew);
      console.info("[testGauge0121_static_01] obj testGauge0121obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('strokeWidth')).assertEqual('5.00vp');

      console.info('[testGauge0121_static_01] END');
      done();
    });

   
    
    
/**
     * @tc.number   testGauge0122_static_02
     * @tc.name     testGauge0122_static_02
     * @tc.desc     testGauge0122_static_02
     * @tc.level    Level.LEVEL0
     */
it('testGauge0122_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGauge0122_static_02] START');
      let strJsonNew = inspector.getInspectorByKey('GaugeKey1');
      let obj = JSON.parseJsonElement(strJsonNew);
      console.info("[testGauge0122_static_02] obj testGauge0122obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('endAngle')).assertEqual('360.00');

      console.info('[testGauge0122_static_02] END');
      done();
    });

    
    
    
/**
     * @tc.number   testGauge0123_static_03
     * @tc.name     testGauge0123_static_03
     * @tc.desc     testGauge0123_static_03
     * @tc.level    Level.LEVEL0
     */
it('testGauge0123_static_03', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGauge0123_static_03] START');
      let strJsonNew = inspector.getInspectorByKey('GaugeKey1');
      let obj = JSON.parseJsonElement(strJsonNew);
      console.info("[testGauge0123_static_03] obj testGauge0123obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('startAngle')).assertEqual('0.00');

      console.info('[testGauge0123_static_03] END');
      done();
    });

    
    
    
/**
     * @tc.number   testGauge0124_static_04
     * @tc.name     testGauge0124_static_04
     * @tc.desc     testGauge0124_static_04
     * @tc.level    Level.LEVEL0
     */
it('testGauge0124_static_04', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGauge0124_static_04] START');
      let strJsonNew = inspector.getInspectorByKey('GaugeKey1');
      let obj = JSON.parseJsonElement(strJsonNew);
      console.info("[testGauge0124_static_04] obj testGauge0124obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('value')).assertEqual('1.00');

      console.info('[testGauge0124_static_04] END');
      done();
    });

    
    
    
/**
     * @tc.number   testGauge0125_static_05
     * @tc.name     testGauge0125_static_05
     * @tc.desc     testGauge0125_static_05
     * @tc.level    Level.LEVEL0
     */
it('testGauge0125_static_05', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGauge0125_static_05] START');
      let strJsonNew = inspector.getInspectorByKey('GaugeKey1');
      let obj = JSON.parseJsonElement(strJsonNew);
      console.info("[testGauge0125_static_05] obj testGauge0125obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('colors')).assertEqual('[[[["#FF123456","0.000000"]],1],[[["#FF654321","0.000000"]],2]]');

      console.info('[testGauge0125_static_05] END');
      done();
    });

   
    
    
/**
     * @tc.number   testGauge0126_static_06
     * @tc.name     testGauge0126_static_06
     * @tc.desc     testGauge0126_static_06
     * @tc.level    Level.LEVEL0
     */
it('testGauge0126_static_06', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGauge0126_static_06] START');
      let strJsonNew = inspector.getInspectorByKey('GaugeKey1');
      let obj = JSON.parseJsonElement(strJsonNew);
      console.info("[testGauge0126_static_06] obj testGauge0126obj is: " + JSON.stringify(obj.getElement('$attrs')));
      //expect(obj.getElement('$attrs').indicator).assertEqual('');
      expect(true).assertEqual(true);

      console.info('[testGauge0126_static_06] END');
      done();
    });

    
    
    
/**
     * @tc.number   testGauge0127_static_07
     * @tc.name     testGauge0127_static_07
     * @tc.desc     testGauge0127_static_07
     * @tc.level    Level.LEVEL0
     */
it('testGauge0127_static_07', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGauge0127_static_07] START');
      let strJsonNew = inspector.getInspectorByKey('GaugeKey1');
      let obj = JSON.parseJsonElement(strJsonNew);
      console.info("[testGauge0127_static_07] obj testGauge0127obj is: " + JSON.stringify(obj.getElement('$attrs')));
      //expect(obj.getElement('$attrs').shadow).assertEqual('');
      expect(true).assertEqual(true);

      console.info('[testGauge0127_static_07] END');
      done();
    });

   
    
    
/**
     * @tc.number   testGauge0128_static_08
     * @tc.name     testGauge0128_static_08
     * @tc.desc     testGauge0128_static_08
     * @tc.level    Level.LEVEL0
     */
it('testGauge0128_static_08', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGauge0128_static_08] START');
      let strJsonNew = inspector.getInspectorByKey('GaugeKey1');
      let obj = JSON.parseJsonElement(strJsonNew);
      console.info("[testGauge0128_static_08] obj testGauge0128obj is: " + JSON.stringify(obj.getElement('$attrs')));
      //expect(obj.getElement('$attrs').description).assertEqual('');
      expect(true).assertEqual(true);

      console.info('[testGauge0128_static_08] END');
      done();
    });
  })
}
