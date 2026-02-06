/**
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

import { afterEach, beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { CommonConstants } from './Constant.test'
import { waitForComponent } from './WaitTest.test';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webOnUrlLoadIntercept() {
  describe('WebOnUrlLoadInterceptTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebOnUrlLoadIntercept',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebOnUrlLoadIntercept state success " + JSON.stringify(pages));
        if (!("WebOnUrlLoadIntercept" == pages.name)) {
          console.info("get WebOnUrlLoadIntercept state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebOnUrlLoadIntercept page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebOnUrlLoadIntercept page error: " + err);
      }
      await waitForComponent("WebOnUrlLoadInterceptTestButton");
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

    afterEach(async (done: Function) => {
      console.info("WebOnUrlLoadInterceptTest afterEach start");
      console.info("WebOnUrlLoadInterceptTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_ONURLLOADINTERCEPT_0200
    * @tc.name        : testOnUrlLoadIntercept002
    * @tc.desc        : test onLoadIntercept when return true
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testOnUrlLoadIntercept002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testOnUrlLoadIntercept002", 134450)
      Utils.registerEvent("testOnUrlLoadIntercept002", CommonConstants.EXAMPLE_URL, 134460, done);
      Utils.registerEvent("testOnUrlLoadIntercept002", 'index', 134470, done);
      sendEventByKey('WebOnUrlLoadInterceptTestButton', 10, '');
    })
  })
}