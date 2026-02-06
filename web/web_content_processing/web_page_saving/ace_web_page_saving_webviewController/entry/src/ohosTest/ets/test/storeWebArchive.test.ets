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
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponents } from './WaitTest.test';
import { Driver, ON } from '@kit.TestKit';

const driver = Driver.create();

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

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
          console.info("push storeWebArchive page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push storeWebArchive page error: " + err);
      }
      await waitForComponents('webcomponent02');
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
      console.info("ActsAceWebControllerTest afterEach start");
      console.info("ActsAceWebViewOnWindowNewJsunitTest afterEach end");
      done();
    })


    /*
   *tc.number SUB_ACE_BASIC_ETS_STOREWEBARCHIVE_API_003
   *tc.name testStoreWebArchiveCallback
   *tc.desic test storeWebArchive interface when choose Callback mode and autoName parameter is ture.
   */
    it('testStoreWebArchiveCallback',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("emitStoreWebArchiveCallback", 132180);
      Utils.registerBaseEvent("testStoreWebArchiveCallback","/data/storage/el3/base/index.html.mht",
        132190, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'webcomponent02');
    })

    /*
   *tc.number SUB_ACE_BASIC_ETS_STOREWEBARCHIVE_API_004
   *tc.name testStoreWebArchiveCallbackFalse
   *tc.desic test storeWebArchive interface when choose Callback mode and autoName parameter is false.
   */
    it('testStoreWebArchiveCallbackFalse',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("emitStoreWebArchiveCallbackFalse", 132180);
      Utils.registerBaseEvent("testStoreWebArchiveCallbackFalse","/data/storage/el3/base/index.html.mht",
        132200, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'webcomponent02');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_STOREWEBARCHIVE_API_005
     *tc.name testStoreWebArchivePromise
     *tc.desic test storeWebArchive interface when choose Promise mode and autoName parameter is ture.
     */
    it('testStoreWebArchivePromise',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("emitStoreWebArchivePromise", 132180);
      Utils.registerBaseEvent("testStoreWebArchivePromise","/data/storage/el1/base/index.html.mht",
        132210, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'webcomponent02');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_STOREWEBARCHIVE_API_006
     *tc.name testStoreWebArchivePromiseFalse
     *tc.desic test storeWebArchive interface when choose Promise mode and autoName parameter is false.
     */
    it('testStoreWebArchivePromiseFalse',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent('emitStoreWebArchivePromiseFlase', 132180);
      Utils.registerBaseEvent("testStoreWebArchivePromiseFalse","/data/storage/el1/base/index.html-2.mht",
        132220, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'webcomponent02');
    })
  })
}