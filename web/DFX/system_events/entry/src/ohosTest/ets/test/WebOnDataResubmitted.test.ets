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
import router from '@ohos.router';
import Utils from './Utils.test';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const EVENT_ID_SET_SUITE_KEY = 127001;
const driver = Driver.create();


export default function webOnDataResubmitted() {
  describe('WebOnDataResubmittedTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebOnDataResubmitted',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebOnDataResubmitted state success " + JSON.stringify(pages));
        if (!("WebOnDataResubmitted" == pages.name)) {
          console.info("get WebOnDataResubmitted state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          console.info("push WebOnDataResubmitted page success");
          await driver.waitForComponent(ON.id("WebOnDataResubmittedTestButton"), 10000);
        }
      } catch (err) {
        console.error("push WebOnDataResubmitted page error: " + err);
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

    /**
     * @tc.name   testOnDataResubmitted001
     * @tc.number SUB_WEB_ONDATARESUBMITTED_0100
     * @tc.desc   test onDataResubmitted callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnDataResubmitted001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnDataResubmitted", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testOnDataResubmitted001", true, 127010, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebOnDataResubmittedTestButton", "testOnDataResubmitted001");
      await Utils.waitForExist(() => isReturn, "testOnDataResubmitted001" + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testDataResubmissionHandlerResend001
     * @tc.number SUB_WEB_DATARESUBMISSIONHANDLER_RESEND_0100
     * @tc.desc   test dataResubmissionHandler.resend
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDataResubmissionHandlerResend001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitDataResubmissionHandlerResend", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testDataResubmissionHandlerResend001", 'requestbin.comrequestbin.com', 127020, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebOnDataResubmittedTestButton", "testDataResubmissionHandlerResend001");
      await Utils.waitForExist(() => isReturn, "testDataResubmissionHandlerResend001" + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testDataResubmissionHandlerCancel001
     * @tc.number SUB_WEB_DATARESUBMISSIONHANDLER_CANCEL_0100
     * @tc.desc   test dataResubmissionHandler.cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDataResubmissionHandlerCancel001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitDataResubmissionHandlerCancel", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testDataResubmissionHandlerCancel001", 'requestbin.com', 127030, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebOnDataResubmittedTestButton", "testDataResubmissionHandlerCancel001");
      await Utils.waitForExist(() => isReturn, "testDataResubmissionHandlerCancel001" + '_returnCheck', true, 1000);
      done();
    })
  })
}