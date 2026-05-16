'use static';
/*
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
import events_emitter from '@ohos.events.emitter';
import { $r, Alignment, Color, Direction } from '@ohos.arkui.component'
import {
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Component, Driver, MouseButton, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { RecordData } from '@ohos.base';

let domain: number = 0x0000;
let tag: string = 'testTag';

interface Data {
  x: number | string
  y: number | string
}

export default function positionSettingJsunit() {
  describe('borderTest_five_3', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.aceEtsApiLack.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      console.info("positionSetting beforeEach start");
      let options: router.RouterOptions = {
        url: 'pages/positionSetting',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get positionSetting state pages:" + JSON.stringify(pages));
        if (!("positionSetting" == pages.name)) {
          console.info("get positionSetting state pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err: Error) {
        console.error("push positionSetting page error:" + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("positionSetting after each called");
    });

    
    
    /**
     * @tc.number   testPositionSetting_static_001
     * @tc.name     testPositionSetting_static_001
     * @tc.desc     testPositionSetting_static_001
     * @tc.level    Level.LEVEL0
     */
it('testPositionSetting_static_001', Level.LEVEL0, async () => {
      console.info('[testPositionSetting001] START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('textAlign');
      console.info("[testPositionSetting001] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testPositionSetting001] textAlign: " + obj.getElement('$attrs').getString('textAlign'));
      expect(obj.getElement('$attrs').getString('textAlign')).assertEqual('TextAlign.Left');
      console.info('[testPositionSetting001] END');
    });

    
    
    /**
     * @tc.number   testPositionSetting_static_002
     * @tc.name     testPositionSetting_static_002
     * @tc.desc     testPositionSetting_static_002
     * @tc.level    Level.LEVEL0
     */
it('testPositionSetting_static_002', Level.LEVEL0, async () => {
      console.info('[testPositionSetting002] START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('rowDirection');
      console.info("[testPositionSetting002] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testPositionSetting002] rowDirection: " + obj.getElement('$attrs').getString('direction'));
      expect(obj.getElement('$attrs').getString('direction')).assertEqual('Direction.Rtl');
      console.info('[testPositionSetting002] END');
    });

    
    
    /**
     * @tc.number   testPositionSetting_static_003
     * @tc.name     testPositionSetting_static_003
     * @tc.desc     testPositionSetting_static_003
     * @tc.level    Level.LEVEL0
     */
it('testPositionSetting_static_003', Level.LEVEL0, async () => {
      console.info('[testPositionSetting003] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textAlign": Alignment.BottomEnd
          } as Record<String,RecordData>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 25,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testPositionSetting003] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err: Error) {
        console.log("[testPositionSetting003] change component data error: " + err.message);
      }
      await Utils.sleep(4000);
      let strJson = inspector.getInspectorByKey('textAlign');
      console.info("[testPositionSetting003] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testPositionSetting003] textAlign: " + obj.getElement('$attrs').getString('textAlign'));
      expect(obj.getElement('$attrs').getString('textAlign')).assertEqual("TextAlign.Right");
      console.info('[testPositionSetting003] END');
    });

    
    
    /**
     * @tc.number   testPositionSetting_static_004
     * @tc.name     testPositionSetting_static_004
     * @tc.desc     testPositionSetting_static_004
     * @tc.level    Level.LEVEL0
     */
it('testPositionSetting_static_004', Level.LEVEL0, async () => {
      console.info('[testPositionSetting004] START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "direction": Direction.Ltr
          } as Record<String,RecordData>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 26,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testPositionSetting004] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err: Error) {
        console.log("[testPositionSetting004] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson = inspector.getInspectorByKey('rowDirection');
      console.info("[testPositionSetting004] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testPositionSetting004] rowDirection: " + obj.getElement('$attrs').getString('direction'));
      expect(obj.getElement('$attrs').getString('direction')).assertEqual('Direction.Ltr');
      console.info('[testPositionSetting004] END');
    });

    
    
    /**
     * @tc.number   testPositionSetting_static_005
     * @tc.name     testPositionSetting_static_005
     * @tc.desc     testPositionSetting_static_005
     * @tc.level    Level.LEVEL0
     */
it('testPositionSetting_static_005', Level.LEVEL0, async () => {
      console.info('[testPositionSetting005] START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('position1');
      console.info("[testPositionSetting005] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testPositionSetting005] position: " +
      JSON.stringify(obj.getElement('$attrs').getString('position')));
      expect(obj.getElement('$attrs').getElement('position').getString('x')).assertEqual('25.00vp');
      expect(obj.getElement('$attrs').getElement('position').getString('y')).assertEqual('15.00vp');
      let strJson1 = inspector.getInspectorByKey('position2');
      console.info("[testPositionSetting005] component strJson1:" + strJson1);
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[testPositionSetting005] position1: " +
      JSON.stringify(obj1.getElement('$attrs').getString('position')));
      expect(obj1.getElement('$attrs').getElement('position').getString('x')).assertEqual('50.00%');
      expect(obj1.getElement('$attrs').getElement('position').getString('y')).assertEqual('70.00%');
      console.info('[testPositionSetting005] END');
    });

    
    
    /**
     * @tc.number   testPositionSetting_static_006
     * @tc.name     testPositionSetting_static_006
     * @tc.desc     testPositionSetting_static_006
     * @tc.level    Level.LEVEL0
     */
it('testPositionSetting_static_006', Level.LEVEL0, async () => {
      console.info('[testPositionSetting006] START');
      await Utils.sleep(1000);
      try {
        let data: Data = {
          x: 10, y: 25
        };
        let data2: Data = {
          x: '30%', y: '50%'
        };
        let eventData: events_emitter.EventData = {
          data: {
            "position1": JSON.stringify(data),
            "position2": JSON.stringify(data2)
          } as Record<String,RecordData>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 27,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testPositionSetting006] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err: Error) {
        console.log("[testPositionSetting006] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson = inspector.getInspectorByKey('position1');
      console.info("[testPositionSetting006] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testPositionSetting006] position1: " +
      JSON.stringify(obj.getElement('$attrs').getString('position')));
      expect(obj.getElement('$attrs').getElement('position').getString('x')).assertEqual('10.00vp');
      expect(obj.getElement('$attrs').getElement('position').getString('y')).assertEqual('25.00vp');
      let strJson2 = inspector.getInspectorByKey('position2');
      console.info("[testPositionSetting006] component strJson2:" + strJson2);
      let obj2 = JSON.parseJsonElement(strJson2);
      ;
      console.info("[testPositionSetting006] position2: " +
      JSON.stringify(obj2.getElement('$attrs').getString('position')));
      expect(obj2.getElement('$attrs').getElement('position').getString('x')).assertEqual('30.00%');
      expect(obj2.getElement('$attrs').getElement('position').getString('y')).assertEqual('50.00%');

    });

    
    
    /**
     * @tc.number   testPositionSetting_static_007
     * @tc.name     testPositionSetting_static_007
     * @tc.desc     testPositionSetting_static_007
     * @tc.level    Level.LEVEL0
     */
it('testPositionSetting_static_007', Level.LEVEL0, async () => {
      console.info('[testPositionSetting007] START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('markAnchor');
      console.info("[testPositionSetting007] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testPositionSetting007] position: " +
      JSON.stringify(obj.getElement('$attrs').getString('markAnchor')));
      expect(obj.getElement('$attrs').getElement('markAnchor').getString('x')).assertEqual('25.00vp');
      expect(obj.getElement('$attrs').getElement('markAnchor').getString('y')).assertEqual('25.00vp');
      console.info('[testPositionSetting007] END');

    });

    
    
    /**
     * @tc.number   testPositionSetting_static_008
     * @tc.name     testPositionSetting_static_008
     * @tc.desc     testPositionSetting_static_008
     * @tc.level    Level.LEVEL0
     */
it('testPositionSetting_static_008', Level.LEVEL0, async () => {
      console.info('[testPositionSetting008] START');
      await Utils.sleep(1000);
      try {
        let data: Data = {
          x: 0, y: 0
        };
        let eventData: events_emitter.EventData = {
          data: {
            "markAnchor": JSON.stringify(data),
          } as Record<String,RecordData>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 28,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testPositionSetting008] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err: Error) {
        console.log("[testPositionSetting008] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson = inspector.getInspectorByKey('markAnchor');
      console.info("[testPositionSetting008] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testPositionSetting008] markAnchor: " +
      JSON.stringify(obj.getElement('$attrs').getString('markAnchor')));
      expect(obj.getElement('$attrs').getElement('markAnchor').getString('x')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getElement('markAnchor').getString('y')).assertEqual('0.00vp');
      console.info('[testPositionSetting008] END');

    });

    
    
    /**
     * @tc.number   testPositionSetting_static_009
     * @tc.name     testPositionSetting_static_009
     * @tc.desc     testPositionSetting_static_009
     * @tc.level    Level.LEVEL0
     */
it('testPositionSetting_static_009', Level.LEVEL0, async () => {
      console.info('[testPositionSetting009] START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('offset');
      console.info("[testPositionSetting009] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testPositionSetting009] offset: " + JSON.stringify(obj.getElement('$attrs').getString('offset')));
      expect(obj.getElement('$attrs').getElement('offset').getString('x')).assertEqual('10.00vp');
      expect(obj.getElement('$attrs').getElement('offset').getString('y')).assertEqual('15.00vp');
      expect(obj.getElement('$attrs').getElement('span').getString('x')).assertEqual('10.00vp');
      expect(obj.getElement('$attrs').getElement('span').getString('y')).assertEqual('15.00vp');
      console.info('[testPositionSetting009] END');

    });

    
    
    /**
     * @tc.number   testPositionSetting_static_010
     * @tc.name     testPositionSetting_static_010
     * @tc.desc     testPositionSetting_static_010
     * @tc.level    Level.LEVEL0
     */
it('testPositionSetting_static_010', Level.LEVEL0, async () => {
      console.info('[testPositionSetting010] START');
      await Utils.sleep(1000);
      try {
        let data: Data = {
          x: 150, y: 10
        };
        let eventData: events_emitter.EventData = {
          data: {
            "offset": JSON.stringify(data),
          } as Record<String,RecordData>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 29,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testPositionSetting010] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err: Error) {
        console.log("[testPositionSetting010] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson = inspector.getInspectorByKey('offset');
      console.info("[testPositionSetting010] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testPositionSetting010] offset: " + JSON.stringify(obj.getElement('$attrs').getString('offset')));
      expect(obj.getElement('$attrs').getElement('offset').getString('x')).assertEqual('150.00vp');
      expect(obj.getElement('$attrs').getElement('offset').getString('y')).assertEqual('10.00vp');
      console.info('[testPositionSetting010] END');

    });

    
    
    /**
     * @tc.number   testPositionSetting_static_011
     * @tc.name     testPositionSetting_static_011
     * @tc.desc     testPositionSetting_static_011
     * @tc.level    Level.LEVEL0
     */
it('testPositionSetting_static_011', Level.LEVEL0, async () => {
      console.info('[testPositionSetting011] START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('opacity');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testPositionSetting011] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getDouble('opacity')).assertEqual(1);
      console.info('[testPositionSetting011] END');

    });

    
    
    /**
     * @tc.number   testPositionSetting_static_012
     * @tc.name     testPositionSetting_static_012
     * @tc.desc     testPositionSetting_static_012
     * @tc.level    Level.LEVEL0
     */
it('testPositionSetting_static_012', Level.LEVEL0, async () => {
      console.info('[testPositionSetting012] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "opacityValue": "0.7"
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 25,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testPositionSetting012] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[testPositionSetting012] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('opacity');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[testPositionSetting012] component objNew is: " + JSON.stringify(objNew));
      expect(objNew.getElement('$attrs').getDouble('opacity')).assertEqual(0.7);
      console.info('[testPositionSetting012] END');
    });
  })
}