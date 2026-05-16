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

import { expect, describe, it, afterEach, Level } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';

export default function ProgressLinearStyleTest(){

  describe('ProgressLinearStyleTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.name   testProgressLinearStyle001
     * @tc.number SUB_ARKUI_CAPI_PROGRESS_LINRAT_STYLE_0100
     * @tc.desc   testing progress linear style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressLinearStyle001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'TestProgressLinearStyle';
      await Utils.pushPage(`progress/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('progress');
      await driver.delayMs(1000);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testProgressLinearStyle001] component width strJson:" + JSON.stringify(strJson));
      expect(obj.$attrs.linearStyle.strokeWidth).assertEqual('50.00vp');
      expect(obj.$attrs.linearStyle.strokeRadius).assertEqual('20.00vp');
      expect(obj.$attrs.enableSmoothEffect).assertEqual('false');
      expect(obj.$attrs.linearStyle.enableScanEffect).assertEqual('true');
      done();
    });

    /**
     * @tc.name   testProgressLinearStyle002
     * @tc.number SUB_ARKUI_CAPI_PROGRESS_LINRAT_STYLE_0200
     * @tc.desc   testing progress linear style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressLinearStyle002', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'TestProgressLinearStyle';
      await Utils.pushPage(`progress/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('progress1');
      await driver.delayMs(1000);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testProgressLinearStyle002] component width strJson:" + JSON.stringify(strJson));
      expect(obj.$attrs.linearStyle.strokeWidth).assertEqual('4.00vp');
      expect(obj.$attrs.linearStyle.strokeRadius).assertEqual('2.00vp');
      done();
    });

    /**
     * @tc.name   testProgressLinearStyle003
     * @tc.number SUB_ARKUI_CAPI_PROGRESS_LINRAT_STYLE_0100
     * @tc.desc   testing progress linear style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressLinearStyle003', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'TestProgressLinearStyle';
      await Utils.pushPage(`progress/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)
      let progress = await driver.findComponent(ON.id('progress'));
      await progress.click();
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('progress');
      await driver.delayMs(1000);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testProgressLinearStyle003] component width strJson:" + JSON.stringify(strJson));
      expect(obj.$attrs.linearStyle.strokeWidth).assertEqual('4.00vp');
      expect(obj.$attrs.linearStyle.strokeRadius).assertEqual('2.00vp');
      expect(obj.$attrs.enableSmoothEffect).assertEqual('true');
      expect(obj.$attrs.linearStyle.enableScanEffect).assertEqual('false');
      done();
    });

    /**
     * @tc.name   testProgressLinearStyle004
     * @tc.number SUB_ARKUI_CAPI_PROGRESS_LINRAT_STYLE_0100
     * @tc.desc   testing progress linear style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressLinearStyle004', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'TestProgressLinearStyle';
      await Utils.pushPage(`progress/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('progress2');
      await driver.delayMs(1000);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testProgressLinearStyle004] component width strJson:" + JSON.stringify(strJson));
      expect(obj.$attrs.linearStyle.strokeWidth).assertEqual('9.00vp');
      expect(obj.$attrs.linearStyle.strokeRadius).assertEqual('4.50vp');
      expect(obj.$attrs.enableSmoothEffect).assertEqual('true');
      expect(obj.$attrs.linearStyle.enableScanEffect).assertEqual('false');
      done();
    });
  })
}
