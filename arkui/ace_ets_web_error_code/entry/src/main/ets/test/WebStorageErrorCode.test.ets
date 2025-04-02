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

import { afterEach, beforeAll, beforeEach, describe, it } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';

export default function webStorageErrorCode() {

  describe('WebStorageErrorCodeTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/webStorageErrorCode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webStorageErrorCode state success " + JSON.stringify(pages));
        if (!("webStorageErrorCode" == pages.name)) {
          console.info("get webStorageErrorCode state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push webStorageErrorCode page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webStorageErrorCode page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      console.info("webStorageErrorCode beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebStorageErrorCodeTestSuite afterEach start");
      await Utils.sleep(2000);
      console.info("WebStorageErrorCodeTestSuite afterEach end");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_DELETEORIGIN_0100
    * @tc.name       : testDeleteOriginError001
    * @tc.desc       : test deleteOrigin error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testDeleteOriginError001', 0, async (done: Function) => {
      Utils.emitEvent("testDeleteOriginError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testDeleteOriginError001", '17100011', 20030, done);
      sendEventByKey('WebStorageErrorCodeButton', 10, '')
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_DELETEORIGIN_0200
    * @tc.name       : testDeleteOriginError002
    * @tc.desc       : test deleteOrigin error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testDeleteOriginError002', 0, async (done: Function) => {
      Utils.emitEvent("testDeleteOriginError002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testDeleteOriginError002", '17100011', 20031, done);
      sendEventByKey('WebStorageErrorCodeButton', 10, '')
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_DELETEORIGIN_0300
    * @tc.name       : testDeleteOriginError003
    * @tc.desc       : test deleteOrigin error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testDeleteOriginError003', 0, async (done: Function) => {
      Utils.emitEvent("testDeleteOriginError003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testDeleteOriginError003", '17100011', 20032, done);
      sendEventByKey('WebStorageErrorCodeButton', 10, '')
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_DELETEORIGIN_0400
    * @tc.name       : testDeleteOriginError004
    * @tc.desc       : test deleteOrigin error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testDeleteOriginError004', 0, async (done: Function) => {
      Utils.emitEvent("testDeleteOriginError004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testDeleteOriginError004", '17100011', 20033, done);
      sendEventByKey('WebStorageErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_GETORIGINQUOTA_0100
    * @tc.name       : testGetOriginQuotaError001
    * @tc.desc       : test getOriginQuota error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testGetOriginQuotaError001', 0, async (done: Function) => {
      Utils.emitEvent("testGetOriginQuotaError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetOriginQuotaError001", '17100011', 20050, done);
      sendEventByKey('WebStorageErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_GETORIGINQUOTA_0200
    * @tc.name       : testGetOriginQuotaError002
    * @tc.desc       : test getOriginQuota error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testGetOriginQuotaError002', 0, async (done: Function) => {
      Utils.emitEvent("testGetOriginQuotaError002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetOriginQuotaError002", '17100011', 20051, done);
      sendEventByKey('WebStorageErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_GETORIGINQUOTA_0300
    * @tc.name       : testGetOriginQuotaError003
    * @tc.desc       : test getOriginQuota error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testGetOriginQuotaError003', 0, async (done: Function) => {
      Utils.emitEvent("testGetOriginQuotaError003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetOriginQuotaError003", '17100011', 20052, done);
      sendEventByKey('WebStorageErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_GETORIGINQUOTA_0400
    * @tc.name       : testGetOriginQuotaError004
    * @tc.desc       : test getOriginQuota error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testGetOriginQuotaError004', 0, async (done: Function) => {
      Utils.emitEvent("testGetOriginQuotaError004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetOriginQuotaError004", '17100011', 20053, done);
      sendEventByKey('WebStorageErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_GETORIGINQUOTA_0500
    * @tc.name       : testGetOriginQuotaError005
    * @tc.desc       : test getOriginQuota error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testGetOriginQuotaError005', 0, async (done: Function) => {
      Utils.emitEvent("testGetOriginQuotaError005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetOriginQuotaError005", '17100011', 20054, done);
      sendEventByKey('WebStorageErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_GETORIGINQUOTA_0600
    * @tc.name       : testGetOriginQuotaError006
    * @tc.desc       : test getOriginQuota error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testGetOriginQuotaError006', 0, async (done: Function) => {
      Utils.emitEvent("testGetOriginQuotaError006", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetOriginQuotaError006", '17100011', 20055, done);
      sendEventByKey('WebStorageErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_GETORIGINQUOTA_0700
    * @tc.name       : testGetOriginQuotaError007
    * @tc.desc       : test getOriginQuota error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testGetOriginQuotaError007', 0, async (done: Function) => {
      Utils.emitEvent("testGetOriginQuotaError007", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetOriginQuotaError007", '17100011', 20056, done);
      sendEventByKey('WebStorageErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_GETORIGINQUOTA_0800
    * @tc.name       : testGetOriginQuotaError008
    * @tc.desc       : test getOriginQuota error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testGetOriginQuotaError008', 0, async (done: Function) => {
      Utils.emitEvent("testGetOriginQuotaError008", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetOriginQuotaError008", '17100011', 20057, done);
      sendEventByKey('WebStorageErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_GETORIGINUSAGE_0100
    * @tc.name       : testGetOriginUsageError001
    * @tc.desc       : test getOriginUsage error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testGetOriginUsageError001', 0, async (done: Function) => {
      Utils.emitEvent("testGetOriginUsageError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetOriginUsageError001", '17100011', 20060, done);
      sendEventByKey('WebStorageErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_GETORIGINUSAGE_0200
    * @tc.name       : testGetOriginUsageError002
    * @tc.desc       : test getOriginUsage error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testGetOriginUsageError002', 0, async (done: Function) => {
      Utils.emitEvent("testGetOriginUsageError002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetOriginUsageError002", '17100011', 20061, done);
      sendEventByKey('WebStorageErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_GETORIGINUSAGE_0300
    * @tc.name       : testGetOriginUsageError003
    * @tc.desc       : test getOriginUsage error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testGetOriginUsageError003', 0, async (done: Function) => {
      Utils.emitEvent("testGetOriginUsageError003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetOriginUsageError003", '17100011', 20062, done);
      sendEventByKey('WebStorageErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_GETORIGINUSAGE_0400
    * @tc.name       : testGetOriginUsageError004
    * @tc.desc       : test getOriginUsage error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testGetOriginUsageError004', 0, async (done: Function) => {
      Utils.emitEvent("testGetOriginUsageError004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetOriginUsageError004", '17100011', 20063, done);
      sendEventByKey('WebStorageErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_GETORIGINUSAGE_0500
    * @tc.name       : testGetOriginUsageError005
    * @tc.desc       : test getOriginUsage error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testGetOriginUsageError005', 0, async (done: Function) => {
      Utils.emitEvent("testGetOriginUsageError005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetOriginUsageError005", '17100011', 20064, done);
      sendEventByKey('WebStorageErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_GETORIGINUSAGE_0600
    * @tc.name       : testGetOriginUsageError006
    * @tc.desc       : test getOriginUsage error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testGetOriginUsageError006', 0, async (done: Function) => {
      Utils.emitEvent("testGetOriginUsageError006", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetOriginUsageError006", '17100011', 20065, done);
      sendEventByKey('WebStorageErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_GETORIGINUSAGE_0700
    * @tc.name       : testGetOriginUsageError007
    * @tc.desc       : test getOriginUsage error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testGetOriginUsageError007', 0, async (done: Function) => {
      Utils.emitEvent("testGetOriginUsageError007", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetOriginUsageError007", '17100011', 20066, done);
      sendEventByKey('WebStorageErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_GETORIGINUSAGE_0800
    * @tc.name       : testGetOriginUsageError008
    * @tc.desc       : test getOriginUsage error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testGetOriginUsageError008', 0, async (done: Function) => {
      Utils.emitEvent("testGetOriginUsageError008", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetOriginUsageError008", '17100011', 20067, done);
      sendEventByKey('WebStorageErrorCodeButton', 10, '');
    })

  })
}
