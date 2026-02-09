/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import Utils from './Utils';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import emitter from '@ohos.events.emitter';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest.test';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver = Driver.create();

let emitKey = "emitJsBridgeLastJsProxyCallingFrameUrl"

export default function webViewApiOne() {
  describe('ActsAceWebDevWebViewApiOne', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'testability/pages/webViewApiOne',
        }

        try {
            router.clear();
            let pages = router.getState();
            console.info('get webViewJsBridgeLastJsProxyCallingFrameUrl state success ' + JSON.stringify(pages));
            if (!("webViewJsBridgeLastJsProxyCallingFrameUrl" == pages.name)) {
                console.info('get webViewJsBridgeLastJsProxyCallingFrameUrl state success ' + JSON.stringify(pages.name));
                let result = await router.pushUrl(options);
                console.info('push webViewJsBridgeLastJsProxyCallingFrameUrl state success ' + JSON.stringify(result));
            }
        } catch (err) {
            console.error('push webViewJsBridgeLastJsProxyCallingFrameUrl page error:' + err);
        }
        await driver.waitForComponent(ON.id("webViewApiOneButton"), 10000);
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


    /**
     * @tc.name   testJsBridgeGetLastJavascriptProxyCallingFrameUrlGroup
     * @tc.number SUB_ACE_WEB_getLastJavascriptProxyCallingFrameUrl_API_GROUP_0200
     * @tc.desc   test GetLastJavascriptProxyCallingFrameUrl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testJsBridgeGetLastJavascriptProxyCallingFrameUrlGroup', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitJsBridgeGetLastJavascriptProxyCallingFrameUrl", 172290)
      Utils.registerBaseEvent("testJsBridgeGetLastJavascriptProxyCallingFrameUrl", "success", 172300,
        done, (backData: emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'webViewApiOneButton');
    })
  })
}
