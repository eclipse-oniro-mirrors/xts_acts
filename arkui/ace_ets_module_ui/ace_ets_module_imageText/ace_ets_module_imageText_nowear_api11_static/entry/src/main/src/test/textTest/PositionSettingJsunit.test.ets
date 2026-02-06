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
import {
  Alignment,
  Direction
} from '@ohos.arkui.component'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import {
  Position
} from '@ohos.arkui.component'
import { RecordData } from '@ohos.base';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
interface Data1 {
  x: number
  y: number
}
interface Data2 {
  x: string
  y: string
}
export default function positionSettingJsunit() {
  describe('positionSettingJsunit', () : void=> {
    beforeAll(() => {
      console.info("positionSettingJsunit beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("positionSettingJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/text/positionSetting",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get positionSettingJsunit state pages:" + "");
        if (!("positionSetting" == pages.name)) {
          console.info("get positionSettingJsunit pages.name:" + "");
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push positionSettingJsunit page error:" + err);
      }
      console.info("positionSettingJsunit beforeEach end");
    });
    afterEach(async () => {
      const routerInstance = AppStorage.get<Router>("router") as Router
      routerInstance.pushUrl({url:'MainAbility/pages/index/index'});
      await CommonFunc.sleep(1000);
      console.info("positionSettingJsunit after each called");
    });

    /**
     * @tc.number   testPositionSetting_static_001
     * @tc.name     testPositionSetting_static_001
     * @tc.desc     testPositionSetting_static_001
     * @tc.level    Level.LEVEL1
     */
it('testPositionSetting_static_001', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[testPositionSetting001] START');
      await CommonFunc.sleep(1000);
        let strJson: string = inspector.getInspectorByKey('textAlign');
        console.info("[testPositionSetting001] component strJson:" + strJson);
        let obj = JSON.parseJsonElement(strJson)
        console.info("[testPositionSetting001] textAlign: " + obj.getElement('$attrs').getString('textAlign') + "_" + obj.getElement('$attrs').getString('align'));
        expect(obj.getElement('$attrs').getString('textAlign')).assertEqual('TextAlign.Start');

      console.info('[testPositionSetting001] END');
      done();
    });

    /**
     * @tc.number   testPositionSetting_static_002
     * @tc.name     testPositionSetting_static_002
     * @tc.desc     testPositionSetting_static_002
     * @tc.level    Level.LEVEL1
     */
it('testPositionSetting_static_002', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[testPositionSetting002] START');
      await CommonFunc.sleep(1000);
        let strJson: string = inspector.getInspectorByKey('rowDirection');
        console.info("[testPositionSetting002] component strJson:" + strJson);
        let obj = JSON.parseJsonElement(strJson)
        console.info("[testPositionSetting002] rowDirection: " + obj.getElement('$attrs').getString('direction'));
        expect(obj.getElement('$attrs').getString('direction')).assertEqual('Direction.Rtl');

      console.info('[testPositionSetting002] END');
      done();
    });

    /**
     * @tc.number   testPositionSetting_static_003
     * @tc.name     testPositionSetting_static_003
     * @tc.desc     testPositionSetting_static_003
     * @tc.level    Level.LEVEL1
     */
it('testPositionSetting_static_003', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[testPositionSetting003] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textAlign": Alignment.BottomEnd
          } as Record<String,RecordData>
        } as events_emitter.EventData
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 25,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testPositionSetting003] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testPositionSetting003] change component data error: " + err.message );
      }
      await CommonFunc.sleep(4000);
        let strJson: string = inspector.getInspectorByKey('textAlign');
        console.info("[testPositionSetting003] component strJson:" + strJson);
        let obj = JSON.parseJsonElement(strJson)
        console.info("[testPositionSetting003] textAlign: " + obj.getElement('$attrs').getString('textAlign'));
        expect(obj.getElement('$attrs').getString('textAlign')).assertEqual("TextAlign.Start");

      console.info('[testPositionSetting003] END');
      done();
    });
    /**
     * @tc.number   testPositionSetting_static_004
     * @tc.name     testPositionSetting_static_004
     * @tc.desc     testPositionSetting_static_004
     * @tc.level    Level.LEVEL1
     */
it('testPositionSetting_static_004', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[testPositionSetting004] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "directionT": Direction.Ltr
          } as Record<String,RecordData>
        } as events_emitter.EventData
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 25,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testPositionSetting004] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testPositionSetting004] change component data error: " + err?.message);
      }
      await CommonFunc.sleep(3000);
        let strJson: string = inspector.getInspectorByKey('rowDirection');
        console.info("[testPositionSetting004] component strJson:" + strJson);
        let obj = JSON.parseJsonElement(strJson)
        console.info("[testPositionSetting004] rowDirection: " + obj.getElement('$attrs').getString('direction'));
        expect(obj.getElement('$attrs').getString('direction')).assertEqual('Direction.Ltr');

      console.info('[testPositionSetting004] END');
      done();
    });
    /**
     * @tc.number   testPositionSetting_static_005
     * @tc.name     testPositionSetting_static_005
     * @tc.desc     testPositionSetting_static_005
     * @tc.level    Level.LEVEL1
     */
it('testPositionSetting_static_005', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[testPositionSetting005] START');
      await CommonFunc.sleep(1000);
        let strJson: string = inspector.getInspectorByKey('position1');
        console.info("[testPositionSetting005] component strJson:" + strJson);
        let obj = JSON.parseJsonElement(strJson)
        console.info("[testPositionSetting005] position: " + JSON.stringify(obj.getElement('$attrs').getElement('position')));
        expect(obj.getElement('$attrs').getElement('position').getString('x')).assertEqual('25.00vp');
        expect(obj.getElement('$attrs').getElement('position').getString('y')).assertEqual('15.00vp');
        let strJson1 = inspector.getInspectorByKey('position2');
        console.info("[testPositionSetting005] component strJson1:" + strJson1);
        let obj1 = JSON.parseJsonElement(strJson1)
        console.info("[testPositionSetting005] position1: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('position')));
        expect(obj1.getElement('$attrs').getElement('position').getString('x')).assertEqual('50.00%');
        expect(obj1.getElement('$attrs').getElement('position').getString('y')).assertEqual('70.00%');
      console.info('[testPositionSetting005] END');
      done();
    });
    /**
     * @tc.number   testPositionSetting_static_006
     * @tc.name     testPositionSetting_static_006
     * @tc.desc     testPositionSetting_static_006
     * @tc.level    Level.LEVEL1
     */
it('testPositionSetting_static_006', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[testPositionSetting006] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "position1": {
              x: 10, y: 25
            } as Position,
            "position2": {
              x: '30%', y: '50%'
            } as Position
          } as Record<String,RecordData>
        } as events_emitter.EventData

        let indexEvent: events_emitter.InnerEvent = {
          eventId: 25,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testPositionSetting006] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testPositionSetting006] change component data error: " + err.message);
      }
      await CommonFunc.sleep(3000);


        let strJson: string = inspector.getInspectorByKey('position1');
        console.info("[testPositionSetting006] component strJson:" + strJson);
        let obj = JSON.parseJsonElement(strJson)

        console.info("[testPositionSetting006] position1: " + JSON.stringify(obj.getElement('$attrs').getElement('position')));
        expect(obj.getElement('$attrs').getElement('position').getString('x')).assertEqual('10.00vp');
        expect(obj.getElement('$attrs').getElement('position').getString('y')).assertEqual('25.00vp');
        let strJson2 = inspector.getInspectorByKey('position2');
        console.info("[testPositionSetting006] component strJson2:" + strJson2);
        let obj1= JSON.parseJsonElement(strJson2) ;

        console.info("[testPositionSetting006] position2: " + JSON.stringify(obj.getElement('$attrs').getElement('position')));
        expect(obj1.getElement('$attrs').getElement('position').getString('x')).assertEqual('30.00%');
        expect(obj1.getElement('$attrs').getElement('position').getString('y')).assertEqual('50.00%');

      done();
    });

    /**
     * @tc.number   testPositionSetting_static_007
     * @tc.name     testPositionSetting_static_007
     * @tc.desc     testPositionSetting_static_007
     * @tc.level    Level.LEVEL1
     */
it('testPositionSetting_static_007', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[testPositionSetting007] START');
      await CommonFunc.sleep(1000);


        let strJson: string = inspector.getInspectorByKey('markAnchor');
        console.info("[testPositionSetting007] component strJson:" + strJson);
        let obj = JSON.parseJsonElement(strJson)
        console.info("[testPositionSetting007] position: " + JSON.stringify(obj.getElement('$attrs').getElement('markAnchor')));
        expect(obj.getElement('$attrs').getElement('markAnchor').getString('x')).assertEqual('25.00vp');
        expect(obj.getElement('$attrs').getElement('markAnchor').getString('y')).assertEqual('25.00vp');

      console.info('[testPositionSetting007] END');
      done();
    });
    /**
     * @tc.number   testPositionSetting_static_008
     * @tc.name     testPositionSetting_static_008
     * @tc.desc     testPositionSetting_static_008
     * @tc.level    Level.LEVEL1
     */
it('testPositionSetting_static_008', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[testPositionSetting008] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "anchor": {
              x: 0, y: 0
            } as Position,
          } as Record<String,RecordData>
        } as events_emitter.EventData

        let indexEvent: events_emitter.InnerEvent = {
          eventId: 25,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testPositionSetting008] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testPositionSetting008] change component data error: " + err.message);
      }
      await CommonFunc.sleep(3000);


        let strJson: string = inspector.getInspectorByKey('markAnchor');
        console.info("[testPositionSetting008] component strJson:" + strJson);
        let obj = JSON.parseJsonElement(strJson)
        console.info("[testPositionSetting008] markAnchor: " + JSON.stringify(obj.getElement('$attrs').getElement('markAnchor')));
        expect(obj.getElement('$attrs').getElement('markAnchor').getString('x')).assertEqual('0.00vp');
        expect(obj.getElement('$attrs').getElement('markAnchor').getString('y')).assertEqual('0.00vp');

      console.info('[testPositionSetting008] END');
      done();
    });
 /**
     * @tc.number   testPositionSetting_static_009
     * @tc.name     testPositionSetting_static_009
     * @tc.desc     testPositionSetting_static_009
     * @tc.level    Level.LEVEL1
     */
it('testPositionSetting_static_009', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[testPositionSetting009] START');
      await CommonFunc.sleep(1000);


        let strJson: string = inspector.getInspectorByKey('offset');
        console.info("[testPositionSetting009] component strJson:" + strJson);
        let obj = JSON.parseJsonElement(strJson)
        console.info("[testPositionSetting009] offset: " + JSON.stringify(obj.getElement('$attrs').getElement('offset')));
        expect(obj.getElement('$attrs').getElement('offset').getString('x')).assertEqual('10.00vp');
        expect(obj.getElement('$attrs').getElement('offset').getString('y')).assertEqual('15.00vp');

      console.info('[testPositionSetting009] END');
      done();
    });
    /**
     * @tc.number   testPositionSetting_static_010
     * @tc.name     testPositionSetting_static_010
     * @tc.desc     testPositionSetting_static_010
     * @tc.level    Level.LEVEL1
     */
it('testPositionSetting_static_010', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[testPositionSetting010] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "offsetT": {
              x: 150, y: 10
            } as Position,
          } as Record<String,RecordData>
        } as events_emitter.EventData

        let indexEvent: events_emitter.InnerEvent = {
          eventId: 25,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testPositionSetting010] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testPositionSetting010] change component data error: " + err.message);
      }
      await CommonFunc.sleep(3000);


        let strJson: string = inspector.getInspectorByKey('offset');
        console.info("[testPositionSetting010] component strJson:" + strJson);
        let obj = JSON.parseJsonElement(strJson)
        console.info("[testPositionSetting010] offset: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('offset')));
        expect(obj.getElement('$attrs').getElement('offset').getString('x')).assertEqual('150.00vp');
        expect(obj.getElement('$attrs').getElement('offset').getString('y')).assertEqual('10.00vp');

      console.info('[testPositionSetting010] END');
      done();
    });
    /**
     * @tc.number   testPositionSetting_static_011
     * @tc.name     testPositionSetting_static_011
     * @tc.desc     testPositionSetting_static_011
     * @tc.level    Level.LEVEL1
     */
it('testPositionSetting_static_011', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[testPositionSetting011] START');
      await CommonFunc.sleep(1000);


        let strJson: string = inspector.getInspectorByKey('opacity');
        let obj = JSON.parseJsonElement(strJson)
        console.info("[testPositionSetting011] component JSON.parse(strJson) is: " + JSON.stringify(obj));
        expect(obj.getElement('$attrs').getInteger('opacity')).assertEqual(1);

      console.info('[testPositionSetting011] END');
      done();
    });

  })
}