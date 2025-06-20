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

import { afterEach, beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webOnHttpErrorReceiveTest() {
  describe('WebOnHttpErrorReceiveTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebOnHttpErrorReceive',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebOnHttpErrorReceive state success " + JSON.stringify(pages));
        if (!("WebOnHttpErrorReceive" == pages.name)) {
          console.info("get WebOnHttpErrorReceive state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebOnHttpErrorReceive page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebOnHttpErrorReceive page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebOnHttpErrorReceiveTest afterEach start");
      await Utils.sleep(1000);
      console.info("WebOnHttpErrorReceiveTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_ONHTTPERRORRECEIVE_0200
    * @tc.name        : testOnHttpErrorReceive002
    * @tc.desc        : test onHttpErrorReceive not callback when returned error code is 204
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testOnHttpErrorReceive002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testOnHttpErrorReceive002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnHttpErrorReceive002", 0, 60600, done);
      sendEventByKey('WebOnHttpErrorReceiveTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_ONHTTPERRORRECEIVE_0300
    * @tc.name        : testOnHttpErrorReceive003
    * @tc.desc        : test onHttpErrorReceive not callback when returned error code is 301
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testOnHttpErrorReceive003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testOnHttpErrorReceive003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnHttpErrorReceive003", 0, 60602, done);
      sendEventByKey('WebOnHttpErrorReceiveTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_ONHTTPERRORRECEIVE_0400
    * @tc.name        : testOnHttpErrorReceive004
    * @tc.desc        : test onHttpErrorReceive callback when returned error code is 500
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnHttpErrorReceive004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testOnHttpErrorReceive004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnHttpErrorReceive004", 500, 60604, done);
      sendEventByKey('WebOnHttpErrorReceiveTestButton', 10, '');
    })
  })
}