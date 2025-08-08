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
let emitKey = "emitOnPageVisibleLoadUrl";
export default function webViewOnWindowNewJsunit() {
  describe('ActsAceWebViewOnWindowNewJsunitTest',  () =>{
    beforeAll(async  (done: Function) => {
      let options: router.RouterOptions = {
        url: "testability/pages/onWindowNew"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onWindowNew state success " + JSON.stringify(pages));
        if (!("onWindowNew" == pages.name)) {
          console.info("get onWindowNew state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push onWindowNew page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onWindowNew page error: " + err);
      }
      await Utils.sleep(2000);
      done()
    });
    beforeEach(async  (done: Function) =>{
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })
    afterEach(async  (done: Function) =>{
      console.info("ActsAceWebViewOnWindowNewJsunitTest afterEach start:"+emitKey);
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
    *tc.number SUB_ACE_BASIC_ETS_API_ONPAGEVISBALE_0100
    *tc.name testOnPageVisibleLoadUrl
    *tc.desc test api onPageVisible by load new url
    */
    it('testOnPageVisibleLoadUrl',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitOnPageVisibleRefresh";
      let url = 'resource://rawfile/index.html';
      Utils.registerEvent("testOnPageVisibleLoadUrl", url, 7108, done);
      sendEventByKey('onWindowNew', 10, '');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_ONPAGEVISBALE_0200
    *tc.name testOnPageVisibleRefresh
    *tc.desc test api onPageVisible by refresh
    */
    it('testOnPageVisibleRefresh',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitOnPageVisibleRefresh";
      let url = 'resource://rawfile/index.html';
      Utils.registerEvent("testOnPageVisibleRefresh", url, 7110, done);
      sendEventByKey('onWindowNew', 10, '');
    })
  })
}