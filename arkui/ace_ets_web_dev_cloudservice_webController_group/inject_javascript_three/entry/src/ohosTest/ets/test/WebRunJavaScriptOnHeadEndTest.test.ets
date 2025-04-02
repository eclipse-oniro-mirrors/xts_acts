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

export default function ActsWebRunJavaScriptHeadEndTest() {

  describe('ActsWebRunJavaScriptOnHeadEndTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebRunJavaScriptOnHeadEndTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebRunJavaScriptOnHeadEndTest state success " + JSON.stringify(pages));
        if (!("WebRunJavaScriptOnHeadEndTest" == pages.name)) {
          console.info("get WebRunJavaScriptOnHeadEndTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebRunJavaScriptOnHeadEndTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebRunJavaScriptOnHeadEndTest page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("WebRunJavaScriptOnHeadEndTest beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebRunJavaScriptOnHeadEndTest afterEach start");
      await Utils.sleep(2000);
      console.info("WebRunJavaScriptOnHeadEndTest afterEach end");
      done();
    })

    /*
    * @tc.number     : SUB_ACE_WEB_RUNJAVASCRIPTONHEADEND_API_0001
    * @tc.name       : testWebRunJavaScriptOnHeadEnd001
    * @tc.desc       : test runJavaScriptOnHeadEnd
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebRunJavaScriptOnHeadEnd001', 0, async (done: Function) => {
      Utils.emitEvent("emitWebRunJavaScriptOnHeadEnd001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebRunJavaScriptOnHeadEnd001", '"testValue"', 2025022103, done);
      sendEventByKey('WebRunJavaScriptOnHeadEndTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_RUNJAVASCRIPTONHEADEND_API_0002
    * @tc.name       : testWebRunJavaScriptOnHeadEnd002
    * @tc.desc       : test runJavaScriptOnHeadEnd
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebRunJavaScriptOnHeadEnd002', 0, async (done: Function) => {
      await Utils.emitEvent("emitWebRunJavaScriptOnHeadEnd002", 10)
      Utils.registerEvent("testWebRunJavaScriptOnHeadEnd002", '"test msg"', 2025022104, done);
      sendEventByKey('WebRunJavaScriptOnHeadEndTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_RUNJAVASCRIPTONHEADEND_API_0003
    * @tc.name       : testWebRunJavaScriptOnHeadEnd003
    * @tc.desc       : test runJavaScriptOnHeadEnd
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebRunJavaScriptOnHeadEnd003', 0, async (done: Function) => {
      Utils.emitEvent("emitWebRunJavaScriptOnHeadEnd003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebRunJavaScriptOnHeadEnd003", '"testValue1"', 2025022105, done);
      sendEventByKey('WebRunJavaScriptOnHeadEndTestButton', 10, '');
    })

  })
}
