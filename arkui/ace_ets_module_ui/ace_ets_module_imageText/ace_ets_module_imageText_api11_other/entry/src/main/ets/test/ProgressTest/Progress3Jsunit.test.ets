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

export default function progressJsunit() {
  describe('progressTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Progress/progress3',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get progress state success " + JSON.stringify(pages));
        if (!("progress3" == pages.name)) {
          console.info("get progress state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push progress page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push progress page error " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("progress after each called");
    });

    it('testProgress_100', 0, async (done: Function) => {
      console.info('testProgress_100 START');
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('LPValue');
      console.info("testProgress_100 component objLP is: " + JSON.parse(strJson1).$attrs.value);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "value": 100
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 164,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testProgress_100 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("testProgress_100 change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('LPValue');
      console.info("testProgress_100 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .value));
      expect(JSON.parse(strJson).$attrs.value).assertEqual("100.000000");
      console.info('testProgress_100 END');
      done();
    });

    it('testProgress_200', 0, async (done: Function) => {
      console.info('[testProgress_200] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('LPValue');
      console.info("testProgress_200 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.width).assertEqual("200.00vp");
      console.info('testProgress_200 END');
      done();
    });

    it('testProgress_300', 0, async (done: Function) => {
      console.info('testProgress_300 START');
      let strJson1 = getInspectorByKey('EPValue');
      console.info("testProgress_300 component objEP is: " + JSON.parse(strJson1).$attrs.value);
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "value": 100
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 165,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testProgress_300 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("testProgress_300 change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('EPValue');

      console.info("testProgress_300 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.value).assertEqual("100.000000");
      console.info('testProgress_300 END');
      done();
    });

    it('testProgress_400', 0, async (done: Function) => {
      console.info('[testProgress_400] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('LPValue');
      console.info("testProgress_400 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.width).assertEqual("200.00vp");
      console.info('testProgress_400 END');
      done();
    });

    it('testProgress_500', 0, async (done: Function) => {
      console.info('testProgress_500 START');
      let strJson1 = getInspectorByKey('CPValue');
      console.info("testProgress_500 component objCP is: " + JSON.parse(strJson1).$attrs.value);
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "value": 100
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 166,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testProgress_500 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("testProgress_500 change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('EPValue');

      console.info("testProgress_500 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.value).assertEqual("100.000000");
      console.info('testProgress_500 END');
      done();
    });

    it('testProgress_600', 0, async (done: Function) => {
      console.info('[testProgress_600] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('CPValue');
      console.info("testProgress_600 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.width).assertEqual("100.00vp");
      console.info('testProgress_600 END');
      done();
    });

    it('testProgress_700', 0, async (done: Function) => {
      console.info('testProgress_700 START');
      let strJson1 = getInspectorByKey('LPValue');
      console.info("testProgress_700 component objLP is: " + JSON.parse(strJson1).$attrs.value);
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "value": 0
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 167,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testProgress_700 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("testProgress_700 change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('LPValue');

      console.info("testProgress_700 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.value).assertEqual("0.000000");
      console.info('testProgress_700 END');
      done();
    });

    it('testProgress_800', 0, async (done: Function) => {
      console.info('testProgress_800 START');
      let strJson1 = getInspectorByKey('EPValue');
      console.info("testProgress_800 component objEP is: " + JSON.parse(strJson1).$attrs.value);
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "value": 0
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 168,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testProgress_800 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("testProgress_800 change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('EPValue');

      console.info("testProgress_800 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.value).assertEqual("0.000000");
      console.info('testProgress_800 END');
      done();
    });

    it('testProgress_900', 0, async (done: Function) => {
      console.info('testProgress_900 START');
      let strJson1 = getInspectorByKey('CPValue');
      console.info("testProgress_900 component objCP is: " + JSON.parse(strJson1).$attrs.value);
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "value": 0
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 169,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testProgress_900 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("testProgress_900 change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('EPValue');

      console.info("testProgress_900 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.value).assertEqual("0.000000");
      console.info('testProgress_900 END');
      done();
    });

    it('testProgress_1000', 0, async (done: Function) => {
      console.info('testProgress_1000 START');
      let strJson1 = getInspectorByKey('LPValue');
      console.info("testProgress_1000 component objLP is: " + JSON.parse(strJson1).$attrs.value);
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "value": -5
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1021,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testProgress_1000 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("testProgress_1000 change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('LPValue');

      console.info("testProgress_1000 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      // 非法入参默认初始值
      expect(JSON.parse(strJson).$attrs.value).assertEqual("0.000000");
      console.info('testProgress_1000 END');
      done();
    });

    it('testProgress_1100', 0, async (done: Function) => {
      console.info('testProgress_1100 START');
      let strJson1 = getInspectorByKey('LPValue');
      console.info("testProgress_1100 component objLP is: " + JSON.parse(strJson1).$attrs.value);
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "value": 121212121
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1022,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testProgress_1100 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("testProgress_1100 change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('LPValue');

      console.info("testProgress_1100 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      // 非法入参默认初始值
      expect(JSON.parse(strJson).$attrs.value).assertEqual("100.000000");
      console.info('testProgress_1100 END');
      done();
    });
  })
}