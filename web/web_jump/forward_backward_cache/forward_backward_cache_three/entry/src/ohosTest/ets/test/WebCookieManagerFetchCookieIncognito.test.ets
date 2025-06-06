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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webCookieManagerFetchCookieIncognito() {

  describe('WebCookieManagerFetchCookieIncognito', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebCookieManagerFetchCookieIncognito',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebCookieManagerFetchCookieIncognito state success " + JSON.stringify(pages));
        if (!("WebCookieManagerFetchCookieIncognito" == pages.name)) {
          console.info("get WebCookieManagerFetchCookieIncognito state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebCookieManagerFetchCookieIncognito page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebCookieManagerFetchCookieIncognito page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
      console.info("WebCookieManagerFetchCookieIncognito beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_INCOGNITO_0100
    * @tc.name       : testFetchCookieIncognito001
    * @tc.desc       : test fetchCookie param incognito false
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieIncognito001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookieIncognito001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookieIncognito001", 'a=b', 2025032101, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_INCOGNITO_0200
    * @tc.name       : testFetchCookieIncognito002
    * @tc.desc       : test fetchCookie param incognito true
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieIncognito002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookieIncognito002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookieIncognito002", 'aa=cc', 2025032102, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })


    /*
    * @tc.number     : SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_INCOGNITO_ERRORCODE_0300
    * @tc.name       : testFetchCookieIncognitoErrorCode003
    * @tc.desc       : test fetchCookie param incognito true, error code 17100002
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFetchCookieIncognitoErrorCode003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFetchCookieIncognitoErrorCode003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFetchCookieIncognitoErrorCode003", 17100002, 2025032103, done);
      sendEventByKey('WebCookieManagerFetchCookieTestButton', 10, '');
    })

  })
}
