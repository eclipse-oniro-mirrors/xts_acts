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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
// import router from '@system.router';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = "emitStoreWebArchiveCallback";  
export default function storeWebArchive() {
  describe('ActsAceWebControllerTest1',  () =>{
    beforeAll(async  (done: Function) => {
      let options: router.RouterOptions = {
        url: "testability/pages/storeWebArchive"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get storeWebArchive state success " + JSON.stringify(pages));
        if (!("storeWebArchive" == pages.name)) {
          console.info("get storeWebArchive state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push storeWebArchive page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push storeWebArchive page error: " + err);
      }
      await Utils.sleep(2000);
      done()
    })
    beforeEach(async  (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })
    afterEach(async (done: Function) =>{
      console.info("ActsAceWebControllerTest afterEach start:"+emitKey);
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
      console.info("ActsAceWebViewOnWindowNewJsunitTest afterEach end");
      done();
    })


      /*
     *tc.number SUB_ACE_BASIC_ETS_STOREWEBARCHIVE_API_003
     *tc.name testStoreWebArchiveCallback
     *tc.desic test storeWebArchive interface when choose Callback mode and autoName parameter is ture.
     */
    it('testStoreWebArchiveCallback',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitStoreWebArchiveCallbackFalse";
      Utils.registerEvent("testStoreWebArchiveCallback","/data/storage/el2/base/index.html.mht",130,done);
      sendEventByKey('webcomponent02',10,'');
    })

      /*
     *tc.number SUB_ACE_BASIC_ETS_STOREWEBARCHIVE_API_004
     *tc.name testStoreWebArchiveCallbackFalse
     *tc.desic test storeWebArchive interface when choose Callback mode and autoName parameter is false.
     */
    it('testStoreWebArchiveCallbackFalse',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitStoreWebArchivePromise";
      Utils.registerEvent("testStoreWebArchiveCallbackFalse","/data/storage/el2/base/index.html.mht",132,done);
      sendEventByKey('webcomponent02',10,'');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_STOREWEBARCHIVE_API_005
     *tc.name testStoreWebArchivePromise
     *tc.desic test storeWebArchive interface when choose Promise mode and autoName parameter is ture.
     */
    it('testStoreWebArchivePromise',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitStoreWebArchivePromiseFlase";
      Utils.registerEvent("testStoreWebArchivePromise","/data/storage/el2/base/index.html-0.mht",134,done);
      sendEventByKey('webcomponent02',10,'');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_STOREWEBARCHIVE_API_006
     *tc.name testStoreWebArchivePromiseFalse
     *tc.desic test storeWebArchive interface when choose Promise mode and autoName parameter is false.
     */
    it('testStoreWebArchivePromiseFalse',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.registerEvent("testStoreWebArchivePromiseFalse","/data/storage/el2/base/index.html-2.mht",136,done);
      sendEventByKey('webcomponent02',10,'');
    })
  })
}