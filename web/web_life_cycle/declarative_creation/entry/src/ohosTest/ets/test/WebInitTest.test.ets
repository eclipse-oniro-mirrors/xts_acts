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

import { beforeAll, afterEach, beforeEach, describe, it, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver: Driver = Driver.create();

export default function webInitTest() {
  describe('WebInitTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebInitTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get WebInitTest state success ' + JSON.stringify(pages));
        if (!('WebInitTest' == pages.name)) {
          console.info('get WebInitTest state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push WebInitTest page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push WebInitTest page error: ' + err);
      }
      await driver.waitForComponent(ON.id('WebInitTestButton'), 10000);
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
      console.info('WebInitTest afterEach start');
      console.info('WebInitTest afterEach end');
      done();
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_FOUR_API_0020
     *tc.name OnControllerAttached                                                                                                                                                                                                                     *tc.desic Injects the JavaScript object into window and invoke the function in window
     */
    it('OnControllerAttached', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitOnControllerAttached', 138450)
      Utils.registerEvent('OnControllerAttached', 1, 138460, done);
      await Utils.waitAndClickComponent(driver, 'WebInitTestButton', 'emitOnControllerAttached');
    })
  })
}
