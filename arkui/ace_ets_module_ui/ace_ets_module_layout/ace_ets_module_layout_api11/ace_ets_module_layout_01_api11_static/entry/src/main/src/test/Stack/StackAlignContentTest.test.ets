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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium';
import router from '@ohos.router';
import {Alignment} from '@ohos.arkui.component'
import events_emitter from '@ohos.events.emitter'
import { UtilsTest,startAbility } from '../Util.test'
import { AppStorage } from '@ohos.arkui.stateManagement';
import {  Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { UIContext } from '@ohos.arkui.UIContext';
import { RecordData } from '@ohos.base';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function StackAlignContentTest() {
  describe('StackAlignContentTest',  () => {
    beforeAll(async () => {
      console.info("stack_alignContent beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility");

    })
    beforeEach(async (): Promise<void> => {
      console.info("StackAlignContent beforeEach start");
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/Stack/stackAlignContentPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router")
        routerInstance?.clear();
        let pages = routerInstance?.getState();
        console.info("get StackAlignContent state pages: " + JSON.stringify(pages));
        if (!("stackAlignContentPage" == pages?.name)) {
          console.info("get stackAlignContent state pages.name: " + JSON.stringify(pages?.name));
          routerInstance?.pushUrl(options);
          await UtilsTest.msSleep(2000);
        }
      } catch (err:BusinessError) {
        console.error("push stackAlignContent page error: " + err);
      }
    });

    afterEach(async (): Promise<void> =>{
      await UtilsTest.msSleep(1000);
      console.info("stackAlignContent after each called");
    })
 



    /**
     * @tc.number   testStackAlignContent_static
     * @tc.name     testStackAlignContent_static
     * @tc.desc     testStackAlignContent_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackAlignContent_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'testStackAlignContent';
      console.info('[' + tagName + '] START============================');
      await UtilsTest.msSleep(1000)
      let strJson = inspector.getInspectorByKey('keyAlignContent');
      let obj  = JSON.parseJsonElement(strJson);
      console.info('[' + tagName + '] component obj is: ' + obj.getElement('$attrs').getString('alignContent'));
      expect(obj.getString('$type')).assertEqual('Stack');
      expect(obj.getElement('$attrs').getString('alignContent')).assertEqual("Alignment.TopStart");

      try {
        let eventData : events_emitter.EventData = {
          data: {
            'alignContentValue': Alignment.Top
          } as Record<String,RecordData>
        }
        let innerEvent : events_emitter.InnerEvent = {
          eventId: 181,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + `${tagName}` + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData)
      } catch (err:BusinessError) {
        console.log('[' + `${tagName}` + '] change component data error: ' + err.message);
      }
      await UtilsTest.msSleep(2000);
      let strJsonNew = inspector.getInspectorByKey('keyAlignContent');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + JSON.stringify(objNew));
      
      expect(objNew.getString('$type')).assertEqual('Stack');
      expect(objNew.getElement('$attrs').getString('alignContent')).assertEqual("Alignment.Top");

      try {
        let eventData2 : events_emitter.EventData = {
          data: {
            "alignContentValue": Alignment.TopEnd
          } as Record<String,RecordData>
        }
        let innerEvent2 : events_emitter.InnerEvent = {
          eventId: 182,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent2,eventData2);
      } catch (err:BusinessError) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await UtilsTest.msSleep(2000);
      let strJson2 = inspector.getInspectorByKey('keyAlignContent');
      let obj2  = JSON.parseJsonElement(strJson2);
      console.info('[' + tagName + '] component strJson2 is: ' + JSON.stringify(strJson2));
      expect(obj2.getString('$type')).assertEqual('Stack');
      expect(obj2.getElement('$attrs').getString('alignContent')).assertEqual("Alignment.TopEnd");

      try {
        let eventData3 : events_emitter.EventData = {
          data: {
            "alignContentValue": Alignment.Start
          } as Record<String,RecordData>
        }
        let innerEvent3 : events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent3, eventData3);
      } catch (err:BusinessError) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await UtilsTest.msSleep(2000);
      let strJson3 = inspector.getInspectorByKey('keyAlignContent');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info('[' + tagName + '] component strJson3 is: ' + JSON.stringify(strJson3));
      expect(obj3.getString('$type')).assertEqual('Stack');
      expect(obj3.getElement('$attrs').getString('alignContent')).assertEqual("Alignment.Start");

      try {
        let eventData4 : events_emitter.EventData = {
          data: {
            "alignContentValue": Alignment.Center
          } as Record<String,RecordData>
        }
        let innerEvent4 : events_emitter.InnerEvent = {
          eventId: 184,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent4, eventData4);
      } catch (err:BusinessError) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await UtilsTest.msSleep(2000);
      let strJson4 = inspector.getInspectorByKey('keyAlignContent');
      let obj4 = JSON.parseJsonElement(strJson4);
      console.info('[' + tagName + '] component strJson4 is: ' + JSON.stringify(strJson4));
      expect(obj4.getString('$type')).assertEqual('Stack');
      expect(obj4.getElement('$attrs').getString('alignContent')).assertEqual("Alignment.Center");

      try {
        let eventData5 : events_emitter.EventData = {
          data: {
            "alignContentValue": Alignment.End
          } as Record<String,RecordData>
        }
        let innerEvent5 : events_emitter.InnerEvent = {
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent5, eventData5);
      } catch (err:BusinessError) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await UtilsTest.msSleep(2000);
      let strJson5 = inspector.getInspectorByKey('keyAlignContent');
      let obj5 = JSON.parseJsonElement(strJson5);
      console.info('[' + tagName + '] component strJson5 is: ' + JSON.stringify(strJson5));
      expect(obj5.getString('$type')).assertEqual('Stack');
      expect(obj5.getElement('$attrs').getString('alignContent')).assertEqual("Alignment.End");
      
      try {
        let eventData6 : events_emitter.EventData = {
          data: {
            "alignContentValue": Alignment.BottomStart
          } as Record<String,RecordData>
        }
        let innerEvent6 : events_emitter.InnerEvent = {
          eventId: 186,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent6, eventData6);
      } catch (err:BusinessError) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await UtilsTest.msSleep(2000);
      let strJson6 = inspector.getInspectorByKey('keyAlignContent');
      let obj6 = JSON.parseJsonElement(strJson6);
      console.info('[' + tagName + '] component strJson6 is: ' + JSON.stringify(strJson6));
      expect(obj6.getString('$type')).assertEqual('Stack');
      expect(obj6.getElement('$attrs').getString('alignContent')).assertEqual("Alignment.BottomStart");

      try {
        let eventData7 : events_emitter.EventData = {
          data: {
            "alignContentValue":Alignment.Bottom
          } as Record<String,RecordData>
        }
        let innerEvent7 : events_emitter.InnerEvent = {
          eventId: 187,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent7, eventData7);
      } catch (err:BusinessError) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await UtilsTest.msSleep(2000);
      let strJson7 = inspector.getInspectorByKey('keyAlignContent');
      let obj7  = JSON.parseJsonElement(strJson7);
      console.info('[' + tagName + '] component strJson7 is: ' + JSON.stringify(strJson7));
      expect(obj7.getString('$type')).assertEqual('Stack');
      expect(obj7.getElement('$attrs').getString('alignContent')).assertEqual("Alignment.Bottom");

       try {
        let eventData8 : events_emitter.EventData = {
          data: {
            "alignContentValue":Alignment.BottomEnd
          } as Record<String,RecordData>
        }
        let innerEvent8 : events_emitter.InnerEvent = {
          eventId: 188,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent8, eventData8);
      } catch (err:BusinessError) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await UtilsTest.msSleep(2000);
      let strJson8 = inspector.getInspectorByKey('keyAlignContent');
      let obj8 = JSON.parseJsonElement(strJson8);
      console.info('[' + tagName + '] component strJson8 is: ' + JSON.stringify(strJson8));
      expect(obj8.getString('$type')).assertEqual('Stack');
      expect(obj8.getElement('$attrs').getString('alignContent')).assertEqual("Alignment.BottomEnd");

      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
