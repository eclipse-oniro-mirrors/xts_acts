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

import { afterEach, beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const EVENT_ID_SET_EIMIT_KEY = 142017;
const driver = Driver.create();

export default function webOnInterceptRequestTest() {

  describe('WebOnInterceptRequestTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebOnInterceptRequest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebOnInterceptRequest state success " + JSON.stringify(pages));
        if (!("WebOnInterceptRequest" == pages.name)) {
          console.info("get WebOnInterceptRequest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebOnInterceptRequest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebOnInterceptRequest page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_ONINTERCEPTREQUEST_0100
    * @tc.name        : testOnInterceptRequest001
    * @tc.desc        : test onInterceptRequest normal
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnInterceptRequest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnInterceptRequest001", EVENT_ID_SET_EIMIT_KEY)
      let isReturn = 0;
      Utils.registerEvent("testOnInterceptRequest001", "intercept test", 142027, ()=>{isReturn = 1});
      await Utils.waitAndClickComponent(driver, "OnInterceptRequestTestButton");
      await Utils.waitForExist(()=>isReturn, "testOnInterceptRequest001", 1);
      done();
    })

    /*
    * @tc.number      : SUB_WEB_ONINTERCEPTREQUEST_0200
    * @tc.name        : testOnInterceptRequest002
    * @tc.desc        : test onInterceptRequest with return code 404
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testOnInterceptRequest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitOnInterceptRequest002", EVENT_ID_SET_EIMIT_KEY)
      let isReturn = 0;
      Utils.registerEvent("testOnInterceptRequest002", 404, 142037, ()=>{isReturn = 1});
      await Utils.waitAndClickComponent(driver, "OnInterceptRequestTestButton");
      await Utils.waitForExist(()=>isReturn, "testOnInterceptRequest002", 1);
      done();
    })
  })
}
