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
let emitKey = "emitOnHttpErrorReceiveFixedUserAgent";
export default function webViewONHttpErrorReceive() {
  describe('ActsAceWebDevWebViewONHttpErrorReceiveTest', function () {
    beforeAll(async function (done) {
      let options = {
        uri: 'MainAbility/pages/webViewONHttpErrorReceive',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewONHttpErrorReceive state success " + JSON.stringify(pages));
        if (!("webViewONHttpErrorReceive" == pages.name)) {
          console.info("get webViewONHttpErrorReceive state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push webViewONHttpErrorReceive page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewONHttpErrorReceive page error: " + err);
      }
      done()
    });
    beforeEach(async function (done) {
      await Utils.sleep(2000);
      console.info("webViewONHttpErrorReceive beforeEach start");
      done();
    })
    afterEach(async function (done) {
      console.info("webViewONHttpErrorReceive afterEach start:" + emitKey);
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
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERRORRECV_API_0100
     *tc.name testOnHttpErrorReceiveFixedUserAgent
     *tc.desc test interface of onHttpErrorReceive with parameter fixed userAgent
     */
    it('testOnHttpErrorReceiveFixedUserAgent',0,async function(done){
      emitKey="emitOnHttpErrorReceiveFixedUserAgent";
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgent","http://1.1.1.123/index.html",362,done);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgent",true,364,done);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgent",false,366,done);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgent",false,368,done);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgent","GET",370,done);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgent",'""',372,done);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgent","utf-8",374,done);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgent","text/html",376,done);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgent",403,378,done);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgent","Forbidden",380,done);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgent","User-Agent",382,done);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgent","Mozilla/5.0 (X11; Linux aarch64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.88 Mobile Safari/537.36",384,done);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgent","X-Frame-Options",386,done);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgent","SAMEORIGIN",388,done);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgent","Direct IP access not allowed | Cloudflare",390,done);
      sendEventByKey('webViewONHttpErrorReceive',10,'');
    })
  })
}