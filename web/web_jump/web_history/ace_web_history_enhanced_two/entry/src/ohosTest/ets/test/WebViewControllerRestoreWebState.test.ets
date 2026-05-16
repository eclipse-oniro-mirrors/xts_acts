/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under * Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with * License.
 * You may obtain a copy of * License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under * License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See * License for * specific language governing permissions and
 * limitations under * License.
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
const EVENT_ID_SET_RESULT_KEY = 133200;
const EVENT_ID_SET_SUITE_KEY = 154018;

let emitKey = "";

export default function WebviewControllerRestoreWebStateTest() {
  describe('WebviewControllerRestoreWebStateTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewControllerRestoreWebState',
      }
      try {
        await Utils.sleep(1000);
        router.clear();
        let pages = router.getState();
        console.info("get WebViewControllerRestoreWebState state success " + JSON.stringify(pages));
        if (!("WebViewControllerRestoreWebState" == pages.name)) {
          console.info("get WebViewControllerRestoreWebState state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebViewControllerRestoreWebState page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewControllerRestoreWebState page error: " + err);
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
        await driver.waitForComponent(ON.id("restoreWebStateClick"), 10000);
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
     * @tc.name testRestoreWebStateNull
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_RESTORE_WEBSTATE_NULL_001
     * @tc.desc Test restoreWebState with null state
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testRestoreWebStateNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'testRestoreWebStateNull';
        let tcName = 'testRestoreWebStateNull';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent(tcName, "error", 20260275, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "restoreWebStateClick", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

    /**
     * @tc.name testRestoreWebStateUndefined
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_RESTORE_WEBSTATE_UNDEFINED_002
     * @tc.desc Test restoreWebState with undefined state
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testRestoreWebStateUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'testRestoreWebStateUndefined';
        let tcName = 'testRestoreWebStateUndefined';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_RESULT_KEY);
        Utils.registerEvent(tcName, "error", 20260276, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "restoreWebStateClick", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });
  })
}
