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
import { describe, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium";
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../MainAbility/common/Common';
import { BusinessError } from '@ohos.base';
import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.information/MainAbility';

export default function badge3Jsunit() {
  describe('badge3Jsunit', () => {
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("badge beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Badge/badge3',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get badge state pages: " + JSON.stringify(pages));
        if (!("badge3" == pages.name)) {
          console.info("get badge state pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push badge page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("badge after each called");
    })

    it('testBadge01', Level.LEVEL0, async (done: Function) => {
      console.info('[testBadge01] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('badge');

      console.info("[testBadge01] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .style) + "---" + JSON.parse(strJson).$attrs.style);
      expect(JSON.parse(strJson).$type).assertEqual('Badge');
      expect(JSON.parse(JSON.parse(strJson).$attrs.style).fontSize).assertEqual('20.00fp');
      done();
    });

    it('testBadge03', Level.LEVEL0, async (done: Function) => {
      console.info('[testBadge03] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontSizeValue": -1,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 63,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testBadge03] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testBadge03] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = getInspectorByKey('badge');
      console.info("[testBadge03] component objNew is: " + JSON.parse(JSON.parse(strJsonNew)
        .$attrs
        .style) + "--" + JSON.parse(strJsonNew).$attrs.style);
      expect(JSON.parse(JSON.parse(strJsonNew).$attrs.style).fontSize).assertEqual('10.00vp');
      done();
    });

    it('testBadge02', Level.LEVEL0, async (done: Function) => {
      console.info('[testBadge02] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontSizeValue": "30",
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 63,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testBadge02] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testBadge02] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = getInspectorByKey('badge');
      console.info("[testBadge02] component objNew is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(JSON.parse(strJsonNew).$attrs.style).fontSize).assertEqual('30.00fp');
      done();
    });


    it('testBadge04', Level.LEVEL0, async (done: Function) => {
      console.info('[testBadge04] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontSizeValue": "121212121",
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 63,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testBadge04] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testBadge04] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = getInspectorByKey('badge');
      console.info("[testBadge04] component objNew is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(JSON.parse(strJsonNew).$attrs.style).fontSize).assertEqual('121212121.00fp');
      done();
    });

    it('testBadge05', Level.LEVEL0, async (done: Function) => {
      console.info('[testBadge05] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontSizeValue": "121212121vaas",
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 63,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testBadge05] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testBadge05] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = getInspectorByKey('badge');
      console.info("[testBadge05] component objNew is: " + JSON.stringify(JSON.parse(strJsonNew)));
      console.info("[testBadge05] component style is: " + JSON.stringify(JSON.parse(JSON.parse(strJsonNew)
        .$attrs
        .style)));
      expect(JSON.parse(JSON.parse(strJsonNew).$attrs.style).fontSize).assertEqual('10.00vp');
      done();
    });

    it('testBadge06', Level.LEVEL0, async (done: Function) => {
      console.info('[testBadge06] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('badge2');

      console.info("[testBadge06] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$type).assertEqual('Badge');
      expect(JSON.parse(strJson).$attrs.value).assertEqual('new');
      done();
    });

    it('testBadge07', Level.LEVEL0, async (done: Function) => {
      console.info('[testBadge07] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('badge2');

      console.info("[testBadge07] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$type).assertEqual('Badge');
      expect(JSON.parse(JSON.parse(strJson).$attrs.style).color).assertEqual('#FFFF0000');
      done();
    });

    it('testBadge08', Level.LEVEL0, async (done: Function) => {
      console.info('[testBadge08] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "colorValue": Color.Blue,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 63,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testBadge08] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testBadge08] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = getInspectorByKey('badge2');
      console.info("[testBadge08] component objNew is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(JSON.parse(strJsonNew).$attrs.style).color).assertEqual('#FF0000FF');
      done();
    });

    it('testBadge09', Level.LEVEL0, async (done: Function) => {
      console.info('[testBadge09] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "message": "test",
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 63,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testBadge09] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testBadge09] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = getInspectorByKey('badge2');
      console.info("[testBadge09] component objNew is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.value).assertEqual('test');
      done();
    });

    it('testBadge10', Level.LEVEL0, async (done: Function) => {
      console.info('[testBadge10] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "colorValue": undefined,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 64,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testBadge10] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testBadge10] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = getInspectorByKey('badge2');
      console.info("[testBadge10] component objNew is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(JSON.parse(strJsonNew).$attrs.style).color).assertEqual('#FF0000FF');
      done();
    });

    it('testBadge11', Level.LEVEL0, async (done: Function) => {
      console.info('[testBadge11] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "colorValue": -300,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 65,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testBadge11] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testBadge11] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = getInspectorByKey('badge2');
      console.info("[testBadge11] component objNew is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(JSON.parse(strJsonNew).$attrs.style).color).assertEqual('#FFFFFED4');
      done();
    });
  })
}