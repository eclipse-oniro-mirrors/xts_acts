/*
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import Utils from '../../MainAbility/common/Utils'
import events_emitter from '@ohos.events.emitter';

export default function promptShowDialogJsunit() {
  describe('promptShowDialogTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/promptAction/prompt1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get prompt state success " + JSON.stringify(pages));
        if (!("prompt1" == pages.name)) {
          console.info("get prompt state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push prompt page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push prompt page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("promptShowDialog after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_001
     * @tc.name         testpromptShowDialog001
     * @tc.desic         acepromptShowDialogEtsTest001
     */
    it('testpromptShowDialog001', 0, async () => {
      console.info('promptShowDialog testpromptShowDialog001 START');
      await Utils.sleep(1000);
      try {
        let innerEventOne: events_emitter.InnerEvent = {
          eventId: 60220,
          priority: events_emitter.EventPriority.LOW
        }
        let callback1 = (eventData: events_emitter.EventData) => {
          console.info("testpromptShowDialog001 get event state result is: " + JSON.stringify(eventData));
          expect(eventData.data?.STATUS).assertEqual(true);

        }
        console.info("onSelect_001 click result is: " + JSON.stringify(sendEventByKey('showDialogText', 10, "")));
        events_emitter.on(innerEventOne, callback1);
      } catch (err) {
        console.info("testpromptShowDialog001 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testpromptShowDialog001 END');
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_002
     * @tc.name         testshowActionMenu0001
     * @tc.desic         aceshowActionMenuEtsTest0001
     */
    it('testshowActionMenu0001', 0, async () => {
      console.info('promptShowDialog testshowActionMenu0001 START');
      await Utils.sleep(1000);
      try {
        let innerEventTwo: events_emitter.InnerEvent = {
          eventId: 60221,
          priority: events_emitter.EventPriority.LOW
        }
        let callback2 = (backData1: events_emitter.EventData) => {
          console.info("onRequestPopupData_0011 get event state result is: " + JSON.stringify(backData1));
          expect(backData1.data?.STATUS).assertEqual(true);

        }
        console.info("onSelect_002 click result is: " + JSON.stringify(sendEventByKey('showActionMenuText', 10, "")));
        events_emitter.on(innerEventTwo, callback2);
      } catch (err) {
        console.info("onRequestPopupData_0011 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testshowActionMenu0001 END');
    });
  })
}
