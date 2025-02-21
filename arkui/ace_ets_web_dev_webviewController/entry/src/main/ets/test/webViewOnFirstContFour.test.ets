/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import {describe, beforeEach, afterEach, it, expect, beforeAll} from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils.ets';
import router from '@system.router';
// @ts-nocheck
let emitKey = "emitRefreshOnfirstcontentfulpaint";
export default function webViewOnFirstContFour() {
  describe('ActsAceWebDevWebViewOnFirstContFourTest', function () {
    beforeAll(async function (done) {
      let options = {
        uri: 'MainAbility/pages/webViewOnFirstContFour',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewOnFirstContFour state success " + JSON.stringify(pages));
        if (!("webViewOnFirstContFour" == pages.name)) {
          console.info("get webViewOnFirstContFour state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push webViewOnFirstContFour page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewOnFirstContFour page error: " + err);
      }
      done()
    });
    beforeEach(async function (done) {
      await Utils.sleep(2000);
      console.info("webViewOnFirstContFour beforeEach start");
      done();
    })
    afterEach(async function (done) {
      console.info("webViewOnFirstContFour afterEach start:" + emitKey);
      try {
            let backData = {
                data: {
                    "ACTION": emitKey
                }
            }
            let backEvent = {
                eventId:10,
                priority:events_emitter.EventPriority.LOW
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
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWPATR5_API_0400
     *tc.name testOnfirstcontentfulpaintrefresh
     *tc.desc onfirstcontentfulpaint with web refresh
     */
    it('testOnfirstcontentfulpaintrefresh',0,async function(done){
      emitKey="emitRefreshOnfirstcontentfulpaint";
      Utils.registerEvent("testOnfirstcontentfulpaintrefresh",true,328,done);
      sendEventByKey('webViewOnFirstContFour',10,'');
    })
  })
}