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
import CommonFunc from '../../MainAbility/common/Common';
import { resourceManager } from '@kit.LocalizationKit';
import { BusinessError } from '@kit.BasicServicesKit';

export default function text3Jsunit() {
  describe('text3Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("text beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text/text3',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get text state pages:" + JSON.stringify(pages));
        if (!("text3" == pages.name)) {
          console.info("get text state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push text page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push text page error:" + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("text after each called");
    });
	let resourceSize = getContext().resourceManager.getNumber($r('sys.float.ohos_id_text_font_size').id)    
	it('testText_0100', 0, async (done: Function) => {
      console.info('testText_0100 START');
      let strJson = getInspectorByKey('text');
      console.info("testText_0100 component strJson:" + strJson);
      console.info("testText_0100 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.fontSize).assertEqual('9.00fp');
      console.info('testText_0100 END');
      done();
    });

    it('testText_0200', 0, async (done: Function) => {
      console.info('testText_0200 START');
      let strJson = getInspectorByKey('image');
      console.info("testText_0200 component strJson:" + strJson);
      console.info("testText_0200 component strJson:" + JSON.parse(strJson).$attrs.src);
      expect(JSON.parse(strJson).$attrs.src).assertEqual('resource://rawfile/test.png');
      console.info('testText_0200 END');
      done();
    });

    it('testText_0300', 0, async (done: Function) => {
      console.info('testText_0300 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontSize": "10",
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 226,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testText_0300 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("testText_0300 change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJsonNew = getInspectorByKey('text');

      console.info("testText_0300 component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.fontSize).assertEqual('10.00fp');
      console.info('testText_0300 END');
      done();
    });

    it('testText_0400', 0, async (done: Function) => {
      console.info('testText_0400 START');
      let strJson = getInspectorByKey('text');
      console.info("testText_0400 component strJson:" + strJson);
      console.info("testText_0400 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.fontColor).assertEqual('#330A59F8');
      console.info('testText_0400 END');
      done();
    });

    it('testText_0500', 0, async (done: Function) => {
      console.info('testText_0500 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontColor": "#330A59F7",
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 227,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testText_0500 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("testText_0500 change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJsonNew = getInspectorByKey('text');

      console.info("testText_0500 component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.fontColor).assertEqual('#330A59F7');
      console.info('testText_0500 END');
      done();
    });

    it('testText_0600', 0, async (done: Function) => {
      console.info('testText_0600 START');
      let strJson = getInspectorByKey('text');
      console.info("testText_0600 component strJson:" + strJson);

      console.info("testText_0600 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.textAlign).assertEqual('TextAlign.Start');
      console.info('testText_0600 END');
      done();
    });

    it('testText_0700', 0, async (done: Function) => {
      console.info('testText_0700 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textAlign": TextAlign.Center,
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 228,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testText_0700 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("testText_0700 change component data error: " + err.message);
      }
      await CommonFunc.sleep(3000);
      let strJsonNew = getInspectorByKey('text');
      console.info("testText_0700 component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.textAlign).assertEqual('TextAlign.Center');
      console.info('testText_0700 END');
      done();
    });

    it('testText_0800', 0, async (done: Function) => {
      console.info('testText_0800 START');
      let strJson = getInspectorByKey('text');
      console.info("testText_0800 component strJson:" + strJson);

      console.info("testText_0800 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.textOverflow).assertEqual('TextOverflow.Clip');
      console.info('testText_0800 END');
      done();
    });

    it('testText_0900', 0, async (done: Function) => {
      console.info('testText_0900 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textOverflow": TextOverflow.None,
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 229,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testText_0900 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("testText_0900 change component data error: " + err.message);
      }
      await CommonFunc.sleep(3000);
      let strJsonNew = getInspectorByKey('text');

      console.info("testText_0900 component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.textOverflow).assertEqual('TextOverflow.None');
      console.info('testText_0900 END');
      done();
    });

    it('testText_1000', 0, async (done: Function) => {
      console.info('testText_1000 START');
      let strJson = getInspectorByKey('text');
      console.info("testText_1000 component strJson:" + strJson);

      console.info("testText_1000 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .decoration));
      expect(JSON.parse(strJson).$attrs.decoration)
        .assertEqual("{\"type\":\"TextDecorationType.None\",\"color\":\"#FFFF0000\"," +
          "\"style\":\"TextDecorationStyle.SOLID\"}");
      console.info('testText_1000 END');
      done();
    });

    it('testText_1200', 0, async (done: Function) => {
      console.info('testText_1200 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontColor": "#FFBC0229",
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 231,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testText_1200 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("testText_1200 change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJsonNew = getInspectorByKey('text');

      console.info("testText_1200 component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)
        .$attrs
        .fontColor));
      expect(JSON.parse(strJsonNew).$attrs.fontColor).assertEqual('#FFBC0229');
      console.info('testText_1200 END');
      done();
    });

    it('testText_1300', 0, async (done: Function) => {
      console.info('testText_1300 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontSize": "-a",
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 232,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testText_1300 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("testText_1300 change component data error: " + err.message);
      }
      await CommonFunc.sleep(3000);
      let strJsonNew = getInspectorByKey('text');

      console.info("testText_1300 component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)
        .$attrs
        .fontSize));

	  expect(JSON.parse(strJsonNew).$attrs.fontSize).assertEqual(px2fp(resourceSize)+'.00fp');      
      console.info('testText_1300 END');
      done();
    });

    it('testText_1400', 0, async (done: Function) => {
      console.info('testText_1400 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontSize": "-20",
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 233,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testText_1400 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("testText_1400 change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJsonNew = getInspectorByKey('text');

      console.info("testText_1400 component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)
        .$attrs
        .fontSize));

	  expect(JSON.parse(strJsonNew).$attrs.fontSize).assertEqual(px2fp(resourceSize)+'.00fp');
      console.info('testText_1400 END');
      done();
    });
  })
}