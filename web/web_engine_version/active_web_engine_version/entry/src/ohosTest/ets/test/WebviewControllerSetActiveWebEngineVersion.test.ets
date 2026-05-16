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
import Utils from './Utils.test';
import router from '@ohos.router';
import { Driver, ON } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { accessibility, config } from '@kit.AccessibilityKit';
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const EVENT_ID_SET_SUITE_KEY = 154011;

let emitKey = "";

export default function WebviewControllerSetActiveWebEngineVersionTest() {
  describe('WebviewControllerSetActiveWebEngineVersionTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebviewControllerSetActiveWebEngineVersion',
      }
      try {
        await Utils.sleep(1000);
        router.clear();
        let pages = router.getState();
        console.info("get WebviewControllerSetActiveWebEngineVersion state success " + JSON.stringify(pages));
        if (!("WebviewControllerSetActiveWebEngineVersion" == pages.name)) {
          console.info("get WebviewControllerSetActiveWebEngineVersion state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebviewControllerSetActiveWebEngineVersion page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebviewControllerSetActiveWebEngineVersion page error: " + err);
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
        await driver.waitForComponent(ON.id("setActiveWebEngineVersionClick"), 10000);
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
     * @tc.name testSetActiveWebEngineVersionArkwebEvergreen
     * @tc.number SUB_WEB_WEBVIEW_CONTROLLER_SET_ACTIVE_WEB_ENGINE_VERSION_ARKWEB_EVERGREEN_001
     * @tc.desc Test setActiveWebEngineVersion with ARKWEB_EVERGREEN enum value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testSetActiveWebEngineVersionArkwebEvergreen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'testSetActiveWebEngineVersionArkwebEvergreen';
        let tcName = 'testSetActiveWebEngineVersionArkwebEvergreen';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent(tcName, "success", 20260255, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "setActiveWebEngineVersionClick");
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });
  })
}
