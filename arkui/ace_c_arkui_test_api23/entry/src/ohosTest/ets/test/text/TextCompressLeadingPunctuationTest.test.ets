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

import { beforeAll, describe, expect, it, Level, afterEach } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON } from '@ohos.UiTest';

export default function TextCompressLeadingPunctuationTest() {

  describe('TextCompressLeadingPunctuationTest', () => {

    let PAGE_TAG = 'TextCompressLeadingPunctuationTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`text/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   TextCompressLeadingPunctuationTest_0010
     * @tc.number TextCompressLeadingPunctuationTest_0010
     * @tc.desc   test CompressLeadingPunctuationTest is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextCompressLeadingPunctuationTest_0010', Level.LEVEL1, async (done: Function) => {
      console.info('[TextCompressLeadingPunctuationTest_0010] START');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let targetButton = await driver.findComponent(ON.id('textButtonCompressLeadingPunctuation'));
      await targetButton.click();
      await Utils.sleep(1000);
      console.info('buttonCompressLeadingPunctuation click')
      let strJson1 = getInspectorByKey('TextCompressLeadingPunctuation');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info('[TextCompressLeadingPunctuationTest_0010] compressLeadingPunctuation : ' + obj1.$attrs.compressLeadingPunctuation);
      expect(obj1.$attrs.compressLeadingPunctuation).assertEqual('false');
      console.info('[TextCompressLeadingPunctuationTest_0010] END');
      done();
    })

    /**
     * @tc.name   TextCompressLeadingPunctuationTest_0020
     * @tc.number TextCompressLeadingPunctuationTest_0020
     * @tc.desc   test CompressLeadingPunctuationTest is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextCompressLeadingPunctuationTest_0020', Level.LEVEL1, async (done: Function) => {
      console.info('[TextCompressLeadingPunctuationTest_0020] START');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let targetButton = await driver.findComponent(ON.id('textButtonCompressLeadingPunctuation1'));
      await targetButton.click();
      await Utils.sleep(1000);
      console.info('buttonCompressLeadingPunctuation1 click')
      let strJson1 = getInspectorByKey('TextCompressLeadingPunctuation');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info('[TextCompressLeadingPunctuationTest_0020] compressLeadingPunctuation : ' + obj1.$attrs.compressLeadingPunctuation);
      expect(obj1.$attrs.compressLeadingPunctuation).assertEqual('true');
      console.info('[TextCompressLeadingPunctuationTest_0020] END');
      done();
    })
  })
}