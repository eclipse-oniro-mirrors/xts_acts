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
import { describe, beforeEach, afterEach, it, expect, beforeAll, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import { RecordData } from '@ohos.base';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function tabsJsunit() {
  describe('tabsTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("tabs beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/tabs',
      }
      try {
        const routerAlp = AppStorage.get<Router>("router") as Router
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get tabs state pages:" + JSON.stringify(pages));
        if (!("tabs" == pages.name)) {
          console.info("get tabs state pages.name:" + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl(options);
          routerAlp.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push tabs page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabs page error:" + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("tabs after each called");
    });


    
    /**
     * @tc.number   testTabs_static_0100
     * @tc.name     testTabs_static_0100
     * @tc.desc     testTabs_static_0100
     * @tc.level    Level.LEVEL0
     */
it('testTabs_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testTabs_static_0100 START');
      let strJson = inspector.getInspectorByKey('tabs');
      console.info("testTabs_static_0100 component strJson:" + strJson);
      console.info("testTabs_static_0100 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Tabs');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barPosition'))
        .assertEqual('BarPosition.Start');
      console.info('testTabs_static_0100 END');
      done();
    });


    
    /**
     * @tc.number   testTabs_static_0200
     * @tc.name     testTabs_static_0200
     * @tc.desc     testTabs_static_0200
     * @tc.level    Level.LEVEL0
     */
it('testTabs_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testTabs_static_0200 START');
      let strJson = inspector.getInspectorByKey('tabs');
      console.info("testTabs_static_0200 component strJson:" + strJson);
      console.info("testTabs_static_0200 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')).assertEqual('0');
      console.info('testTabs_static_0200 END');
      done();
    });


    
    /**
     * @tc.number   testTabs_static_0300
     * @tc.name     testTabs_static_0300
     * @tc.desc     testTabs_static_0300
     * @tc.level    Level.LEVEL0
     */
it('testTabs_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testTabs_static_0300 START');
      let strJson = inspector.getInspectorByKey('tabs');
      console.info("testTabs_static_0300 component strJson:" + strJson);
      console.info("testTabs_static_0300 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('vertical')).assertEqual('true');
      console.info('testTabs_static_0300 END');
      done();
    });


    
    /**
     * @tc.number   testTabs_static_0400
     * @tc.name     testTabs_static_0400
     * @tc.desc     testTabs_static_0400
     * @tc.level    Level.LEVEL0
     */
it('testTabs_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testTabs_static_0400 START');
      let strJson = inspector.getInspectorByKey('tabs');
      console.info("testTabs_static_0400 component strJson:" + strJson);
      console.info("testTabs_static_0400 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('scrollable')).assertEqual(true);
      console.info('testTabs_static_0400 END');
      done();
    });


    
    /**
     * @tc.number   testTabs_static_0500
     * @tc.name     testTabs_static_0500
     * @tc.desc     testTabs_static_0500
     * @tc.level    Level.LEVEL0
     */
it('testTabs_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testTabs_static_0500 START');
      let strJson = inspector.getInspectorByKey('tabs');
      console.info("testTabs_static_0500 component strJson:" + strJson);
      console.info("testTabs_static_0500 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barMode')).assertEqual('BarMode.Fixed');
      console.info('testTabs_static_0500 END');
      done();
    });


    
    /**
     * @tc.number   testTabs_static_0600
     * @tc.name     testTabs_static_0600
     * @tc.desc     testTabs_static_0600
     * @tc.level    Level.LEVEL0
     */
it('testTabs_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testTabs_static_0600 START');
      let strJson = inspector.getInspectorByKey('tabs');
      console.info("testTabs_static_0600 component strJson:" + strJson);
      console.info("testTabs_static_0600 component JSON.parseJsonElement(strJson) is: " + strJson);

      expect(Math.abs(Number(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barWidth')) - 70.000000) <=
        1).assertTrue();

      console.info('testTabs_static_0600 END');
      done();
    });


    
    /**
     * @tc.number   testTabs_static_0700
     * @tc.name     testTabs_static_0700
     * @tc.desc     testTabs_static_0700
     * @tc.level    Level.LEVEL0
     */
it('testTabs_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testTabs_static_0700 START');
      let strJson = inspector.getInspectorByKey('tabs');
      console.info("testTabs_static_0700 component strJson:" + strJson);
      console.info("testTabs_static_0700 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(Math.abs(Number(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barHeight')) -
        150.000000) <= 1).assertTrue();

      console.info('testTabs_static_0700 END');
      done();
    });


    
    /**
     * @tc.number   testTabs_static_0800
     * @tc.name     testTabs_static_0800
     * @tc.desc     testTabs_static_0800
     * @tc.level    Level.LEVEL0
     */
it('testTabs_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testTabs_static_0800 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "vertical": "false",
          } as Record<String,RecordData>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 213,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testTabs_static_0800 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("testTabs_static_0800 change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('tabs');
      console.info("testTabs_static_0800 component JSON.parseJsonElement(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('vertical')).assertEqual('false');
      console.info('testTabs_static_0800 END');
      done();
    });


    
    /**
     * @tc.number   testTabs_static_0900
     * @tc.name     testTabs_static_0900
     * @tc.desc     testTabs_static_0900
     * @tc.level    Level.LEVEL0
     */
it('testTabs_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testTabs_static_0900 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "scrollable": "false",
          } as Record<String,RecordData>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 213,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testTabs_static_0900 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("testTabs_static_0900 change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('tabs');
      console.info("testTabs_static_0900 component JSON.parseJsonElement(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getBoolean('scrollable')).assertEqual(false);
      console.info('testTabs_static_0900 END');
      done();
    });


    
    /**
     * @tc.number   testTabs_static_1000
     * @tc.name     testTabs_static_1000
     * @tc.desc     testTabs_static_1000
     * @tc.level    Level.LEVEL0
     */
it('testTabs_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testTabs_static_1000 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "scrollable": "false53",
          } as Record<String,RecordData>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 213,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testTabs_static_1000 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("testTabs_static_1000 change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('tabs');
      console.info("testTabs_static_1000 component JSON.parseJsonElement(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getBoolean('scrollable')).assertEqual(false);
      console.info('testTabs_static_1000 END');
      done();
    });


    
    /**
     * @tc.number   testTabs_static_1100
     * @tc.name     testTabs_static_1100
     * @tc.desc     testTabs_static_1100
     * @tc.level    Level.LEVEL0
     */
it('testTabs_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testTabs_static_1100 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "vertical": "39284",
          } as Record<String,RecordData>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 213,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testTabs_static_1100 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("testTabs_static_1100 change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('tabs');
      console.info("testTabs_static_1100 component JSON.parseJsonElement(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getBoolean('scrollable')).assertEqual(false);
      console.info('testTabs_static_1100 END');
      done();
    });


    
    /**
     * @tc.number   testTabs_static_1200
     * @tc.name     testTabs_static_1200
     * @tc.desc     testTabs_static_1200
     * @tc.level    Level.LEVEL0
     */
it('testTabs_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testTabs_static_1200 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "vertical": "abc123",
          } as Record<String,RecordData>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 214,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testTabs_static_1200 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("testTabs_static_1200 change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('tabs');
      console.info("testTabs_static_1200 component JSON.parseJsonElement(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('vertical')).assertEqual('false');
      console.info('testTabs_static_1200 END');
      done();
    });


    
    /**
     * @tc.number   testTabs_static_1300
     * @tc.name     testTabs_static_1300
     * @tc.desc     testTabs_static_1300
     * @tc.level    Level.LEVEL0
     */
it('testTabs_static_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testTabs_static_1300 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "scrollable": "avc12321",
          } as Record<String,RecordData>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 215,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testTabs_static_1300 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("testTabs_static_1300 change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('tabs');
      console.info("testTabs_static_1300 component JSON.parseJsonElement(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getBoolean('scrollable')).assertEqual(false);
      console.info('testTabs_static_1300 END');
      done();
    });


    
    /**
     * @tc.number   testTabs_static_1400
     * @tc.name     testTabs_static_1400
     * @tc.desc     testTabs_static_1400
     * @tc.level    Level.LEVEL0
     */
it('testTabs_static_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testTabs_static_1400 START');
      await CommonFunc.sleep(1500);
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("testTabs_static_1400 get state result is: " + JSON.stringify(indexEvent));
        if (indexEvent.data != null) {
          expect((indexEvent.data as Record<String,RecordData>)['ACTION']).assertEqual(true);
        }
        done();
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 212,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("testTabs_static_1400 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("testTabs_static_1400 click result is: " +
      JSON.stringify(inspector.sendEventByKey('tabContent1', 10, "")));
      await CommonFunc.sleep(1000);
      console.info('testTabs_static_1400 END');
      done();
    });
  })
}