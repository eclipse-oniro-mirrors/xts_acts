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
import { beforeEach, describe, it } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';
import { Constants } from './Constants'

export default function webStressScreenCaptureHandler() {

  describe('WebStressScreenCaptureHandler', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebStressScreenCaptureHandler',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebStressScreenCaptureHandler state success " + JSON.stringify(pages));
        if (!("WebStressScreenCaptureHandler" == pages.name)) {
          console.info("get WebStressScreenCaptureHandler state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebStressScreenCaptureHandler page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebStressScreenCaptureHandler page error: " + err);
      }
      done()
    })

    /*
    * @tc.number     : SUB_WEB_STRESS_SCREENCAPTURECONFIG_DENY_0100
    * @tc.name       : testScreenCaptureConfigDeny001
    * @tc.desc       : test ScreenCaptureConfigDeny
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScreenCaptureConfigDeny001', 0, async (done: Function) => {
      Utils.doIt("testScreenCaptureConfigDeny001", 7401, Constants.DEFAULT_STRESS_TIMES,
        Constants.SCREEN_CAPTURE_HANDLER_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    })
    /*
    * @tc.number     : SUB_WEB_STRESS_SCREENCAPTURECONFIG_GRANT_0100
    * @tc.name       : testScreenCaptureConfigGrant001
    * @tc.desc       : test ScreenCaptureConfigGrant
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScreenCaptureConfigGrant001', 0, async (done: Function) => {
      Utils.doIt("testScreenCaptureConfigGrant001", 7402, Constants.DEFAULT_STRESS_TIMES,
        Constants.SCREEN_CAPTURE_HANDLER_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    })
    /*
    * @tc.number     : SUB_WEB_STRESS_SCREENCAPTURECONFI_GGETORIGIN_0100
    * @tc.name       : testScreenCaptureConfigGetOrigin001
    * @tc.desc       : test ScreenCaptureConfigGetOrigin
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScreenCaptureConfigGetOrigin001', 0, async (done: Function) => {
      Utils.doIt("testScreenCaptureConfigGetOrigin001", 7403, Constants.DEFAULT_STRESS_TIMES,
        Constants.SCREEN_CAPTURE_HANDLER_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    })
  })
}
