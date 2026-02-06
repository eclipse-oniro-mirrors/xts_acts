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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from '../Utils';

export default function sliderJsunit1() {
  describe('appInfoTest_five_3', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/slider1/slider',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get slider state success " + JSON.stringify(pages));
        if (!("slider" == pages.name)) {
          console.info("get slider success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(3000);
          console.info("push slider page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push slider page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(2000);
      console.info("slider after each called");
    });
   /**
     * @tc.number      testSlider001
     * @tc.name        testSlider001
     * @tc.desc        trackThickness = 60
     * @tc.level       Level 3
     */
    it('testSlider001', Level.LEVEL1, async (done: Function) => {
      console.info('[testSlider001] START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('slider');
      console.info("[testSlider001] component strJson:" + strJson);
      console.info("[testSlider001] decoration:" + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.decoration).assertEqual(undefined);
      done();
    });

   /**
     * @tc.number      testSlider002
     * @tc.name        testSlider002
     * @tc.desc        trackThickness = 60
     * @tc.level       Level 3
     */
    it('testSlider002', Level.LEVEL1, async (done: Function) => {
      console.info('[testSlider002] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "decorationValue": Axis.Horizontal
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 196,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testSlider002] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testSlider002] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(4000);
      let strJson: string = getInspectorByKey('slider');
      console.info("[testSlider002] component strJson:" + strJson);
      console.info("[testSlider002] decoration:" + JSON.parse(strJson).$attrs.decoration);
      expect(JSON.parse(strJson).$attrs.decoration).assertEqual(undefined);
      done();
    });

   /**
     * @tc.number      testSlider003
     * @tc.name        testSlider003
     * @tc.desc        trackThickness = 60
     * @tc.level       Level 3
     */
    it('testSlider003', Level.LEVEL1, async (done: Function) => {
      console.info('[testSlider003] START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('slider');
      console.info("[testSlider003] component strJson:" + strJson);
      expect(JSON.parse(strJson).$attrs.value).assertEqual(undefined);
      done();
    });
   /**
     * @tc.number      testSlider004
     * @tc.name        testSlider004
     * @tc.desc        trackThickness = 60
     * @tc.level       Level 3
     */
    it('testSlider004', Level.LEVEL1, async (done: Function) => {
      console.info('[testSlider004] START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "value": "10",
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 196,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testSlider004] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testSlider004] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('slider');
      console.info("[testSlider004] component objNew is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.value).assertEqual(undefined);
      done();
    });

   /**
     * @tc.number      testSlider005
     * @tc.name        testSlider005
     * @tc.desc        trackThickness = 60
     * @tc.level       Level 3
     */
    it('testSlider005', Level.LEVEL1, async (done: Function) => {
      console.info('testSlider005 START');
      let strJson: string = getInspectorByKey('slider');
      console.info("testSlider005 component strJson:" + strJson);
      console.info("testSlider005 component obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.step).assertEqual(undefined);
      console.info('testSlider005 END');
      done();
    });

   /**
     * @tc.number      testSlider006
     * @tc.name        testSlider006
     * @tc.desc        trackThickness = 60
     * @tc.level       Level 3
     */
    it('testSlider006', Level.LEVEL1, async (done: Function) => {
      console.info('testSlider006 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "stepValue": "10",
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 196,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testSlider006 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("testSlider006 change component data error: " + (err as Error).message);
      }
      await Utils.sleep(4000);
      let strJsonNew: string = getInspectorByKey('slider');
      console.info("testSlider006 component objNew is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.step).assertEqual(undefined);
      console.info('testSlider006 END');
      done();
    });
  })
}