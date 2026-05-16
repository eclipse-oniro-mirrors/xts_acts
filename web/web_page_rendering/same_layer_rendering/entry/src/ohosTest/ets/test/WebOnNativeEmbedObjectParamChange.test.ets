/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { afterEach, beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver: Driver = Driver.create();

export default function WebOnNativeEmbedObjectParamChange() {
  describe('ActsAceWebOnNativeEmbedObjectParamChange', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebOnNativeEmbedObjectParamChange',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info('get WebOnNativeEmbedObjectParamChange state success ' + JSON.stringify(pages));
        if (!('WebOnNativeEmbedObjectParamChange' == pages.name)) {
          console.info('get WebOnNativeEmbedObjectParamChange state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push WebOnNativeEmbedObjectParamChange state success ' + JSON.stringify(result));
          await driver.waitForComponent(ON.id('WebOnNativeEmbedObjectParamChangeButton'), 10000);
        }
      } catch (err) {
        console.error('push WebOnNativeEmbedObjectParamChange page error:' + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('WebOnNativeEmbedObjectParamChange beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('WebOnNativeEmbedObjectParamChange afterEach start');
      done();
    })



    /**
     * @tc.name   emitOnNativeEmbedObjectParamChange001
     * @tc.number emitOnNativeEmbedObjectParamChange001
     * @tc.desc   emitOnNativeEmbedObjectParamChange001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitOnNativeEmbedObjectParamChange001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.emitEvent('emitOnNativeEmbedObjectParamChange001', 130701)
        Utils.registerEvent('emitOnNativeEmbedObjectParamChange001', NativeEmbedParamStatus.ADD, 20250923, done);
        await Utils.waitAndClickComponent(driver, 'WebOnNativeEmbedObjectParamChangeButton', 'emitOnNativeEmbedObjectParamChange001');
      })

    /**
     * @tc.name   emitOnNativeEmbedObjectParamChange002
     * @tc.number SUB_ACE_WEB_EMITONNATIVEEMBEDOBJECTPARAMCHANGE_API_0200
     * @tc.desc   emitOnNativeEmbedObjectParamChange002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitOnNativeEmbedObjectParamChange002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.emitEvent('emitOnNativeEmbedObjectParamChange002', 130701)
        Utils.registerEvent('emitOnNativeEmbedObjectParamChange002', NativeEmbedParamStatus.UPDATE, 20250924, done);
        await Utils.waitAndClickComponent(driver, 'WebOnNativeEmbedObjectParamChangeButton', 'emitOnNativeEmbedObjectParamChange002');
      })



    /**
     * @tc.name   emitOnNativeEmbedObjectParamChange003
     * @tc.number emitOnNativeEmbedObjectParamChange003
     * @tc.desc   emitOnNativeEmbedObjectParamChange003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitOnNativeEmbedObjectParamChange003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.emitEvent('emitOnNativeEmbedObjectParamChange003', 130701)
        Utils.registerEvent('emitOnNativeEmbedObjectParamChange003', NativeEmbedParamStatus.DELETE, 20250925, done);
        await Utils.waitAndClickComponent(driver, 'WebOnNativeEmbedObjectParamChangeButton', 'emitOnNativeEmbedObjectParamChange003');
      })



  })
}

