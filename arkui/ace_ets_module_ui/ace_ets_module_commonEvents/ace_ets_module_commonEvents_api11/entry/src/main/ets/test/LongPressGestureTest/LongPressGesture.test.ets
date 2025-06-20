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
import { describe, beforeEach, afterEach, it, expect,beforeAll, Level } from '@ohos/hypium';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../MainAbility/common/Common';
import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.commonEvents.api11/EntryAbility';

export default function longPressGestureJsunit() {
  describe('longPressGestureJsunit', () => {
    beforeEach(async (done: Function) => {
config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
      console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
	done();
});
    beforeAll(async (done: Function) => {
      console.info("longPressGesture beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/LongPressGesture/longPressGesture',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get longPressGesture state pages:" + JSON.stringify(pages));
        if (!("longPressGesture" == pages.name)) {
          console.info("get longPressGesture state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push longPressGesture page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push longPressGesture page error:" + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("longPressGesture after each called");
    });

    it('testLongPressGesture01', Level.LEVEL0, async (done: Function) => {
      console.info('[testLongPressGesture01] START');
      await CommonFunc.sleep(1000);
      let callback = (eventData: events_emitter.EventData) => {
        console.info("testLongPressGesture01 get event state result is: " + JSON.stringify(eventData));
        expect(eventData.data?.ACTION).assertEqual('onAction')
        done();
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: 125,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        console.info("testLongPressGesture01 on events_emitter on");
        events_emitter.on(innerEvent, callback)
      } catch (err) {
        console.info("testLongPressGesture01 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("testLongPressGesture01 sendEventByKey result: " + JSON.stringify(sendEventByKey('flex', 11, "")));
      await CommonFunc.sleep(1000);
      console.info('testLongPressGesture01 END');
      done();
    });

    it('testLongPressGesture02', Level.LEVEL0, async (done: Function) => {
      console.info('[testLongPressGesture02] START');
      await CommonFunc.sleep(1000);
      let callback = (eventData: events_emitter.EventData) => {
        console.info("testLongPressGesture02 get event state result is: " + JSON.stringify(eventData));
        expect(eventData.data?.ACTION).assertEqual('onActionEnd')
        done();
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: 126,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        console.info("testLongPressGesture02 on events_emitter on");
        events_emitter.on(innerEvent, callback)
      } catch (err) {
        console.info("testLongPressGesture02 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("testLongPressGesture02 sendEventByKey result: " + JSON.stringify(sendEventByKey('flex', 11, "")));
      await CommonFunc.sleep(1000);
      console.info('testLongPressGesture02 END');
    });
  })
}
