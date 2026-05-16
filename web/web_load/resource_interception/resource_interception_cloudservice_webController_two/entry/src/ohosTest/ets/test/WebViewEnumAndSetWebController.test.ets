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

const EVENT_ID_SET_EMIT_KEY = 202360;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
export default function WebViewEnumAndSetWebController() {

  describe('WebViewEnumAndSetWebControllerTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewEnumAndSetWebController',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewEnumAndSetWebController state success " + JSON.stringify(pages));
        if (!("webTwo" == pages.name)) {
          console.info("get WebViewEnumAndSetWebController state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          console.info("push WebViewEnumAndSetWebController page success");
        }
      } catch (err) {
        console.error("push WebViewEnumAndSetWebController page error: " + err);
      }
      await driver.waitForComponent(ON.id("buttonEnumAndSetWebController"), 10000);
      console.log("waitForComponent buttonEnumAndSetWebController");
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
     * @tc.name   testOnTouchIconUrlReceived001
     * @tc.number SUB_WEB_ONTOUCHICONURLRECEIVED_0100
     * @tc.desc   test onTouchIconUrlReceived
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnTouchIconUrlReceived001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnTouchIconUrlReceived", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("testOnTouchIconUrlReceived001", 'resource://rawfile/icon.png', 202370, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "buttonEnumAndSetWebController");
      if (await Utils.waitForExist(() => isReturn, 'testOnTouchIconUrlReceived001' + '_returnCheck', 1, 1000)) {
        done();
      }
    })
  })
}