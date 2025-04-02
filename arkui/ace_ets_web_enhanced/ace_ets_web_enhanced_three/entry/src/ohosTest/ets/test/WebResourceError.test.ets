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

import { beforeAll, beforeEach, describe, it } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';


export default function webResourceError() {

  describe('webResourceErrorTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webResourceError',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webResourceError state success " + JSON.stringify(pages));
        if (!("webResourceError" == pages.name)) {
          console.info("get webResourceError state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push webResourceError page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webResourceError page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("webResourceError beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_GETERRORINFO_0100
    * @tc.name       : testGetErrorInfo001
    * @tc.desc       : test getErrorInfo
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetErrorInfo001', 0, async (done: Function) => {
      Utils.emitEvent("testGetErrorInfo001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetErrorInfo001", 'ERR_CERT_COMMON_NAME_INVALID', 36020, done);
      sendEventByKey('WebResourceErrorButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_GETERRORCODE_0100
    * @tc.name       : testGetErrorCode001
    * @tc.desc       : test getErrorCode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetErrorCode001', 0, async (done: Function) => {
      Utils.emitEvent("testGetErrorCode001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetErrorCode001", -200, 36022, done);
      sendEventByKey('WebResourceErrorButton', 10, '');
    })


  })
}
