/**
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

import { describe, beforeEach, afterEach, it, expect, beforeAll } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
// import router from '@system.router';
import router from '@ohos.router';
let emitKey = "certChainData01";
export default function certChainDataTest() {
  describe('certChainDataTest',  () =>{
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: "MainAbility/pages/certChainData"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get certChainData state success " + JSON.stringify(pages));
        if (!("certChainData" == pages.name)) {
          console.info("get certChainData state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push certChainData page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push certChainData page error: " + err);
      }
      done()
    });
    beforeEach(async  (done: Function) =>{
      await Utils.sleep(2000);
      console.info("certChainData beforeEach start");
      done();
    })
    afterEach(async  (done: Function) =>{
      console.info("certChainData afterEach start:"+emitKey);
      try {
        let backData: events_emitter.EventData = {
          data: {
            "ACTION": emitKey
          }
        }
        let backEvent: events_emitter.InnerEvent = {
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
     *tc.number SUB_ACE_CERTCHAINDATA_API_001
     *tc.name certChainData01
     *tc.desic test certChainData01 interface when choose callback mode.
     */
    it('certChainData01',0,async  (done: Function) =>{
      emitKey="certChainData01";
      Utils.registerEvent("certChainData01",true,202412099,done);
      sendEventByKey('certChainDataWeb',10,'');
    })



  })
}
