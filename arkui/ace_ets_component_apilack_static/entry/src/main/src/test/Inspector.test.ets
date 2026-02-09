'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import events_emitter from '@ohos.events.emitter';
import { Color, $r } from '@ohos.arkui.component'
import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../ets/MainAbility/common/Common';
import Utils from '../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from './Util.test';
import { RecordData } from '@ohos.base';


export default function inspectorJsunit() {
  describe('inspectorTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.aceEtsApiLack.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/inspector',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get inspector state success " + JSON.stringify(pages));
        if (!("inspector" == pages.name)) {
          console.info("get inspector state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push inspector page error: " + err);
      }
    });

    afterEach(async () => {
      console.info("inspectorTest after each called");
    });

    
    
    
    /**
     * @tc.number   testInspectorTestAdd_static_0001
     * @tc.name     testInspectorTestAdd_static_0001
     * @tc.desc     testInspectorTestAdd_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testInspectorTestAdd_static_0001', Level.LEVEL0, async () => {
      console.info('Inspector testInspectorTestAdd0001 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('inspectorApiOne');
      console.info("[testInspectorTestAdd0001] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual("50.00fp");
      console.info("[testInspectorTestAdd0001] fontSize value :" + obj.getElement('$attrs').getString('fontSize'));

    });

    
    
    
    /**
     * @tc.number   testInspectorTestAdd_static_0002
     * @tc.name     testInspectorTestAdd_static_0002
     * @tc.desc     testInspectorTestAdd_static_0002
     * @tc.level    Level.LEVEL0
     */
it('testInspectorTestAdd_static_0002', Level.LEVEL0, async () => {
      console.info('Inspector testInspectorTestAdd0002 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('inspectorApiOne');
      console.info("[testInspectorTestAdd0002] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual("FontWeight.Bold");
      console.info("[testInspectorTestAdd0002] fontWeight value :" + obj.getElement('$attrs').getString('fontWeight'));

    });

    
    
    
    /**
     * @tc.number   testInspectorTestAdd_static_0003
     * @tc.name     testInspectorTestAdd_static_0003
     * @tc.desc     testInspectorTestAdd_static_0003
     * @tc.level    Level.LEVEL0
     */
it('testInspectorTestAdd_static_0003', Level.LEVEL0, async () => {
      console.info("testInspectorTestAdd0003 start test");
      let innerEvent1: events_emitter.InnerEvent = {
        eventId: 60208,
        priority: events_emitter.EventPriority.LOW
      }
      let callback1: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
        console.info("eventData.data.getInspectorNodes result is: " +
        ((eventData.data) as ESObject)?.getProperty('getInspectorNodes'));
        try {
          console.info("callback1 success");
          console.info("inspector_101 eventData.data.result result is: " +
          ((eventData.data) as ESObject)?.getProperty('result').toString());
          expect(((eventData.data) as ESObject)?.getProperty('result').toString()).assertEqual("success");
          console.info("inspector_101 end: ");
          if (((eventData.data) as ESObject)?.getProperty('getInspectorNodes') != null) {
            console.info("eventData.data.result result is: " +
            ((eventData.data) as ESObject)?.getProperty('result').toString());
            expect(((eventData.data) as ESObject)?.getProperty('result').toString()).assertEqual("success");
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
it('testInspectorTestAdd_static_0004', Level.LEVEL0, async () => {
      let innerEvent2: events_emitter.InnerEvent = {
        eventId: 60209,
        priority: events_emitter.EventPriority.LOW
      }
      let callback2: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
        console.info("eventData.data.getInspectorNodeById result is: " +
        ((eventData.data) as ESObject)?.getProperty('getInspectorNodeById'));
        try {
          console.info("callback2 success");
          console.info("inspector_102 eventData.data.result result is: " +
          ((eventData.data) as ESObject)?.getProperty('result').toString());
          expect(((eventData.data) as ESObject)?.getProperty('result').toString()).assertEqual("success");
          console.info("inspector_102 end");
        } catch (err) {
          console.info("inspector_102 on events_emitter err : " + JSON.stringify(err));
        }

      }
      try {
        console.info("inspector_102 click result is: " + JSON.stringify(inspector.sendEventByKey('inspectorApiTwo', 10, "")));
        events_emitter.on(innerEvent2, callback2);
        await Utils.sleep(2000);

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
it('testInspectorTestAdd_static_0005', Level.LEVEL0, async () => {
      try {
        console.info('testInspectorTestAdd0005 START');
        try {
          let eventData: events_emitter.EventData = {
            data: {
              "setColor": 'red'
            } as Record<String,RecordData>
          }
          let innerEvent: events_emitter.InnerEvent = {
            eventId: 60211,
            priority: events_emitter.EventPriority.LOW
          }
          events_emitter.emit(innerEvent, eventData);
        } catch (err: Error) {
          console.log("[testInspectorTestAdd0005] change component data error: " + err.message);
        }
      }catch(error) {
        expect().assertFail();
      }
    });

    
    
    
    /**
     * @tc.number   testInspectorTestAdd_static_0006
     * @tc.name     testInspectorTestAdd_static_0006
     * @tc.desc     testInspectorTestAdd_static_0006
     * @tc.level    Level.LEVEL0
     */
it('testInspectorTestAdd_static_0006', Level.LEVEL0, async () => {
      let innerEvent3: events_emitter.InnerEvent = {
        eventId: 60210,
        priority: events_emitter.EventPriority.LOW
      }
      let callback3: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
        try {
          console.info("callback3 success");
          console.info("inspector_103 eventData.data.result result is: " +
          ((eventData.data) as ESObject)?.getProperty('catchStatus').toString());
          expect(((eventData.data) as ESObject)?.getProperty('catchStatus').toString()).assertEqual("callBackSuccess");
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
  })
}
