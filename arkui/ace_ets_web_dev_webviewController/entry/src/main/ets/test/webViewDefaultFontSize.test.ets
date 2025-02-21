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
let emitKey = "emitdefaultFontSize73AndminFontSize1";
export default function webViewDefaultFontSize() {
  describe('ActsAceWebDevWebViewDefaultFontSizeTest', function () {
    beforeAll(async function (done) {
      let options = {
        uri: 'MainAbility/pages/webViewDefaultFontSize',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewDefaultFontSize state success " + JSON.stringify(pages));
        if (!("webViewDefaultFontSize" == pages.name)) {
          console.info("get webViewDefaultFontSize state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push webViewDefaultFontSize page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewDefaultFontSize page error: " + err);
      }
      done()
    });
    beforeEach(async function (done) {
      await Utils.sleep(2000);
      console.info("webViewDefaultFontSize beforeEach start");
      done();
    })
    afterEach(async function (done) {
      console.info("webViewDefaultFontSize afterEach start:" + emitKey);
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
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWPATR6_API_0200
     *tc.name testDefaultFontSize73AndMinFontSize1
     *tc.desc test with defaultfontsize 73 and minfontsize 1
     */
    it('testDefaultFontSize73AndMinFontSize1',0,async function(done){
      emitKey="emitdefaultFontSize73AndminFontSize73";
      Utils.registerEvent("testDefaultFontSize73AndMinFontSize1","72px",332,done);
      sendEventByKey('webViewDefaultFontSize',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWPATR6_API_0300
     *tc.name testDefaultFontSize73AndMinFontSize73
     *tc.desc test with defaultfontsize 73 and minfontsize 73
     */
    it('testDefaultFontSize73AndMinFontSize73',0,async function(done){
      emitKey="emitdefaultFontSize73AndminFontSize73";
      Utils.registerEvent("testDefaultFontSize73AndMinFontSize73","72px",334,done);
      sendEventByKey('webViewDefaultFontSize',10,'');
    })
  })
}