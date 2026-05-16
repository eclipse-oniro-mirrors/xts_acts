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

import { afterEach, beforeAll, beforeEach, describe, it, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import webview from '@ohos.web.webview';
import Utils from './Utils.test';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@ohos.UiTest';
const CAPABILITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function EnableAdvancedSecurityMode() {

  describe('EnableAdvancedSecurityModeTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/enableAdvancedSecurityMode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get EnableAdvancedSecurityMode state success " + JSON.stringify(pages));
        if (!("EnableAdvancedSecurityMode" == pages.name)) {
          console.info("get EnableAdvancedSecurityMode state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push EnableAdvancedSecurityMode page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push EnableAdvancedSecurityMode page error: " + err);
      }
      let driver: Driver = Driver.create();
      await driver.waitForComponent(ON.id("EnableAdvancedSecurityModeButton"), 10000);
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPABILITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("EnableAdvancedSecurityMode beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("EnableAdvancedSecurityMode afterEach start");
      console.info("EnableAdvancedSecurityMode afterEach end");
      done();
    })

    /**
     * @tc.number     SUB_WEB_ENABLE_ADVANCEDSECURITYMODE_0100
     * @tc.name       testEnableAdvancedSecurityMode001
     * @tc.desc       enableAdvancedSecurityMode with disableJITCompilation true
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testEnableAdvancedSecurityMode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitEnableAdvancedSecurityMode001', 10)
      Utils.registerEvent('testEnableAdvancedSecurityMode001', true, 210001, done);
      sendEventByKey('EnableAdvancedSecurityModeButton', 10, '');
    })

    /**
     * @tc.number     SUB_WEB_ENABLE_ADVANCEDSECURITYMODE_0200
     * @tc.name       testEnableAdvancedSecurityMode002
     * @tc.desc       enableAdvancedSecurityMode with disableJITCompilation false
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testEnableAdvancedSecurityMode002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitEnableAdvancedSecurityMode002', 10)
      Utils.registerEvent('testEnableAdvancedSecurityMode002', true, 210002, done);
      sendEventByKey('EnableAdvancedSecurityModeButton', 10, '');
    })

    /**
     * @tc.number     SUB_WEB_ENABLE_ADVANCEDSECURITYMODE_0300
     * @tc.name       testEnableAdvancedSecurityMode003
     * @tc.desc       enableAdvancedSecurityMode with disableWebAssembly true
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testEnableAdvancedSecurityMode003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitEnableAdvancedSecurityMode003', 10)
      Utils.registerEvent('testEnableAdvancedSecurityMode003', true, 210003, done);
      sendEventByKey('EnableAdvancedSecurityModeButton', 10, '');
    })

    /**
     * @tc.number     SUB_WEB_ENABLE_ADVANCEDSECURITYMODE_0400
     * @tc.name       testEnableAdvancedSecurityMode004
     * @tc.desc       enableAdvancedSecurityMode with disableWebAssembly false
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testEnableAdvancedSecurityMode004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitEnableAdvancedSecurityMode004', 10)
      Utils.registerEvent('testEnableAdvancedSecurityMode004', true, 210004, done);
      sendEventByKey('EnableAdvancedSecurityModeButton', 10, '');
    })

    /**
     * @tc.number     SUB_WEB_ENABLE_ADVANCEDSECURITYMODE_0500
     * @tc.name       testEnableAdvancedSecurityMode005
     * @tc.desc       enableAdvancedSecurityMode with disableWebGL true
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testEnableAdvancedSecurityMode005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitEnableAdvancedSecurityMode005', 10)
      Utils.registerEvent('testEnableAdvancedSecurityMode005', true, 210005, done);
      sendEventByKey('EnableAdvancedSecurityModeButton', 10, '');
    })

    /**
     * @tc.number     SUB_WEB_ENABLE_ADVANCEDSECURITYMODE_0600
     * @tc.name       testEnableAdvancedSecurityMode006
     * @tc.desc       enableAdvancedSecurityMode with disableWebGL false
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testEnableAdvancedSecurityMode006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitEnableAdvancedSecurityMode006', 10)
      Utils.registerEvent('testEnableAdvancedSecurityMode006', true, 210006, done);
      sendEventByKey('EnableAdvancedSecurityModeButton', 10, '');
    })

    /**
     * @tc.number     SUB_WEB_ENABLE_ADVANCEDSECURITYMODE_0700
     * @tc.name       testEnableAdvancedSecurityMode007
     * @tc.desc       enableAdvancedSecurityMode with disablePDFViewer true
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testEnableAdvancedSecurityMode007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitEnableAdvancedSecurityMode007', 10)
      Utils.registerEvent('testEnableAdvancedSecurityMode007', true, 210007, done);
      sendEventByKey('EnableAdvancedSecurityModeButton', 10, '');
    })

    /**
     * @tc.number     SUB_WEB_ENABLE_ADVANCEDSECURITYMODE_0800
     * @tc.name       testEnableAdvancedSecurityMode008
     * @tc.desc       enableAdvancedSecurityMode with disablePDFViewer false
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testEnableAdvancedSecurityMode008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitEnableAdvancedSecurityMode008', 10)
      Utils.registerEvent('testEnableAdvancedSecurityMode008', true, 210008, done);
      sendEventByKey('EnableAdvancedSecurityModeButton', 10, '');
    })

    /**
     * @tc.number     SUB_WEB_ENABLE_ADVANCEDSECURITYMODE_0900
     * @tc.name       testEnableAdvancedSecurityMode009
     * @tc.desc       enableAdvancedSecurityMode with disableMathML true
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testEnableAdvancedSecurityMode009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitEnableAdvancedSecurityMode009', 10)
      Utils.registerEvent('testEnableAdvancedSecurityMode009', true, 210009, done);
      sendEventByKey('EnableAdvancedSecurityModeButton', 10, '');
    })

    /**
     * @tc.number     SUB_WEB_ENABLE_ADVANCEDSECURITYMODE_1000
     * @tc.name       testEnableAdvancedSecurityMode010
     * @tc.desc       enableAdvancedSecurityMode with disableMathML false
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testEnableAdvancedSecurityMode010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitEnableAdvancedSecurityMode010', 10)
      Utils.registerEvent('testEnableAdvancedSecurityMode010', true, 210010, done);
      sendEventByKey('EnableAdvancedSecurityModeButton', 10, '');
    })

    /**
     * @tc.number     SUB_WEB_ENABLE_ADVANCEDSECURITYMODE_1100
     * @tc.name       testEnableAdvancedSecurityMode011
     * @tc.desc       enableAdvancedSecurityMode with disableServiceWorker true
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testEnableAdvancedSecurityMode011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitEnableAdvancedSecurityMode011', 10)
      Utils.registerEvent('testEnableAdvancedSecurityMode011', true, 210011, done);
      sendEventByKey('EnableAdvancedSecurityModeButton', 10, '');
    })

    /**
     * @tc.number     SUB_WEB_ENABLE_ADVANCEDSECURITYMODE_1200
     * @tc.name       testEnableAdvancedSecurityMode012
     * @tc.desc       enableAdvancedSecurityMode with disableServiceWorker false
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testEnableAdvancedSecurityMode012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitEnableAdvancedSecurityMode012', 10)
      Utils.registerEvent('testEnableAdvancedSecurityMode012', true, 210012, done);
      sendEventByKey('EnableAdvancedSecurityModeButton', 10, '');
    })

    /**
     * @tc.number     SUB_WEB_ENABLE_ADVANCEDSECURITYMODE_1300
     * @tc.name       testEnableAdvancedSecurityMode013
     * @tc.desc       enableAdvancedSecurityMode with disableNonProxyUDP true
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testEnableAdvancedSecurityMode013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitEnableAdvancedSecurityMode013', 10)
      Utils.registerEvent('testEnableAdvancedSecurityMode013', true, 210013, done);
      sendEventByKey('EnableAdvancedSecurityModeButton', 10, '');
    })

    /**
     * @tc.number     SUB_WEB_ENABLE_ADVANCEDSECURITYMODE_1400
     * @tc.name       testEnableAdvancedSecurityMode014
     * @tc.desc       enableAdvancedSecurityMode with disableNonProxyUDP false
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testEnableAdvancedSecurityMode014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitEnableAdvancedSecurityMode014', 10)
      Utils.registerEvent('testEnableAdvancedSecurityMode014', true, 210014, done);
      sendEventByKey('EnableAdvancedSecurityModeButton', 10, '');
    })

    /**
     * @tc.number     SUB_WEB_ENABLE_ADVANCEDSECURITYMODE_1500
     * @tc.name       testEnableAdvancedSecurityMode015
     * @tc.desc       enableAdvancedSecurityMode with all params true
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testEnableAdvancedSecurityMode015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitEnableAdvancedSecurityMode015', 10)
      Utils.registerEvent('testEnableAdvancedSecurityMode015', true, 210015, done);
      sendEventByKey('EnableAdvancedSecurityModeButton', 10, '');
    })

    /**
     * @tc.number     SUB_WEB_ENABLE_ADVANCEDSECURITYMODE_1600
     * @tc.name       testEnableAdvancedSecurityMode016
     * @tc.desc       enableAdvancedSecurityMode with all params false
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testEnableAdvancedSecurityMode016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitEnableAdvancedSecurityMode016', 10)
      Utils.registerEvent('testEnableAdvancedSecurityMode016', true, 210016, done);
      sendEventByKey('EnableAdvancedSecurityModeButton', 10, '');
    })

    /**
     * @tc.number     SUB_WEB_ENABLE_ADVANCEDSECURITYMODE_1700
     * @tc.name       testEnableAdvancedSecurityMode017
     * @tc.desc       enableAdvancedSecurityMode with disableJITCompilation disableWebAssembly disableWebGL true
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testEnableAdvancedSecurityMode017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitEnableAdvancedSecurityMode017', 10)
      Utils.registerEvent('testEnableAdvancedSecurityMode017', true, 210017, done);
      sendEventByKey('EnableAdvancedSecurityModeButton', 10, '');
    })

    /**
     * @tc.number     SUB_WEB_ENABLE_ADVANCEDSECURITYMODE_1800
     * @tc.name       testEnableAdvancedSecurityMode018
     * @tc.desc       enableAdvancedSecurityMode with disablePDFViewer disableMathML disableServiceWorker disableNonProxyUDP true
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testEnableAdvancedSecurityMode018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitEnableAdvancedSecurityMode018', 10)
      Utils.registerEvent('testEnableAdvancedSecurityMode018', true, 210018, done);
      sendEventByKey('EnableAdvancedSecurityModeButton', 10, '');
    })

  })
}
