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
import webView from '@ohos.web.webview';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';


export default function WebViewSetSocketIdleTimeout() {
  describe('ActsWebViewSetSocketIdleTimeout', () => {
      
    beforeEach(async (done: Function) => {
        config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
          console.info(`enable success`);
          }).catch((err: object) => {
          console.error(`failed to enable, ${err}`);
        })
        done();
    })


    /**
     * @tc.name   testSetSocketIdleTimeout001
     * @tc.number SUB_ACE_WEB_setSocketIdleTimeout_API_0001
     * @tc.desc   test setSocketIdleTimeout 200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetSocketIdleTimeout001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        console.log('testSetSocketIdleTimeout001 start')
        let result = false
        try {
            webView.WebviewController.setSocketIdleTimeout(200);
            console.log('setSocketIdleTimeout 200');
            result = true
        } catch(error) {
            console.error('testSetSocketIdleTimeout001 error: ' + JSON.stringify(error))
            result = false
        }
        expect(result).assertEqual(true)
        console.log('testSetSocketIdleTimeout001 end')
        done()
    })

    /**
     * @tc.name   testSetSocketIdleTimeout002
     * @tc.number SUB_ACE_WEB_setSocketIdleTimeout_API_0002
     * @tc.desc   test setSocketIdleTimeout 30
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSocketIdleTimeout002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        console.log('testSetSocketIdleTimeout002 start')
        let result = false
        try {
            webView.WebviewController.setSocketIdleTimeout(30);
            console.log('setSocketIdleTimeout 30');
            result = true
        } catch(error) {
            console.error('testSetSocketIdleTimeout002 error: ' + JSON.stringify(error))
            result = false
        }
        expect(result).assertEqual(true)
        console.log('testSetSocketIdleTimeout002 end')
        done()
    })

    /**
     * @tc.name   testSetSocketIdleTimeout003
     * @tc.number SUB_ACE_WEB_setSocketIdleTimeout_API_0003
     * @tc.desc   test setSocketIdleTimeout 300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSocketIdleTimeout003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        console.log('testSetSocketIdleTimeout003 start')
        let result = false
        try {
            webView.WebviewController.setSocketIdleTimeout(300);
            console.log('setSocketIdleTimeout 300');
            result = true
        } catch(error) {
            console.error('testSetSocketIdleTimeout003 error: ' + JSON.stringify(error))
            result = false
        }
        expect(result).assertEqual(true)
        console.log('testSetSocketIdleTimeout003 end')
        done()
    })

    /**
     * @tc.name   testSetSocketIdleTimeout004
     * @tc.number SUB_ACE_WEB_setSocketIdleTimeout_API_0004
     * @tc.desc   test setSocketIdleTimeout 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetSocketIdleTimeout004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testSetSocketIdleTimeout004 start')
        let result = false
        try {
            webView.WebviewController.setSocketIdleTimeout(0);
            console.log('testSetSocketIdleTimeout004 0');
            result = true
        } catch(error) {
            console.error('testSetSocketIdleTimeout004 error: ' + JSON.stringify(error))
            result = false
        }
        expect(result).assertEqual(true)
        console.log('testSetSocketIdleTimeout004 end')
        done()
    })

    /**
     * @tc.name   testSetSocketIdleTimeout005
     * @tc.number SUB_ACE_WEB_setSocketIdleTimeout_API_0005
     * @tc.desc   test setSocketIdleTimeout 99999999
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetSocketIdleTimeout005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testSetSocketIdleTimeout005 start')
        let result = false
        try {
            webView.WebviewController.setSocketIdleTimeout(99999999);
            console.log('setSocketIdleTimeout 99999999');
            result = true
        } catch(error) {
            console.error('testSetSocketIdleTimeout005 error: ' + JSON.stringify(error))
            result = false
        }
        expect(result).assertEqual(true)
        console.log('testSetSocketIdleTimeout005 end')
        done()
    })



  })
}
