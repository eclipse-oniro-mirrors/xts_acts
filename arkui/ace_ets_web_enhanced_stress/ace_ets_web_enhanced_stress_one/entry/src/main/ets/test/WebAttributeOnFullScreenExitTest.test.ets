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

export default function webAttributeOnFullScreenExitTest() {

  describe('WebAttributeOnFullScreenExitTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebAttributeOnFullScreenExitTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebAttributeOnFullScreenExitTest state success " + JSON.stringify(pages));
        if (!("WebAttributeOnFullScreenExitTest" == pages.name)) {
          console.info("get WebAttributeOnFullScreenExitTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebAttributeOnFullScreenExitTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebAttributeOnFullScreenExitTest page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      console.info("WebAttributeOnFullScreenExitTest beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebAttributeOnFullScreenExitTest afterEach start");
      await Utils.sleep(2000);
      console.info("WebAttributeOnFullScreenExitTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBATTRIBUTE_ONFULLSCREENEXIT_0100
    * @tc.name        : testWebAttributeOnFullScreenExit001
    * @tc.desc        : stress testing onFullScreenExit
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebAttributeOnFullScreenExit001', 0, async (done: Function) => {
      Utils.doIt("testWebAttributeOnFullScreenExit001", 110020,
        Constants.USE_LOW_STRESS_TIMES ? Constants.LOW_STRESS_TIMES : Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_ATTRIBUTE_ONFULLSCREENEXIT_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

  })
}
