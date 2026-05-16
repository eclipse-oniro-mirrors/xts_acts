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
import emitter from '@ohos.events.emitter';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it,Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  Point,
  PointerMatrix,
  Rect,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Callback, MessageManager } from '../../../ets/MainAbility/utils/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import display from '@ohos.display'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import { UtilsTest } from '../Util.test';
import { Alignment } from '@ohos.arkui.component';
import { RecordData } from '@ohos.base';

let domain: number = 0x0000;
let tag: String = 'testTag';
let testAbilityContext: common.UIAbilityContext;


export default function OverlayUIJsunit() {
  describe('OverlayUIJsunit', () => {
    beforeAll(async (): Promise<void> => {
      console.info("overLayJsunit beforeAll start");
      
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsOther.api11.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("overLayJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/overlay/overlayUI',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get overLayJsunit state pages:" + JSON.stringify(pages));
        if (!("overlayUI" == pages.name)) {
          console.info("get overLayJsunit pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push overLayJsunit page error:" + err);
      }
      console.info("overLayJsunit beforeEach end");
    });

    
/**
     * @tc.number   overLayJsunit_static_0100
     * @tc.name     overLayJsunit_static_0100
     * @tc.desc     overLayJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('overLayJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[overLayJsunit_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('overlay');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[overLayJsunit_0100] obj is: " + JSON.stringify(obj.getElement('$attrs').getElement('overlay')));
      expect(obj.getElement('$attrs').getElement('overlay').getString('title')).assertEqual("old title");
      expect(obj.getElement('$attrs').getElement('overlay').getElement('options').getString('align'))
        .assertEqual("Alignment.Bottom");
      expect(obj.getElement('$attrs')
        .getElement('overlay')
        .getElement('options')
        .getElement('offset')
        .getString('x')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs')
        .getElement('overlay')
        .getElement('options')
        .getElement('offset')
        .getString('y')).assertEqual('-15.00vp');
      console.info('[overLayJsunit_0100] END');
      done();
    });

    
/**
     * @tc.number   overLayJsunit_static_0200
     * @tc.name     overLayJsunit_static_0200
     * @tc.desc     overLayJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('overLayJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[overLayJsunit_0200] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "title": "new title"
          } as Record<String,RecordData>
        }
        let innerEvent: emitter.InnerEvent = {
          eventId: 143,
          priority: emitter.EventPriority.LOW
        }
        console.info("[overLayJsunit_0200] start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[overLayJsunit_0200] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('overlay');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[overLayJsunit_0200] obj is: " + JSON.stringify(obj.getElement('$attrs').getElement('overlay')));
      expect(obj.getElement('$attrs').getElement('overlay').getString('title')).assertEqual("new title");
      console.info('overLayJsunit_0200 END');
      done();
    });

    
/**
     * @tc.number   overLayJsunit_static_0300
     * @tc.name     overLayJsunit_static_0300
     * @tc.desc     overLayJsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('overLayJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[overLayJsunit_0300] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "align": Alignment.TopStart,
            "x": 30.0,
            "y": -30.0
          } as Record<String,RecordData>
        }
        let innerEvent: emitter.InnerEvent = {
          eventId: 143,
          priority: emitter.EventPriority.LOW
        }
        console.info("[overLayJsunit_0300] start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[overLayJsunit_0300] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('overlay');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[overLayJsunit_0300] obj is: " + JSON.stringify(obj.getElement('$attrs').getElement('overlay')));
      expect(obj.getElement('$attrs').getElement('overlay').getElement('options').getString('align'))
        .assertEqual("Alignment.TopStart");
      expect(obj.getElement('$attrs')
        .getElement('overlay')
        .getElement('options')
        .getElement('offset')
        .getString('x')).assertEqual('30.00vp');
      expect(obj.getElement('$attrs')
        .getElement('overlay')
        .getElement('options')
        .getElement('offset')
        .getString('y')).assertEqual('-30.00vp');
      console.info('overLayJsunit_0300 END');
      done();
    });

    
/**
     * @tc.number   overLayJsunit_static_0400
     * @tc.name     overLayJsunit_static_0400
     * @tc.desc     overLayJsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('overLayJsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[overLayJsunit_0400] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: emitter.EventData = {
          data: {
            "align": "Alignment.Center"
          } as Record<String,RecordData>
        }
        let innerEvent: emitter.InnerEvent = {
          eventId: 143,
          priority: emitter.EventPriority.LOW
        }
        console.info("[overLayJsunit_0400] start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[overLayJsunit_0400] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('overlay');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[overLayJsunit_0400] obj is: " + JSON.stringify(obj.getElement('$attrs').getElement('overlay')));
      expect(obj.getElement('$attrs').getElement('overlay').getElement('options').getString('align'))
        .assertEqual("Alignment.TopStart");
      console.info('overLayJsunit_0400 END');
      done();
    });

    
/**
     * @tc.number   overLayJsunit_static_0500
     * @tc.name     overLayJsunit_static_0500
     * @tc.desc     overLayJsunit_static_0500
     * @tc.level    Level.LEVEL0
     */
it('overLayJsunit_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[overLayJsunit_0500] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "align": '-1'
          } as Record<String,RecordData>
        }
        let innerEvent: emitter.InnerEvent = {
          eventId: 1110,
          priority: emitter.EventPriority.LOW
        }
        console.info("[overLayJsunit_0500] start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[overLayJsunit_0500] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('overlay');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[overLayJsunit_0500] obj is: " + JSON.stringify(obj.getElement('$attrs').getElement('overlay')));
      expect(obj.getElement('$attrs').getElement('overlay').getElement('options').getString('align'))
        .assertEqual("Alignment.TopStart");
      console.info('overLayJsunit_0500 END');
      done();
    });

    
/**
     * @tc.number   overLayJsunit_static_0600
     * @tc.name     overLayJsunit_static_0600
     * @tc.desc     overLayJsunit_static_0600
     * @tc.level    Level.LEVEL0
     */
it('overLayJsunit_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[overLayJsunit_0600] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "x": -30.0,
            "y": 30.0
          } as Record<String,RecordData>
        }
        let innerEvent: emitter.InnerEvent = {
          eventId: 1110,
          priority: emitter.EventPriority.LOW
        }
        console.info("[overLayJsunit_0600] start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[overLayJsunit_0600] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('overlay');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[overLayJsunit_0600] obj is: " + JSON.stringify(obj.getElement('$attrs').getElement('overlay')));
      expect(obj.getElement('$attrs')
        .getElement('overlay')
        .getElement('options')
        .getElement('offset')
        .getString('x')).assertEqual('-30.00vp');
      expect(obj.getElement('$attrs')
        .getElement('overlay')
        .getElement('options')
        .getElement('offset')
        .getString('y')).assertEqual('30.00vp');
      console.info('overLayJsunit_0600 END');
      done();
    });

    
/**
     * @tc.number   overLayJsunit_static_0700
     * @tc.name     overLayJsunit_static_0700
     * @tc.desc     overLayJsunit_static_0700
     * @tc.level    Level.LEVEL0
     */
it('overLayJsunit_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[overLayJsunit_0700] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "x": 1111111111.0
          } as Record<String,RecordData>
        }
        let innerEvent: emitter.InnerEvent = {
          eventId: 1110,
          priority: emitter.EventPriority.LOW
        }
        console.info("[overLayJsunit_0700] start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[overLayJsunit_0700] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('overlay');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[overLayJsunit_0700] obj is: " + JSON.stringify(obj.getElement('$attrs').getElement('overlay')));
      expect(obj.getElement('$attrs')
        .getElement('overlay')
        .getElement('options')
        .getElement('offset')
        .getString('x')).assertEqual('1111111111.00vp');
      console.info('overLayJsunit_0700 END');
      done();
    });

    
/**
     * @tc.number   overLayJsunit_static_0800
     * @tc.name     overLayJsunit_static_0800
     * @tc.desc     overLayJsunit_static_0800
     * @tc.level    Level.LEVEL0
     */
it('overLayJsunit_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[overLayJsunit_0800] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "y": 1111111111.0
          } as Record<String,RecordData>
        }
        let innerEvent: emitter.InnerEvent = {
          eventId: 1110,
          priority: emitter.EventPriority.LOW
        }
        console.info("[overLayJsunit_0800] start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[overLayJsunit_0800] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('overlay');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[overLayJsunit_0800] obj is: " + JSON.stringify(obj.getElement('$attrs').getElement('overlay')));
      expect(obj.getElement('$attrs')
        .getElement('overlay')
        .getElement('options')
        .getElement('offset')
        .getString('x')).assertEqual('1111111111.00vp');
      console.info('overLayJsunit_0800 END');
      done();
    });

    
/**
     * @tc.number   overLayJsunit_static_0900
     * @tc.name     overLayJsunit_static_0900
     * @tc.desc     overLayJsunit_static_0900
     * @tc.level    Level.LEVEL0
     */
it('overLayJsunit_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[overLayJsunit_0900] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: emitter.EventData = {
          data: {
            "align": "Alignment.Top"
          } as Record<String,RecordData>
        }
        let innerEvent: emitter.InnerEvent = {
          eventId: 1110,
          priority: emitter.EventPriority.LOW
        }
        console.info("[overLayJsunit_0900] start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[overLayJsunit_0900] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('overlay');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[overLayJsunit_0900] obj is: " + JSON.stringify(obj.getElement('$attrs').getElement('overlay')));
      expect(obj.getElement('$attrs').getElement('overlay').getElement('options').getString('align'))
        .assertEqual("Alignment.TopStart");
      console.info('overLayJsunit_0900 END');
      done();
    });

    
/**
     * @tc.number   overLayJsunit_static_1000
     * @tc.name     overLayJsunit_static_1000
     * @tc.desc     overLayJsunit_static_1000
     * @tc.level    Level.LEVEL0
     */
it('overLayJsunit_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[overLayJsunit_1000] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: emitter.EventData = {
          data: {
            "align": "Alignment.TopEnd"
          } as Record<String,RecordData>
        }
        let innerEvent: emitter.InnerEvent = {
          eventId: 143,
          priority: emitter.EventPriority.LOW
        }
        console.info("[overLayJsunit_1000] start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[overLayJsunit_1000] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('overlay');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[overLayJsunit_1000] obj is: " + JSON.stringify(obj.getElement('$attrs').getElement('overlay')));
      expect(obj.getElement('$attrs').getElement('overlay').getElement('options').getString('align'))
        .assertEqual("Alignment.TopStart");
      console.info('overLayJsunit_1000 END');
      done();
    });

    
/**
     * @tc.number   overLayJsunit_static_1100
     * @tc.name     overLayJsunit_static_1100
     * @tc.desc     overLayJsunit_static_1100
     * @tc.level    Level.LEVEL0
     */
it('overLayJsunit_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[overLayJsunit_1100] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: emitter.EventData = {
          data: {
            "align": "Alignment.Start"
          } as Record<String,RecordData>
        }
        let innerEvent: emitter.InnerEvent = {
          eventId: 143,
          priority: emitter.EventPriority.LOW
        }
        console.info("[overLayJsunit_1100] start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[overLayJsunit_1100] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('overlay');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[overLayJsunit_1100] obj is: " + JSON.stringify(obj.getElement('$attrs').getElement('overlay')));
      expect(obj.getElement('$attrs').getElement('overlay').getElement('options').getString('align'))
        .assertEqual("Alignment.TopStart");
      console.info('overLayJsunit_1100 END');
      done();
    });

    
/**
     * @tc.number   overLayJsunit_static_1200
     * @tc.name     overLayJsunit_static_1200
     * @tc.desc     overLayJsunit_static_1200
     * @tc.level    Level.LEVEL0
     */
it('overLayJsunit_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[overLayJsunit_1200] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: emitter.EventData = {
          data: {
            "align": "Alignment.End"
          } as Record<String,RecordData>
        }
        let innerEvent: emitter.InnerEvent = {
          eventId: 143,
          priority: emitter.EventPriority.LOW
        }
        console.info("[overLayJsunit_1200] start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[overLayJsunit_1200] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('overlay');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[overLayJsunit_1200] obj is: " + JSON.stringify(obj.getElement('$attrs').getElement('overlay')));
      expect(obj.getElement('$attrs').getElement('overlay').getElement('options').getString('align'))
        .assertEqual("Alignment.TopStart");
      console.info('overLayJsunit_1200 END');
      done();
    });

    
/**
     * @tc.number   overLayJsunit_static_1300
     * @tc.name     overLayJsunit_static_1300
     * @tc.desc     overLayJsunit_static_1300
     * @tc.level    Level.LEVEL0
     */
it('overLayJsunit_static_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[overLayJsunit_1300] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: emitter.EventData = {
          data: {
            "align": "Alignment.BottomEnd"
          } as Record<String,RecordData>
        }
        let innerEvent: emitter.InnerEvent = {
          eventId: 143,
          priority: emitter.EventPriority.LOW
        }
        console.info("[overLayJsunit_1300] start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[overLayJsunit_1300] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('overlay');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[overLayJsunit_1300] obj is: " + JSON.stringify(obj.getElement('$attrs').getElement('overlay')));
      expect(obj.getElement('$attrs').getElement('overlay').getElement('options').getString('align'))
        .assertEqual("Alignment.TopStart");
      console.info('overLayJsunit_1300 END');
      done();
    });

    
/**
     * @tc.number   overLayJsunit_static_1400
     * @tc.name     overLayJsunit_static_1400
     * @tc.desc     overLayJsunit_static_1400
     * @tc.level    Level.LEVEL0
     */
it('overLayJsunit_static_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[overLayJsunit_1400] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: emitter.EventData = {
          data: {
            "align": "Alignment.BottomStart"
          } as Record<String,RecordData>
        }
        let innerEvent: emitter.InnerEvent = {
          eventId: 143,
          priority: emitter.EventPriority.LOW
        }
        console.info("[overLayJsunit_1400] start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[overLayJsunit_1400] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('overlay');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[overLayJsunit_1400] obj is: " + JSON.stringify(obj.getElement('$attrs').getElement('overlay')));
      expect(obj.getElement('$attrs').getElement('overlay').getElement('options').getString('align'))
        .assertEqual("Alignment.TopStart");
      console.info('overLayJsunit_1400 END');
      done();
    });

  })
}
