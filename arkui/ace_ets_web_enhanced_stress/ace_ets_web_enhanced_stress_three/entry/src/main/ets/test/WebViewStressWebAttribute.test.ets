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
import { afterEach, beforeEach, describe, it } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';
import { Constants } from './Constants'

export default function webViewStressWebAttribute() {

  describe('WebViewStressWebAttribute', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebViewStressWebAttribute',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewStressWebAttribute state success " + JSON.stringify(pages));
        if (!("WebViewStressWebAttribute" == pages.name)) {
          console.info("get WebViewStressWebAttribute state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebViewStressWebAttribute page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewStressWebAttribute page error: " + err);
      }
      done()
    })

    afterEach(async (done: Function) => {
      console.info("WebViewStressWebAttribute afterEach start");
      await Utils.sleep(2000);
      console.info("WebViewStressWebAttribute afterEach end");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_STRESS_ONPERMISSIONREQUEST_0100
    * @tc.name       : testOnPermissionRequest001
    * @tc.desc       : test onPermissionRequest
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnPermissionRequest001', 0, async (done: Function) => {
      Utils.doIt("testOnPermissionRequest001", 1411,
        Constants.USE_LOW_STRESS_TIMES ? Constants.LOW_STRESS_TIMES : Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_ATTRIBUTE_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    })

    /*
    * @tc.number     : SUB_WEB_STRESS_ONCONTEXTMENUSHOW_0100
    * @tc.name       : testOnContextMenuShow001
    * @tc.desc       : test onContextMenuShow
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnContextMenuShow001', 0, async (done: Function) => {
      Utils.doIt("testOnContextMenuShow001", 1252,
        Constants.USE_LOW_STRESS_TIMES ? Constants.LOW_STRESS_TIMES : Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_ATTRIBUTE_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    })

    /*
    * @tc.number     : SUB_WEB_STRESS_ONTOUCHICONURLRECEIVED_0100
    * @tc.name       : testOnTouchIconUrlReceived001
    * @tc.desc       : test onTouchIconUrlReceived
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnTouchIconUrlReceived001', 0, async (done: Function) => {
      Utils.doIt("testOnTouchIconUrlReceived001", 1371, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_ATTRIBUTE_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    })

    /*
    * @tc.number     : SUB_WEB_STRESS_ONPAGEVISIBLE_0100
    * @tc.name       : testOnPageVisible001
    * @tc.desc       : test onPageVisible
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnPageVisible001', 0, async (done: Function) => {
      Utils.doIt("testOnPageVisible001", 1991, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_ATTRIBUTE_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    })

    /*
    * @tc.number     : SUB_WEB_STRESS_ONSCREENCAPTUREREQUEST_0100
    * @tc.name       : testOnScreenCaptureRequest001
    * @tc.desc       : test onScreenCaptureRequest
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnScreenCaptureRequest001', 0, async (done: Function) => {
      Utils.doIt("testOnScreenCaptureRequest001", 1992, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_ATTRIBUTE_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    })
  })
}
