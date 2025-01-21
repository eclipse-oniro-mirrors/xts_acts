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

import { afterEach, beforeAll, beforeEach, describe, it } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';

export default function webOnInterceptRequestTest() {

  describe('WebOnInterceptRequestTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebOnInterceptRequest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebOnInterceptRequest state success " + JSON.stringify(pages));
        if (!("WebOnInterceptRequest" == pages.name)) {
          console.info("get WebOnInterceptRequest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebOnInterceptRequest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebOnInterceptRequest page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebOnInterceptRequestTest afterEach start");
      await Utils.sleep(1000);
      console.info("WebOnInterceptRequestTest afterEach end");
      done();
    })


    /*
    * @tc.number      : SUB_WEB_ONINTERCEPTREQUEST_0100
    * @tc.name        : testOnInterceptRequest001
    * @tc.desc        : test onInterceptRequest normal
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnInterceptRequest001', 0, async (done: Function) => {
      Utils.emitEvent("emitOnInterceptRequest001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnInterceptRequest001", "intercept test", 60406, done);
      sendEventByKey('OnInterceptRequestTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_ONINTERCEPTREQUEST_0200
    * @tc.name        : testOnInterceptRequest002
    * @tc.desc        : test onInterceptRequest with return code 404
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testOnInterceptRequest002', 0, async (done: Function) => {
      Utils.emitEvent("emitOnInterceptRequest002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnInterceptRequest002", 404, 60407, done);
      sendEventByKey('OnInterceptRequestTestButton', 10, '');
    })
  })
}
