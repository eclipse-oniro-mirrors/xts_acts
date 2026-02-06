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

export default function storeWebArchiveSaveFail() {
  describe('ActsAceWebControllerTest', () =>{
    beforeAll(async  (done: Function) => {
      let options: router.RouterOptions = {
        url: "testability/pages/storeWebArchiveSaveFail"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get storeWebArchiveSaveFail state success " + JSON.stringify(pages));
        if (!("storeWebArchiveSaveFail" == pages.name)) {
          console.info("get storeWebArchiveSaveFail state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push storeWebArchiveSaveFail page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push storeWebArchiveSaveFail page error: " + err);
      }
      await waitForComponents('webcomponent03');
      done()
    })
    beforeEach(async (done: Function) => {
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
      console.info("ActsAceWebControllerTest afterEach end");
      done();
    })

    /**
     * @tc.name   testStoreWebArchiveCallback
     * @tc.number SUB_ACE_BASIC_ETS_STOREWEBARCHIVESAVEFAIL_API_007
     * @tc.desc   testStoreWebArchiveCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStoreWebArchiveCallback',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) =>{
      Utils.emitEvent("emitStoreWebArchiveCallbackSaveFail", 132230);
      Utils.registerBaseEvent("testStoreWebArchiveCallback","17100003Invalid resource path or file type",
        132240, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'webcomponent03');
    })

    /**
     * @tc.name   testStoreWebArchivePromise
     * @tc.number SUB_ACE_BASIC_ETS_STOREWEBARCHIVESAVEFAIL_API_008
     * @tc.desc   testStoreWebArchivePromise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStoreWebArchivePromise',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("emitStoreWebArchivePromiseSaveFail", 132230);
      Utils.registerBaseEvent("testStoreWebArchivePromise","17100003Invalid resource path or file type",
        132250, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'webcomponent03');
    })
  })
}