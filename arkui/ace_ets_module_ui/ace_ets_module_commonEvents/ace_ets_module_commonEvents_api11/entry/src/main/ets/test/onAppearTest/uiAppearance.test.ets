/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import CommonFunc from '../../MainAbility/common/Common'
import events_emitter from '@ohos.events.emitter';
import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.commonEvents.api11/EntryAbility';
export default function uiAppearanceALWAYS_DARKJsunit() {
  describe('uiAppearanceALWAYS_DARKTest', () => {
    beforeEach(async (done: Function) => {
config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
      console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
	done();
});
    beforeAll(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/onAppear/uiAppearance',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get uiAppearance state success " + JSON.stringify(pages));
        if (!("uiAppearance" == pages.name)) {
          console.info("get uiAppearance state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push uiAppearance page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push uiAppearance page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("uiAppearanceALWAYS_DARK after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testuiAppearanceALWAYS_DARK0001
     * @tc.desic         aceuiAppearanceALWAYS_DARKEtsTest0001
     */
    it('testuiAppearanceALWAYS_DARK0001', 0, async (done: Function) => {
      console.info('uiAppearanceALWAYS_DARK testuiAppearanceALWAYS_DARK0001 START');
      await CommonFunc.sleep(2000);
      try {
        let event: events_emitter.InnerEvent = {
          eventId: 60308,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (eventData: events_emitter.EventData) => {
          console.info("testuiAppearanceALWAYS_DARK0001 get event data is: " + JSON.stringify(eventData));
          expect(eventData.data?.Mode).assertEqual(0);
          console.info('testuiAppearanceALWAYS_DARK0001 END');
          done();
        }
        console.info("testuiAppearanceALWAYS_DARK0001 click result is: " + JSON.stringify(sendEventByKey('ALWAYS_DARKText', 10, "")));
        events_emitter.on(event, callback);
      } catch (err) {
        console.info("testuiAppearanceALWAYS_DARK0001 on events_emitter err : " + JSON.stringify(err));
      }
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testuiAppearanceALWAYS_LIGHT0001
     * @tc.desic         aceuiAppearanceALWAYS_LIGHTEtsTest0001
     */
    it('testuiAppearanceALWAYS_LIGHT0001', 0, async (done: Function) => {
      console.info('uiAppearanceALWAYS_LIGHT testuiAppearanceALWAYS_LIGHT0001 START');
      await CommonFunc.sleep(2000);
      try {
        let event: events_emitter.InnerEvent = {
          eventId: 60309,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (eventData: events_emitter.EventData) => {
          console.info("testuiAppearanceALWAYS_LIGHT0001 get event data is: " + JSON.stringify(eventData));
          expect(eventData.data?.Mode).assertEqual(1);
          console.info('testuiAppearanceALWAYS_LIGHT0001 END');
          done();
        }
        console.info("testuiAppearanceALWAYS_LIGHT0001 click result is: " + JSON.stringify(sendEventByKey('ALWAYS_LIGHTText', 10, "")));
        events_emitter.on(event, callback);
      } catch (err) {
        console.info("testuiAppearanceALWAYS_LIGHT0001 on events_emitter err : " + JSON.stringify(err));
      }
    });
  })
}
