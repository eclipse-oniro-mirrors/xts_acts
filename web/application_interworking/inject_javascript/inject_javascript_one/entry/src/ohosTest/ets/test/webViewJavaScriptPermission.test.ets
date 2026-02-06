/**
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
import { afterEach, beforeAll, beforeEach, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import emitter from '@ohos.events.emitter';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest.test';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver = Driver.create();
// @ts-nocheck
let emitKey = ""

export default function ActsAceWebviewJavaScriptPermission() {
  describe('ActsAceWebviewJavaScriptPermission', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'testability/pages/webViewJavaScriptPermission',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info('get webViewJavaScriptPermission state success ' + JSON.stringify(pages));
        if (!("webViewJavaScriptPermission" == pages.name)) {
          console.info('get webViewJavaScriptPermission state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webViewJavaScriptPermission state success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webViewJavaScriptPermission page error:' + err);
      }
      await driver.waitForComponent(ON.id("webviewJavaScriptPermissionButton"), 10000);
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      done();
    })


    /*
    *@tc.number SUB_ACE_WEBVIEW_JAVASCRIPTPERMISSION_API_0001
    *@tc.name testWebViewJavaScriptPermission
    *@tc.desc test testWebViewJavaScriptPermission
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewJavaScriptPermission', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewJavaScriptPermission"
      Utils.emitEvent(emitKey, 172350);
      Utils.registerBaseEvent("testWebViewJavaScriptPermission", "success", 172360,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'webviewJavaScriptPermissionButton');
    })
  })
}
