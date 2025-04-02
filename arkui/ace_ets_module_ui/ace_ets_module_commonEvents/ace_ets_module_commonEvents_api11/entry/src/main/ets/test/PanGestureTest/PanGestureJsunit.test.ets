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

export default function PanGesture3Jsunit() {
  describe('PanGesture3Jsunit', () => {
    let x_value: number;
    let y_value: number;

    beforeEach(async (done: Function) => {
      console.info("PanGesture beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PanGesture/PanGesture',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PanGesture state pages:" + JSON.stringify(pages));
        if (!("PanGesture" == pages.name)) {
          console.info("get PanGesture state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push PanGesture page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PanGesture page error:" + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("PanGesture after each called");
    });

    it('testPanGesture01', 0, async (done: Function) => {
      console.info('[testPanGesture01] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "touchable": true,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 23,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testPanGesture01] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testPanGesture01] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      console.info('[testPanGesture01] END');
      done();
    });

    it('testPanGesture02', 0, async (done: Function) => {
      let rect = CommonFunc.getComponentRect('PanGesture')
      console.info("[testPanGesture02] rectInfo is " + JSON.stringify(rect));
      x_value = rect.left + (rect.right - rect.left) / 10
      y_value = rect.top + (rect.bottom - rect.top) / 10
      console.info("[testPanGesture02] onTouch location is: " + "[x]=== " + x_value + "   [y]===" + y_value);
      let point: TouchObject = {
        id: 1,
        x: x_value,
        y: y_value,
        type: TouchType.Move,
        displayX: 0,
        displayY: 0,
        windowX: 0,
        windowY: 0,
        screenX: 0,
        screenY: 0
      }
      let callbackTwo = (eventDataOne: events_emitter.EventData) => {
        console.info("[testPanGesture02] get event state result is: " + JSON.stringify(eventDataOne));
        expect(eventDataOne.data?.ACTION).assertEqual(true)
        expect(eventDataOne.data?.EVENT_TYPE).assertEqual('Move')
      }
      let innerEventTwo: events_emitter.InnerEvent = {
        eventId: 24,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(innerEventTwo, callbackTwo)
      } catch (err) {
        console.info("[testPanGesture02] on events_emitter err : " + JSON.stringify(err));
      }
      console.info('[testPanGesture02] testSendTouchEvent ' + sendTouchEvent(point));
      await CommonFunc.sleep(1000)
      console.info('[testPanGesture02] END');
      done();
    });
  })
}
