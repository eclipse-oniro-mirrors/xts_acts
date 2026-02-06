/**
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

import { afterEach, beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver: Driver = Driver.create();


export default function ActsAcewebViewSharedRenderProcessToken() {
  describe('ActsAcewebViewSharedRenderProcessToken', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewSharedRenderProcessToken',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webViewSharedRenderProcessToken state success ' + JSON.stringify(pages));
        if (!('webViewSharedRenderProcessToken' == pages.name)) {
          console.info('get webViewSharedRenderProcessToken state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webViewSharedRenderProcessToken state success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webViewSharedRenderProcessToken page error:' + err);
      }
      await driver.waitForComponent(ON.id('webViewSharedRenderProcessToken'), 10000);
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webViewSharedRenderProcessToken beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('webViewSharedRenderProcessToken afterEach start');
      done();
    })

    /*
     * @tc.number      : SUB_ACE_WEB_SharedRenderProcessToken_API_0001
     * @tc.name        : testWebViewSharedRenderProcessToken
     * @tc.desc        : test SharedRenderProcessToken
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSharedRenderProcessToken', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.emitEvent('emitWebViewSharedRenderProcessToken', 138350);
        Utils.registerBaseEvent('testWebViewSharedRenderProcessToken', true, 138360, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'webViewSharedRenderProcessToken',
          'emitWebViewSharedRenderProcessToken');
      })

    /*
     * @tc.number      : SUB_ACE_WEB_JSBRIDGE_API_0001
     * @tc.name        : testWebViewWebViewJsBridge
     * @tc.desc        : test WebViewJsBridge
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewWebViewJsBridge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitWebViewWebViewJsBridge', 138350);
      Utils.registerBaseEvent('testWebViewWebViewJsBridge', true, 138370, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'webViewSharedRenderProcessToken', 'emitWebViewWebViewJsBridge');
    })
  })
}
