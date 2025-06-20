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

import { afterEach, beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webControllerHitTest() {

  describe('WebControllerHitTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebControllerHitTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebControllerHitTest state success " + JSON.stringify(pages));
        if (!("WebControllerHitTest" == pages.name)) {
          console.info("get WebControllerHitTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebControllerHitTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebControllerHitTest page error: " + err);
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
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebControllerHitTest afterEach start");
      await Utils.sleep(1000);
      console.info("WebControllerHitTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_WEBCONTROLLER_GETHITTEST_0100
    * @tc.name        : testGetHitTest001
    * @tc.desc        : test getHitTest return webView.WebHitTestType.EditText
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitGetHitTest001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetHitTest001", HitTestType.EditText, 70170, done);
      sendEventByKey('WebControllerHitTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBCONTROLLER_GETHITTEST_0200
    * @tc.name        : testGetHitTest002
    * @tc.desc        : test getHitTest return webView.WebHitTestType.Email
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitGetHitTest002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetHitTest002", HitTestType.Email, 70172, done);
      sendEventByKey('WebControllerHitTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBCONTROLLER_GETHITTEST_0300
    * @tc.name        : testGetHitTest003
    * @tc.desc        : test getHitTest return webView.WebHitTestType.HttpAnchor
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitGetHitTest003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetHitTest003", HitTestType.HttpAnchor, 70174, done);
      sendEventByKey('WebControllerHitTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBCONTROLLER_GETHITTEST_0400
    * @tc.name        : testGetHitTest004
    * @tc.desc        : test getHitTest return webView.WebHitTestType.HttpAnchorImg
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitGetHitTest004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetHitTest004", HitTestType.HttpAnchorImg, 70176, done);
      sendEventByKey('WebControllerHitTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBCONTROLLER_GETHITTEST_0500
    * @tc.name        : testGetHitTest005
    * @tc.desc        : test getHitTest return webView.WebHitTestType.Img
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitGetHitTest005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetHitTest005", HitTestType.Img, 70178, done);
      sendEventByKey('WebControllerHitTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBCONTROLLER_GETHITTEST_0700
    * @tc.name        : testGetHitTest007
    * @tc.desc        : test getHitTest return webView.WebHitTestType.Phone
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitGetHitTest007", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetHitTest007", HitTestType.Phone, 70182, done);
      sendEventByKey('WebControllerHitTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBCONTROLLER_GETHITTEST_0800
    * @tc.name        : testGetHitTest008
    * @tc.desc        : test getHitTest return webView.WebHitTestType.Unknown
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitGetHitTest008", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetHitTest008", HitTestType.Unknown, 70184, done);
      sendEventByKey('WebControllerHitTestButton', 10, '');
    })
  })
}
