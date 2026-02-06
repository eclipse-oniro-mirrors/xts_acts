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


import { describe, beforeAll, beforeEach, it, TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 200520;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = "";

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
          await router.push(options);
          console.info("push onWindowNew page success");
        }
      } catch (err) {
        console.error("push onWindowNew page error: " + err);
      }
      await driver.waitForComponent(ON.id("onWindowNew"), 10000);
      console.log("waitForComponent onWindowNew");
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

    /*
    * @tc.number SUB_ACE_BASIC_ETS_API_ONPAGEVISBALE_0100
    * @tc.name testOnPageVisibleLoadUrl
    * @tc.desc test api onPageVisible by load new url
    */
    it('testOnPageVisibleLoadUrl',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitOnPageVisibleLoadUrl";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testOnPageVisibleLoadUrl", 'success', 200530, done);
      sendEventByKey('onWindowNew', 10, '');
    })
    /*
    * @tc.number SUB_ACE_BASIC_ETS_API_ONPAGEVISBALE_0200
    * @tc.name testOnPageVisibleRefresh
    * @tc.desc test api onPageVisible by refresh
    */
    it('testOnPageVisibleRefresh',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitOnPageVisibleRefresh";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testOnPageVisibleRefresh", 'success', 200540, done);
      sendEventByKey('onWindowNew', 10, '');
    })
  })
}