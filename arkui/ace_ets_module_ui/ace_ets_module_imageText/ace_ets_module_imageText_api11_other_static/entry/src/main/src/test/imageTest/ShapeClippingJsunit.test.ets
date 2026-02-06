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
import { RecordData } from '@ohos.base';


let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function shapeClippingJsunit() {
  describe('borderTest_five_4', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("shapeClipping beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/image/shapeClipping',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get shapeClipping state pages:" + JSON.stringify(pages));
        if (!("shapeClipping" == pages.name)) {
          console.info("get shapeClipping pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push shapeClipping page result:" + JSON.stringify(result));
        }

      } catch (err) {
        console.error("push shapeClipping page error:" + err);
      }

    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("shapeClipping after each called");
    });

    
/**
     * @tc.number   testShapeClipping_static_001
     * @tc.name     testShapeClipping_static_001
     * @tc.desc     testShapeClipping_static_001
     * @tc.level    Level.LEVEL1
     */
it('testShapeClipping_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testShapeClipping_static_001] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('image_clip');
      console.info("[testShapeClipping_static_001] component obj is: " + strJson);
      console.log("attrs.clip====" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('clip'))
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('clip')).getString('shape')).assertEqual('Circle');
      let strJson1: string = inspector.getInspectorByKey('image_clip_true');
      console.info("[testShapeClipping_static_001] component obj1 is: " + JSON.stringify(JSON.parseJsonElement(strJson1)));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('clip')).assertEqual('true');
      console.info('[testShapeClipping_static_001] END');
      done();
    });

    
/**
     * @tc.number   testShapeClipping_static_002
     * @tc.name     testShapeClipping_static_002
     * @tc.desc     testShapeClipping_static_002
     * @tc.level    Level.LEVEL1
     */
it('testShapeClipping_static_002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testShapeClipping_static_002] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('image_mask');
      console.info("[testShapeClipping_static_002] component obj is: " + strJson);
      console.info("[testShapeClipping_static_002] component mask obj is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('mask')));
      console.info("[testShapeClipping_static_002] component mask obj is: " + JSON.parseJsonElement(JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('mask'))));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('mask').getString('shape')).assertEqual('Rect');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('clip')).assertEqual('false');
      console.info('[testShapeClipping_static_002] END');
      done();
    });

    
/**
     * @tc.number   testShapeClipping_static_003
     * @tc.name     testShapeClipping_static_003
     * @tc.desc     testShapeClipping_static_003
     * @tc.level    Level.LEVEL1
     */
it('testShapeClipping_static_003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testShapeClipping_static_003] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "maskValue": false
          }as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 32,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testShapeClipping_static_003] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testShapeClipping_static_003] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('image_mask');
      console.info("[testShapeClipping_static_003] component objNew is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      console.info("[testShapeClipping_static_003] component mask obj is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')
        .getElement('mask')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('mask').getString('shape')).assertEqual('Circle');
      console.info('[testShapeClipping_static_003] END');
      done();
    });

    
/**
     * @tc.number   testShapeClipping_static_004
     * @tc.name     testShapeClipping_static_004
     * @tc.desc     testShapeClipping_static_004
     * @tc.level    Level.LEVEL1
     */
it('testShapeClipping_static_004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testShapeClipping_static_004] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "clipValue": false
          }as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 33,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testShapeClipping_static_004] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testShapeClipping_static_004] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('image_clip');
      console.info("[testShapeClipping_static_004] component objNew is: " + strJsonNew);
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('clip')).getString('shape')).assertEqual('Rect');
      console.info('[testShapeClipping_static_004] END');
      done();
    });
  })
}