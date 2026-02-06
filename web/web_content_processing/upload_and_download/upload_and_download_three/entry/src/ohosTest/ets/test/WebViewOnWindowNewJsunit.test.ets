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


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponents } from './WaitTest.test';
import { Driver, ON } from '@kit.TestKit';

const driver = Driver.create();

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
      await waitForComponents('onWindowNew');
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
    *tc.number SUB_ACE_BASIC_ETS_API_BLOCKNETWORK_0100
    *tc.name testBlockNetWorkTrue
    *tc.desc test api blockNetWork set to true by load online website
    */
    it('testBlockNetWorkTrue',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("emitBlockNetWorkTrue", 130590);
      let url = "http://www.example.com/";
      Utils.registerBaseEvent("testBlockNetWorkTrue", url, 130600,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, "onWindowNew");
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_BLOCKNETWORK_0200
    *tc.name testBlockNetWorkFalse
    *tc.desc test api blockNetWork set to false by load online website
    */
   it('testBlockNetWorkFalse',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("emitBlockNetWorkFalse", 130590);
      let title = "Example Domain";
      Utils.registerBaseEvent("testBlockNetWorkFalse", title, 130610,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, "onWindowNew");
    })

  })
}