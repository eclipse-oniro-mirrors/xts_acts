/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import { afterEach, beforeAll, beforeEach, describe, it, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver: Driver = Driver.create();

export default function declarativeCreationOne() {
  describe('declarativeCreationOne', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/declarativeCreationOne',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get declarativeCreationOne state success ' + JSON.stringify(pages));
        if (!('declarativeCreationOne' == pages.name)) {
          console.info('get declarativeCreationOne state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push declarativeCreationOne page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push declarativeCreationOne page error: ' + err);
      }
      await driver.waitForComponent(ON.id("buttonEnumAndSetWebController"), 10000);
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('web beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('WebViewControllerDownloadTest afterEach start');
      console.info('WebViewControllerDownloadTest afterEach end');
      done();
    })

    /*
    * @tc.number     : SUB_WEB_SETWEBCONTROLLER_0100
    * @tc.name       : testSetWebController001
    * @tc.desc       : test setWebController
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testSetWebController001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetWebController', 138400)
      Utils.registerEvent('testSetWebController001', true, 138410, done);
      await Utils.waitAndClickComponent(driver, 'buttonEnumAndSetWebController', 'emitSetWebController');
    })
  })
}
