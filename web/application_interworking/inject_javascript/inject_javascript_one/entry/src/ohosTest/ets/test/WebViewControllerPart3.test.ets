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
import { Driver, ON } from '@ohos.UiTest';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest.test';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver = Driver.create();

export default function webViewControllerPart3Test() {

  describe('WebViewControllerPart3', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewControllerPart3',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get WebViewControllerPart3 state success ' + JSON.stringify(pages));
        if (!("WebViewControllerPart3" == pages.name)) {
          console.info('get WebViewControllerPart3 state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push WebViewControllerPart3 page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push WebViewControllerPart3 page error: ' + err);
      }
      await driver.waitForComponent(ON.id("WebViewControllerTestButton"), 10000);
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('WebViewControllerPart3 beforeEach start');
      done();
    })
    /**
     * @tc.name   testJavaScriptProxy001
     * @tc.number SUB_WEB_JAVASCRIPTPROXY_0100
     * @tc.desc   test javaScriptProxy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testJavaScriptProxy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("javaScriptProxy", 172310)
      Utils.registerEvent("testJavaScriptProxy001", true, 172320, done);
      await Utils.waitAndClickComponent(driver, 'WebViewControllerTestButton');
    })

    /**
     * @tc.name   testRegisterJavaScriptProxy001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_REGISTERJAVASCRIPTPROXY_0100
     * @tc.desc   test registerJavaScriptProxy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterJavaScriptProxy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testRegisterJavaScriptProxy001", 172310)
      Utils.registerEvent("testRegisterJavaScriptProxy001", "backToEts", 172330, done);
      await Utils.waitAndClickComponent(driver, 'WebViewControllerTestButton');
    })

    /**
     * @tc.name   testDeleteJavaScriptRegister001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_DELETEJAVASCRIPTREGISTER_0100
     * @tc.desc   test deleteJavaScriptRegister
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDeleteJavaScriptRegister001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testDeleteJavaScriptRegister001", 172310)
      Utils.registerEvent("testDeleteJavaScriptRegister001", true, 172340, done);
      await Utils.waitAndClickComponent(driver, 'WebViewControllerTestButton');
    })
  })
}
