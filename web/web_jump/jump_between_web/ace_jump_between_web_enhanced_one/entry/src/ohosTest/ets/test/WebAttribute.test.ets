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

import { beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { waitForComponent } from './WaitTest.test';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webAttribute() {

  describe('WebAttributeTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webAttribute',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webAttribute state success " + JSON.stringify(pages));
        if (!("webAttribute" == pages.name)) {
          console.info("get webAttribute state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webAttribute page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webAttribute page error: " + err);
      }
      await waitForComponent("WebAttributeButton");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webAttribute beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_ONWINDOWNEW_0100
    * @tc.name       : testOnWindowNew001
    * @tc.desc       : test onWindowNew
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testOnWindowNew001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testOnWindowNew001", 133900)
      Utils.registerEvent("testOnWindowNew001", true, 133910, done);
      sendEventByKey('WebAttributeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ONWINDOWNEW_0200
    * @tc.name       : testOnWindowNew002
    * @tc.desc       : test onWindowNew
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnWindowNew002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testOnWindowNew002", 133900)
      Utils.registerEvent("testOnWindowNew002", false, 133920, done);
      sendEventByKey('WebAttributeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ONWINDOWNEW_0300
    * @tc.name       : testOnWindowNew003
    * @tc.desc       : test onWindowNew
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnWindowNew003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testOnWindowNew003", 133900)
      Utils.registerEvent("testOnWindowNew003", false, 133930, done);
      sendEventByKey('WebAttributeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_MULTIWINDOWACCESS_0100
    * @tc.name       : testMultiWindowAccess001
    * @tc.desc       : test multiWindowAccess
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testMultiWindowAccess001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testMultiWindowAccess001", 133900)
      Utils.registerEvent("testMultiWindowAccess001", false, 133940, done);
      sendEventByKey('WebAttributeButton', 10, '');
    })
  })

}
