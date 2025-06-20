/*
 * Copyright (c) 2022~2023 Huawei Device Co., Ltd.
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

import { afterEach, beforeEach,beforeAll, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

let emitKey = "emitSetHttpDnsSuccessAuto";

export default function WebSafeLoadOneTest() {
  describe('WebSafeLoadOneTest', () => {
      beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
          url: 'testability/pages/webSafeLoadOne',
        }

        try {
          await Utils.sleep(1000)
          router.clear();
          let pages = router.getState();
          console.info("get webSafeLoadOne state success " + JSON.stringify(pages));
          if (!("webSafeLoadOne" == pages.name)) {
            console.info("get webSafeLoadOne state success " + JSON.stringify(pages.name));
            let result = await router.pushUrl(options);
            await Utils.sleep(1000);
            console.info("push webSafeLoadOne state success " + JSON.stringify(result));
          }
        } catch (err) {
          console.error("push webSafeLoadOne page error:" + err);
        }
        done()
      });



    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })
    afterEach(async (done: Function) => {
      console.info("web afterEach start:" + emitKey);
      try {
        let backData: events_emitter.EventData = {
          data: {
            "ACTION": emitKey
          }
        };
        let backEvent: events_emitter.InnerEvent = {
          eventId: 100,
          priority: events_emitter.EventPriority.LOW
        };
        console.info("start send emitKey");
        events_emitter.emit(backEvent, backData);
      } catch (err) {
        console.info("emit emitKey  err: " + JSON.stringify(err));
      }
      await Utils.sleep(2000);
      done();
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_057                                                                                                                                                
     *tc.name SetHttpDnsSuccessAuto                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('SetHttpDnsSuccessAuto', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitSetHttpDnsSuccessOff";
      Utils.registerEvent("SetHttpDnsSuccessAuto", "Example Domain", 518, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_058                                                                                                                                             
     *tc.name SetHttpDnsSuccessOff                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('SetHttpDnsSuccessOff', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetCustomUserAgent";
      Utils.registerEvent("SetHttpDnsSuccessOff", "Example Domain", 519, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
      *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_061                                                                                                                                                              
      *tc.name getCustomUserAgent                                                                                                                                                                                                                
      *tc.desic Save current page
      */
    it('GetCustomUserAgent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetCustomUserAgent";
      Utils.registerEvent("GetCustomUserAgent", "userAgent", 522, done);
      sendEventByKey('webcomponent', 10, '');
    })
  })
}
