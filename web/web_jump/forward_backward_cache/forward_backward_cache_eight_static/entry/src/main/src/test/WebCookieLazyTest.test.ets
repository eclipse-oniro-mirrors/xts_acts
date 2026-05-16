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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level, expect } from '../../../hypium/index';
import { BusinessError } from '@ohos.base';

import webview from '@ohos.web.webview';

export default function webCookieLazyTest() {

  describe('webCookieLazyTest', () => {

    beforeEach(async () => {
      console.info('web beforeEach start');
    })

    /**
     * @tc.name   testWebSetLazyInitializeWebEngineStatic0001
     * @tc.number SUB_WEB_setLazyInitializeWebEngine_STATIC_0001
     * @tc.desc   test SetLazyInitializeWebEngine normal
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 0
     */
    it('testWebSetLazyInitializeWebEngineStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void):Promise<void> => {
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
     * @tc.name   testWebSetLazyInitializeWebEngineStatic0002
     * @tc.number SUB_WEB_setLazyInitializeWebEngine_STATIC_0002
     * @tc.desc   test SetLazyInitializeWebEngine normal
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 0
     */
    it('testWebSetLazyInitializeWebEngineStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void):Promise<void> => {
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
  })
}
