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

export default function webOnPermissionRequest() {

  describe('WebOnPermissionRequestTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebOnPermissionRequest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebOnPermissionRequest state success " + JSON.stringify(pages));
        if (!("WebOnPermissionRequest" == pages.name)) {
          console.info("get WebOnPermissionRequest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebOnPermissionRequest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebOnPermissionRequest page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebOnPermissionRequestTest afterEach start");
      await Utils.sleep(1000);
      console.info("WebOnPermissionRequestTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_PERMISSIONREQUESTDENY_0100
    * @tc.name        : testPermissionRequestDeny001
    * @tc.desc        : test permissionRequest deny
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testPermissionRequestDeny001', 0, async (done: Function) => {
      Utils.emitEvent("emitPermissionRequestDeny001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testPermissionRequestDeny001", '"deny"', 70320, done);
      sendEventByKey('WebOnPermissionRequestTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_PERMISSIONREQUESTGRANT_0100
    * @tc.name        : testPermissionRequestGrant001
    * @tc.desc        : test permissionRequest grant
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testPermissionRequestGrant001', 0, async (done: Function) => {
      Utils.emitEvent("emitPermissionRequestGrant001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testPermissionRequestGrant001", '"grant"', 70322, done);
      sendEventByKey('WebOnPermissionRequestTestButton', 10, '');
    })
  })
}
