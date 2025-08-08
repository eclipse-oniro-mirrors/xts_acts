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
export default function webMediaPlayGestureAccess() {
  describe('WebMediaPlayGestureAccessTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebMediaPlayGestureAccess',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebMediaPlayGestureAccess state success " + JSON.stringify(pages));
        if (!("WebMediaPlayGestureAccess" == pages.name)) {
          console.info("get WebMediaPlayGestureAccess state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebMediaPlayGestureAccess page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebMediaPlayGestureAccess page error: " + err);
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
      console.info("WebMediaPlayGestureAccessTest afterEach start");
      await Utils.sleep(1000);
      console.info("WebMediaPlayGestureAccessTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_MEDIAPLAYGESTUREACCESS_0100
    * @tc.name        : testMediaPlayGestureAccess001
    * @tc.desc        : test mediaPlayGestureAccess true
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testMediaPlayGestureAccess001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitMediaPlayGestureAccessTrue", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testMediaPlayGestureAccess001", "false_", 60504, done);
      sendEventByKey('WebMediaPlayGestureAccessTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_MEDIAPLAYGESTUREACCESS_0200
    * @tc.name        : testMediaPlayGestureAccess002
    * @tc.desc        : test mediaPlayGestureAccess false
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testMediaPlayGestureAccess002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitMediaPlayGestureAccessFalsePlay", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testMediaPlayGestureAccess002", "true_true_", 60506, done);
      sendEventByKey('WebMediaPlayGestureAccessTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_MEDIAPLAYGESTUREACCESS_0300
    * @tc.name        : testMediaPlayGestureAccess003
    * @tc.desc        : test mediaPlayGestureAccess false
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testMediaPlayGestureAccess003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitMediaPlayGestureAccessFalsePause", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testMediaPlayGestureAccess003", "true_false_false_", 60508, done);
      sendEventByKey('WebMediaPlayGestureAccessTestButton', 10, '');
    })
  })
}