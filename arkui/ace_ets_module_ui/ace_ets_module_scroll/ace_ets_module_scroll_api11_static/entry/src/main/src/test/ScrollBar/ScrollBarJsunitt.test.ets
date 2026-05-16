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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { BarState } from '@ohos.arkui.component'
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import { RecordData } from '@ohos.base';

export default function scrollBarJsunitt() {
  describe('scrollBarJsunitt', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ScrollBar/scrollBarr',
      }
      const routerAlp = AppStorage.get<Router>("router") as Router
      try {
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get scrollBar state success " + JSON.stringify(pages));
        if (!("scrollBarr" == pages.name)) {
          console.info("get scrollBar success " + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl(options);
          routerAlp.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push scrollBar page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scrollBar page error " + JSON.stringify(err));
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("scrollBar after each called");
    });


    
    /**
     * @tc.number   testScrollBar001_static_01
     * @tc.name     testScrollBar001_static_01
     * @tc.desc     testScrollBar001_static_01
     * @tc.level    Level.LEVEL0
     */
it('testScrollBar001_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testScrollBar001_static_01] START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('scroll');
      console.info("[testScrollBar001_static_01] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testScrollBar001_static_01] direction:" + obj.getElement('$attrs').getString('direction'));
      expect(obj.getElement('$attrs').getString('direction')).assertEqual('ScrollBarDirection.Vertical');
      done();
    });


    
    /**
     * @tc.number   testScrollBar002_static_02
     * @tc.name     testScrollBar002_static_02
     * @tc.desc     testScrollBar002_static_02
     * @tc.level    Level.LEVEL0
     */
it('testScrollBar002_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testScrollBar002_static_02] START');
      let objectT: Record<string, string> = {
        "directionValue": "ScrollBarDirection.Horizontal"
      };
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "directionObject": JSON.stringify(objectT)
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testScrollBar002_static_02] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[testScrollBar002_static_02] change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJson = inspector.getInspectorByKey('scroll');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testScrollBar002_static_02] obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('direction')).assertEqual('ScrollBarDirection.Vertical');
      console.info('testScrollBar002_static_02 END');
      done();
    });


    
    /**
     * @tc.number   testScrollBar003_static_03
     * @tc.name     testScrollBar003_static_03
     * @tc.desc     testScrollBar003_static_03
     * @tc.level    Level.LEVEL0
     */
it('testScrollBar003_static_03', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testScrollBar003_static_03] START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('scroll');
      console.info("[testScrollBar003_static_03] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testScrollBar003_static_03] state:" + obj.getElement('$attrs').getString('state'));
      expect(obj.getElement('$attrs').getString('state')).assertEqual('BarState.Off');
      done();
    });


    
    /**
     * @tc.number   testScrollBar004_static_04
     * @tc.name     testScrollBar004_static_04
     * @tc.desc     testScrollBar004_static_04
     * @tc.level    Level.LEVEL0
     */
it('testScrollBar004_static_04', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testScrollBar004_static_04] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "stateValue": BarState.On
          } as Record<String,RecordData>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 184,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testScrollBar004_static_04] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err: Error) {
        console.log("[testScrollBar004_static_04] change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJson = inspector.getInspectorByKey('scroll');
      console.info("[testScrollBar004_static_04] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testScrollBar004_static_04] state:" + obj.getElement('$attrs').getString('state'));
      expect(obj.getElement('$attrs').getString('state')).assertEqual("BarState.On");
      done();
    });


    
    /**
     * @tc.number   testScrollBar005_static_05
     * @tc.name     testScrollBar005_static_05
     * @tc.desc     testScrollBar005_static_05
     * @tc.level    Level.LEVEL0
     */
it('testScrollBar005_static_05', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testScrollBar005_static_05] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "stateValue": BarState.Auto
          } as Record<String,RecordData>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 184,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testScrollBar005_static_05] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err: Error) {
        console.log("[testScrollBar005_static_05] change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJson = inspector.getInspectorByKey('scroll');
      console.info("[testScrollBar005_static_05] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testScrollBar005_static_05] state:" + obj.getElement('$attrs').getString('state'));
      expect(obj.getElement('$attrs').getString('state')).assertEqual("BarState.Auto");
      done();
    });
  })
}