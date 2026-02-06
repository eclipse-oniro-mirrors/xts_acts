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
import { Driver, ON } from '@ohos.UiTest';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest.test';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver = Driver.create();

export default function webAttribute() {

  describe('WebAttributeTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webAttribute',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webAttribute state success ' + JSON.stringify(pages));
        if (!("webAttribute" == pages.name)) {
          console.info('get webAttribute state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webAttribute page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webAttribute page error: ' + err);
      }
      await driver.waitForComponent(ON.id("WebAttributeButton"), 10000);
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webAttribute beforeEach start');
      done();
    })
    /*
    * @tc.number     : SUB_WEB_JAVASCRIPTACCESS_0100
    * @tc.name       : testJavaScriptAccess001
    * @tc.desc       : test javaScriptAccess
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testJavaScriptAccess001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testJavaScriptAccess001", 172160)
      Utils.registerEvent("testJavaScriptAccess001", true, 172170, done);
      await Utils.waitAndClickComponent(driver, 'WebAttributeButton');
    })
  })
}
