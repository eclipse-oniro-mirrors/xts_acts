
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
export default function appearJsunit() {
  describe('appearTest', () => {
    beforeEach(async (done: Function) => {
config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
      console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
	done();
});
    beforeAll(async (done: Function) => {
      console.info("appear beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/onAppear/appear'
      }
      try {
        router.clear();
        let pages: router.RouterState = router.getState();
        console.info("get appear state pages: " + JSON.stringify(pages));
        if (!("appear" == pages.name)) {
          console.info("get appear state pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push appear page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("appear after each called");
    })

    /**
     * @tc.name   testAppear01
     * @tc.number testAppear01
     * @tc.desc   testAppear01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAppear01', Level.LEVEL0, async (done: Function) => {
      console.info('[testAppear01] START');
      await CommonFunc.sleep(1000);
      try {
        let callBackAppear1 = (backData: events_emitter.EventData) => {
          console.info("testAppear01 get appearEvent result is: " + JSON.stringify(backData));
          expect(backData.data?.ACTION).assertEqual(false);
          done()
        }
        let appearEvent1: events_emitter.InnerEvent = {
          eventId: 58,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.on(appearEvent1, callBackAppear1);
      } catch (err) {
        console.info("testAppear01 on appearEvent err : " + JSON.stringify(err));
      }
      console.info("testAppear01 click result is: " + JSON.stringify(sendEventByKey('appear', 10, "")));
      await CommonFunc.sleep(1000);
      console.info('[testAppear01] END');

      console.info('[testAppear02] START');
      try {
        let callBackDisAppear = (backData1: events_emitter.EventData) => {
          console.info("testAppear02 get disAppearEvent result is: " + JSON.stringify(backData1));
          console.info("testAppear02 get backData1.data.ACTION result is: " + backData1.data?.ACTION);
          expect(backData1.data?.ACTION).assertEqual(true);
          done()
        }
        let disAppearEvent: events_emitter.InnerEvent = {
          eventId: 60,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.on(disAppearEvent, callBackDisAppear);
      } catch (err) {
        console.info("testAppear02 on disAppearEvent err : " + JSON.stringify(err));
      }

      await CommonFunc.sleep(1000);
      console.info('[testAppear03] START');
      let callBackAppear2 = (backData2: events_emitter.EventData) => {
        console.info("testAppear03 get appearEvent result is: " + JSON.stringify(backData2));
        console.info("testAppear03 get backData2.data.APPEAR: " + backData2.data?.APPEAR);
        expect(backData2.data?.APPEAR).assertEqual("appearStatusOn");
        done()
      }
      let appearEvent2: events_emitter.InnerEvent = {
        eventId: 59,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        console.info("testAppear03 appearEvent click result is: " + JSON.stringify(sendEventByKey('appear', 10, "")));
        events_emitter.on(appearEvent2, callBackAppear2);
      } catch (err) {
        console.info("testAppear03 on appearEvent err : " + JSON.stringify(err));
      }

    });
  })
}
