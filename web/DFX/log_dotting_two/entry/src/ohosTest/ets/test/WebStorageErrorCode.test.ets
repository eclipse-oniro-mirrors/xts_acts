/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 115070;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webStorageErrorCode() {

  describe('WebStorageErrorCodeTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webStorageErrorCode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webStorageErrorCode state success " + JSON.stringify(pages));
        if (!("webStorageErrorCode" == pages.name)) {
          console.info("get webStorageErrorCode state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webStorageErrorCode page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webStorageErrorCode page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebStorageErrorCodeButton"), 10000);
      console.log("WebStorageErrorCodeButton webView");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webStorageErrorCode beforeEach start");
      done();
    })

    /**
     * @tc.name   testDeleteOriginError001
     * @tc.number SUB_WEB_ERRORCODE_DELETEORIGIN_0100
     * @tc.desc   test deleteOrigin error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeleteOriginError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testDeleteOriginError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testDeleteOriginError001", '17100011', 115080, done);
      await Utils.waitAndClickComponent(driver, "WebStorageErrorCodeButton");
    })

    /**
     * @tc.name   testDeleteOriginError002
     * @tc.number SUB_WEB_ERRORCODE_DELETEORIGIN_0200
     * @tc.desc   test deleteOrigin error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeleteOriginError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testDeleteOriginError002", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testDeleteOriginError002", '17100011', 115090, done);
      await Utils.waitAndClickComponent(driver, "WebStorageErrorCodeButton");
    })

    /**
     * @tc.name   testDeleteOriginError003
     * @tc.number SUB_WEB_ERRORCODE_DELETEORIGIN_0300
     * @tc.desc   test deleteOrigin error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeleteOriginError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testDeleteOriginError003", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testDeleteOriginError003", '17100011', 115100, done);
      await Utils.waitAndClickComponent(driver, "WebStorageErrorCodeButton");
    })

    /**
     * @tc.name   testDeleteOriginError004
     * @tc.number SUB_WEB_ERRORCODE_DELETEORIGIN_0400
     * @tc.desc   test deleteOrigin error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeleteOriginError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testDeleteOriginError004", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testDeleteOriginError004", '17100011', 115110, done);
      await Utils.waitAndClickComponent(driver, "WebStorageErrorCodeButton");
    })

    /**
     * @tc.name   testGetOriginQuotaError001
     * @tc.number SUB_WEB_ERRORCODE_GETORIGINQUOTA_0100
     * @tc.desc   test getOriginQuota error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginQuotaError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testGetOriginQuotaError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetOriginQuotaError001", '17100011', 115120, done);
      await Utils.waitAndClickComponent(driver, "WebStorageErrorCodeButton");
    })

    /**
     * @tc.name   testGetOriginQuotaError002
     * @tc.number SUB_WEB_ERRORCODE_GETORIGINQUOTA_0200
     * @tc.desc   test getOriginQuota error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginQuotaError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testGetOriginQuotaError002", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetOriginQuotaError002", '17100011', 115130, done);
      await Utils.waitAndClickComponent(driver, "WebStorageErrorCodeButton");
    })

    /**
     * @tc.name   testGetOriginQuotaError003
     * @tc.number SUB_WEB_ERRORCODE_GETORIGINQUOTA_0300
     * @tc.desc   test getOriginQuota error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginQuotaError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testGetOriginQuotaError003", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetOriginQuotaError003", '17100011', 115140, done);
      await Utils.waitAndClickComponent(driver, "WebStorageErrorCodeButton");
    })

    /**
     * @tc.name   testGetOriginQuotaError004
     * @tc.number SUB_WEB_ERRORCODE_GETORIGINQUOTA_0400
     * @tc.desc   test getOriginQuota error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginQuotaError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testGetOriginQuotaError004", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetOriginQuotaError004", '17100011', 115150, done);
      await Utils.waitAndClickComponent(driver, "WebStorageErrorCodeButton");
    })

    /**
     * @tc.name   testGetOriginQuotaError005
     * @tc.number SUB_WEB_ERRORCODE_GETORIGINQUOTA_0500
     * @tc.desc   test getOriginQuota error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginQuotaError005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testGetOriginQuotaError005", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetOriginQuotaError005", '17100011', 115160, done);
      await Utils.waitAndClickComponent(driver, "WebStorageErrorCodeButton");
    })

    /**
     * @tc.name   testGetOriginQuotaError006
     * @tc.number SUB_WEB_ERRORCODE_GETORIGINQUOTA_0600
     * @tc.desc   test getOriginQuota error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginQuotaError006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testGetOriginQuotaError006", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetOriginQuotaError006", '17100011', 115170, done);
      await Utils.waitAndClickComponent(driver, "WebStorageErrorCodeButton");
    })

    /**
     * @tc.name   testGetOriginQuotaError007
     * @tc.number SUB_WEB_ERRORCODE_GETORIGINQUOTA_0700
     * @tc.desc   test getOriginQuota error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginQuotaError007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testGetOriginQuotaError007", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetOriginQuotaError007", '17100011', 115180, done);
      await Utils.waitAndClickComponent(driver, "WebStorageErrorCodeButton");
    })

    /**
     * @tc.name   testGetOriginQuotaError008
     * @tc.number SUB_WEB_ERRORCODE_GETORIGINQUOTA_0800
     * @tc.desc   test getOriginQuota error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginQuotaError008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testGetOriginQuotaError008", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetOriginQuotaError008", '17100011', 115190, done);
      await Utils.waitAndClickComponent(driver, "WebStorageErrorCodeButton");
    })

    /**
     * @tc.name   testGetOriginUsageError001
     * @tc.number SUB_WEB_ERRORCODE_GETORIGINUSAGE_0100
     * @tc.desc   test getOriginUsage error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginUsageError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testGetOriginUsageError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetOriginUsageError001", '17100011', 115200, done);
      await Utils.waitAndClickComponent(driver, "WebStorageErrorCodeButton");
    })

    /**
     * @tc.name   testGetOriginUsageError002
     * @tc.number SUB_WEB_ERRORCODE_GETORIGINUSAGE_0200
     * @tc.desc   test getOriginUsage error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginUsageError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testGetOriginUsageError002", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetOriginUsageError002", '17100011', 115210, done);
      await Utils.waitAndClickComponent(driver, "WebStorageErrorCodeButton");
    })

    /**
     * @tc.name   testGetOriginUsageError003
     * @tc.number SUB_WEB_ERRORCODE_GETORIGINUSAGE_0300
     * @tc.desc   test getOriginUsage error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginUsageError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testGetOriginUsageError003", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetOriginUsageError003", '17100011', 115220, done);
      await Utils.waitAndClickComponent(driver, "WebStorageErrorCodeButton");
    })

    /**
     * @tc.name   testGetOriginUsageError004
     * @tc.number SUB_WEB_ERRORCODE_GETORIGINUSAGE_0400
     * @tc.desc   test getOriginUsage error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginUsageError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testGetOriginUsageError004", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetOriginUsageError004", '17100011', 115230, done);
      await Utils.waitAndClickComponent(driver, "WebStorageErrorCodeButton");
    })

    /**
     * @tc.name   testGetOriginUsageError005
     * @tc.number SUB_WEB_ERRORCODE_GETORIGINUSAGE_0500
     * @tc.desc   test getOriginUsage error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginUsageError005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testGetOriginUsageError005", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetOriginUsageError005", '17100011', 115240, done);
      await Utils.waitAndClickComponent(driver, "WebStorageErrorCodeButton");
    })

    /**
     * @tc.name   testGetOriginUsageError006
     * @tc.number SUB_WEB_ERRORCODE_GETORIGINUSAGE_0600
     * @tc.desc   test getOriginUsage error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginUsageError006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testGetOriginUsageError006", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetOriginUsageError006", '17100011', 115250, done);
      await Utils.waitAndClickComponent(driver, "WebStorageErrorCodeButton");
    })

    /**
     * @tc.name   testGetOriginUsageError007
     * @tc.number SUB_WEB_ERRORCODE_GETORIGINUSAGE_0700
     * @tc.desc   test getOriginUsage error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginUsageError007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testGetOriginUsageError007", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetOriginUsageError007", '17100011', 115260, done);
      await Utils.waitAndClickComponent(driver, "WebStorageErrorCodeButton");
    })

    /**
     * @tc.name   testGetOriginUsageError008
     * @tc.number SUB_WEB_ERRORCODE_GETORIGINUSAGE_0800
     * @tc.desc   test getOriginUsage error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginUsageError008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testGetOriginUsageError008", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetOriginUsageError008", '17100011', 115270, done);
      await Utils.waitAndClickComponent(driver, "WebStorageErrorCodeButton");
    })
  })
}