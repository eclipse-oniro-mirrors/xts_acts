/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect , TestType, Size, Level } from '@ohos/hypium';
import { webview } from '@kit.ArkWeb';
import { temp } from './Const';
import { BusinessError } from '@kit.BasicServicesKit';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      webview.WebviewController.initializeWebEngine()
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number Sub_WEB_PrefetchResource_0100
     * @tc.name testPrefetchResource01
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testPrefetchResource01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_0100 start')
      console.info('Sub_WEB_PrefetchResource_0100 start')
      let info: webview.RequestInfo = {
        url: "//collect-v6.51.la/v6/collect?dt=4",
        method: "POST",
        formData: ""
      }
      let hands: Array<webview.WebHeader> = [{
        headerKey: "user-agent",
        headerValue: "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36"
      }, {
        headerKey: "content-type",
        headerValue: "application/x-www-form-urlencoded"
      }]

      try {
        webview.WebviewController.prefetchResource(info, hands)
      } catch (e) {
        console.error(`[PrefetchResource] ErrorCode: ${(e as BusinessError).code},  Message: ${(e as BusinessError).message}`);
        expect(e.code).assertEqual("17100002")
        expect(e.message).assertEqual("URL error. Possible causes:1.No valid cookie found for the specified URL. 2.The webpage corresponding to the URL is invalid, or the URL length exceeds 2048.")
        console.info('Sub_WEB_PrefetchResource_0100 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_0100 end')
        return
      }
      expect(false).assertTrue()
      console.info('Sub_WEB_PrefetchResource_0100 end')
      hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_0100 end')
    })

    /**
     * @tc.number Sub_WEB_PrefetchResource_0200
     * @tc.name testPrefetchResource02
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testPrefetchResource02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_0200 start')
      console.info('Sub_WEB_PrefetchResource_0200 start')
      let info: webview.RequestInfo = {
        url: "http://collect-v6.51.la/v6/collect?dt=4",
        method: "GET",
        formData: ""
      }
      let hands: Array<webview.WebHeader> = [{
        headerKey: "user-agent",
        headerValue: "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36"
      }, {
        headerKey: "content-type",
        headerValue: "application/x-www-form-urlencoded"
      }]

      try {
        webview.WebviewController.prefetchResource(info, hands)
      } catch (e) {
        console.error(`[PrefetchResource] ErrorCode: ${(e as BusinessError).code},  Message: ${(e as BusinessError).message}`);
        expect(e.code).assertEqual("401")
        expect(e.message).assertEqual("Invalid input parameter")
        console.info('Sub_WEB_PrefetchResource_0200 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_0200 end')
        return
      }
      expect(false).assertTrue()
      console.info('Sub_WEB_PrefetchResource_0200 end')
      hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_0200 end')
    })

    /**
     * @tc.number Sub_WEB_PrefetchResource_0300
     * @tc.name testPrefetchResource03
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testPrefetchResource03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_0300 start')
      console.info('Sub_WEB_PrefetchResource_0300 start')

      let info: webview.RequestInfo = {
        url: "http://collect-v6.51.la/v6/collect?dt=4",
        method: "POST",
        formData: temp
      }
      let hands: Array<webview.WebHeader> = [{
        headerKey: "user-agent",
        headerValue: "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36"
      }, {
        headerKey: "content-type",
        headerValue: "application/x-www-form"
      }]

      try {
        webview.WebviewController.prefetchResource(info, hands)
      } catch (e) {
        console.error(`[PrefetchResource] ErrorCode: ${(e as BusinessError).code},  Message: ${(e as BusinessError).message}`);
        expect(e.code).assertEqual("401")
        expect(e.message).assertEqual("Invalid input parameter")
        console.info('Sub_WEB_PrefetchResource_0300 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_0300 end')
        return
      }
      expect(false).assertTrue()
      console.info('Sub_WEB_PrefetchResource_0300 end')
      hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_0300 end')
    })

    /**
     * @tc.number Sub_WEB_PrefetchResource_0400
     * @tc.name testPrefetchResource04
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testPrefetchResource04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_0400 start')
      console.info('Sub_WEB_PrefetchResource_0400 start')
      let info: webview.RequestInfo = {
        url: "http://collect-v6.51.la/v6/collect?dt=4",
        method: "POST",
        formData: ""
      }
      let hands: Array<webview.WebHeader> = [{
        headerKey: "",
        headerValue: "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36"
      }, {
        headerKey: "",
        headerValue: "application/x-www-form-urlencoded"
      }]

      try {
        webview.WebviewController.prefetchResource(info, hands)
      } catch (e) {
        console.error(`[PrefetchResource] ErrorCode: ${(e as BusinessError).code},  Message: ${(e as BusinessError).message}`);
        expect(e.code).assertEqual("401")
        expect(e.message).assertEqual("Invalid input parameter")
        console.info('Sub_WEB_PrefetchResource_0400 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_0400 end')
        return
      }
      expect(false).assertTrue()
      console.info('Sub_WEB_PrefetchResource_0400 end')
      hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_0400 end')
    })

    /**
     * @tc.number Sub_WEB_PrefetchResource_0500
     * @tc.name testPrefetchResource05
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testPrefetchResource05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_0500 start')
      console.info('Sub_WEB_PrefetchResource_0500 start')
      let info: webview.RequestInfo = {
        url: "http://collect-v6.51.la/v6/collect?dt=4",
        method: "POST",
        formData: ""
      }

      let hands: Array<webview.WebHeader> = [{
        headerKey: "ww",
        headerValue: temp,
      }, {
        headerKey: "content-type",
        headerValue: "application/xml; charset=UTF-w"
      }]

      try {
        webview.WebviewController.prefetchResource(info, hands)
      } catch (e) {
        console.error(`[PrefetchResource] ErrorCode: ${(e as BusinessError).code},  Message: ${(e as BusinessError).message}`);
        expect(e.code).assertEqual("401")
        expect(e.message).assertEqual("Invalid input parameter")
        console.info('Sub_WEB_PrefetchResource_0500 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_0500 end')
        return
      }
      expect(false).assertTrue()
      console.info('Sub_WEB_PrefetchResource_0500 end')
      hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_0500 end')
    })

    /**
     * @tc.number Sub_WEB_PrefetchResource_0600
     * @tc.name testPrefetchResource06
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testPrefetchResource06', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_0600 start')
      console.info('Sub_WEB_PrefetchResource_0600 start')
      let info: webview.RequestInfo = {
        url: "http://collect-v6.51.la/v6/collect?dt=4",
        method: "POST",
        formData: ""
      }
      let hands: Array<webview.WebHeader> = [{
        headerKey: "user-agent",
        headerValue: "",
      }, {
        headerKey: "content-type",
        headerValue: "application/json; charset=UTF-8"
      }]

      try {
        webview.WebviewController.prefetchResource(info, hands, "\t")
      } catch (e) {
        console.error(`[PrefetchResource] ErrorCode: ${(e as BusinessError).code},  Message: ${(e as BusinessError).message}`);
        expect(e.code).assertEqual("401")
        expect(e.message).assertEqual("Invalid input parameter")
        console.info('Sub_WEB_PrefetchResource_0600 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_0600 end')
        return
      }
      expect(false).assertTrue()
      console.info('Sub_WEB_PrefetchResource_0600 end')
      hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_0600 end')
    })

    /**
     * @tc.number Sub_WEB_PrefetchResource_0900
     * @tc.name testPrefetchResource09
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testPrefetchResource09', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_0900 start')
      console.info('Sub_WEB_PrefetchResource_0900 start')
      let info: webview.RequestInfo = {
        url: "file://collect-v6.51.la/v6/collect?dt=4",
        method: "POST",
        formData: ""
      }
      let hands: Array<webview.WebHeader> = [{
        headerKey: "user-agent",
        headerValue: "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36"
      }, {
        headerKey: "content-type",
        headerValue: "application/x-www-form-urlencoded"
      }]

      try {
        webview.WebviewController.prefetchResource(info, hands)
      } catch (e) {
        console.error(`[PrefetchResource] ErrorCode: ${(e as BusinessError).code},  Message: ${(e as BusinessError).message}`);
        expect(e.code).assertEqual("17100002")
        expect(e.message).assertEqual("URL error. Possible causes:1.No valid cookie found for the specified URL. 2.The webpage corresponding to the URL is invalid, or the URL length exceeds 2048.")
        console.info('Sub_WEB_PrefetchResource_0900 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_0900 end')
        return
      }
      expect(false).assertTrue()
      console.info('Sub_WEB_PrefetchResource_0900 end')
      hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_0900 end')
    })

    /**
     * @tc.number Sub_WEB_PrefetchResource_1000
     * @tc.name testPrefetchResource10
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testPrefetchResource10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_1000 start')
      console.info('Sub_WEB_PrefetchResource_1000 start')
      let info: webview.RequestInfo = {
        url: "ssh://collect-v6.51.la/v6/collect?dt=4",
        method: "POST",
        formData: ""
      }
      let hands: Array<webview.WebHeader> = [{
        headerKey: "user-agent",
        headerValue: "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36"
      }, {
        headerKey: "content-type",
        headerValue: "application/x-www-form-urlencoded"
      }]

      try {
        webview.WebviewController.prefetchResource(info, hands)
      } catch (e) {
        console.error(`[PrefetchResource] ErrorCode: ${(e as BusinessError).code},  Message: ${(e as BusinessError).message}`);
        expect(e.code).assertEqual("17100002")
        expect(e.message).assertEqual("URL error. Possible causes:1.No valid cookie found for the specified URL. 2.The webpage corresponding to the URL is invalid, or the URL length exceeds 2048.")
        console.info('Sub_WEB_PrefetchResource_1000 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_1000 end')
        return
      }
      expect(false).assertTrue()
      console.info('Sub_WEB_PrefetchResource_1000 end')
      hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_1000 end')
    })

    /**
     * @tc.number Sub_WEB_PrefetchResource_1100
     * @tc.name testPrefetchResource11
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testPrefetchResource11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_1100 start')
      console.info('Sub_WEB_PrefetchResource_1100 start')
      let info: webview.RequestInfo = {
        url: "XXX://collect-v6.51.la/v6/collect?dt=4",
        method: "POST",
        formData: ""
      }
      let hands: Array<webview.WebHeader> = [{
        headerKey: "user-agent",
        headerValue: "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36"
      }, {
        headerKey: "content-type",
        headerValue: "application/x-www-form-urlencoded"
      }]

      try {
        webview.WebviewController.prefetchResource(info, hands)
      } catch (e) {
        console.error(`[PrefetchResource] ErrorCode: ${(e as BusinessError).code},  Message: ${(e as BusinessError).message}`);
        expect(e.code).assertEqual("17100002")
        expect(e.message).assertEqual("URL error. Possible causes:1.No valid cookie found for the specified URL. 2.The webpage corresponding to the URL is invalid, or the URL length exceeds 2048.")
        console.info('Sub_WEB_PrefetchResource_1100 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_1100 end')
        return
      }
      expect(false).assertTrue()
      console.info('Sub_WEB_PrefetchResource_1100 end')
      hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_1100 end')
    })

    /**
     * @tc.number Sub_WEB_PrefetchResource_1200
     * @tc.name testPrefetchResource12
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testPrefetchResource12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_1200 start')
      console.info('Sub_WEB_PrefetchResource_1200 start')
      let info: webview.RequestInfo = {
        url: "http://collect-v6.51.la/v6/collect?dt=4",
        method: "PUT",
        formData: ""
      }
      let hands: Array<webview.WebHeader> = [{
        headerKey: "user-agent",
        headerValue: "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36"
      }, {
        headerKey: "content-type",
        headerValue: "application/x-www-form-urlencoded"
      }]

      try {
        webview.WebviewController.prefetchResource(info, hands)
      } catch (e) {
        console.error(`[PrefetchResource] ErrorCode: ${(e as BusinessError).code},  Message: ${(e as BusinessError).message}`);
        expect(e.code).assertEqual("401")
        expect(e.message).assertEqual("Invalid input parameter")
        console.info('Sub_WEB_PrefetchResource_1200 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_1200 end')
        return
      }
      expect(false).assertTrue()
      console.info('Sub_WEB_PrefetchResource_1200 end')
      hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_1200 end')
    })

    /**
     * @tc.number Sub_WEB_PrefetchResource_1300
     * @tc.name Sub_WEB_PrefetchResource_1300
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testPrefetchResource13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_1300 start')
      console.info('Sub_WEB_PrefetchResource_1300 start')
      let info: webview.RequestInfo = {
        url: "http://collect-v6.51.la/v6/collect?dt=4",
        method: "DELETE",
        formData: ""
      }
      let hands: Array<webview.WebHeader> = [{
        headerKey: "user-agent",
        headerValue: "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36"
      }, {
        headerKey: "content-type",
        headerValue: "application/x-www-form-urlencoded"
      }]

      try {
        webview.WebviewController.prefetchResource(info, hands)
      } catch (e) {
        console.error(`[PrefetchResource] ErrorCode: ${(e as BusinessError).code},  Message: ${(e as BusinessError).message}`);
        expect(e.code).assertEqual("401")
        expect(e.message).assertEqual("Invalid input parameter")
        console.info('Sub_WEB_PrefetchResource_1300 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_1300 end')
        return
      }
      expect(false).assertTrue()
      console.info('Sub_WEB_PrefetchResource_1300 end')
      hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_1300 end')
    })

    /**
     * @tc.number Sub_WEB_PrefetchResource_1400
     * @tc.name testPrefetchResource14
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testPrefetchResource14', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_1400 start')
      console.info('Sub_WEB_PrefetchResource_1400 start')
      let info: webview.RequestInfo = {
        url: "http://collect-v6.51.la/v6/collect?dt=4",
        method: "",
        formData: ""
      }
      let hands: Array<webview.WebHeader> = [{
        headerKey: "user-agent",
        headerValue: "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36"
      }, {
        headerKey: "content-type",
        headerValue: "application/x-www-form-urlencoded"
      }]

      try {
        webview.WebviewController.prefetchResource(info, hands)
      } catch (e) {
        console.error(`[PrefetchResource] ErrorCode: ${(e as BusinessError).code},  Message: ${(e as BusinessError).message}`);
        expect(e.code).assertEqual("401")
        expect(e.message).assertEqual("Invalid input parameter")
        console.info('Sub_WEB_PrefetchResource_1400 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_1400 end')
        return
      }
      expect(false).assertTrue()
      console.info('Sub_WEB_PrefetchResource_1400 end')
      hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_1400 end')
    })

    /**
     * @tc.number Sub_WEB_PrefetchResource_1500
     * @tc.name testPrefetchResource15
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testPrefetchResource15', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_1500 start')
      console.info('Sub_WEB_PrefetchResource_1500 start')
      let info: webview.RequestInfo = {
        url: "http://collect-v6.51.la/v6/collect?dt=4",
        method: "POST",
        formData: ""
      }
      let hands: Array<webview.WebHeader> = [{
        headerKey: temp,
        headerValue: "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36"
      }, {
        headerKey: temp,
        headerValue: "application/x-www-form-urlencoded"
      }]

      try {
        webview.WebviewController.prefetchResource(info, hands)
      } catch (e) {
        console.error(`[PrefetchResource] ErrorCode: ${(e as BusinessError).code},  Message: ${(e as BusinessError).message}`);
        expect(e.code).assertEqual("401")
        expect(e.message).assertEqual("Invalid input parameter")
        console.info('Sub_WEB_PrefetchResource_1500 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_1500 end')
        return
      }
      expect(false).assertTrue()
      console.info('Sub_WEB_PrefetchResource_1500 end')
      hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_1500 end')
    })

    /**
     * @tc.number Sub_WEB_PrefetchResource_1600
     * @tc.name testPrefetchResource16
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testPrefetchResource16', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_1600 start')
      console.info('Sub_WEB_PrefetchResource_1600 start')
      let info: webview.RequestInfo = {
        url: "http://collect-v6.51.la/v6/collect?dt=4",
        method: "POST",
        formData: ""
      }
      let hands: Array<webview.WebHeader> = [{
        headerKey: "user-agent",
        headerValue: "",
      }, {
        headerKey: "content-type",
        headerValue: "application/json; charset=UTF-8"
      }]

      try {
        webview.WebviewController.prefetchResource(info, hands, temp)
      } catch (e) {
        console.error(`[PrefetchResource] ErrorCode: ${(e as BusinessError).code},  Message: ${(e as BusinessError).message}`);
        expect(e.code).assertEqual("401")
        expect(e.message).assertEqual("Invalid input parameter")
        console.info('Sub_WEB_PrefetchResource_1600 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_1600 end')
        return
      }
      expect(false).assertTrue()
      console.info('Sub_WEB_PrefetchResource_1600 end')
      hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_1600 end')
    })

    /**
     * @tc.number Sub_WEB_PrefetchResource_1700
     * @tc.name testPrefetchResource17
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testPrefetchResource17', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_1700 start')
      console.info('Sub_WEB_PrefetchResource_1700 start')
      let info: webview.RequestInfo = {
        url: "http://collect-v6.51.la/v6/collect?dt=4",
        method: "POST",
        formData: ""
      }
      let hands: Array<webview.WebHeader> = [{
        headerKey: "user-agent",
        headerValue: "",
      }, {
        headerKey: "content-type",
        headerValue: "application/json; charset=UTF-8"
      }]

      try {
        webview.WebviewController.prefetchResource(info, hands, "event", temp)
      } catch (e) {
        console.error(`[PrefetchResource] ErrorCode: ${(e as BusinessError).code},  Message: ${(e as BusinessError).message}`);
        expect(e.code).assertEqual("401")
        expect(e.message).assertEqual("Invalid input parameter")
        console.info('Sub_WEB_PrefetchResource_1700 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_1700 end')
        return
      }
      expect(false).assertTrue()
      console.info('Sub_WEB_PrefetchResource_1700 end')
      hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_1700 end')
    })

    /**
     * @tc.number Sub_WEB_PrefetchResource_1800
     * @tc.name testPrefetchResource18
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testPrefetchResource18', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_1800 start')
      console.info('Sub_WEB_PrefetchResource_1800 start')
      let info: webview.RequestInfo = {
        url: "http://collect-v6.51.la/v6/collect?dt=4",
        method: "POST",
        formData: ""
      }
      let hands: Array<webview.WebHeader> = [{
        headerKey: "user-agent",
        headerValue: "",
      }, {
        headerKey: "content-type",
        headerValue: "application/json; charset=UTF-8"
      }]

      try {
        webview.WebviewController.prefetchResource(info, hands, temp)
      } catch (e) {
        console.error(`[PrefetchResource] ErrorCode: ${(e as BusinessError).code},  Message: ${(e as BusinessError).message}`);
        expect(e.code).assertEqual("401")
        expect(e.message).assertEqual("Invalid input parameter")
        console.info('Sub_WEB_PrefetchResource_1800 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_1800 end')
        return
      }
      expect(false).assertTrue()
      console.info('Sub_WEB_PrefetchResource_1800 end')
      hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_1800 end')
    })
  })
}
