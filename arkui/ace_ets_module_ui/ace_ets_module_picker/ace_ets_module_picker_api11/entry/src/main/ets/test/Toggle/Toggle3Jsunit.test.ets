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
import { describe, beforeEach, afterEach, it, expect } from "@ohos/hypium";
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from '../Utils';

export default function Toggle3Jsunit() {
  describe('Toggle3Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("toggle beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Toggle/toggle3',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get toggle state pages:" + JSON.stringify(pages));
        if (!("toggle3" == pages.name)) {
          console.info("get toggle state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push toggle page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push toggle page error:" + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("toggle after each called");
    });

    it('testToggle01', 0, async (done: Function) => {
      console.info('[testToggle01] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('toggle');
      console.info("[testToggle01] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$type).assertEqual('Toggle');
      expect(JSON.parse(strJson).$attrs.selectedColor).assertEqual('#330A59F7');
      console.info('[testToggle01] END');
      done();
    });

    it('testToggle02', 0, async (done: Function) => {
      console.info('[testToggle02] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('toggle');
      console.info("[testToggle02] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.type).assertEqual('ToggleType.Button');
      console.info('[testToggle02] END');
      done();
    });

    it('testToggle03', 0, async (done: Function) => {
      console.info('[testToggle03] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('toggle');
      console.info("[testToggle03] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.isOn).assertEqual('false');
      console.info('[testToggle03] END');
      done();
    });

    it('testToggle04', 0, async (done: Function) => {
      console.info('testToggle04 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "isOn": true,
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 231,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testToggle04 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("testToggle04 change component data error: " + (err as Error).message);
      }
      await Utils.sleep(4000);
      let strJsonNew = getInspectorByKey('toggle');
      console.info("testToggle04 component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.isOn).assertEqual('true');
      console.info('testToggle04 END');
      done();
    });

    it('testToggle05', 0, async (done: Function) => {
      console.info('testToggle05 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selectedColor": '#330A59F8',
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 232,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testToggle05 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("testToggle05 change component data error: " + (err as Error).message);
      }
      await Utils.sleep(4000);
      let strJsonNew = getInspectorByKey('toggle');
      console.info("testToggle05 component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.selectedColor).assertEqual('#330A59F8');
      console.info('testToggle05 END');
      done();
    });

    it('testToggle08', 0, async (done: Function) => {
      console.info('testToggle04 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "isOn": 'aaa',
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 1035,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testToggle04 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("testToggle04 change component data error: " + (err as Error).message);
      }
      await Utils.sleep(4000);
      let strJsonNew = getInspectorByKey('toggle');
      console.info("testToggle04 component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.isOn).assertEqual('false');
      console.info('testToggle04 END');
      done();
    });

    it('testToggle09', 0, async (done: Function) => {
      console.info('testToggle04 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "isOn": -1,
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 1036,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testToggle04 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("testToggle04 change component data error: " + (err as Error).message);
      }
      await Utils.sleep(4000);
      let strJsonNew = getInspectorByKey('toggle');
      console.info("testToggle04 component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.isOn).assertEqual('false');
      console.info('testToggle04 END');
      done();
    });
  })
}
