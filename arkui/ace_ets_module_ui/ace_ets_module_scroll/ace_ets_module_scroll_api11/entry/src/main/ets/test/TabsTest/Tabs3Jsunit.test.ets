/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeEach, afterEach, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';

export default function tabsJsunit() {
  describe('tabsTest', () => {
    beforeEach(async (done: Function) => {
      console.info("tabs beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/tabs',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get tabs state pages:" + JSON.stringify(pages));
        if (!("tabs" == pages.name)) {
          console.info("get tabs state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push tabs page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabs page error:" + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("tabs after each called");
    });

    it('testTabs_0100', 0, async (done: Function) => {
      console.info('testTabs_0100 START');
      let strJson = getInspectorByKey('tabs');
      console.info("testTabs_0100 component strJson:" + strJson);
      console.info("testTabs_0100 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$type).assertEqual('Tabs');
      expect(JSON.parse(strJson).$attrs.barPosition).assertEqual('BarPosition.Start');
      console.info('testTabs_0100 END');
      done();
    });

    it('testTabs_0200', 0, async (done: Function) => {
      console.info('testTabs_0200 START');
      let strJson = getInspectorByKey('tabs');
      console.info("testTabs_0200 component strJson:" + strJson);
      console.info("testTabs_0200 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.index).assertEqual('0');
      console.info('testTabs_0200 END');
      done();
    });

    it('testTabs_0300', 0, async (done: Function) => {
      console.info('testTabs_0300 START');
      let strJson = getInspectorByKey('tabs');
      console.info("testTabs_0300 component strJson:" + strJson);
      console.info("testTabs_0300 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.vertical).assertEqual('true');
      console.info('testTabs_0300 END');
      done();
    });

    it('testTabs_0400', 0, async (done: Function) => {
      console.info('testTabs_0400 START');
      let strJson = getInspectorByKey('tabs');
      console.info("testTabs_0400 component strJson:" + strJson);
      console.info("testTabs_0400 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.scrollable).assertEqual(true);
      console.info('testTabs_0400 END');
      done();
    });

    it('testTabs_0500', 0, async (done: Function) => {
      console.info('testTabs_0500 START');
      let strJson = getInspectorByKey('tabs');
      console.info("testTabs_0500 component strJson:" + strJson);
      console.info("testTabs_0500 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.barMode).assertEqual('BarMode.Fixed');
      console.info('testTabs_0500 END');
      done();
    });

    it('testTabs_0600', 0, async (done: Function) => {
      console.info('testTabs_0600 START');
      let strJson = getInspectorByKey('tabs');
      console.info("testTabs_0600 component strJson:" + strJson);
      console.info("testTabs_0600 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
     
      expect(Math.abs(Number(JSON.parse(strJson).$attrs.barWidth) - 70.000000 ) <=1 ).assertTrue();
     
      console.info('testTabs_0600 END');
      done();
    });

    it('testTabs_0700', 0, async (done: Function) => {
      console.info('testTabs_0700 START');
      let strJson = getInspectorByKey('tabs');
      console.info("testTabs_0700 component strJson:" + strJson);
      console.info("testTabs_0700 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(Math.abs(Number(JSON.parse(strJson).$attrs.barHeight) - 150.000000 ) <=1 ).assertTrue();
    
      console.info('testTabs_0700 END');
      done();
    });

    it('testTabs_0800', 0, async (done: Function) => {
      console.info('testTabs_0800 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "vertical": "false",
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 213,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testTabs_0800 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("testTabs_0800 change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = getInspectorByKey('tabs');
      console.info("testTabs_0800 component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.vertical).assertEqual('false');
      console.info('testTabs_0800 END');
      done();
    });

    it('testTabs_0900', 0, async (done: Function) => {
      console.info('testTabs_0900 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "scrollable": "false",
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 213,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testTabs_0900 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("testTabs_0900 change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = getInspectorByKey('tabs');
      console.info("testTabs_0900 component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.scrollable).assertEqual(false);
      console.info('testTabs_0900 END');
      done();
    });

    it('testTabs_1000', 0, async (done: Function) => {
      console.info('testTabs_1000 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "scrollable": "false53",
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 213,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testTabs_1000 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("testTabs_1000 change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = getInspectorByKey('tabs');
      console.info("testTabs_1000 component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.scrollable).assertEqual(false);
      console.info('testTabs_1000 END');
      done();
    });

    it('testTabs_1100', 0, async (done: Function) => {
      console.info('testTabs_1100 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "vertical": "39284",
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 213,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testTabs_1100 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("testTabs_1100 change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = getInspectorByKey('tabs');
      console.info("testTabs_1100 component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.scrollable).assertEqual(false);
      console.info('testTabs_1100 END');
      done();
    });

    it('testTabs_1200', 0, async (done: Function) => {
      console.info('testTabs_1200 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "vertical": "abc123",
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 214,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testTabs_1200 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("testTabs_1200 change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = getInspectorByKey('tabs');
      console.info("testTabs_1200 component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.vertical).assertEqual('false');
      console.info('testTabs_1200 END');
      done();
    });

    it('testTabs_1300', 0, async (done: Function) => {
      console.info('testTabs_1300 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "scrollable": "avc12321",
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 215,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testTabs_1300 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("testTabs_1300 change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = getInspectorByKey('tabs');
      console.info("testTabs_1300 component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.scrollable).assertEqual(false);
      console.info('testTabs_1300 END');
      done();
    });

    it('testTabs_1400', 0, async (done: Function) => {
      console.info('testTabs_1400 START');
      await CommonFunc.sleep(1500);
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("testTabs_1400 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data?.ACTION).assertEqual(true);
        done();
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 212,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("testTabs_1400 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("testTabs_1400 click result is: " + JSON.stringify(sendEventByKey('tabContent1', 10, "")));
      await CommonFunc.sleep(1000);
      console.info('testTabs_1400 END');
      done();
    });
  })
}