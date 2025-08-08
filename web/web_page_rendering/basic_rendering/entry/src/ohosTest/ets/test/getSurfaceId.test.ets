/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { beforeAll,afterEach, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';

let emitKey = "emitGetSurfaceId0100";

export default function getSurfaceId() {
  describe('getSurfaceId', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/getSurfaceId',
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
    it('emitGetSurfaceId0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetSurfaceId0200";
      Utils.registerEvent("emitGetSurfaceId0100", true, 28930, done);
      sendEventByKey('getSurfaceIdButton', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_GETSURFACEID_API_0200
     *tc.name testGetSurfaceId
     *tc.desc getSurfaceId
     */
    it('emitGetSurfaceId0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetSurfaceId0300";
      Utils.registerEvent("emitGetSurfaceId0200", "17100001", 28938, done);
      sendEventByKey('getSurfaceIdButton', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_GETSURFACEID_API_0300
     *tc.name testGetSurfaceId
     *tc.desc getSurfaceId
     */
    it('emitGetSurfaceId0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetWebIdTwo";
      Utils.registerEvent("emitGetSurfaceId0300", "Init error. The WebviewController must be associated with a Web component", 28939, done);
      sendEventByKey('getSurfaceIdButton', 10, '');
    })
  })
}
