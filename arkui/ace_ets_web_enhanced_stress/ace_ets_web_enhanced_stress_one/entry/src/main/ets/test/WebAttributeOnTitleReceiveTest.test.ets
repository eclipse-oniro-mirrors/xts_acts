/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { Constants } from './Constants';
import Utils from './Utils';

export default function webAttributeOnTitleReceiveTest() {

  describe('WebAttributeOnTitleReceiveTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebAttributeOnTitleReceiveTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebAttributeOnTitleReceiveTest state success " + JSON.stringify(pages));
        if (!("WebAttributeOnTitleReceiveTest" == pages.name)) {
          console.info("get WebAttributeOnTitleReceiveTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebAttributeOnTitleReceiveTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebAttributeOnTitleReceiveTest page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      console.info("WebAttributeOnTitleReceiveTest beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebAttributeOnTitleReceiveTest afterEach start");
      await Utils.sleep(2000);
      console.info("WebAttributeOnTitleReceiveTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBATTRIBUTE_ONTITLERECEIVE_0100
    * @tc.name        : testWebAttributeOnTitleReceive001
    * @tc.desc        : stress testing onTitleReceive
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebAttributeOnTitleReceive001', 0, async (done: Function) => {
      Utils.doIt("testWebAttributeOnTitleReceive001", 110046, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_ATTRIBUTE_ONTITLERECEIVE_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBATTRIBUTE_ONTITLERECEIVE_0200
    * @tc.name        : testWebAttributeOnTitleReceive002
    * @tc.desc        : stress testing onTitleReceive
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebAttributeOnTitleReceive002', 0, async (done: Function) => {
      Utils.doIt("testWebAttributeOnTitleReceive002", 110050, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_ATTRIBUTE_ONTITLERECEIVE_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

  })
}
