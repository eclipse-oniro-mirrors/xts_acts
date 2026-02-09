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

import { beforeAll, beforeEach,afterEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function ActsWebJavaScriptOnDocumentStartTest() {

  describe('ActsWebJavaScriptOnDocumentStartTest', () => {

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
      await waitForComponent("WebJavaScriptOnDocumentStartTestButton");
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

    afterEach(async (done: Function) => {
      console.info('WebJavaScriptOnDocumentStartTest afterEach start');
      console.info('WebJavaScriptOnDocumentStartTest afterEach end');
      done();
    })

    /**
     * @tc.name   testWebJavaScriptOnDocumentStart001
     * @tc.number SUB_ACE_WEB_JAVASCRIPTONDOCUMENTSTART_API_0001
     * @tc.desc   test javaScriptOnDocumentStart
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebJavaScriptOnDocumentStart001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitWebJavaScriptOnDocumentStart001", 173070)
      Utils.registerEvent("testWebJavaScriptOnDocumentStart001", true, 173080, done);
      sendEventByKey('WebJavaScriptOnDocumentStartTestButton', 10, '');
    })

  })
}
