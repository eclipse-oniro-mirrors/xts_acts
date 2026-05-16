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
import router from '@ohos.router';
import window from '@ohos.window';
import events_emitter from '@ohos.events.emitter';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  TestType,
  Size
} from "../../../../hypium/index"
import {
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import { AppStorage } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { ScaleOptions } from '@ohos.arkui.component';
import { RecordData } from '@ohos.base';


let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

class ScaleValue {
  x: number = 0
  y: number = 0
}

class Matrix {
  x: number = 0
}

export default function ohosMatrix4Jsunit() {
  describe('appInfoTest_five_1', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("ohosMatrix4 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/image/ohosMatrix4',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ohosMatrix4 state pages:" + JSON.stringify(pages));
        if (!("ohosMatrix4" == pages.name)) {
          console.info("get ohosMatrix4 pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ohosMatrix4 page result:" + JSON.stringify(result));
        }

      } catch (err:Error) {
        console.error("push ohosMatrix4  page error:" + err);
      }

    });

    afterEach(async () => {
      await CommonFunc.sleep(3000);
      console.info("OhosMatrix4 each called");
    });

    
/**
     * @tc.number   test_OhosMatrix4_static_001
     * @tc.name     test_OhosMatrix4_static_001
     * @tc.desc     test_OhosMatrix4_static_001
     * @tc.level    Level.LEVEL1
     */
it('test_OhosMatrix4_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[test_OhosMatrix4_001] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('rotate7');
      console.info("[test_OhosMatrix4_001] component strJson:" + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Image');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('transform').getString("type"))
        .assertEqual('matrix')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('transform').getString('matrix') !== null)
        .assertTrue();
      done();
    });

    
/**
     * @tc.number   test_OhosMatrix4_static_002
     * @tc.name     test_OhosMatrix4_static_002
     * @tc.desc     test_OhosMatrix4_static_002
     * @tc.level    Level.LEVEL1
     */
it('test_OhosMatrix4_static_002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[test_OhosMatrix4_002] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('rotate8');
      console.info("[test_OhosMatrix4_001] component strJson:" + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Image');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('transform').getString("type"))
        .assertEqual('matrix')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('transform').getString('matrix'))
        .assertEqual('5.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,-200.000000,0.000000,0.000000,1.000000,')
      done();
    });

    
/**
     * @tc.number   test_OhosMatrix4_static_003
     * @tc.name     test_OhosMatrix4_static_003
     * @tc.desc     test_OhosMatrix4_static_003
     * @tc.level    Level.LEVEL1
     */
it('test_OhosMatrix4_static_003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[test_OhosMatrix4_003] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('rotate9');
      console.info("[test_OhosMatrix4_003] component strJson:" + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Image');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('transform').getString("type"))
        .assertEqual('matrix')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('transform').getString('matrix'))
        .assertEqual('1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,100.000000,200.000000,30.000000,1.000000,')
      done();
    });

    
/**
     * @tc.number   test_OhosMatrix4_static_004
     * @tc.name     test_OhosMatrix4_static_004
     * @tc.desc     test_OhosMatrix4_static_004
     * @tc.level    Level.LEVEL1
     */
it('test_OhosMatrix4_static_004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[test_OhosMatrix4_004] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "scaleValue": {
              x: 1, y: 1
            } as ScaleOptions
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 140,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[test_OhosMatrix4_004] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err:Error) {
        console.log("[test_OhosMatrix4_004] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = inspector.getInspectorByKey('rotate3');
      console.info("[test_OhosMatrix4_004] component objNew is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      await CommonFunc.sleep(2000);
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('scale').getString('x')).assertEqual('1.000000');
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('scale').getString('y')).assertEqual('1.000000');
      done();
    });

    
/**
     * @tc.number   test_OhosMatrix4_static_005
     * @tc.name     test_OhosMatrix4_static_005
     * @tc.desc     test_OhosMatrix4_static_005
     * @tc.level    Level.LEVEL1
     */
it('test_OhosMatrix4_static_005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000)
      let callback:(eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
        console.info("[test_OhosMatrix4_005] get event state result is: " + JSON.stringify(eventData));
        const data = eventData.data as Record<String,RecordData>
        expect(data['matrix1']).assertEqual("[100, 10]")
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: 141,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(innerEvent, callback)
      } catch (err:Error) {
        console.info("[test_OhosMatrix4_005] on events_emitter err : " + JSON.stringify(err));
      }
      console.info('[test_OhosMatrix4_005] sendEventByKey ' + JSON.stringify(inspector.sendEventByKey('rotate5', 10, "")));
      await CommonFunc.sleep(1000)
      console.info('[test_OhosMatrix4_005] testSendTouchEvent END');
      done();
    });

    
/**
     * @tc.number   test_OhosMatrix4_static_006
     * @tc.name     test_OhosMatrix4_static_006
     * @tc.desc     test_OhosMatrix4_static_006
     * @tc.level    Level.LEVEL1
     */
it('test_OhosMatrix4_static_006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[test_OhosMatrix4_006] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "matrix2":{
              x: 400
            } as Matrix,
            "matrix3": {
              x: 2
            } as Matrix
          }as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 140,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[test_OhosMatrix4_006] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err:Error) {
        console.log("[test_OhosMatrix4_006] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = inspector.getInspectorByKey('rotate6');
      console.info("[test_OhosMatrix4_006] component objNew is: " + strJsonNew);
      console.info("[test_OhosMatrix4_006] component transform is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('transform')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('transform')))
        .assertEqual('{"type":"matrix","matrix":"3.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,900.000000,0.000000,0.000000,1.000000,"}');
      done();
    });
  })
}




