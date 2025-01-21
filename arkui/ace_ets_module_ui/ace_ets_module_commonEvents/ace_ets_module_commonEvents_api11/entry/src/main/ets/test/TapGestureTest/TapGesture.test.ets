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

export default function tapGestureTest() {
  describe('tapGestureTest', () => {
    beforeEach(async (done: Function) => {
      console.info("tapGesture beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TapGesture/tapGesture',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get tapGesture state pages:" + JSON.stringify(pages));
        if (!("tapGesture" == pages.name)) {
          console.info("get tapGesture state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push tapGesture page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tapGesture page error:" + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("tapGesture after each called");
    });

    it('testTapGesture01', 0, async (done: Function) => {
      await CommonFunc.sleep(1000)
      let rect = CommonFunc.getComponentRect('tapGesture')
      console.info("[testTapGesture01] rectInfo is " + JSON.stringify(rect));
      let x_value: number = rect.left + (rect.right - rect.left) / 2;
      let y_value: number = rect.top + (rect.bottom - rect.top) / 2;
      let x_value_two: number = rect.left + (rect.right - rect.left) / 20;
      let y_value_two: number = rect.top + (rect.bottom - rect.top) / 20;
      console.info("[testTapGesture01] onTouch location is: " + "[x]=== " + x_value + "   [y]===" + y_value);
      let point: TouchObject = {
        id: 1,
        x: x_value,
        y: y_value,
        type: TouchType.Move,
        screenX: 0,
        screenY: 0,
        windowX: 0,
        windowY: 0,
        displayX: 0,
        displayY: 0
      }
      let point2: TouchObject = {
        id: 2,
        x: x_value_two,
        y: y_value_two,
        type: TouchType.Move,
        screenX: 0,
        screenY: 0,
        windowX: 0,
        windowY: 0,
        displayX: 0,
        displayY: 0
      }
      let callback = (eventData: events_emitter.EventData) => {
        console.info("[testTapGesture01] get event state result is: " + JSON.stringify(eventData));
        expect(eventData.data?.ACTION).assertEqual(true)
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: 214,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(innerEvent, callback)
      } catch (err) {
        console.info("[testTapGesture01] on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testTapGesture01 sendTouchEvent one:' + sendTouchEvent(point));
      console.info('testTapGesture01 sendTouchEvent two:' + sendTouchEvent(point2));
      await CommonFunc.sleep(1000)
      console.info('[testClickEvent001] testSendTouchEvent END');
      done();
    });

  })
}
