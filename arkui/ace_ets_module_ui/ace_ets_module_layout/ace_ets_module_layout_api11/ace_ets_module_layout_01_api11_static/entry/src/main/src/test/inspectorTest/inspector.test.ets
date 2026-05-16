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



import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from "../../../../hypium/index"
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import {UtilsTest} from "../Util.test"
import { RecordData } from '@ohos.base';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function inspectorJsunit() {
  describe('inspectorTest', () => {
    beforeAll(() => {
      console.info("inspectorJsunit beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility");

    });

    beforeEach(async ():Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/inspector/inspector',
      }
      try {
        const routerInstance=AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        // console.info("get inspector state success " + JSON.stringify(pages));
        if (!("inspector" == pages.name)) {
          console.info("get inspector state success " + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options)
          await CommonFunc.sleep(2000);
          // console.info("push inspector page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push inspector page error: " + err);
      }
    })

    afterEach(async (): Promise<void> => {
      console.info("inspectorTest after each called");
    });



    /**
     * @tc.number   testInspectorTestAdd_static_0001
     * @tc.name     testInspectorTestAdd_static_0001
     * @tc.desc     testInspectorTestAdd_static_0001
     * @tc.level    Level.LEVEL0
     */
    it('testInspectorTestAdd_static_0001', Level.LEVEL0, async (): Promise<void> => {
      console.info('Inspector testInspectorTestAdd_static_0001 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('inspectorApiOne');
      console.info("[testInspectorTestAdd_static_0001] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontSize')).assertEqual("50.00fp");
      console.info("[testInspectorTestAdd_static_0001] fontSize value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontSize'));

    });





    /**
     * @tc.number   testInspectorTestAdd_static_0002
     * @tc.name     testInspectorTestAdd_static_0002
     * @tc.desc     testInspectorTestAdd_static_0002
     * @tc.level    Level.LEVEL0
     */
    it('testInspectorTestAdd_static_0002', Level.LEVEL0, async (): Promise<void> => {
      console.info('Inspector testInspectorTestAdd0002 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('inspectorApiOne');
      console.info("[testInspectorTestAdd0002] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight')).assertEqual("FontWeight.Bold");
      console.info("[testInspectorTestAdd0002] fontWeight value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight'));

    });




    /**
     * @tc.number   testInspectorTestAdd_static_0003
     * @tc.name     testInspectorTestAdd_static_0003
     * @tc.desc     testInspectorTestAdd_static_0003
     * @tc.level    Level.LEVEL0
     */
    it('testInspectorTestAdd_static_0003', Level.LEVEL0, async (): Promise<void> => {
      console.info("testInspectorTestAdd0003 start test");
      let innerEvent1: events_emitter.InnerEvent = {
        eventId: 60208,
        priority: events_emitter.EventPriority.LOW
      }
      let callback1: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
        console.info("eventData.data?.getInspectorNodes result is: " + (eventData.data as ESObject)?.getProperty('getInspectorNodes'));
        try {
          console.info("callback1 success");
          console.info("inspector_101 eventData.data?.result result is: " + (eventData.data as ESObject)?.getProperty('result'));
          expect((eventData.data as ESObject)?.getProperty('result')).assertEqual("success");
          console.info("inspector_101 end: ");
          if ((eventData.data as ESObject)?.getProperty('getInspectorNodes') != null) {
            console.info("eventData.data?.result result is: " + (eventData.data as ESObject)?.getProperty('result'));
            expect((eventData.data as ESObject)?.getProperty('result')).assertEqual("success");
          }
        } catch (err) {
          console.info("inspector_101 on events_emitter err : " + JSON.stringify(err));
        }

      }
      try {
        events_emitter.on(innerEvent1, callback1);
        console.info("inspector_101 click result is: " + JSON.stringify(inspector.sendEventByKey('inspectorApiOne', 10, "")));
      } catch (err) {
        console.info("inspector_101 on events_emitter err : " + JSON.stringify(err));
      }
    });



    /**
     * @tc.number   testInspectorTestAdd_static_0004
     * @tc.name     testInspectorTestAdd_static_0004
     * @tc.desc     testInspectorTestAdd_static_0004
     * @tc.level    Level.LEVEL0
     */
    it('testInspectorTestAdd_static_0004', Level.LEVEL0, async (): Promise<void> => {
      let innerEvent2: events_emitter.InnerEvent = {
        eventId: 60209,
        priority: events_emitter.EventPriority.LOW
      }
      let callback2: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
        console.info("eventData.data?.getInspectorNodeById result is: " + (eventData.data as ESObject)?.getProperty('getInspectorNodeById'));
        try {
          console.info("callback2 success");
          console.info("inspector_102 eventData.data?.result result is: " + (eventData.data as ESObject)?.getProperty('result'));
          expect((eventData.data as ESObject)?.getProperty('result')).assertEqual("success");
          console.info("inspector_102 end");
        } catch (err) {
          console.info("inspector_102 on events_emitter err : " + JSON.stringify(err));
        }

      }
      try {
        console.info("inspector_102 click result is: " + JSON.stringify(inspector.sendEventByKey('inspectorApiTwo', 10, "")));
        events_emitter.on(innerEvent2, callback2);
        await CommonFunc.sleep(2000);

      } catch (err) {
        console.info("inspector_102 on events_emitter err : " + JSON.stringify(err));
      }
    });





    /**
     * @tc.number   testInspectorTestAdd_static_0005
     * @tc.name     testInspectorTestAdd_static_0005
     * @tc.desc     testInspectorTestAdd_static_0005
     * @tc.level    Level.LEVEL0
     */
    it('testInspectorTestAdd_static_0005', Level.LEVEL0, async (): Promise<void> => {
      console.info('testInspectorTestAdd0005 START');
      try {
        let data: Record<String,RecordData> = {
          "setColor": 'red'
        }
        let eventData: events_emitter.EventData = {
          data: data
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60211,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        expect().assertFail();
        console.log("[testInspectorTestAdd0005] change component data error: " + (err as Error)?.message);
      }

    });



    /**
     * @tc.number   testInspectorTestAdd_static_0006
     * @tc.name     testInspectorTestAdd_static_0006
     * @tc.desc     testInspectorTestAdd_static_0006
     * @tc.level    Level.LEVEL0
     */
    it('testInspectorTestAdd_static_0006', Level.LEVEL0, async (): Promise<void> => {
      let innerEvent3: events_emitter.InnerEvent = {
        eventId: 60210,
        priority: events_emitter.EventPriority.LOW
      }
      let callback3: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
        try {
          console.info("callback3 success");
          console.info("inspector_103 eventData.data?.result result is: " + (eventData.data as ESObject)?.getProperty('catchStatus'));
          expect((eventData.data as ESObject)?.getProperty('catchStatus')).assertEqual("callBackSuccess");
          console.info("inspector_103 end");
        } catch (err) {
          console.info("inspector_103 on events_emitter err : " + JSON.stringify(err));
        }

      }
      try {
        console.info("inspector_103 click result is: " + JSON.stringify(inspector.sendEventByKey('inspectorApiFour', 10, "")));
        events_emitter.on(innerEvent3, callback3);
      } catch (err) {
        console.info("inspector_103 on events_emitter err : " + JSON.stringify(err));
      }
    });



    /**
     * @tc.number   testInspectorTestAdd_static_007
     * @tc.name     testInspectorTestAdd_static_007
     * @tc.desc     testInspectorTestAdd_static_007
     * @tc.level    Level.LEVEL0
     */
    it('testInspectorTestAdd_static_007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testInspectorTestAdd007 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('getFilteredInspectorTree'))
      console.info('[testInspectorTestAdd007] findcomponent');
      await (btn?.click() as Promise<void>);
      console.info('[testInspectorTestAdd007] click success');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('text01_id');
      let obj = JSON.parseJsonElement(strJson);
      console.info("response: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertContain("401");
      console.info('[testInspectorTestAdd007] END');
      done();
    });



    /**
     * @tc.number   testInspectorTestAdd_static_008
     * @tc.name     testInspectorTestAdd_static_008
     * @tc.desc     testInspectorTestAdd_static_008
     * @tc.level    Level.LEVEL0
     */
    it('testInspectorTestAdd_static_008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testInspectorTestAdd008 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('getFilteredInspectorTreeById'))
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('text02_id');
      let obj = JSON.parseJsonElement(strJson);
      console.info("response: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertContain("401");
      console.info('[testInspectorTestAdd008] END');
      done();
    });
  })
}
