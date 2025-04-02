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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils.ets';
import router from '@system.router';
let emitKey = "emitRunJsCallback";
export default function runJavaScript() {
  describe('ActsAceWebControllerTest2', function () {
    beforeAll(async function (done) {
      let options = {
        uri: "MainAbility/pages/runJavaScript"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get runJavaScript state success " + JSON.stringify(pages));
        if (!("runJavaScript" == pages.name)) {
          console.info("get runJavaScript state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push runJavaScript page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push runJavaScript page error: " + err);
      }
      await Utils.sleep(2000);
      done()
    })
    beforeEach(async function (done) {
      console.info("web beforeEach start");
      done();
    })
    afterEach(async function (done) {
      console.info("ActsAceWebControllerTest afterEach start:"+emitKey);
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
      console.info("ActsAceWebControllerTest afterEach end");
      done();
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_RUNJAVASCRIPT_API_001
     *tc.name RunJsCallback
     *tc.desic test RunJavascrit interface when choose callback mode.
     */
    it('RunJsCallback',0,async function(done){
      emitKey="emitRunJsPromise";
      Utils.registerEvent("testRunJsCallback",'testRunJavaScript',126,done);
      sendEventByKey('webcomponent01',10,'');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_RUNJAVASCRIPT_API_002
     *tc.name RunJsPromise
     *tc.desic test RunJavascrit interface when choose promise mode.
     */
    it('RunJsPromise',0,async function(done){
      Utils.registerEvent("testRunJsPromise",'\"testRunJavaScript\"',128,done);
      sendEventByKey('webcomponent01',10,'');
    })
  })
}
