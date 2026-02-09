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
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 115670;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webViewControllerPostUrlErrorCode() {

  describe('WebViewControllerPostUrlErrorCode', () => {
    let pageName = 'WebViewControllerPostUrlErrorCode'
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/' + pageName,
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info(`get ${pageName} state success ` + JSON.stringify(pages));
        if (!(pageName == pages.name)) {
          console.info(`get ${pageName} state success ` + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info(`push ${pageName} page success ` + JSON.stringify(result));
        }
      } catch (err) {
        console.error(`push ${pageName} page error: ` + err);
      }
      await driver.waitForComponent(ON.id("PostUrlErrorCodeButton"), 10000);
      console.log("PostUrlErrorCodeButton webView");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info(`${pageName} beforeEach start`);
      done();
    })

    /**
     * @tc.name   testWebViewControllerPostUrl001
     * @tc.number SUB_WEB_ERRORCODE_WEBVIEWCONTROLLER_POSTURL_0100
     * @tc.desc   test postUrl error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebViewControllerPostUrl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebViewControllerPostUrl001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebViewControllerPostUrl001", '17100001', 115680, done);
      await Utils.waitAndClickComponent(driver, "PostUrlErrorCodeButton");
    })

    /**
     * @tc.name   testWebViewControllerPostUrl002
     * @tc.number SUB_WEB_ERRORCODE_WEBVIEWCONTROLLER_POSTURL_0200
     * @tc.desc   test postUrl error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebViewControllerPostUrl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebViewControllerPostUrl002", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testWebViewControllerPostUrl002", '17100002', 115690, done);
      await Utils.waitAndClickComponent(driver, "PostUrlErrorCodeButton");
    })
  })
}