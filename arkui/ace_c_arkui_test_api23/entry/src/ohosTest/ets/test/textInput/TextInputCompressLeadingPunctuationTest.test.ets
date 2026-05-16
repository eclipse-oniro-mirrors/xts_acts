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

export default function TextInputCompressLeadingPunctuationTest() {

  describe('TextInputCompressLeadingPunctuationTest', () => {

    let PAGE_TAG = 'TextInputCompressLeadingPunctuationTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`textInput/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   TextInputCompressLeadingPunctuationTest_0010
     * @tc.number TextInputCompressLeadingPunctuationTest_0010
     * @tc.desc   test CompressLeadingPunctuationTest is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextInputCompressLeadingPunctuationTest_0010', Level.LEVEL1, async (done: Function) => {
      console.info('[TextInputCompressLeadingPunctuationTest_0010] START');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let targetButton = await driver.findComponent(ON.id('textInputbuttonCompressLeadingPunctuation'));
      await targetButton.click();
      await Utils.sleep(1000);
      console.info('buttonCompressLeadingPunctuation click')
      let strJson1 = getInspectorByKey('TextInputCompressLeadingPunctuation');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info('[TextInputCompressLeadingPunctuationTest_0010] compressLeadingPunctuation : ' + obj1.$attrs.compressLeadingPunctuation);
      expect(obj1.$attrs.compressLeadingPunctuation).assertEqual('0');
      console.info('[TextInputCompressLeadingPunctuationTest_0010] END');
      done();
    })

    /**
     * @tc.name   TextInputCompressLeadingPunctuationTest_0020
     * @tc.number TextInputCompressLeadingPunctuationTest_0020
     * @tc.desc   test CompressLeadingPunctuationTest is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextInputCompressLeadingPunctuationTest_0020', Level.LEVEL1, async (done: Function) => {
      console.info('[TextInputCompressLeadingPunctuationTest_0020] START');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let targetButton = await driver.findComponent(ON.id('textInputbuttonCompressLeadingPunctuation1'));
      await targetButton.click();
      await Utils.sleep(1000);
      console.info('buttonCompressLeadingPunctuation1 click')
      let strJson1 = getInspectorByKey('TextInputCompressLeadingPunctuation');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info('[TextInputCompressLeadingPunctuationTest_0020] compressLeadingPunctuation : ' + obj1.$attrs.compressLeadingPunctuation);
      expect(obj1.$attrs.compressLeadingPunctuation).assertEqual('1');
      console.info('[TextInputCompressLeadingPunctuationTest_0020] END');
      done();
    })
  })
}