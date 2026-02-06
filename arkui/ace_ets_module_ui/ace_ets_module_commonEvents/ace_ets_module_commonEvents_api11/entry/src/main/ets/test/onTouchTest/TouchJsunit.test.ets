
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
import events_emitter from '@ohos.events.emitter'
import CommonFunc from '../../MainAbility/common/Common';
import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.commonEvents.api11/EntryAbility';
export default function touchJsunit() {
  describe('touchTest', () => {
    beforeEach(async (done: Function) => {
config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
      console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
	done();
});
    beforeAll(async (done: Function) => {
      console.info("touch beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/onTouch/touch',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get touch state pages: " + JSON.stringify(pages));
        if (!("touch" == pages.name)) {
          console.info("get touch state pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push touch page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("touch after each called");
    })

    it('testTouch01', Level.LEVEL0, async (done: Function) => {
      console.info('[testTouch01] START');
      await CommonFunc.sleep(1000);
      try {
        let callBackTouch = (backData: events_emitter.EventData) => {
          console.info("testTouch01 get backEvent result is: " + JSON.stringify(backEvent));
          console.info("testTouch01 get flag result is: " + JSON.stringify(backData.data?.ACTION));
          expect(backData.data?.ACTION).assertEqual(true);
          done()
        }
        let backEvent: events_emitter.InnerEvent = {
          eventId: 43,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.on(backEvent, callBackTouch);
      } catch (err) {
        console.info("testTouch01 on touchEvent err : " + JSON.stringify(err));
      }
      console.info("testTouch01 click result is: " + JSON.stringify(sendEventByKey('touch', 10, "")));
      console.info('[testTouch01] END');
    });
  })
}
