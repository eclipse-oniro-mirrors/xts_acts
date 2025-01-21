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
import { afterEach, beforeAll, beforeEach, describe, it, expect } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
// @ts-nocheck
let emitKey = ""

export default function ActsAceWebSafeBrowsing() {
  describe('ActsAceWebSafeBrowsing', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'MainAbility/pages/webSafeBrowsing',
      }

      try {
        await Utils.sleep(1000)
        router.clear();
        let pages = router.getState();
        console.info("get webSafeBrowsing state success " + JSON.stringify(pages));
        if (!("webSafeBrowsing" == pages.name)) {
          console.info("get webSafeBrowsing state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(1000);
          console.info("push webSafeBrowsing state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webSafeBrowsing page error:" + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      done();
    })

    afterEach(async (done: Function) => {
      try {
        let backData: events_emitter.EventData = {
          data: {
            "ACTION": emitKey
          }
        }
        let backEvent : events_emitter.InnerEvent = {
          eventId: 10,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("start send emitKey");
        events_emitter.emit(backEvent, backData);
      } catch (err) {
        console.error("emit emitKey error:" + JSON.stringify(err));
      }
      await Utils.sleep(1000);
      done();
    })

    /*
     *@tc.number SUB_ACE_WEB_SAFEBROWSING_API_0001
     *@tc.name testEnableSafeBrowsingTrue
     *@tc.desc test EnableSafeBrowsingTrue
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testEnableSafeBrowsingTrue', 0, async (done: Function) => {
      emitKey = "emitEnableSafeBrowsingTrue"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testEnableSafeBrowsingTrue", true, 2001, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SAFEBROWSING_API_0002
     *@tc.name testEnableSafeBrowsingFalse
     *@tc.desc test EnableSafeBrowsingFalse
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testEnableSafeBrowsingFalse', 0, async (done: Function) => {
      emitKey = "emitEnableSafeBrowsingFalse"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testEnableSafeBrowsingFalse", true, 2002, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SAFEBROWSING_API_0003
     *@tc.name testIsSafeBrowsingEnabledTrue
     *@tc.desc test IsSafeBrowsingEnabledTrue
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testIsSafeBrowsingEnabledTrue', 0, async (done: Function) => {
      emitKey = "emitIsSafeBrowsingEnabledTrue"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testIsSafeBrowsingEnabledTrue", true, 2003, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SAFEBROWSING_API_0004
     *@tc.name testIsSafeBrowsingEnabledFalse
     *@tc.desc test IsSafeBrowsingEnabledFalse
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testIsSafeBrowsingEnabledFalse', 0, async (done: Function) => {
      emitKey = "emitIsSafeBrowsingEnabledFalse"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testIsSafeBrowsingEnabledFalse", true, 2004, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

  })
}
