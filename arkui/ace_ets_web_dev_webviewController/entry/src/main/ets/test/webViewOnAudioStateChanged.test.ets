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
let emitKey = "emitAudioStatePlay";
export default function webViewOnAudioStateChanged() {
  describe('ActsAceWebDevWebViewOnAudioStateChangedTest', function () {
    beforeAll(async function (done) {
      let options = {
        uri: 'MainAbility/pages/webViewOnAudioStateChanged',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewOnAudioStateChanged state success " + JSON.stringify(pages));
        if (!("webViewOnAudioStateChanged" == pages.name)) {
          console.info("get webViewOnAudioStateChanged state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push webViewOnAudioStateChanged page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewOnAudioStateChanged page error: " + err);
      }
      done()
    });
    beforeEach(async function (done) {
      await Utils.sleep(2000);
      console.info("webViewOnAudioStateChanged beforeEach start");
      done();
    })
    afterEach(async function (done) {
      console.info("webViewOnAudioStateChanged afterEach start:" + emitKey);
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
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWAUDIOSTATE_API_0100
     *tc.name testOnAudioStateChangedPlay
     *tc.desc test interface of onaudiostatechanged with audio play
     */
    it('testOnAudioStateChangedPlay',0,async function(done){
      emitKey="emitAudioStatePause";
      Utils.registerEvent("testOnAudioStateChangedPlay",true,411,done);
      Utils.registerEvent("testOnAudioStateChangedPlay","false",412,done);
      sendEventByKey('webViewOnAudioStateChanged',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWAUDIOSTATE_API_0200
     *tc.name testOnAudioStateChangedPause
     *tc.desc test interface of onaudiostatechanged with audio pause
     */
    it('testOnAudioStateChangedPause',0,async function(done){
      emitKey="emitAudioStatePause";
      Utils.registerEvent("testOnAudioStateChangedPause",false,413,done);
      Utils.registerEvent("testOnAudioStateChangedPause","true",414,done);
      sendEventByKey('webViewOnAudioStateChanged',10,'');
    })
  })
}