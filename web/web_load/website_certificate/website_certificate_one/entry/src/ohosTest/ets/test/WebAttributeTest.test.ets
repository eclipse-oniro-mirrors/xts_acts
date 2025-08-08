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
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webAttributeTest() {

  describe('WebAttributeTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebAttributeTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebAttributeTest state success " + JSON.stringify(pages));
        if (!("WebAttributeTest" == pages.name)) {
          console.info("get WebAttributeTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebAttributeTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebAttributeTest page error: " + err);
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

    afterEach(async (done: Function) => {
      console.info("WebAttributeTest afterEach start");
      await Utils.sleep(2000);
      console.info("WebAttributeTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_GETCERTIFICATE_0100
    * @tc.name        : testGetCertificate001
    * @tc.desc        : test getCertificate with return promise
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testGetCertificate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitGetCertificate001", 10)
      await Utils.sleep(2000);
      Utils.registerContainEvent("testGetCertificate001", "getCertificate success: len = 1", 60423, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_GETCERTIFICATE_0200
    * @tc.name        : testGetCertificate002
    * @tc.desc        : test getCertificate with callback function
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetCertificate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitGetCertificate002", 10)
      await Utils.sleep(2000);
      Utils.registerContainEvent("testGetCertificate002", "getCertificate success: len = 1", 60424, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })
  })
}
