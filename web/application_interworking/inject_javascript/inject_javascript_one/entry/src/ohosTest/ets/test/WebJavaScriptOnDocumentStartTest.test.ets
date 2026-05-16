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

export default function webJavaScriptOnDocumentStartTest() {

  describe('WebJavaScriptOnDocumentStartTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebJavaScriptOnDocumentStartTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get WebJavaScriptOnDocumentStartTest state success ' + JSON.stringify(pages));
        if (!("WebJavaScriptOnDocumentStartTest" == pages.name)) {
          console.info('get WebJavaScriptOnDocumentStartTest state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push WebJavaScriptOnDocumentStartTest page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push WebJavaScriptOnDocumentStartTest page error: ' + err);
      }
      await Utils.waitForComponent(driver, 'WebJavaScriptOnDocumentStartTestButton');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('WebJavaScriptOnDocumentStartTest beforeEach start');
      done();
    })

    /**
     * @tc.name   testJavaScriptOnDocumentStart001
     * @tc.number SUB_WEB_JAVASCRIPTONDOCUMENTSTART_0100
     * @tc.desc   test javaScriptOnDocumentStart
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testJavaScriptOnDocumentStart001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testJavaScriptOnDocumentStart001", 172210)
      Utils.registerEvent("testJavaScriptOnDocumentStart001", '"Red"', 172220, done);
      await Utils.waitAndClickComponent(driver, 'WebJavaScriptOnDocumentStartTestButton');
    })

    /**
     * @tc.name   testJavaScriptOnDocumentStart002
     * @tc.number SUB_WEB_JAVASCRIPTONDOCUMENTSTART_0200
     * @tc.desc   test javaScriptOnDocumentStart
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testJavaScriptOnDocumentStart002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testJavaScriptOnDocumentStart002", 172210)
      Utils.registerEvent("testJavaScriptOnDocumentStart002", '"Red"', 172230, done);
      await Utils.waitAndClickComponent(driver, 'WebJavaScriptOnDocumentStartTestButton');
    })

    /**
     * @tc.name   testJavaScriptOnDocumentStart003
     * @tc.number SUB_WEB_JAVASCRIPTONDOCUMENTSTART_0300
     * @tc.desc   test javaScriptOnDocumentStart with null/undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testJavaScriptOnDocumentStart003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testJavaScriptOnDocumentStart003", 172210)
      Utils.registerEvent("testJavaScriptOnDocumentStart003", '"No script injected"', 20230312, done);
      await Utils.waitAndClickComponent(driver, 'WebJavaScriptOnDocumentStartTestButton');
    })

    /**
     * @tc.name   testJavaScriptOnDocumentStart004
     * @tc.number SUB_WEB_JAVASCRIPTONDOCUMENTSTART_0400
     * @tc.desc   test javaScriptOnDocumentStart with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testJavaScriptOnDocumentStart004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testJavaScriptOnDocumentStart004", 172210)
      Utils.registerEvent("testJavaScriptOnDocumentStart004", '"No script injected"', 20230313, done);
      await Utils.waitAndClickComponent(driver, 'WebJavaScriptOnDocumentStartTestButton');
    })

    /**
     * @tc.name   testJavaScriptOnDocumentStart005
     * @tc.number SUB_WEB_JAVASCRIPTONDOCUMENTSTART_0500
     * @tc.desc   test javaScriptOnDocumentStart with empty array parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testJavaScriptOnDocumentStart005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testJavaScriptOnDocumentStart005", 172210)
      Utils.registerEvent("testJavaScriptOnDocumentStart005", '"No script injected"', 20230314, done);
      await Utils.waitAndClickComponent(driver, 'WebJavaScriptOnDocumentStartTestButton');
    })

  })
}
