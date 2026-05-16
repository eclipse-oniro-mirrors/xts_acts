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
import { afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { startAbility, stopApplication, UtilsTest } from '../Util.test';
import { LineCapStyle, LineJoinStyle } from '@ohos.arkui.component'
import { RecordData } from '@ohos.base';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function shapeJsunit() {
  describe('shapeJsunit', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.draw.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Shape/shape3',
      }
      try {
        const shape = AppStorage.get<Router>("router") as Router
        shape.clear();
        let pages = shape.getState();
        console.info("get shape state success " + JSON.stringify(pages));
        if (!("shape3" == pages.name)) {
          console.info("get shape state success " + JSON.stringify(pages.name));
          shape.pushUrl(options);
          await CommonFunc.sleep(1000);
        }
      } catch (err: BusinessError) {
        console.error("push shape page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("shape after each called");
    });

    
    /**
     * @tc.number   shapeTest_static_0100
     * @tc.name     shapeTest_static_0100
     * @tc.desc     shapeTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('shapeTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_static_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_static_0100 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeDashOffset')).assertEqual('0.00vp');
      await CommonFunc.sleep(1000);
      done();
    });


    
    /**
     * @tc.number   shapeTest_static_0200
     * @tc.name     shapeTest_static_0200
     * @tc.desc     shapeTest_static_0200
     * @tc.level    Level.LEVEL0
     */
it('shapeTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_static_0200 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_static_0200 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeLineCap'))
        .assertEqual('LineCapStyle.Butt');
      await CommonFunc.sleep(1000);
      done();
    });

    
    /**
     * @tc.number   shapeTest_static_0300
     * @tc.name     shapeTest_static_0300
     * @tc.desc     shapeTest_static_0300
     * @tc.level    Level.LEVEL0
     */
it('shapeTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_static_0300 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_static_0300 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeLineJoin'))
        .assertEqual('LineJoinStyle.Miter');
      await CommonFunc.sleep(1000);
      done();
    });

    
    /**
     * @tc.number   shapeTest_static_0400
     * @tc.name     shapeTest_static_0400
     * @tc.desc     shapeTest_static_0400
     * @tc.level    Level.LEVEL0
     */
it('shapeTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_static_0400 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_static_0400 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeMiterLimit')).assertEqual('4.000000');
      await CommonFunc.sleep(1000);
      done();
    });

    
    /**
     * @tc.number   shapeTest_static_0500
     * @tc.name     shapeTest_static_0500
     * @tc.desc     shapeTest_static_0500
     * @tc.level    Level.LEVEL0
     */
it('shapeTest_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_static_0500 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_static_0500 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeOpacity')).assertEqual('1.000000');
      await CommonFunc.sleep(1000);
      done();
    });

    
    /**
     * @tc.number   shapeTest_static_0600
     * @tc.name     shapeTest_static_0600
     * @tc.desc     shapeTest_static_0600
     * @tc.level    Level.LEVEL0
     */
it('shapeTest_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_static_0600 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_static_0600 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fillOpacity')).assertEqual('0.000000');
      await CommonFunc.sleep(1000);
      done();
    });

    
    /**
     * @tc.number   shapeTest_static_0700
     * @tc.name     shapeTest_static_0700
     * @tc.desc     shapeTest_static_0700
     * @tc.level    Level.LEVEL0
     */
it('shapeTest_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_static_0700 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_static_0700 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('antiAlias')).assertEqual('true');
      await CommonFunc.sleep(1000);
      done();
    });

    
    /**
     * @tc.number   shapeTest_static_0800
     * @tc.name     shapeTest_static_0800
     * @tc.desc     shapeTest_static_0800
     * @tc.level    Level.LEVEL0
     */
it('shapeTest_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_static_0800 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_static_0800 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('strokeDashArray')[0].asString())
        .assertEqual('20.00vp');
      await CommonFunc.sleep(1000);
      done();
    });

    
    /**
     * @tc.number   shapeTest_static_0900
     * @tc.name     shapeTest_static_0900
     * @tc.desc     shapeTest_static_0900
     * @tc.level    Level.LEVEL0
     */
it('shapeTest_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_static_0900 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_static_0900 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('strokeDashArray')[1].asString())
        .assertEqual('20.00vp');
      await CommonFunc.sleep(1000);
      done();
    });

    
    /**
     * @tc.number   shapeTest_static_1000
     * @tc.name     shapeTest_static_1000
     * @tc.desc     shapeTest_static_1000
     * @tc.level    Level.LEVEL0
     */
it('shapeTest_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_1000 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: emitter.EventData = {
          data: {
            "antiAlias": false,
          } as Record<String,RecordData>
        } as emitter.EventData
        let innerEvent: emitter.InnerEvent = {
          eventId: 192,
          priority: emitter.EventPriority.LOW
        }
        console.info("shapeTest_1000 start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_1000 change component color error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJson = inspector.getInspectorByKey('shape');
      await CommonFunc.sleep(2000);

      console.info("shapeTest_1000 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('antiAlias')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('antiAlias')).assertEqual('false');
      done();
    });

    
    /**
     * @tc.number   shapeTest_static_1100
     * @tc.name     shapeTest_static_1100
     * @tc.desc     shapeTest_static_1100
     * @tc.level    Level.LEVEL0
     */
it('shapeTest_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_static_1100 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: emitter.EventData = {
          data: {
            "antiAlias": 'undefined',
          } as Record<String,RecordData>
        } as emitter.EventData
        let innerEvent: emitter.InnerEvent = {
          eventId: 192,
          priority: emitter.EventPriority.LOW
        } as emitter.InnerEvent
        console.info("shapeTest_static_1100 start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_static_1100 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');
      console.info("shapeTest_static_1100 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('antiAlias')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('antiAlias')).assertEqual('false');
      done();
    });

    
    /**
     * @tc.number   shapeTest_static_1200
     * @tc.name     shapeTest_static_1200
     * @tc.desc     shapeTest_static_1200
     * @tc.level    Level.LEVEL0
     */
it('shapeTest_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_static_1200 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: emitter.EventData = {
          data: {
            "antiAlias": -0.1,
          } as Record<String,RecordData>
        } as emitter.EventData
        let innerEvent: emitter.InnerEvent = {
          eventId: 192,
          priority: emitter.EventPriority.LOW
        } as emitter.InnerEvent
        console.info("shapeTest_static_1200 start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_static_1200 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');
      console.info("shapeTest_static_1200 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('antiAlias')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('antiAlias')).assertEqual('false');
      done();
    });

    
    /**
     * @tc.number   shapeTest_static_1300
     * @tc.name     shapeTest_static_1300
     * @tc.desc     shapeTest_static_1300
     * @tc.level    Level.LEVEL0
     */
it('shapeTest_static_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_static_1300 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: emitter.EventData = {
          data: {
            "strokeLineCap": LineCapStyle.Round,
          } as Record<String,RecordData>
        } as emitter.EventData
        let innerEvent: emitter.InnerEvent = {
          eventId: 192,
          priority: emitter.EventPriority.LOW
        } as emitter.InnerEvent
        console.info("shapeTest_static_1300 start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_static_1300 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_static_1300 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('strokeLineCap')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeLineCap'))
        .assertEqual('LineCapStyle.Round');
      done();
    });


    
    /**
     * @tc.number   shapeTest_static_1400
     * @tc.name     shapeTest_static_1400
     * @tc.desc     shapeTest_static_1400
     * @tc.level    Level.LEVEL0
     */
it('shapeTest_static_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_static_1400 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: emitter.EventData = {
          data: {
            "strokeLineCap": 'string'
          } as Record<String,RecordData>
        } as emitter.EventData
        let innerEvent: emitter.InnerEvent = {
          eventId: 192,
          priority: emitter.EventPriority.LOW
        } as emitter.InnerEvent
        console.info("shapeTest_static_1400 start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_static_1400 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_static_1400 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('strokeLineCap')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeLineCap'))
        .assertEqual('LineCapStyle.Round');
      done();
    });

    
    /**
     * @tc.number   shapeTest_static_1500
     * @tc.name     shapeTest_static_1500
     * @tc.desc     shapeTest_static_1500
     * @tc.level    Level.LEVEL0
     */
it('shapeTest_static_1500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_static_1500 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: emitter.EventData = {
          data: {
            "strokeLineCap": '-0.2'
          } as Record<String,RecordData>
        } as emitter.EventData
        let innerEvent: emitter.InnerEvent = {
          eventId: 192,
          priority: emitter.EventPriority.LOW
        } as emitter.InnerEvent
        console.info("shapeTest_static_1500 start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_static_1500 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_static_1500 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('strokeLineCap')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeLineCap'))
        .assertEqual('LineCapStyle.Round');
      done();
    });

    
    /**
     * @tc.number   shapeTest_static_1600
     * @tc.name     shapeTest_static_1600
     * @tc.desc     shapeTest_static_1600
     * @tc.level    Level.LEVEL0
     */
it('shapeTest_static_1600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_static_1600 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: emitter.EventData = {
          data: {
            "strokeLineJoin": LineJoinStyle.Round,
          } as Record<String,RecordData>
        } as emitter.EventData
        let innerEvent: emitter.InnerEvent = {
          eventId: 192,
          priority: emitter.EventPriority.LOW
        } as emitter.InnerEvent
        console.info("shapeTest_static_1600 start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_static_1600 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_static_1600 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('strokeLineJoin')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeLineJoin'))
        .assertEqual('LineJoinStyle.Round');
      done();
    });


    
    /**
     * @tc.number   shapeTest_static_1700
     * @tc.name     shapeTest_static_1700
     * @tc.desc     shapeTest_static_1700
     * @tc.level    Level.LEVEL0
     */
it('shapeTest_static_1700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_static_1700 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: emitter.EventData = {
          data: {
            "strokeLineJoin": 'nothing',
          } as Record<String,RecordData>
        } as emitter.EventData
        let innerEvent: emitter.InnerEvent = {
          eventId: 192,
          priority: emitter.EventPriority.LOW
        } as emitter.InnerEvent
        console.info("shapeTest_static_1700 start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_static_1700 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_static_1700 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('strokeLineJoin')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeLineJoin'))
        .assertEqual('LineJoinStyle.Round');
      done();
    });

    
    /**
     * @tc.number   shapeTest_static_1800
     * @tc.name     shapeTest_static_1800
     * @tc.desc     shapeTest_static_1800
     * @tc.level    Level.LEVEL0
     */
it('shapeTest_static_1800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_static_1800 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: emitter.EventData = {
          data: {
            "strokeLineJoin": 0.11111,
          } as Record<String,RecordData>
        } as emitter.EventData
        let innerEvent: emitter.InnerEvent = {
          eventId: 192,
          priority: emitter.EventPriority.LOW
        } as emitter.InnerEvent
        console.info("shapeTest_static_1800 start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_static_1800 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_static_1800 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('strokeLineJoin')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeLineJoin'))
        .assertEqual('LineJoinStyle.Round');
      done();
    });

    
    /**
     * @tc.number   shapeTest_static_2100
     * @tc.name     shapeTest_static_2100
     * @tc.desc     shapeTest_static_2100
     * @tc.level    Level.LEVEL0
     */
it('shapeTest_static_2100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_static_2100 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: emitter.EventData = {
          data: {
            "strokeMiterLimit": "-0.11111",
          } as Record<String,RecordData>
        } as emitter.EventData
        let innerEvent: emitter.InnerEvent = {
          eventId: 192,
          priority: emitter.EventPriority.LOW
        } as emitter.InnerEvent
        console.info("shapeTest_static_2100 start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_static_2100 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_static_2100 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('strokeMiterLimit')));
      expect(parseInt(JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeMiterLimit')))
        .assertEqual(4);
      done();
    });

    
    /**
     * @tc.number   shapeTest_static_3200
     * @tc.name     shapeTest_static_3200
     * @tc.desc     shapeTest_static_3200
     * @tc.level    Level.LEVEL0
     */
it('shapeTest_static_3200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_static_3200 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: emitter.EventData = {
          data: {
            "strokeMiterLimit": 1.0,
          } as Record<String,RecordData>
        } as emitter.EventData
        let innerEvent: emitter.InnerEvent = {
          eventId: 192,
          priority: emitter.EventPriority.LOW
        } as emitter.InnerEvent
        console.info("shapeTest_static_3200 start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_static_3200 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_static_3200 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('strokeMiterLimit')));
      expect(parseInt(JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeMiterLimit')))
        .assertEqual(1);
      done();
    });

    
    /**
     * @tc.number   shapeTest_static_3300
     * @tc.name     shapeTest_static_3300
     * @tc.desc     shapeTest_static_3300
     * @tc.level    Level.LEVEL0
     */
it('shapeTest_static_3300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_static_3300 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: emitter.EventData = {
          data: {
            "strokeMiterLimit": 0.5,
          } as Record<String,RecordData>
        } as emitter.EventData
        let innerEvent: emitter.InnerEvent = {
          eventId: 192,
          priority: emitter.EventPriority.LOW
        } as emitter.InnerEvent
        console.info("shapeTest_static_3300 start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_static_3300 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_static_3300 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('strokeMiterLimit')));
      expect(parseInt(JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeMiterLimit')))
        .assertEqual(1);
      done();
    });

    
    /**
     * @tc.number   shapeTest_static_2200
     * @tc.name     shapeTest_static_2200
     * @tc.desc     shapeTest_static_2200
     * @tc.level    Level.LEVEL0
     */
it('shapeTest_static_2200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_static_1300 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: emitter.EventData = {
          data: {
            "strokeMiterLimit": 11111.0,
          } as Record<String,RecordData>
        } as emitter.EventData
        let innerEvent: emitter.InnerEvent = {
          eventId: 192,
          priority: emitter.EventPriority.LOW
        } as emitter.InnerEvent
        console.info("shapeTest_static_2200 start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_static_2200 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_static_2200 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('strokeMiterLimit')));
      expect(parseInt(JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeMiterLimit')))
        .assertEqual(11111);
      done();
    });

    
    /**
     * @tc.number   shapeTest_static_1900
     * @tc.name     shapeTest_static_1900
     * @tc.desc     shapeTest_static_1900
     * @tc.level    Level.LEVEL0
     */
it('shapeTest_static_1900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_static_1900 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: emitter.EventData = {
          data: {
            "strokeMiterLimit": 5.0,
          } as Record<String,RecordData>
        } as emitter.EventData
        let innerEvent: emitter.InnerEvent = {
          eventId: 192,
          priority: emitter.EventPriority.LOW
        } as emitter.InnerEvent
        console.info("shapeTest_static_1900 start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_static_1900 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_static_1900 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('strokeMiterLimit')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeMiterLimit')).assertEqual('5.000000');
      done();
    });


    
    /**
     * @tc.number   shapeTest_static_2000
     * @tc.name     shapeTest_static_2000
     * @tc.desc     shapeTest_static_2000
     * @tc.level    Level.LEVEL0
     */
it('shapeTest_static_2000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_static_2000 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: emitter.EventData = {
          data: {
            "strokeMiterLimit": "string",
          } as Record<String,RecordData>
        } as emitter.EventData
        let innerEvent: emitter.InnerEvent = {
          eventId: 192,
          priority: emitter.EventPriority.LOW
        } as emitter.InnerEvent
        console.info("shapeTest_static_2000 start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_static_2000 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_static_2000 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('strokeMiterLimit')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeMiterLimit')).assertEqual('5.000000');
      done();
    });


    
    /**
     * @tc.number   shapeTest_static_2300
     * @tc.name     shapeTest_static_2300
     * @tc.desc     shapeTest_static_2300
     * @tc.level    Level.LEVEL0
     */
it('shapeTest_static_2300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_static_2300 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: emitter.EventData = {
          data: {
            "fillOpacity": 1.0,
          } as Record<String,RecordData>
        } as emitter.EventData
        let innerEvent: emitter.InnerEvent = {
          eventId: 192,
          priority: emitter.EventPriority.LOW
        } as emitter.InnerEvent
        console.info("shapeTest_static_2300 start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_static_2300 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_static_2300 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('fillOpacity')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fillOpacity')).assertEqual('1.000000');
      done();
    });


    
    /**
     * @tc.number   shapeTest_static_2400
     * @tc.name     shapeTest_static_2400
     * @tc.desc     shapeTest_static_2400
     * @tc.level    Level.LEVEL0
     */
it('shapeTest_static_2400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_static_2400 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: emitter.EventData = {
          data: {
            "fillOpacity": "-1",
          } as Record<String,RecordData>
        } as emitter.EventData
        let innerEvent: emitter.InnerEvent = {
          eventId: 192,
          priority: emitter.EventPriority.LOW
        } as emitter.InnerEvent
        console.info("shapeTest_static_2400 start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_static_2400 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_static_2400 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('fillOpacity')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fillOpacity')).assertEqual('0.000000');
      done();
    });

    
    /**
     * @tc.number   shapeTest_static_2500
     * @tc.name     shapeTest_static_2500
     * @tc.desc     shapeTest_static_2500
     * @tc.level    Level.LEVEL0
     */
it('shapeTest_static_2500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_static_2500 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: emitter.EventData = {
          data: {
            "fillOpacity": "aaaaaaa",
          } as Record<String,RecordData>
        } as emitter.EventData
        let innerEvent: emitter.InnerEvent = {
          eventId: 192,
          priority: emitter.EventPriority.LOW
        } as emitter.InnerEvent
        console.info("shapeTest_static_2500 start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_static_2500 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_static_2500 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('fillOpacity')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fillOpacity')).assertEqual('nan');
      done();
    });

    
    /**
     * @tc.number   shapeTest_static_2600
     * @tc.name     shapeTest_static_2600
     * @tc.desc     shapeTest_static_2600
     * @tc.level    Level.LEVEL0
     */
it('shapeTest_static_2600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_static_2600 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: emitter.EventData = {
          data: {
            "fillOpacity": "aa12345",
          } as Record<String,RecordData>
        } as emitter.EventData
        let innerEvent: emitter.InnerEvent = {
          eventId: 192,
          priority: emitter.EventPriority.LOW
        } as emitter.InnerEvent
        console.info("shapeTest_static_2600 start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_static_2600 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_static_2600 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('fillOpacity')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fillOpacity')).assertEqual('nan');
      done();
    });

    
    /**
     * @tc.number   shapeTest_static_2700
     * @tc.name     shapeTest_static_2700
     * @tc.desc     shapeTest_static_2700
     * @tc.level    Level.LEVEL0
     */
it('shapeTest_static_2700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_static_2700 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: emitter.EventData = {
          data: {
            "strokeDashArrayOne": "4",
          } as Record<String,RecordData>
        } as emitter.EventData
        let innerEvent: emitter.InnerEvent = {
          eventId: 192,
          priority: emitter.EventPriority.LOW
        } as emitter.InnerEvent
        console.info("shapeTest_static_2700 start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_static_2700 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_static_2700 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getArray('strokeDashArray')[0]));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('strokeDashArray')[0].asString())
        .assertEqual('4.00vp');
      done();
    });

    
    /**
     * @tc.number   shapeTest_static_2800
     * @tc.name     shapeTest_static_2800
     * @tc.desc     shapeTest_static_2800
     * @tc.level    Level.LEVEL0
     */
it('shapeTest_static_2800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_static_2800 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: emitter.EventData = {
          data: {
            "strokeDashArrayTwo": "4",
          } as Record<String,RecordData>
        } as emitter.EventData
        let innerEvent: emitter.InnerEvent = {
          eventId: 192,
          priority: emitter.EventPriority.LOW
        } as emitter.InnerEvent
        console.info("shapeTest_static_2800 start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_static_2800 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_static_2800 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getArray('strokeDashArray')[1]));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('strokeDashArray')[1].asString())
        .assertEqual('4.00vp');
      done();
    });

    
    /**
     * @tc.number   shapeTest_static_2900
     * @tc.name     shapeTest_static_2900
     * @tc.desc     shapeTest_static_2900
     * @tc.level    Level.LEVEL0
     */
it('shapeTest_static_2900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_static_2900 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: emitter.EventData = {
          data: {
            "strokeDashArrayThree": 4.0,
          } as Record<String,RecordData>
        } as emitter.EventData
        let innerEvent: emitter.InnerEvent = {
          eventId: 192,
          priority: emitter.EventPriority.LOW
        } as emitter.InnerEvent
        console.info("shapeTest_static_2900 start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_static_2900 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_static_2900 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getArray('strokeDashArray')[1]));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('strokeDashArray')[2].asString()).assertEqual('4.00vp');
      done();
    });


    
    /**
     * @tc.number   shapeTest_static_3000
     * @tc.name     shapeTest_static_3000
     * @tc.desc     shapeTest_static_3000
     * @tc.level    Level.LEVEL0
     */
it('shapeTest_static_3000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_static_3000 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_static_3000 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('stroke')).assertEqual('#FF000000');
      await CommonFunc.sleep(1000);
      done();
    });

    
    /**
     * @tc.number   shapeTest_static_3100
     * @tc.name     shapeTest_static_3100
     * @tc.desc     shapeTest_static_3100
     * @tc.level    Level.LEVEL0
     */
it('shapeTest_static_3100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('shapeTest_static_3100 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: emitter.EventData = {
          data: {
            "strokeLineJoin": LineJoinStyle.Bevel,
          } as Record<String,RecordData>
        } as emitter.EventData
        let innerEvent: emitter.InnerEvent = {
          eventId: 192,
          priority: emitter.EventPriority.LOW
        } as emitter.InnerEvent
        console.info("shapeTest_static_3100 start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("shapeTest_static_3100 change component color error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('shape');

      console.info("shapeTest_static_3100 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('strokeLineJoin')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeLineJoin'))
        .assertEqual('LineJoinStyle.Bevel');
      done();
    });
  })
}

