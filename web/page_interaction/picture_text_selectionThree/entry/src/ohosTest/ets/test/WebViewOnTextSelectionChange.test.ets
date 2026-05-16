/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import Utils from './Utils.test';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';
import { waitForExist} from './WaitTest.test';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

const EVENT_ID_SET_SUITE_KEY = 183128;
const driver = Driver.create();

export default function WebViewOnTextSelectionChangeCase() {

  describe('WebViewOnTextSelectionChangeTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewOnTextSelectionChange',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewOnTextSelectionChange state success " + JSON.stringify(pages));
        if (!("WebViewOnTextSelectionChange" == pages.name)) {
          console.info("get WebViewOnTextSelectionChange state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebViewOnTextSelectionChange page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewOnTextSelectionChange page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebViewOnTextSelectionChangeButton"), 10000)
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webViewController beforeEach start");
      done();
    })


    /**
     * @tc.name   testOnTextSelectionChange01
     * @tc.number SUB_WEB_INTERSECTIONALITIES_0100
     * @tc.desc   onTextSelectionChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEXT
     * @tc.level  LEVEL1
     */
    it('testOnTextSelectionChange01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnTextSelectionChange01", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testOnTextSelectionChange01", 'onTextSelectionChange', 202601211, done);
      await Utils.waitAndClickComponent(driver, "WebViewOnTextSelectionChangeButton","testOnTextSelectionChange01");
    })

    /**
     * @tc.name   testOnTextSelectionChange02
     * @tc.number SUB_WEB_INTERSECTIONALITIES_0200
     * @tc.desc   onTextSelectionChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEXT
     * @tc.level  LEVEL1
     */
    it('testOnTextSelectionChange02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnTextSelectionChange02", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testOnTextSelectionChange02", 'selectionText', 202601212, done);
      await Utils.waitAndClickComponent(driver, "WebViewOnTextSelectionChangeButton","testOnTextSelectionChange02");
    })


  })
}
