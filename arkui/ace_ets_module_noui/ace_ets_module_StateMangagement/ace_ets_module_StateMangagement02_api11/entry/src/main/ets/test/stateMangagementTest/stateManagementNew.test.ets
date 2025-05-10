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

import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import CommonFunc from '../../MainAbility/common/Common'

export default function stateManagementGetSharedJsunit() {
  describe('stateManagementGetSharedTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/stateMangagement/stateManagementNew',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get stateManagement state success " + JSON.stringify(pages));
        if (!("stateManagement" == pages.name)) {
          console.info("get stateManagement state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push stateManagement page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stateManagement page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("stateManagementGetShared after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         teststateManagementGetShared0001
     * @tc.desic         acestateManagementGetSharedEtsTest0001
     */
    it('teststateManagementGetShared0001', 0, async () => {
      console.info('stateManagementGetShared teststateManagementGetShared0001 START');
      await CommonFunc.sleep(2000);
      try {
        let EventOne: events_emitter.InnerEvent = {
          eventId: 60223,
          priority: events_emitter.EventPriority.LOW
        }
        let callbackOne = (eventData: events_emitter.EventData) => {
          console.info("teststateManagementGetShared_0001 get event state result is: " + JSON.stringify(eventData));
          expect(eventData.data?.Result).assertEqual(false);

        }
        console.info("GetShared_0001 click result is: " + JSON.stringify(sendEventByKey('GetSharedText', 10, "")));
        events_emitter.on(EventOne, callbackOne);
      } catch (err) {
        console.info("stateManagementGetShared0001 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('teststateManagementGetShared0001 END');
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         teststateManagementsetAndLink0001
     * @tc.desic         acestateManagementsetAndLinkEtsTest0001
     */
    it('teststateManagementsetAndLink0001', 0, async () => {
      console.info('stateManagementsetAndLink teststateManagementsetAndLink0001 START');
      await CommonFunc.sleep(1000);
      try {
        let EventTwo: events_emitter.InnerEvent = {
          eventId: 60224,
          priority: events_emitter.EventPriority.LOW
        }
        let callbackTwo = (eventData: events_emitter.EventData) => {
          console.info("teststateManagementsetAndLink_0001 get event state result is: " + JSON.stringify(eventData));
          expect(eventData.data?.Result).assertEqual("callback2");

        }
        console.info("setAndLink_0001 click result is: " + JSON.stringify(sendEventByKey('setAndLinkText', 10, "")));
        events_emitter.on(EventTwo, callbackTwo);
      } catch (err) {
        console.info("stateManagementsetAndLink0001 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('teststateManagementsetAndLink0001 END');
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         teststateManagementsetOrCreate0001
     * @tc.desic         acestateManagementsetOrCreateEtsTest0001
     */
    it('teststateManagementsetOrCreate0001', 0, async () => {
      console.info('stateManagementsetOrCreate teststateManagementsetOrCreate0001 START');
      await CommonFunc.sleep(1000);
      try {
        let EventThree: events_emitter.InnerEvent = {
          eventId: 60225,
          priority: events_emitter.EventPriority.LOW
        }
        let callbackThree = (eventData: events_emitter.EventData) => {
          console.info("teststateManagementsetOrCreate_0001 get event state result is: " + JSON.stringify(eventData));
          expect(eventData.data?.Result).assertEqual("callback3");

        }
        console.info("setOrCreate_0001 click result is: " + JSON.stringify(sendEventByKey('setOrCreateText', 10, "")));
        events_emitter.on(EventThree, callbackThree);
      } catch (err) {
        console.info("stateManagementsetOrCreate0001 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('teststateManagementsetOrCreate0001 END');

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         teststateManagementsetAndProp0001
     * @tc.desic         acestateManagementsetAndPropEtsTest0001
     */
    it('teststateManagementsetAndProp0001', 0, async () => {
      console.info('stateManagementsetAndProp teststateManagementsetAndProp0001 START');
      await CommonFunc.sleep(1000);
      try {
        let EventFour: events_emitter.InnerEvent = {
          eventId: 60226,
          priority: events_emitter.EventPriority.LOW
        }
        let callbackFour = (eventData: events_emitter.EventData) => {
          console.info("teststateManagementsetAndProp_0001 get event state result is: " + JSON.stringify(eventData));
          expect(eventData.data?.Result).assertEqual("callback4");

        }
        console.info("setAndProp_0001 click result is: " + JSON.stringify(sendEventByKey('setAndPropText', 10, "")));
        events_emitter.on(EventFour, callbackFour);
      } catch (err) {
        console.info("stateManagementsetAndProp0001 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('teststateManagementsetAndProp0001 END');
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         test_staticClear_0001
     * @tc.desc         delete the property
     */
    it('test_staticClear_0001', 0, async () => {
      console.info('test_staticClear_0001 Register a customized font in the FontManagerSTART');
      await CommonFunc.sleep(2000);
      try {
        let simple = AppStorage.staticClear();
        expect(simple).assertFalse();

      } catch (err) {
        console.info("test_font_registerFont_0001  err : " + JSON.stringify(err));
        expect(true).assertTrue();

      }
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         test_setAndLink_0001
     * @tc.desc         bind localStorage
    */
    it('test_setAndLink_0001', 0, async () => {
      console.info('test_setAndLink_0001 START');
      await CommonFunc.sleep(2000);
      try {
        let storage = new LocalStorage()
        storage.setAndLink<string>('storageSimpleProp', '121');
        let size = storage.size()
        expect(size == 1).assertTrue();

      } catch (err) {
        console.info("test_font_registerFont_0001  err : " + JSON.stringify(err));
        expect().assertFail();

      }
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0008
     * @tc.name         test_setAndProp_0002
     * @tc.desc         bind localStorage
     */
    it('test_setAndProp_0002', 0, async () => {
      console.info('test_setAndProp_0002 START');
      await CommonFunc.sleep(2000);
      try {
        let storage = new LocalStorage()
        storage.setAndProp<string>("setAndProp", '12');
        let size = storage.size();
        expect(size == 1).assertTrue();

      } catch (err) {
        console.info("test_setAndProp_0002  err : " + JSON.stringify(err));
        expect().assertFail();

      }
    });


  })
}
