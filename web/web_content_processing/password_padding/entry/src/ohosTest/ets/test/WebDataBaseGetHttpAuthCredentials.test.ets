/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { beforeAll, afterEach, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import { Driver, ON } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { accessibility, config } from '@kit.AccessibilityKit';
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const EVENT_ID_SET_SUITE_KEY = 154069;

let emitKey = "";

export default function WebDataBaseGetHttpAuthCredentialsTest() {
  describe('WebDataBaseGetHttpAuthCredentialsTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebDataBaseGetHttpAuthCredentials',
      }
      try {
        await Utils.sleep(1000);
        router.clear();
        let pages = router.getState();
        console.info("get WebDataBaseGetHttpAuthCredentials state success " + JSON.stringify(pages));
        if (!("WebDataBaseGetHttpAuthCredentials" == pages.name)) {
          console.info("get WebDataBaseGetHttpAuthCredentials state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebDataBaseGetHttpAuthCredentials page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebDataBaseGetHttpAuthCredentials page error: " + err);
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
      try {
        await driver.waitForComponent(ON.id("getHttpAuthCredentialsClick"), 10000);
      } catch (e) {
        const error = e as BusinessError;
        console.error(`${emitKey} ErrorCode: ${error.code},  Message: ${error.message}`);
      }
      done();
    })

    afterEach(async (done: Function) => {
      console.info("web afterEach start:" + emitKey);
      done();
    })

    /**
     * @tc.name testGetHttpAuthCredentialsEmptyHostEmptyRealm
     * @tc.number SUB_WEB_WEBDATABASE_GET_HTTP_AUTH_CREDENTIALS_EMPTY_HOST_EMPTY_REALM_001
     * @tc.desc Test getHttpAuthCredentials with empty string for both parameters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testGetHttpAuthCredentialsEmptyHostEmptyRealm', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'testGetHttpAuthCredentialsEmptyHostEmptyRealm';
        let tcName = 'testGetHttpAuthCredentialsEmptyHostEmptyRealm';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent(tcName, "error", 20260239, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "getHttpAuthCredentialsClick", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

    /**
     * @tc.name testGetHttpAuthCredentialsNullHostNullRealm
     * @tc.number SUB_WEB_WEBDATABASE_GET_HTTP_AUTH_CREDENTIALS_NULL_HOST_NULL_REALM_002
     * @tc.desc Test getHttpAuthCredentials with null for both parameters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testGetHttpAuthCredentialsNullHostNullRealm', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'testGetHttpAuthCredentialsNullHostNullRealm';
        let tcName = 'testGetHttpAuthCredentialsNullHostNullRealm';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent(tcName, "error", 20260240, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "getHttpAuthCredentialsClick", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

    /**
     * @tc.name testGetHttpAuthCredentialsUndefinedHostUndefinedRealm
     * @tc.number SUB_WEB_WEBDATABASE_GET_HTTP_AUTH_CREDENTIALS_UNDEFINED_HOST_UNDEFINED_REALM_003
     * @tc.desc Test getHttpAuthCredentials with undefined for both parameters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testGetHttpAuthCredentialsUndefinedHostUndefinedRealm', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'testGetHttpAuthCredentialsUndefinedHostUndefinedRealm';
        let tcName = 'testGetHttpAuthCredentialsUndefinedHostUndefinedRealm';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent(tcName, "error", 20260241, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "getHttpAuthCredentialsClick", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

    /**
     * @tc.name testGetHttpAuthCredentialsEmptyHostNullRealm
     * @tc.number SUB_WEB_WEBDATABASE_GET_HTTP_AUTH_CREDENTIALS_EMPTY_HOST_NULL_REALM_004
     * @tc.desc Test getHttpAuthCredentials with empty host and null realm
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testGetHttpAuthCredentialsEmptyHostNullRealm', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'testGetHttpAuthCredentialsEmptyHostNullRealm';
        let tcName = 'testGetHttpAuthCredentialsEmptyHostNullRealm';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent(tcName, "error", 20260242, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "getHttpAuthCredentialsClick", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

    /**
     * @tc.name testGetHttpAuthCredentialsEmptyHostUndefinedRealm
     * @tc.number SUB_WEB_WEBDATABASE_GET_HTTP_AUTH_CREDENTIALS_EMPTY_HOST_UNDEFINED_REALM_005
     * @tc.desc Test getHttpAuthCredentials with empty host and undefined realm
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testGetHttpAuthCredentialsEmptyHostUndefinedRealm', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'testGetHttpAuthCredentialsEmptyHostUndefinedRealm';
        let tcName = 'testGetHttpAuthCredentialsEmptyHostUndefinedRealm';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent(tcName, "error", 20260243, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "getHttpAuthCredentialsClick", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

    /**
     * @tc.name testGetHttpAuthCredentialsNullHostEmptyRealm
     * @tc.number SUB_WEB_WEBDATABASE_GET_HTTP_AUTH_CREDENTIALS_NULL_HOST_EMPTY_REALM_006
     * @tc.desc Test getHttpAuthCredentials with null host and empty realm
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testGetHttpAuthCredentialsNullHostEmptyRealm', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'testGetHttpAuthCredentialsNullHostEmptyRealm';
        let tcName = 'testGetHttpAuthCredentialsNullHostEmptyRealm';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent(tcName, "error", 20260244, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "getHttpAuthCredentialsClick", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

    /**
     * @tc.name testGetHttpAuthCredentialsNullHostUndefinedRealm
     * @tc.number SUB_WEB_WEBDATABASE_GET_HTTP_AUTH_CREDENTIALS_NULL_HOST_UNDEFINED_REALM_007
     * @tc.desc Test getHttpAuthCredentials with null host and undefined realm
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testGetHttpAuthCredentialsNullHostUndefinedRealm', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'testGetHttpAuthCredentialsNullHostUndefinedRealm';
        let tcName = 'testGetHttpAuthCredentialsNullHostUndefinedRealm';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent(tcName, "error", 20260245, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "getHttpAuthCredentialsClick", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });


    /**
     * @tc.name testGetHttpAuthCredentialsUndefinedHostEmptyRealm
     * @tc.number SUB_WEB_WEBDATABASE_GET_HTTP_AUTH_CREDENTIALS_UNDEFINED_HOST_EMPTY_REALM_008
     * @tc.desc Test getHttpAuthCredentials with undefined host and empty realm
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testGetHttpAuthCredentialsUndefinedHostEmptyRealm', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'testGetHttpAuthCredentialsUndefinedHostEmptyRealm';
        let tcName = 'testGetHttpAuthCredentialsUndefinedHostEmptyRealm';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent(tcName, "error", 20260246, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "getHttpAuthCredentialsClick", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });


    /**
     * @tc.name testGetHttpAuthCredentialsUndefinedHostNullNullRealm
     * @tc.number SUB_WEB_WEBDATABASE_GET_HTTP_AUTH_CREDENTIALS_UNDEFINED_HOST_EMPTY_REALM_009
     * @tc.desc Test getHttpAuthCredentials with undefined host and empty realm
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testGetHttpAuthCredentialsUndefinedHostNullNullRealm', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'testGetHttpAuthCredentialsUndefinedHostNullNullRealm';
        let tcName = 'testGetHttpAuthCredentialsUndefinedHostNullNullRealm';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent(tcName, "error", 20260247, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "getHttpAuthCredentialsClick", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });
  })
}
