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

import { afterEach, beforeAll, beforeEach, describe, it, expect } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';

let emitKey = "emitGetSurfaceId0100";

export default function getSurfaceId() {
  describe('getSurfaceId', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/getSurfaceId',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getSurfaceId state success " + JSON.stringify(pages));
        if (!("getSurfaceId" == pages.name)) {
          console.info("get getSurfaceId state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push getSurfaceId page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getSurfaceId page error: " + err);
      }
      done();
    });
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("getSurfaceId beforeEach start");
      done();
    })
    afterEach(async (done: Function) => {
      console.info("getSurfaceId afterEach start:" + emitKey);
      try {
        let backData: events_emitter.EventData = {
          data: {
            "ACTION": emitKey
          }
        }
        let backEvent: events_emitter.InnerEvent = {
          eventId: 10,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("start send emitKey");
        events_emitter.emit(backEvent, backData);
      } catch (err) {
        console.info("emit emitKey  err: " + JSON.stringify(err));
      }
      await Utils.sleep(2000);
      done();
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_GETSURFACEID_API_0100
     *tc.name testGetSurfaceId
     *tc.desc getSurfaceId
     */
    it('emitGetSurfaceId0100', 0, async (done: Function) => {
      emitKey = "emitSetUrlTrustList0100";
      Utils.registerEvent("emitGetSurfaceId0100", true, 28930, done);
      sendEventByKey('getSurfaceIdButton', 10, '');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_SETURLTRUSTLIST_API_0100
     *tc.name testSetUrlTrustList
     *tc.desc SetUrlTrustList
     */
    it('emitSetUrlTrustList0100', 0, async (done: Function) => {
      emitKey = "emitSetUrlTrustList0200";
      Utils.registerEvent("emitSetUrlTrustList0100", 1, 28931, done);
      sendEventByKey('getSurfaceIdButton', 10, '');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_SETURLTRUSTLIST_API_0200
     *tc.name testSetUrlTrustList
     *tc.desc SetUrlTrustList
     */
    it('emitSetUrlTrustList0200', 0, async (done: Function) => {
      emitKey = "emitSetUrlTrustList0300";
      Utils.registerEvent("emitSetUrlTrustList0200", 1, 28932, done);
      sendEventByKey('getSurfaceIdButton', 10, '');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_SETURLTRUSTLIST_API_0300
     *tc.name testSetUrlTrustList
     *tc.desc SetUrlTrustList
     */
    it('emitSetUrlTrustList0300', 0, async (done: Function) => {
      emitKey = "emitSetUrlTrustList0400";
      Utils.registerEvent("emitSetUrlTrustList0300", 1, 28933, done);
      sendEventByKey('getSurfaceIdButton', 10, '');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_SETURLTRUSTLIST_API_0400
     *tc.name testSetUrlTrustList
     *tc.desc SetUrlTrustList
     */
    it('emitSetUrlTrustList0400', 0, async (done: Function) => {
      emitKey = "emitSetUrlTrustList0500";
      Utils.registerEvent("emitSetUrlTrustList0400", 1, 28934, done);
      sendEventByKey('getSurfaceIdButton', 10, '');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_SETURLTRUSTLIST_API_0500
     *tc.name testSetUrlTrustList
     *tc.desc SetUrlTrustList
     */
    it('emitSetUrlTrustList0500', 0, async (done: Function) => {
      emitKey = "emitSetUrlTrustList0600";
      Utils.registerEvent("emitSetUrlTrustList0500", 1, 28935, done);
      sendEventByKey('getSurfaceIdButton', 10, '');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_SETURLTRUSTLIST_API_0600
     *tc.name testSetUrlTrustList
     *tc.desc SetUrlTrustList
     */
    it('emitSetUrlTrustList0600', 0, async (done: Function) => {
      emitKey = "emitSetUrlTrustList0700";
      Utils.registerEvent("emitSetUrlTrustList0600", 1, 28936, done);
      sendEventByKey('getSurfaceIdButton', 10, '');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_SETURLTRUSTLIST_API_0700
     *tc.name testSetUrlTrustList
     *tc.desc SetUrlTrustList
     */
    it('emitSetUrlTrustList0700', 0, async (done: Function) => {
      emitKey = "emitGetSurfaceId0200";
      Utils.registerEvent("emitSetUrlTrustList0700", 1, 28937, done);
      sendEventByKey('getSurfaceIdButton', 10, '');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_GETSURFACEID_API_0200
     *tc.name testGetSurfaceId
     *tc.desc getSurfaceId
     */
    it('emitGetSurfaceId0200', 0, async (done: Function) => {
      emitKey = "emitGetSurfaceId0300";
      Utils.registerEvent("emitGetSurfaceId0200", "17100001", 28938, done);
      sendEventByKey('getSurfaceIdButton', 10, '');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_GETSURFACEID_API_0300
     *tc.name testGetSurfaceId
     *tc.desc getSurfaceId
     */
    it('emitGetSurfaceId0300', 0, async (done: Function) => {
      emitKey = "emitSetUrlTrustList0800";
      Utils.registerEvent("emitGetSurfaceId0300", "Init error. The WebviewController must be associated with a Web component", 28939, done);
      sendEventByKey('getSurfaceIdButton', 10, '');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_SETURLTRUSTLIST_API_0800
     *tc.name testSetUrlTrustList
     *tc.desc SetUrlTrustList
     */
    it('emitSetUrlTrustList0800', 0, async (done: Function) => {
      emitKey = "emitSetUrlTrustList0900";
      Utils.registerEvent("emitSetUrlTrustList0800", "17100001", 28940, done);
      sendEventByKey('getSurfaceIdButton', 10, '');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_SETURLTRUSTLIST_API_0900
     *tc.name testSetUrlTrustList
     *tc.desc SetUrlTrustList
     */
    it('emitSetUrlTrustList0900', 0, async (done: Function) => {
      emitKey = "emitSetUrlTrustList1000";
      Utils.registerEvent("emitSetUrlTrustList0900", "Init error. The WebviewController must be associated with a Web component", 28941, done);
      sendEventByKey('getSurfaceIdButton', 10, '');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_SETURLTRUSTLIST_API_1000
     *tc.name testSetUrlTrustList
     *tc.desc SetUrlTrustList
     */
    it('emitSetUrlTrustList1000', 0, async (done: Function) => {
      emitKey = "emitSetUrlTrustList1100";
      Utils.registerEvent("emitSetUrlTrustList1000", "401", 28942, done);
      sendEventByKey('getSurfaceIdButton', 10, '');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_SETURLTRUSTLIST_API_1100
     *tc.name testSetUrlTrustList
     *tc.desc SetUrlTrustList
     */
    it('emitSetUrlTrustList1100', 0, async (done: Function) => {
      emitKey = "emitSetUrlTrustList1200";
      Utils.registerEvent("emitSetUrlTrustList1100", 1, 28943, done);
      sendEventByKey('getSurfaceIdButton', 10, '');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_SETURLTRUSTLIST_API_1200
     *tc.name testSetUrlTrustList
     *tc.desc SetUrlTrustList
     */
    it('emitSetUrlTrustList1200', 0, async (done: Function) => {
      emitKey = "emitSetUrlTrustList1300";
      Utils.registerEvent("emitSetUrlTrustList1200", 1, 28944, done);
      sendEventByKey('getSurfaceIdButton', 10, '');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_SETURLTRUSTLIST_API_1300
     *tc.name testSetUrlTrustList
     *tc.desc SetUrlTrustList
     */
    it('emitSetUrlTrustList1300', 0, async (done: Function) => {
      emitKey = "emitSetUrlTrustList1400";
      Utils.registerEvent("emitSetUrlTrustList1300", 3, 28945, done);
      sendEventByKey('getSurfaceIdButton', 10, '');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_SETURLTRUSTLIST_API_1400
     *tc.name testSetUrlTrustList
     *tc.desc SetUrlTrustList
     */
    it('emitSetUrlTrustList1400', 0, async (done: Function) => {
      emitKey = "emitSetUrlTrustList1400";
      Utils.registerEvent("emitSetUrlTrustList1400", 3, 28946, done);
      sendEventByKey('getSurfaceIdButton', 10, '');
    })
  })
}