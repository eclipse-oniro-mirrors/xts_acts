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
const EVENT_ID_SET_SUITE_KEY = 154010;

let emitKey = "";

export default function WebDataBaseSaveHttpAuthCredentialsTest() {
  describe('WebDataBaseSaveHttpAuthCredentialsTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebDataBaseSaveHttpAuthCredentials',
      }
      try {
        await Utils.sleep(1000);
        router.clear();
        let pages = router.getState();
        console.info("get WebDataBaseSaveHttpAuthCredentials state success " + JSON.stringify(pages));
        if (!("WebDataBaseSaveHttpAuthCredentials" == pages.name)) {
          console.info("get WebDataBaseSaveHttpAuthCredentials state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebDataBaseSaveHttpAuthCredentials page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebDataBaseSaveHttpAuthCredentials page error: " + err);
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
        await driver.waitForComponent(ON.id("saveHttpAuthCredentialsClick"), 10000);
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
     * @tc.name testSaveHttpAuthCredentialsAllEmpty
     * @tc.number SUB_WEB_WEBDATABASE_SAVE_HTTP_AUTH_CREDENTIALS_ALL_EMPTY_001
     * @tc.desc Test saveHttpAuthCredentials with empty string for all parameters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testSaveHttpAuthCredentialsAllEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'testSaveHttpAuthCredentialsAllEmpty';
        let tcName = 'testSaveHttpAuthCredentialsAllEmpty';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent(tcName, "error", 20260240, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "saveHttpAuthCredentialsClick", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

    /**
     * @tc.name testSaveHttpAuthCredentialsAllNull
     * @tc.number SUB_WEB_WEBDATABASE_SAVE_HTTP_AUTH_CREDENTIALS_ALL_NULL_002
     * @tc.desc Test saveHttpAuthCredentials with null for all parameters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testSaveHttpAuthCredentialsAllNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'testSaveHttpAuthCredentialsAllNull';
        let tcName = 'testSaveHttpAuthCredentialsAllNull';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent(tcName, "error", 20260241, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "saveHttpAuthCredentialsClick", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

    /**
     * @tc.name testSaveHttpAuthCredentialsAllUndefined
     * @tc.number SUB_WEB_WEBDATABASE_SAVE_HTTP_AUTH_CREDENTIALS_ALL_UNDEFINED_003
     * @tc.desc Test saveHttpAuthCredentials with undefined for all parameters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testSaveHttpAuthCredentialsAllUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'testSaveHttpAuthCredentialsAllUndefined';
        let tcName = 'testSaveHttpAuthCredentialsAllUndefined';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent(tcName, "error", 20260242, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "saveHttpAuthCredentialsClick", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

    /**
     * @tc.name testSaveHttpAuthCredentialsEmptyHost
     * @tc.number SUB_WEB_WEBDATABASE_SAVE_HTTP_AUTH_CREDENTIALS_EMPTY_HOST_004
     * @tc.desc Test saveHttpAuthCredentials with empty host
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testSaveHttpAuthCredentialsEmptyHost', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'testSaveHttpAuthCredentialsEmptyHost';
        let tcName = 'testSaveHttpAuthCredentialsEmptyHost';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent(tcName, "error", 20260243, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "saveHttpAuthCredentialsClick", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

    /**
     * @tc.name testSaveHttpAuthCredentialsNullHost
     * @tc.number SUB_WEB_WEBDATABASE_SAVE_HTTP_AUTH_CREDENTIALS_NULL_HOST_005
     * @tc.desc Test saveHttpAuthCredentials with null host
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testSaveHttpAuthCredentialsNullHost', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'testSaveHttpAuthCredentialsNullHost';
        let tcName = 'testSaveHttpAuthCredentialsNullHost';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent(tcName, "error", 20260244, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "saveHttpAuthCredentialsClick", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

    /**
     * @tc.name testSaveHttpAuthCredentialsUndefinedHost
     * @tc.number SUB_WEB_WEBDATABASE_SAVE_HTTP_AUTH_CREDENTIALS_UNDEFINED_HOST_006
     * @tc.desc Test saveHttpAuthCredentials with undefined host
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testSaveHttpAuthCredentialsUndefinedHost', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'testSaveHttpAuthCredentialsUndefinedHost';
        let tcName = 'testSaveHttpAuthCredentialsUndefinedHost';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent(tcName, "error", 20260245, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "saveHttpAuthCredentialsClick", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

    /**
     * @tc.name testSaveHttpAuthCredentialsEmptyRealm
     * @tc.number SUB_WEB_WEBDATABASE_SAVE_HTTP_AUTH_CREDENTIALS_EMPTY_REALM_007
     * @tc.desc Test saveHttpAuthCredentials with empty realm
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testSaveHttpAuthCredentialsEmptyRealm', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'testSaveHttpAuthCredentialsEmptyRealm';
        let tcName = 'testSaveHttpAuthCredentialsEmptyRealm';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent(tcName, "empty_realm", 20260246, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "saveHttpAuthCredentialsClick", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

    /**
     * @tc.name testSaveHttpAuthCredentialsNullRealm
     * @tc.number SUB_WEB_WEBDATABASE_SAVE_HTTP_AUTH_CREDENTIALS_NULL_REALM_008
     * @tc.desc Test saveHttpAuthCredentials with null realm
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testSaveHttpAuthCredentialsNullRealm', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'testSaveHttpAuthCredentialsNullRealm';
        let tcName = 'testSaveHttpAuthCredentialsNullRealm';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent(tcName, "error", 20260247, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "saveHttpAuthCredentialsClick", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

    /**
     * @tc.name testSaveHttpAuthCredentialsUndefinedRealm
     * @tc.number SUB_WEB_WEBDATABASE_SAVE_HTTP_AUTH_CREDENTIALS_UNDEFINED_REALM_009
     * @tc.desc Test saveHttpAuthCredentials with undefined realm
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testSaveHttpAuthCredentialsUndefinedRealm', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'testSaveHttpAuthCredentialsUndefinedRealm';
        let tcName = 'testSaveHttpAuthCredentialsUndefinedRealm';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent(tcName, "error", 20260248, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "saveHttpAuthCredentialsClick", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

    /**
     * @tc.name testSaveHttpAuthCredentialsEmptyUsername
     * @tc.number SUB_WEB_WEBDATABASE_SAVE_HTTP_AUTH_CREDENTIALS_EMPTY_USERNAME_010
     * @tc.desc Test saveHttpAuthCredentials with empty username
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testSaveHttpAuthCredentialsEmptyUsername', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'testSaveHttpAuthCredentialsEmptyUsername';
        let tcName = 'testSaveHttpAuthCredentialsEmptyUsername';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent(tcName, "error", 20260249, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "saveHttpAuthCredentialsClick", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

    /**
     * @tc.name testSaveHttpAuthCredentialsNullUsername
     * @tc.number SUB_WEB_WEBDATABASE_SAVE_HTTP_AUTH_CREDENTIALS_NULL_USERNAME_011
     * @tc.desc Test saveHttpAuthCredentials with null username
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testSaveHttpAuthCredentialsNullUsername', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'testSaveHttpAuthCredentialsNullUsername';
        let tcName = 'testSaveHttpAuthCredentialsNullUsername';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent(tcName, "error", 20260250, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "saveHttpAuthCredentialsClick", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

    /**
     * @tc.name testSaveHttpAuthCredentialsUndefinedUsername
     * @tc.number SUB_WEB_WEBDATABASE_SAVE_HTTP_AUTH_CREDENTIALS_UNDEFINED_USERNAME_012
     * @tc.desc Test saveHttpAuthCredentials with undefined username
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testSaveHttpAuthCredentialsUndefinedUsername', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'testSaveHttpAuthCredentialsUndefinedUsername';
        let tcName = 'testSaveHttpAuthCredentialsUndefinedUsername';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent(tcName, "error", 20260251, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "saveHttpAuthCredentialsClick", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

    /**
     * @tc.name testSaveHttpAuthCredentialsEmptyPassword
     * @tc.number SUB_WEB_WEBDATABASE_SAVE_HTTP_AUTH_CREDENTIALS_EMPTY_PASSWORD_013
     * @tc.desc Test saveHttpAuthCredentials with empty password
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testSaveHttpAuthCredentialsEmptyPassword', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'testSaveHttpAuthCredentialsEmptyPassword';
        let tcName = 'testSaveHttpAuthCredentialsEmptyPassword';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent(tcName, "empty_password", 20260252, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "saveHttpAuthCredentialsClick", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

    /**
     * @tc.name testSaveHttpAuthCredentialsNullPassword
     * @tc.number SUB_WEB_WEBDATABASE_SAVE_HTTP_AUTH_CREDENTIALS_NULL_PASSWORD_014
     * @tc.desc Test saveHttpAuthCredentials with null password
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testSaveHttpAuthCredentialsNullPassword', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'testSaveHttpAuthCredentialsNullPassword';
        let tcName = 'testSaveHttpAuthCredentialsNullPassword';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent(tcName, "error", 20260253, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "saveHttpAuthCredentialsClick", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

    /**
     * @tc.name testSaveHttpAuthCredentialsUndefinedPassword
     * @tc.number SUB_WEB_WEBDATABASE_SAVE_HTTP_AUTH_CREDENTIALS_UNDEFINED_PASSWORD_015
     * @tc.desc Test saveHttpAuthCredentials with undefined password
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testSaveHttpAuthCredentialsUndefinedPassword', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'testSaveHttpAuthCredentialsUndefinedPassword';
        let tcName = 'testSaveHttpAuthCredentialsUndefinedPassword';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent(tcName, "error", 20260254, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "saveHttpAuthCredentialsClick", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });
  })
}
