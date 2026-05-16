'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, beforeEach, afterEach, it, expect, beforeAll,Level } from "../../../../hypium/index"
import events_emitter from '@ohos.events.emitter';
import Utils from '../Utils.test';
import inspector from '@ohos.arkui.inspector'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import router from '@ohos.router';
import { RotateOptions, ScaleOptions } from '@ohos.arkui.component'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test'
import { RecordData } from '@ohos.base';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function transFormJsunit() {
  describe('appInfoTest_five_4', () => {
    beforeAll(() => {
      console.info("appInfoTest_five_4 beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split05.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("transFormJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Row/transForm',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get transFormJsunit state pages: " + JSON.stringify(pages));
        if (!("transForm" == pages.name)) {
          console.info("get transFormJsunit state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push transFormJsunit page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("transFrom each called");
    });
    
    
    

/**
     * @tc.number   testTransForm001_static_01
     * @tc.name     testTransForm001_static_01
     * @tc.desc     testTransForm001_static_01
     * @tc.level    Level.LEVEL0
     */
it('testTransForm001_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testTransForm001_static_01] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('rotate');
      let obj = JSON.parseJsonElement(strJson)
     console.info("[testTransForm001_static_01] component strJson:" + JSON.stringify(obj));
     expect(obj.getString('$type')).assertEqual('Row');
     expect(obj.getElement('$attrs').getElement('rotate').getString('x')).assertEqual('1.000000');
     expect(obj.getElement('$attrs').getElement('rotate').getString('y')).assertEqual('1.000000');
     expect(obj.getElement('$attrs').getElement('rotate').getString('z')).assertEqual('1.000000');
     expect(obj.getElement('$attrs').getElement('rotate').getString('centerX')).assertEqual('50.00%');
     expect(obj.getElement('$attrs').getElement('rotate').getString('centerY')).assertEqual('50.00%');
     expect(obj.getElement('$attrs').getElement('rotate').getString('angle')).assertEqual('300.000000');
      done();
    });
    
    
    

/**
     * @tc.number   testTransForm002_static_02
     * @tc.name     testTransForm002_static_02
     * @tc.desc     testTransForm002_static_02
     * @tc.level    Level.LEVEL0
     */
it('testTransForm002_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testTransForm002_static_02] START');
      await CommonFunc.sleep(1000);
      let rotateValue: RotateOptions = {
        x: 2,
        y: 2,
        z: 2,
        centerX: '60%',
        centerY: '60%',
        angle: 100
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rotateValue": rotateValue as RotateOptions
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 45,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testTransForm002_static_02] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testTransForm002_static_02] change component data error: " + (err as Error)?.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = inspector.getInspectorByKey('rotate');
      let obj = JSON.parseJsonElement(strJsonNew)
     console.info("[testTransForm002_static_02] component objNew is: " + JSON.stringifyJsonElement(obj));
     expect(obj.getElement('$attrs').getElement('rotate').getString('x')).assertEqual('2.000000');
     expect(obj.getElement('$attrs').getElement('rotate').getString('y')).assertEqual('2.000000');
     expect(obj.getElement('$attrs').getElement('rotate').getString('z')).assertEqual('2.000000');
     expect(obj.getElement('$attrs').getElement('rotate').getString('centerX')).assertEqual('60.00%');
     expect(obj.getElement('$attrs').getElement('rotate').getString('centerY')).assertEqual('60.00%');
     expect(obj.getElement('$attrs').getElement('rotate').getString('angle')).assertEqual('100.000000');
      done();
    });
    
    
    

/**
     * @tc.number   testTransForm003_static_03
     * @tc.name     testTransForm003_static_03
     * @tc.desc     testTransForm003_static_03
     * @tc.level    Level.LEVEL0
     */
it('testTransForm003_static_03', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testTransForm003_static_03] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('rotate3');
      let obj = JSON.parseJsonElement(strJson)
     console.info("[testTransForm003_static_03] component strJson:" + JSON.stringify(obj));
     expect(obj.getElement('$attrs').getElement('scale').getString('x')).assertEqual('2.000000');
     expect(obj.getElement('$attrs').getElement('scale').getString('y')).assertEqual('0.500000');
      done();
    });
    
    
    

/**
     * @tc.number   testTransForm004_staic_04
     * @tc.name     testTransForm004_staic_04
     * @tc.desc     testTransForm004_staic_04
     * @tc.level    Level.LEVEL0
     */
it('testTransForm004_staic_04', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testTransForm004_staic_04] START');
      await CommonFunc.sleep(1000);
      let scaleValue: ScaleOptions = {
        x: 1, y: 1
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "scaleValue": scaleValue as ScaleOptions
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 46,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testTransForm004_staic_04] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testTransForm004_staic_04] change component data error: " + (err as Error)?.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = inspector.getInspectorByKey('rotate3');
      let obj = JSON.parseJsonElement(strJsonNew)
     console.info("[testTransForm004_staic_04] component objNew is: " + JSON.stringify(obj));
     expect(obj.getElement('$attrs').getElement('scale').getString('x')).assertEqual('1.000000');
     expect(obj.getElement('$attrs').getElement('scale').getString('y')).assertEqual('1.000000');
      done();
    });
  })
}




