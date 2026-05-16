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
import { RecordData } from '@ohos.base';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function LineJsunit() {
  describe('LineTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.draw.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/line/line3',
      }
      try {
        const line = AppStorage.get<Router>("router") as Router
        line.clear();
        let pages = line.getState();
        console.info("get line state success " + JSON.stringify(pages));
        if (!("line3" == pages.name)) {
          console.info("get line state success " + JSON.stringify(pages.name));
          line.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err: BusinessError) {
        console.error("push line page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(2000);
      console.info("line after each called");
    });



    /**
     * @tc.number   lineTest_static_0100
     * @tc.name     lineTest_static_0100
     * @tc.desc     lineTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('lineTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('lineTest_static_0100 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('line');
      console.info("lineTest_static_0100 component strJson:" + strJson);
      console.info("lineTest_static_0100 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("lineTest_static_0100 component getArray('startPoint'): " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('startPoint')));
      console.info("lineTest_static_0100 component getArray('startPoint')[0]: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('startPoint')[0]));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('startPoint')[0].asDouble()).assertEqual(0);
      done();
    });

    /**
     * @tc.number   lineTest_static_0200
     * @tc.name     lineTest_static_0200
     * @tc.desc     lineTest_static_0200
     * @tc.level    Level.LEVEL0
     */
it('lineTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('lineTest_static_0200 START');
      let strJson = inspector.getInspectorByKey('line');
      console.info("lineTest_static_0200 component strJson:" + strJson);
      console.info("lineTest_static_0200 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('startPoint')[1].asDouble()).assertEqual(0);
      done();
    });

    /**
     * @tc.number   lineTest_static_0300
     * @tc.name     lineTest_static_0300
     * @tc.desc     lineTest_static_0300
     * @tc.level    Level.LEVEL0
     */
it('lineTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('lineTest_static_0300 START');
      let strJson = inspector.getInspectorByKey('line');
      console.info("lineTest_static_0300 component strJson:" + strJson);
      console.info("lineTest_static_0300 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('endPoint')[0].asDouble()).assertEqual(50);
      done();
    });

    /**
     * @tc.number   lineTest_static_0400
     * @tc.name     lineTest_static_0400
     * @tc.desc     lineTest_static_0400
     * @tc.level    Level.LEVEL0
     */
it('lineTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('lineTest_static_0400 START');
      let strJson = inspector.getInspectorByKey('line');
      console.info("lineTest_static_0400 component strJson:" + strJson);
      console.info("lineTest_static_0400 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('endPoint')[1].asDouble()).assertEqual(100);
      done();
    });

    
    /**
     * @tc.number   lineTest_static_0500
     * @tc.name     lineTest_static_0500
     * @tc.desc     lineTest_static_0500
     * @tc.level    Level.LEVEL0
     */
it('lineTest_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('lineTest_static_0500 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: emitter.EventData = {
          data: {
            "startPoint": 50.0,
            "startPointOne": 50.0,
          } as Record<String,RecordData>
        } as emitter.EventData
        let innerEvent: emitter.InnerEvent = {
          eventId: 131,
          priority: emitter.EventPriority.LOW
        } as emitter.InnerEvent
        console.info("lineTest_static_0500 start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("lineTest_static_0500 change component error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJson = inspector.getInspectorByKey('line');
      console.info("lineTest_static_0500 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getArray('startPoint')[0]));
      console.info("lineTest_static_0500 component objOne is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('startPoint')[1]));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('startPoint')[0].asDouble()).assertEqual(50);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('startPoint')[1].asDouble()).assertEqual(50);
      done();
    });

    
    /**
     * @tc.number   lineTest_static_0600
     * @tc.name     lineTest_static_0600
     * @tc.desc     lineTest_static_0600
     * @tc.level    Level.LEVEL0
     */
it('lineTest_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('lineTest_static_0600 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: emitter.EventData = {
          data: {
            "endPoint": 100.0,
            "endPointOne": 150.0,
          } as Record<String,RecordData>
        } as emitter.EventData
        let innerEvent: emitter.InnerEvent = {
          eventId: 131,
          priority: emitter.EventPriority.LOW
        } as emitter.InnerEvent
        console.info("lineTest_static_0600 start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("lineTest_static_0600 change component error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJson = inspector.getInspectorByKey('line');
      console.info("lineTest_static_0600 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getArray('endPoint')[0]));
      console.info("lineTest_static_0600 component objOne is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('endPoint')[1]));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('endPoint')[0].asDouble()).assertEqual(100);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('endPoint')[1].asDouble()).assertEqual(150);
      done();
    });


    
    /**
     * @tc.number   lineTest_static_0700
     * @tc.name     lineTest_static_0700
     * @tc.desc     lineTest_static_0700
     * @tc.level    Level.LEVEL0
     */
it('lineTest_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('lineTest_static_0700 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: emitter.EventData = {
          data: {
            "startPoint": 'A',
            "startPointOne": 'B',
          } as Record<String,RecordData>
        } as emitter.EventData
        let innerEvent: emitter.InnerEvent = {
          eventId: 131,
          priority: emitter.EventPriority.LOW
        } as emitter.InnerEvent
        console.info("lineTest_static_0700 start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("lineTest_static_0700 change component error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('line');
      console.info("lineTest_static_0700 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getArray('startPoint')[0]));
      console.info("lineTest_static_0700 component objOne is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('startPoint')[1]));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('startPoint')[0].asDouble()).assertEqual(0);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('startPoint')[1].asDouble()).assertEqual(0);
      done();
    });

    
    /**
     * @tc.number   lineTest_static_0800
     * @tc.name     lineTest_static_0800
     * @tc.desc     lineTest_static_0800
     * @tc.level    Level.LEVEL0
     */
it('lineTest_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('lineTest_static_0900 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: emitter.EventData = {
          data: {
            "endPoint": 'A',
            "endPointOne": 'B',
          } as Record<String,RecordData>
        } as emitter.EventData
        let innerEvent: emitter.InnerEvent = {
          eventId: 131,
          priority: emitter.EventPriority.LOW
        }
        console.info("lineTest_static_0800 start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err: BusinessError) {
        console.log("lineTest_static_0800 change component error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('line');
      console.info("lineTest_static_0800 component objOne is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('endPoint')[1]));
      console.info("lineTest_static_0800 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('endPoint')[0]));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('endPoint')[1].asDouble()).assertEqual(0);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('endPoint')[0].asDouble()).assertEqual(0);
      done();
    });
  })
}