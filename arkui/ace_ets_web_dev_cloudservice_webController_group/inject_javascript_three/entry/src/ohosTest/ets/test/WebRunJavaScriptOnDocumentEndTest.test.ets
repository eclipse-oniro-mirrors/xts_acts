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

import { beforeAll, beforeEach,afterEach, describe, it } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';

export default function ActsWebRunJavaScriptOnDocumentEndTest() {

  describe('ActsWebRunJavaScriptOnDocumentEndTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebRunJavaScriptOnDocumentEndTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebRunJavaScriptOnDocumentEndTest state success " + JSON.stringify(pages));
        if (!("WebRunJavaScriptOnDocumentEndTest" == pages.name)) {
          console.info("get WebRunJavaScriptOnDocumentEndTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebRunJavaScriptOnDocumentEndTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebRunJavaScriptOnDocumentEndTest page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("WebRunJavaScriptOnDocumentEndTest beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebRunJavaScriptOnDocumentEndTest afterEach start");
      await Utils.sleep(2000);
      console.info("WebRunJavaScriptOnDocumentEndTest afterEach end");
      done();
    })

    /*
    * @tc.number     : SUB_ACE_WEB_RUNJAVASCRIPTONDOCUMENTEND_API_0001
    * @tc.name       : testWebRunJavaScriptOnDocumentEnd001
    * @tc.desc       : test runJavaScriptOnDocumentEnd
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebRunJavaScriptOnDocumentEnd001', 0, async (done: Function) => {
      Utils.emitEvent("emitWebRunJavaScriptOnDocumentEnd001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebRunJavaScriptOnDocumentEnd001", '"runJavaScriptOnDocumentEnd"', 2025022101, done);
      sendEventByKey('WebRunJavaScriptOnDocumentEndTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_RUNJAVASCRIPTONDOCUMENTEND_API_0002
    * @tc.name       : testWebRunJavaScriptOnDocumentEnd002
    * @tc.desc       : test runJavaScriptOnDocumentEnd
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebRunJavaScriptOnDocumentEnd002', 0, async (done: Function) => {
      Utils.emitEvent("emitWebRunJavaScriptOnDocumentEnd002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebRunJavaScriptOnDocumentEnd002", '"msg2"', 2025022102, done);
      sendEventByKey('WebRunJavaScriptOnDocumentEndTestButton', 10, '');
    })

  })
}
