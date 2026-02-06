/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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
import router from '@ohos.router';
import { waitForComponent } from './WaitTest.test';
import { accessibility, config } from '@kit.AccessibilityKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

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
          console.info("push onWindowNew page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onWindowNew page error: " + err);
      }
      await waitForComponent("onWindowNew");
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
      console.info("ActsAceWebViewOnWindowNewJsunitTest afterEach start");
      console.info("ActsAceWebViewOnWindowNewJsunitTest afterEach end");
      done();
    })

    /*
    *tc.number SUB_ACE_BASIC_ETS_API_ONWINDOWNEW_0100
    *tc.name testOnWindowNew01
    *tc.desc test api OnWindowNew by execute window.open function,at the same time,set MutliWindowAccess to true,
    *         allowWindowOpenMethod to true,javaScriptAccess to true
    */
    it('testOnWindowNew01',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("emitOnWindowNew01", 134050)
      Utils.registerEvent("emitOnWindowNew01", 1, 134060, done);
      sendEventByKey('onWindowNew', 10, '');
    })

     /*
     *tc.number SUB_ACE_BASIC_ETS_API_ONWINDOWNEW_0200
     *tc.name testOnWindowNew02
     *tc.desc test api OnWindowNew by execute window.open function,at the same time,set MutliWindowAccess to true,
     *         allowWindowOpenMethod to false,javaScriptAccess to true
     */
     it('testOnWindowNew02',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("emitOnWindowNew02", 134050)
      Utils.registerEvent("emitOnWindowNew02", 0, 134070, done);
      sendEventByKey('onWindowNew', 10, '');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_API_ONWINDOWNEW_0300
     *tc.name testOnWindowNew03
     *tc.desc test api OnWindowNew by execute window.open function,at the same time,set MutliWindowAccess to true,
     *         allowWindowOpenMethod to false,javaScriptAccess to false
     */
    it('testOnWindowNew03',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("emitOnWindowNew03", 134050)
      Utils.registerEvent("emitOnWindowNew03", 0, 134080, done);
      sendEventByKey('onWindowNew', 10, '');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_API_ONWINDOWNEW_0400
     *tc.name testOnWindowNew04
     *tc.desc test api OnWindowNew by execute window.open function,at the same time,set MutliWindowAccess to false,
     *         allowWindowOpenMethod to false,javaScriptAccess to true
     */
    it('testOnWindowNew04',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("emitOnWindowNew04", 134050)
      Utils.registerEvent("emitOnWindowNew04", 0, 134090, done);
      sendEventByKey('onWindowNew', 10, '');
    })
  })
}