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

export default function ActsAcewebViewSetWebDestroyMode() {
  describe('ActsAcewebViewSetWebDestroyMode', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewSetWebDestroyMode',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info('get webViewSetWebDestroyMode state success ' + JSON.stringify(pages));
        if (!('webViewSetWebDestroyMode' == pages.name)) {
          console.info('get webViewSetWebDestroyMode state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webViewSetWebDestroyMode state success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webViewSetWebDestroyMode page error:' + err);
      }
      await driver.waitForComponent(ON.id('webViewSetWebDestroyModeKey'), 10000);
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webViewSetWebDestroyMode beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('webViewSetWebDestroyMode afterEach start');
      done();
    })

    /**
     * @tc.name   emitwebViewSetWebDestroyMode001
     * @tc.number SUB_ACE_WEB_WEBVIEWSETWEBDESTROYMODE_API_0001
     * @tc.desc   emitwebViewSetWebDestroyMode001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitwebViewSetWebDestroyMode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.emitEvent('emitwebViewSetWebDestroyMode001', 138550)
        Utils.registerEvent('emitwebViewSetWebDestroyMode001', 'webview.WebDestroyMode.FAST_MODE', 138560, done);
        await Utils.waitAndClickComponent(driver, 'webViewSetWebDestroyModeKey', 'emitwebViewSetWebDestroyMode001');
      })

    /**
     * @tc.name   emitwebViewSetWebDestroyMode002
     * @tc.number SUB_ACE_WEB_WEBVIEWSETWEBDESTROYMODE_API_0002
     * @tc.desc   emitwebViewSetWebDestroyMode002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitwebViewSetWebDestroyMode002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.emitEvent('emitwebViewSetWebDestroyMode002', 138550)
        Utils.registerEvent('emitwebViewSetWebDestroyMode002', 'webview.WebDestroyMode.NORMAL_MODE', 138570, done);
        await Utils.waitAndClickComponent(driver, 'webViewSetWebDestroyModeKey', 'emitwebViewSetWebDestroyMode002');
      })
  })
}
