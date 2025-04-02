
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import Utils from './Utils';
import events_emitter from '@ohos.events.emitter';

export default function touchAbleJsunit() {
  describe('touchAbleTest', () => {
    beforeEach(async (done:Function) => {
      console.info("touchAble beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/touchAble'
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get touchAble state pages:" + JSON.stringify(pages));
        if (!("touchAble" == pages.name)) {
          console.info("get touchAble state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push touchAble page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push touchAble page error:" + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("touchAble after each called");
    });

    it('testTouchAble001', 0, async () => {
      await Utils.sleep(1000)
      let strJson: string = getInspectorByKey('ellipse');
      console.info("[testTouchAble001] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.focusable).assertEqual(false);
    });

    it('testTouchAble002', 0, async (done:Function) => {
      await Utils.sleep(1000);
      let callbackTwo = (eventData: events_emitter.EventData) => {
        console.info("[testTouchAble002] get event state result is: " + JSON.stringify(eventData));
        expect(eventData.data?.ACTION).assertEqual('Ellipse Clicked')
        console.info('[testTouchAble002] END');
        done()
      }
      let innerEventTwo: events_emitter.InnerEvent = {
        eventId: 237,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(innerEventTwo, callbackTwo)
      } catch (err) {
        console.info("[testTouchAble002] on events_emitter err : " + JSON.stringify(err));
      }
      console.info("testClickEvent002 click result is: " + JSON.stringify(sendEventByKey('ellipse', 10, "")));
    });
  })
}