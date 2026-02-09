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

export default function ActsWebRunJavaScriptOnDocumentEndTest() {

  describe('ActsWebRunJavaScriptOnDocumentEndTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebRunJavaScriptOnDocumentEndTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get WebRunJavaScriptOnDocumentEndTest state success ' + JSON.stringify(pages));
        if (!("WebRunJavaScriptOnDocumentEndTest" == pages.name)) {
          console.info('get WebRunJavaScriptOnDocumentEndTest state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push WebRunJavaScriptOnDocumentEndTest page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push WebRunJavaScriptOnDocumentEndTest page error: ' + err);
      }
      await waitForComponent("WebRunJavaScriptOnDocumentEndTestButton");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('WebRunJavaScriptOnDocumentEndTest beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('WebRunJavaScriptOnDocumentEndTest afterEach start');
      console.info('WebRunJavaScriptOnDocumentEndTest afterEach end');
      done();
    })

    /**
     * @tc.name   testWebRunJavaScriptOnDocumentEnd001
     * @tc.number SUB_ACE_WEB_RUNJAVASCRIPTONDOCUMENTEND_API_0001
     * @tc.desc   test runJavaScriptOnDocumentEnd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebRunJavaScriptOnDocumentEnd001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebRunJavaScriptOnDocumentEnd001", 173090)
      Utils.registerEvent("testWebRunJavaScriptOnDocumentEnd001", '"runJavaScriptOnDocumentEnd"', 173100, done);
      sendEventByKey('WebRunJavaScriptOnDocumentEndTestButton', 10, '');
    })

    /**
     * @tc.name   testWebRunJavaScriptOnDocumentEnd002
     * @tc.number SUB_ACE_WEB_RUNJAVASCRIPTONDOCUMENTEND_API_0002
     * @tc.desc   test runJavaScriptOnDocumentEnd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebRunJavaScriptOnDocumentEnd002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebRunJavaScriptOnDocumentEnd002", 173090)
      Utils.registerEvent("testWebRunJavaScriptOnDocumentEnd002", '"msg2"', 173110, done);
      sendEventByKey('WebRunJavaScriptOnDocumentEndTestButton', 10, '');
    })

    /**
     * @tc.name   testWebRunJavaScriptOnDocumentEnd003
     * @tc.number SUB_ACE_WEB_RUNJAVASCRIPTONDOCUMENTEND_API_0003
     * @tc.desc   test runJavaScriptOnDocumentEnd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebRunJavaScriptOnDocumentEnd003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitWebRunJavaScriptOnDocumentEnd003", 173090)
      Utils.registerEvent("testWebRunJavaScriptOnDocumentEnd003", true, 173120, done);
      sendEventByKey('WebRunJavaScriptOnDocumentEndTestButton', 10, '');
    })

  })
}
