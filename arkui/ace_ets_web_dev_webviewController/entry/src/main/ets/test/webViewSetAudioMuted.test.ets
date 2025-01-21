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
let emitKey = "emitSetAudioMuted";
export default function webViewSetAudioMuted() {
  describe('ActsAceWebDevWebViewSetAudioMutedTest', function () {
    beforeAll(async function (done) {
      let options = {
        uri: 'MainAbility/pages/webViewSetAudioMuted',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewSetAudioMuted state success " + JSON.stringify(pages));
        if (!("webViewSetAudioMuted" == pages.name)) {
          console.info("get webViewSetAudioMuted state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push webViewSetAudioMuted page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewSetAudioMuted page error: " + err);
      }
      done()
    });
    beforeEach(async function (done) {
      await Utils.sleep(2000);
      console.info("webViewSetAudioMuted beforeEach start");
      done();
    })
    afterEach(async function (done) {
      console.info("webViewSetAudioMuted afterEach start:" + emitKey);
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
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWMUTED_API_0100
     *tc.name testSetAudioMuted
     *tc.desc test interface of setaudiomuted with muted true
     */
    it('testSetAudioMuted',0,async function(done){
      emitKey="emitSetAudioDisMuted";
      Utils.registerEvent("testSetAudioMuted","true",405,done);
      Utils.registerEvent("testSetAudioMuted",'"muted"',406,done);
      sendEventByKey('webViewSetAudioMuted',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWMUTED_API_0200
     *tc.name testSetAudioDisMuted
     *tc.desc test interface of setaudiomuted with muted false
     */
    it('testSetAudioDisMuted',0,async function(done){
      emitKey="emitSetAudioDisMuted";
      Utils.registerEvent("testSetAudioDisMuted","false",407,done);
      Utils.registerEvent("testSetAudioDisMuted",'"unmuted"',408,done);
      sendEventByKey('webViewSetAudioMuted',10,'');
    })
  })
}