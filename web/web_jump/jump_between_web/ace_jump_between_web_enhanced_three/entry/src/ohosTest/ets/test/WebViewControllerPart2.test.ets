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

import { beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webViewControllerPart2() {

  describe('WebViewControllerPart2TestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewControllerPart2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewControllerPart2 state success " + JSON.stringify(pages));
        if (!("webViewControllerPart2" == pages.name)) {
          console.info("get webViewControllerPart2 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push webViewControllerPart2 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewControllerPart2 page error: " + err);
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
      console.info("webViewControllerPart2 beforeEach start");
      done();
    })


    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_BACKORFORWARD_0100
    * @tc.name       : testBackOrForward001
    * @tc.desc       : test backOrForward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testBackOrForward001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testBackOrForward001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testBackOrForward001", "second", 37005, done);
      sendEventByKey('WebViewControllerPart2Button', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_BACKORFORWARD_0200
    * @tc.name       : testBackOrForward002
    * @tc.desc       : test backOrForward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testBackOrForward002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testBackOrForward002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testBackOrForward002", "index", 37006, done);
      sendEventByKey('WebViewControllerPart2Button', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_BACKORFORWARD_0300
    * @tc.name       : testBackOrForward003
    * @tc.desc       : test backOrForward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testBackOrForward003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testBackOrForward003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testBackOrForward003", "index", 37007, done);
      sendEventByKey('WebViewControllerPart2Button', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_BACKORFORWARD_0400
    * @tc.name       : testBackOrForward004
    * @tc.desc       : test backOrForward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testBackOrForward004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testBackOrForward004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testBackOrForward004", "index", 37008, done);
      sendEventByKey('WebViewControllerPart2Button', 10, '');
    })


  })
}
