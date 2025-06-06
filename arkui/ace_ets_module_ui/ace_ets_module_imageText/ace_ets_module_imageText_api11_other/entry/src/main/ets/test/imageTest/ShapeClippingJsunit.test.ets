/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../MainAbility/common/Common';

export default function shapeClippingJsunit() {
  describe('borderTest_five_4', () => {
    beforeEach(async (done: Function) => {
      console.info("shapeClipping beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/image/shapeClipping',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get shapeClipping state pages:" + JSON.stringify(pages));
        if (!("shapeClipping" == pages.name)) {
          console.info("get shapeClipping state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push shapeClipping page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push shapeClipping page error:" + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("shapeClipping after each called");
    });

    it('testShapeClipping001', Level.LEVEL1, async (done: Function) => {
      console.info('[testShapeClipping001] START');
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('image_clip');
      console.info("[testShapeClipping001] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(JSON.parse(strJson).$attrs.clip).shape).assertEqual('Circle');
      let strJson1: string = getInspectorByKey('image_clip_true');
      console.info("[testShapeClipping001] component obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      expect(JSON.parse(strJson1).$attrs.clip).assertEqual('true');
      console.info('[testShapeClipping001] END');
      done();
    });

    it('testShapeClipping002', Level.LEVEL1, async (done: Function) => {
      console.info('[testShapeClipping002] START');
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('image_mask');
      console.info("[testShapeClipping002] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[testShapeClipping002] component mask obj is: " + JSON.stringify(JSON.parse(strJson).$attrs.mask));
      expect(JSON.parse(JSON.stringify(JSON.parse(strJson).$attrs.mask)).shape).assertEqual('Rect');
      expect(JSON.parse(strJson).$attrs.clip).assertEqual('false');
      console.info('[testShapeClipping002] END');
      done();
    });

    it('testShapeClipping003', Level.LEVEL1, async (done: Function) => {
      console.info('[testShapeClipping003] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "maskValue": false
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 32,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testShapeClipping003] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testShapeClipping003] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = getInspectorByKey('image_mask');
      console.info("[testShapeClipping003] component objNew is: " + JSON.stringify(JSON.parse(strJsonNew)));
      console.info("[testShapeClipping003] component mask obj is: " + JSON.stringify(JSON.parse(strJsonNew)
        .$attrs
        .mask));
      expect(JSON.parse(JSON.stringify(JSON.parse(strJsonNew).$attrs.mask)).shape).assertEqual('Circle');
      console.info('[testShapeClipping003] END');
      done();
    });

    it('testShapeClipping004', Level.LEVEL1, async (done: Function) => {
      console.info('[testShapeClipping004] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "clipValue": false
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 33,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testShapeClipping004] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testShapeClipping004] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = getInspectorByKey('image_clip');
      console.info("[testShapeClipping004] component objNew is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(JSON.parse(strJsonNew).$attrs.clip).shape).assertEqual('Rect');
      console.info('[testShapeClipping004] END');
      done();
    });
  })
}