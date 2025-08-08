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
import { describe,  beforeEach, afterEach, it, expect,beforeAll } from "@ohos/hypium"
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';
import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.commonEvents.api11/EntryAbility';
export default function priorityGestureJsunit() {
  describe('priorityGestureTest', () => {
    beforeEach(async (done: Function) => {
config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
      console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
	done();
});
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TapGesture/priorityGesture',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get priorityGesture state success " + JSON.stringify(pages));
        if (!("priorityGesture" == pages.name)) {
          console.info("get priorityGesture state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await CommonFunc.sleep(1000);
          console.info("push priorityGesture page success");
        }
      } catch (err) {
        console.error("push priorityGesture page error");
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("priorityGesture after each called");
    });

    it('priorityGestureTest_0100', 0, async (done: Function) => {
      await CommonFunc.sleep(1000)
      let rect = CommonFunc.getComponentRect('tapGesture')
      console.info("priorityGestureTest_0100 rectInfo is " + JSON.stringify(rect));
      let x_value: number = rect.left + (rect.right - rect.left) / 2;
      let y_value: number = rect.top + (rect.bottom - rect.top) / 2;
      console.info("priorityGestureTest_0100 onTouch location is: " + "[x]=== " + x_value + "   [y]===" + y_value);
      let point: TouchObject = {
        id: 11,
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
      let callback = (eventData: events_emitter.EventData) => {
        console.info("priorityGestureTest_0100 get event state result is: " + JSON.stringify(eventData));
        expect(eventData.data?.value).assertEqual('gesture onAction')
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: 162,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(innerEvent, callback)
      } catch (err) {
        console.info("priorityGestureTest_0100 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('priorityGestureTest_0100 sendTouchEvent one:' + sendTouchEvent(point));
      await CommonFunc.sleep(1000)
      console.info('priorityGestureTest_0100 testSendTouchEvent END');
      done();
    });
  })
}