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
let emitKey = "emitOnsslerroreventreceive";
export default function webViewOnSslError() {
  describe('ActsAceWebDevWebViewOnSslErrorTest', function () {
    beforeAll(async function (done) {
      let options = {
        uri: 'MainAbility/pages/webViewOnSslError',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewOnSslError state success " + JSON.stringify(pages));
        if (!("webViewOnSslError" == pages.name)) {
          console.info("get webViewOnSslError state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push webViewOnSslError page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewOnSslError page error: " + err);
      }
      done()
    });
    beforeEach(async function (done) {
      await Utils.sleep(2000);
      console.info("webViewOnSslError beforeEach start");
      done();
    })
    afterEach(async function (done) {
      console.info("webViewOnSslError afterEach start:" + emitKey);
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
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWPATR4_API_0100
     *tc.name testOnsslerroreventreceive
     *tc.desc onsslerroreventreceive after load http://http.badssl.com/
     */
    it('testOnsslerroreventreceive',0,async function(done){
      emitKey="emitOnsslerroreventreceive";
      Utils.registerEvent("testOnsslerroreventreceive","1",320,done);
      sendEventByKey('webViewOnSslError',10,'');
    })
  })
}