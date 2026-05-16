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
import { $r, Color } from '@ohos.arkui.component'
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

export default function shapeClippingJsunit() {
  describe('borderTest_five_4', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.aceEtsApiLack.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      console.info("shapeClipping beforeEach start");
      let options: router.RouterOptions = {
        url: 'pages/shapeClipping',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get shapeClipping state pages:" + JSON.stringify(pages));
        if (!("shapeClipping" == pages.name)) {
          console.info("get shapeClipping state pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err: Error) {
        console.error("push shapeClipping page error:" + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("shapeClipping after each called");
    });

    
    
    /**
     * @tc.number   testShapeClipping_static_001
     * @tc.name     testShapeClipping_static_001
     * @tc.desc     testShapeClipping_static_001
     * @tc.level    Level.LEVEL0
     */
it('testShapeClipping_static_001', Level.LEVEL0, async () => {
      console.info('[testShapeClipping001] START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('image_clip');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testShapeClipping001] component obj is: " + JSON.stringify(obj));
      let clip = JSON.parseJsonElement(obj.getElement('$attrs').getString('clip'));
      expect(clip.getString('shape')).assertEqual('Circle');
      let strJson1 = inspector.getInspectorByKey('image_clip_true');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[testShapeClipping001] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('clip')).assertEqual('true');
      console.info('[testShapeClipping001] END');

    });

    
    
    /**
     * @tc.number   testShapeClipping_static_002
     * @tc.name     testShapeClipping_static_002
     * @tc.desc     testShapeClipping_static_002
     * @tc.level    Level.LEVEL0
     */
it('testShapeClipping_static_002', Level.LEVEL0, async () => {
      console.info('[testShapeClipping002] START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('image_mask');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testShapeClipping002] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getElement('mask').getString('shape')).assertEqual('Rect');
      expect(obj.getElement('$attrs').getString('clip')).assertEqual('false');
      console.info('[testShapeClipping002] END');

    });

    
    
    /**
     * @tc.number   testShapeClipping_static_003
     * @tc.name     testShapeClipping_static_003
     * @tc.desc     testShapeClipping_static_003
     * @tc.level    Level.LEVEL0
     */
it('testShapeClipping_static_003', Level.LEVEL0, async () => {
      console.info('[testShapeClipping003] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "maskValue": false
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 32,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testShapeClipping003] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[testShapeClipping003] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('image_mask');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[testShapeClipping003] component objNew is: " + JSON.stringify(objNew));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('mask').getString('shape'))
        .assertEqual('Circle');
      console.info('[testShapeClipping003] END');

    });

    
    
    /**
     * @tc.number   testShapeClipping_static_004
     * @tc.name     testShapeClipping_static_004
     * @tc.desc     testShapeClipping_static_004
     * @tc.level    Level.LEVEL0
     */
it('testShapeClipping_static_004', Level.LEVEL0, async () => {
      console.info('[testShapeClipping004] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "clipValue": false
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 33,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testShapeClipping004] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[testShapeClipping004] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('image_clip');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[testShapeClipping004] component objNew is: " + JSON.stringify(objNew));
      let clip = JSON.parseJsonElement(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('clip'));
      expect(clip.getString('shape')).assertEqual('Rect');
      console.info('[testShapeClipping004] END');

    });

    
    
    /**
     * @tc.number   testShapeClipping_static_005
     * @tc.name     testShapeClipping_static_005
     * @tc.desc     testShapeClipping_static_005
     * @tc.level    Level.LEVEL0
     */
it('testShapeClipping_static_005', Level.LEVEL0, async () => {
      console.info('[testShapeClipping004] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "clipValue": false
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 33,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testShapeClipping004] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[testShapeClipping004] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('shapeType_clip');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[testShapeClipping004] component objNew is: " + JSON.stringify(objNew));
      let clip = JSON.parseJsonElement(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('clip'));
      expect(clip.getString('shape')).assertEqual('Rect');
      console.info('[testShapeClipping004] END');

    });
  })
}