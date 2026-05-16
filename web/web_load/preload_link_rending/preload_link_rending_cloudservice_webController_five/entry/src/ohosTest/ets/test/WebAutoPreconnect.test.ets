/*
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

import { beforeAll, beforeEach, describe, it , TestType, Size, Level, expect } from '@ohos/hypium';
import Utils from './Utils.test';
import webview from '@ohos.web.webview'
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function WebAutoPreconnectTest() {

  describe('WebAutoPreconnectTest', () => {

    beforeAll(async (done: Function) => {
      console.info("WebAutoPreconnectTest start");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
      console.info("WebAutoPreconnectTest beforeEach start");
      done();
    })

    /**
     * @tc.name   testIsAutoPreconnectEnabled
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_ISAUTOPRECONNECTENABLED_0100
     * @tc.desc   test isAutoPreconnectEnabled return true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsAutoPreconnectEnabled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("testIsAutoPreconnectEnabled start");
      try {
        let isEnabled:boolean = webview.WebviewController.isAutoPreconnectEnabled()
        console.info("isAutoPreconnectEnabled:", isEnabled);
        expect(isEnabled).assertEqual(true)
      } catch (error) {
        console.error("testIsAutoPreconnectEnabled error: " + error)
        expect(0).assertEqual(1)
      }
      console.info("testIsAutoPreconnectEnabled end")
      done();
    })

    /**
     * @tc.name   testSetAutoPreconnectFalse
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETAUTOPRECONNECT_0100
     * @tc.desc   test setAutoPreconnect  false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetAutoPreconnectFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("testSetAutoPreconnectFalse start");
      try {
        webview.WebviewController.setAutoPreconnect(false)
        console.info("setAutoPreconnect false");
        let isEnabled:boolean = webview.WebviewController.isAutoPreconnectEnabled()
        console.info("isAutoPreconnectEnabled:", isEnabled);
        expect(isEnabled).assertEqual(false)
      } catch (error) {
        console.error("testSetAutoPreconnectFalse error: " + error)
        expect(0).assertEqual(1)
      }
      console.info("testSetAutoPreconnectFalse end")
      done();
    })

    /**
     * @tc.name   testSetAutoPreconnectTrue
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETAUTOPRECONNECT_0200
     * @tc.desc   test setAutoPreconnect  true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetAutoPreconnectTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("testSetAutoPreconnectTrue start");
      try {
        webview.WebviewController.setAutoPreconnect(true)
        console.info("setAutoPreconnect true");
        let isEnabled:boolean = webview.WebviewController.isAutoPreconnectEnabled()
        console.info("isAutoPreconnectEnabled:", isEnabled);
        expect(isEnabled).assertEqual(true)
      } catch (error) {
        console.error("testSetAutoPreconnectTrue error: " + error)
        expect(0).assertEqual(1)
      }
      console.info("testSetAutoPreconnectTrue end")
      done();
    })

  })
}