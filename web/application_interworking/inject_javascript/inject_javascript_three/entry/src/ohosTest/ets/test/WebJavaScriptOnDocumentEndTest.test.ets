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
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function ActsWebJavaScriptOnDocumentEndTest() {

  describe('ActsWebJavaScriptOnDocumentEndTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebJavaScriptOnDocumentEndTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebJavaScriptOnDocumentEndTest state success " + JSON.stringify(pages));
        if (!("WebJavaScriptOnDocumentEndTest" == pages.name)) {
          console.info("get WebJavaScriptOnDocumentEndTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebJavaScriptOnDocumentEndTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebJavaScriptOnDocumentEndTest page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
      console.info("WebJavaScriptOnDocumentEndTest beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebJavaScriptOnDocumentEndTest afterEach start");
      await Utils.sleep(2000);
      console.info("WebJavaScriptOnDocumentEndTest afterEach end");
      done();
    })

    /*
    * @tc.number     : SUB_ACE_WEB_JAVASCRIPTONDOCUMENTEND_API_0001
    * @tc.name       : testWebJavaScriptOnDocumentEnd001
    * @tc.desc       : test javaScriptOnDocumentEnd
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebJavaScriptOnDocumentEnd001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitWebJavaScriptOnDocumentEnd001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebJavaScriptOnDocumentEnd001", true, 2025040805, done);
      sendEventByKey('WebJavaScriptOnDocumentEndTestButton', 10, '');
    })

  })
}
