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

import { beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 202590;
const driver = Driver.create();
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
          await router.pushUrl(options);
          console.info("push WebAttributeTest page success");
        }
      } catch (err) {
        console.error("push WebAttributeTest page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebAttributeTestButton"), 10000);
      console.log("waitForComponent WebAttributeTestButton");
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
    * @tc.number      : SUB_WEB_GETCERTIFICATE_0100
    * @tc.name        : testGetCertificate001
    * @tc.desc        : test getCertificate with return promise
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testGetCertificate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitGetCertificate001", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("testGetCertificate001", true, 202600, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "WebAttributeTestButton");
      if (await Utils.waitForExist(() => isReturn, 'testGetCertificate001' + '_returnCheck', 1, 1000)) {
        done();
      }
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
      Utils.emitEvent("emitGetCertificate002", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("testGetCertificate002", true, 202610, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "WebAttributeTestButton");
      if (await Utils.waitForExist(() => isReturn, 'testGetCertificate002' + '_returnCheck', 1, 1000)) {
        done();
      }
    })
  })
}