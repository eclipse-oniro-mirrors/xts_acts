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

let emitKey = "wholeWebPageDrawing0100";

export default function wholeWebPageDrawing() {
  describe('wholeWebPageDrawing', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/wholeWebPageDrawing',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get wholeWebPageDrawing state success " + JSON.stringify(pages));
        if (!("wholeWebPageDrawing" == pages.name)) {
          console.info("get wholeWebPageDrawing state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push wholeWebPageDrawing page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push wholeWebPageDrawing page error: " + err);
      }
      done();
    });
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("wholeWebPageDrawing beforeEach start");
      done();
    })
    afterEach(async (done: Function) => {
      console.info("wholeWebPageDrawing afterEach start:" + emitKey);
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
     *tc.number SUB_ACE_BASIC_ETS_WHOLEWEBPAGEDRAWING_API_0100
     *tc.name testWholeWebPageDrawing
     *tc.desc wholeWebPageDrawing
     */
    it('wholeWebPageDrawing0100', 0, async (done: Function) => {
      emitKey = "wholeWebPageDrawing0200";
      Utils.registerEvent("wholeWebPageDrawing0100", "hello", 2793, done);
      sendEventByKey('wholeWebPageDrawingButton', 10, '');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_WHOLEWEBPAGEDRAWING_API_0200
     *tc.name testWholeWebPageDrawing
     *tc.desc wholeWebPageDrawing
     */
    it('wholeWebPageDrawing0200', 0, async (done: Function) => {
      emitKey = "wholeWebPageDrawing0300";
      Utils.registerEvent("wholeWebPageDrawing0200", true, 2794, done);
      sendEventByKey('wholeWebPageDrawingButton', 10, '');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_WHOLEWEBPAGEDRAWING_API_0300
     *tc.name testWholeWebPageDrawing
     *tc.desc wholeWebPageDrawing
     */
    it('wholeWebPageDrawing0300', 0, async (done: Function) => {
      emitKey = "wholeWebPageDrawing0400";
      Utils.registerEvent("wholeWebPageDrawing0300", 100, 2795, done);
      sendEventByKey('wholeWebPageDrawingButton', 10, '');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_WHOLEWEBPAGEDRAWING_API_0400
     *tc.name testWholeWebPageDrawing
     *tc.desc wholeWebPageDrawing
     */
    it('wholeWebPageDrawing0400', 0, async (done: Function) => {
      emitKey = "wholeWebPageDrawing0500";
      Utils.registerEvent("wholeWebPageDrawing0400", 100, 2796, done);
      sendEventByKey('wholeWebPageDrawingButton', 10, '');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_WHOLEWEBPAGEDRAWING_API_0500
     *tc.name testWholeWebPageDrawing
     *tc.desc wholeWebPageDrawing
     */
    it('wholeWebPageDrawing0500', 0, async (done: Function) => {
      emitKey = "wholeWebPageDrawing0600";
      Utils.registerEvent("wholeWebPageDrawing0500", true, 2797, done);
      sendEventByKey('wholeWebPageDrawingButton', 10, '');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_WHOLEWEBPAGEDRAWING_API_0600
     *tc.name testWholeWebPageDrawing
     *tc.desc wholeWebPageDrawing
     */
    it('wholeWebPageDrawing0600', 0, async (done: Function) => {
      emitKey = "wholeWebPageDrawing0600";
      Utils.registerEvent("wholeWebPageDrawing0600", false, 2798, done);
      sendEventByKey('wholeWebPageDrawingButton', 10, '');
    })
  })
}