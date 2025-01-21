/**
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

import { afterEach, beforeAll, beforeEach, describe, it } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';

export default function webOnBeforeUnload() {
  describe('WebOnBeforeUnloadTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebOnBeforeUnload',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebOnBeforeUnload state success " + JSON.stringify(pages));
        if (!("WebOnBeforeUnload" == pages.name)) {
          console.info("get WebOnBeforeUnload state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebOnBeforeUnload page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebOnBeforeUnload page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebOnBeforeUnloadTest afterEach start");
      await Utils.sleep(1000);
      console.info("WebOnBeforeUnloadTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_ONBEFOREUNLOAD_0100
    * @tc.name        : testOnBeforeUnload001
    * @tc.desc        : test OnBeforeUnload when refresh
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnBeforeUnload001', 0, async (done: Function) => {
      Utils.emitEvent("emitOnBeforeUnload001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnBeforeUnload001", "resource://rawfile/onBeforeUnloadTest.html", 60402, done);
      Utils.registerEvent("testOnBeforeUnload001", "Is it OK to leave/reload this page?", 60403, done);
      sendEventByKey('webOnBeforeUnload', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_ONBEFOREUNLOAD_0200
    * @tc.name        : testOnBeforeUnload002
    * @tc.desc        : test OnBeforeUnload when loadUrl
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnBeforeUnload002', 0, async (done: Function) => {
      Utils.emitEvent("emitOnBeforeUnload002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnBeforeUnload002", "resource://rawfile/onBeforeUnloadTest.html", 60404, done);
      Utils.registerEvent("testOnBeforeUnload002", "Is it OK to leave/reload this page?", 60405, done);
      sendEventByKey('webOnBeforeUnload', 10, '');
    })
  })
}