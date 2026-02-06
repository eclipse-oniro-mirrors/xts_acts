/*
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

import { beforeEach, describe, it , TestType, Size, Level, expect } from '@ohos/hypium';
import { accessibility, config } from '@kit.AccessibilityKit';
import { BusinessError } from '@ohos.base';
import { webview } from '@kit.ArkWeb';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webCookieLazyTest() {

  describe('webCookieLazyTest', () => {
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })

    /**
     * @tc.name   testWebSetLazyInitializeWebEngine0001
     * @tc.number SUB_WEB_setLazyInitializeWebEngine_0001
     * @tc.desc   test SetLazyInitializeWebEngine normal
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 0
     */
    it('testWebSetLazyInitializeWebEngine0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let expect_value:boolean = false;
      try {
        webview.WebCookieManager.setLazyInitializeWebEngine(true);
        expect_value = true;
      } catch (error) {
        console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
      }
      expect(expect_value).assertEqual(true);
      done();
    })

    /**
     * @tc.name   testWebSetLazyInitializeWebEngine0002
     * @tc.number SUB_WEB_setLazyInitializeWebEngine_0002
     * @tc.desc   test SetLazyInitializeWebEngine normal
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 0
     */
    it('testWebSetLazyInitializeWebEngine0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let expect_value:boolean = false;
      try {
        webview.WebCookieManager.setLazyInitializeWebEngine(false);
        expect_value = true;
      } catch (error) {
        console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
      }
      expect(expect_value).assertEqual(true);
      done();
    })

    /**
     * @tc.name   testWebSetLazyInitializeWebEngine0003
     * @tc.number SUB_WEB_setLazyInitializeWebEngine_0003
     * @tc.desc   test SetLazyInitializeWebEngine normal
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 0
     */
    it('testWebSetLazyInitializeWebEngine0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let expect_value:boolean = false;
      try {
        webview.WebCookieManager.setLazyInitializeWebEngine(null);
      } catch (error) {
        console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
        if (error.code == 401) {
          expect_value = true;
        }
      }
      expect(expect_value).assertEqual(true);
      done();
    })

    /**
     * @tc.name   testWebSetLazyInitializeWebEngine0004
     * @tc.number SUB_WEB_setLazyInitializeWebEngine_0004
     * @tc.desc   test SetLazyInitializeWebEngine normal
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 0
     */
    it('testWebSetLazyInitializeWebEngine0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let expect_value:boolean = false;
      try {
        webview.WebCookieManager.setLazyInitializeWebEngine(undefined);
      } catch (error) {
        console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
        if (error.code == 401) {
          expect_value = true;
        }
      }
      expect(expect_value).assertEqual(true);
      done();
    })

  })
}
