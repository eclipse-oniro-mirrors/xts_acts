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
import router from '@ohos.router';
import Utils from './Utils';

export default function webOnDataResubmitted() {
  describe('WebOnDataResubmittedTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebOnDataResubmitted',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebOnDataResubmitted state success " + JSON.stringify(pages));
        if (!("WebOnDataResubmitted" == pages.name)) {
          console.info("get WebOnDataResubmitted state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebOnDataResubmitted page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebOnDataResubmitted page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebOnDataResubmittedTest afterEach start");
      await Utils.sleep(1000);
      console.info("WebOnDataResubmittedTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_ONDATARESUBMITTED_0100
    * @tc.name        : testOnDataResubmitted001
    * @tc.desc        : test onDataResubmitted callback
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnDataResubmitted001', 0, async (done: Function) => {
      Utils.emitEvent("emitOnDataResubmitted", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnDataResubmitted001", true, 60425, done);
      sendEventByKey('WebOnDataResubmittedTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_DATARESUBMISSIONHANDLER_RESEND_0100
    * @tc.name        : testDataResubmissionHandlerResend001
    * @tc.desc        : test dataResubmissionHandler.resend
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testDataResubmissionHandlerResend001', 0, async (done: Function) => {
      Utils.emitEvent("emitDataResubmissionHandlerResend", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testDataResubmissionHandlerResend001", 'httpbin.org/posthttpbin.org/post', 60426, done);
      sendEventByKey('WebOnDataResubmittedTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_DATARESUBMISSIONHANDLER_CANCEL_0100
    * @tc.name        : testDataResubmissionHandlerCancel001
    * @tc.desc        : test dataResubmissionHandler.cancel
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testDataResubmissionHandlerCancel001', 0, async (done: Function) => {
      Utils.emitEvent("emitDataResubmissionHandlerCancel", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testDataResubmissionHandlerCancel001", 'httpbin.org/post', 60428, done);
      sendEventByKey('WebOnDataResubmittedTestButton', 10, '');
    })
  })
}