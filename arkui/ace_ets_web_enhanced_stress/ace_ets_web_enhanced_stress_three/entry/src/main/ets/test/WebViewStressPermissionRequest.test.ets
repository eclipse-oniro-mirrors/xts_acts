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

export default function webViewStressPermissionRequest() {

  describe('WebViewStressPermissionRequest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebViewStressPermissionRequest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewStressPermissionRequest state success " + JSON.stringify(pages));
        if (!("WebViewStressPermissionRequest" == pages.name)) {
          console.info("get WebViewStressPermissionRequest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebViewStressPermissionRequest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewStressPermissionRequest page error: " + err);
      }
      done()
    })

    afterEach(async (done: Function) => {
      console.info("WebViewStressPermissionRequest afterEach start");
      await Utils.sleep(2000);
      console.info("WebViewStressPermissionRequest afterEach end");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_STRESS_ONPERMISSIONREQUEST_GETORIGIN_0100
    * @tc.name       : testOnPermissionRequestGetOrigin001
    * @tc.desc       : test OnPermissionRequestGetOrigin
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnPermissionRequestGetOrigin001', 0, async (done: Function) => {
      Utils.doIt("testOnPermissionRequestGetOrigin001", 1102, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_PERMISSIONREQUEST_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    })

    /*
    * @tc.number     : SUB_WEB_STRESS_ONPERMISSIONREQUEST_GETACCESSIBLERESOURCE_0100
    * @tc.name       : testOnPermissionRequestGetAccessibleResource001
    * @tc.desc       : test OnPermissionRequestGetAccessibleResource
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnPermissionRequestGetAccessibleResource001', 0, async (done: Function) => {
      Utils.doIt("testOnPermissionRequestGetAccessibleResource001", 1103, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_PERMISSIONREQUEST_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    })

    /*
    * @tc.number     : SUB_WEB_STRESS_ONPERMISSIONREQUEST_DENY_0100
    * @tc.name       : testonPermissionRequestDeny001
    * @tc.desc       : test onPermissionRequestDeny
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnPermissionRequestDeny001', 0, async (done: Function) => {
      Utils.doIt("testOnPermissionRequestDeny001", 3101, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_PERMISSIONREQUEST_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    })

    /*
        * @tc.number     : SUB_WEB_STRESS_ONPERMISSIONREQUEST_GRANT_0100
        * @tc.name       : testOnPermissionRequestGrant001
        * @tc.desc       : test onPermissionRequestGrant
        * @tc.size       : MediumTest
        * @tc.type       : Function
        * @tc.level      : Level 1
        */
    it('testOnPermissionRequestGrant001', 0, async (done: Function) => {
      Utils.doIt("testOnPermissionRequestGrant001", 3102, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_PERMISSIONREQUEST_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    })
  })
}
