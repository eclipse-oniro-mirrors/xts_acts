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

export default function TextInputTest() {

  describe('TextInputTest', () => {

    let PAGE_TAG = 'TextInputTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`textTest/${PAGE_TAG}`, done);
    });

    /**
     * @tc.number    TextInputTest_0010
     * @tc.name      TextInputTest_0010
     * @tc.desc      test the attr of TextInput: includeFontPadding
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('TextInputTest_0010', Level.LEVEL1, async (done: Function) => {
      console.info('[TextInputTest_0010] START');

      await Utils.sleep(1500);
      let strJson = getInspectorByKey('textInputA');
      let obj: ESObject = JSON.parse(strJson);

      console.info('[TextInputTest_0010] includeFontPadding: ' + obj.$attrs.includeFontPadding);
      expect(obj.$attrs.includeFontPadding).assertEqual('0');

      console.info('[TextInputTest_0010] END');
      done();
    });

    /**
     * @tc.number    TextInputTest_0020
     * @tc.name      TextInputTest_0020
     * @tc.desc      test the attr of TextInput: includeFontPadding
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('TextInputTest_0020', Level.LEVEL1, async (done: Function) => {
      console.info('[TextInputTest_0020] START');

      await Utils.sleep(1500);
      let strJson = getInspectorByKey('textInputB');
      let obj: ESObject = JSON.parse(strJson);

      console.info('[TextInputTest_0020] includeFontPadding: ' + obj.$attrs.includeFontPadding);
      expect(obj.$attrs.includeFontPadding).assertEqual('1');

      console.info('[TextInputTest_0020] END');
      done();
    });

    /**
     * @tc.number    TextInputTest_0030
     * @tc.name      TextInputTest_0030
     * @tc.desc      test the attr of TextInput: fallbackLineSpacing
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('TextInputTest_0030', Level.LEVEL1, async (done: Function) => {
      console.info('[TextInputTest_0030] START');

     await Utils.sleep(1500);
      let strJson = getInspectorByKey('textInputC');
      let obj: ESObject = JSON.parse(strJson);

      console.info('[TextInputTest_0030] fallbackLineSpacing: ' + obj.$attrs.fallbackLineSpacing);
      expect(obj.$attrs.fallbackLineSpacing).assertEqual('0');

      console.info('[TextInputTest_0030] END');
      done();
    });

    /**
     * @tc.number    TextInputTest_0040
     * @tc.name      TextInputTest_0040
     * @tc.desc      test the attr of TextInput: fallbackLineSpacing
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('TextInputTest_0040', Level.LEVEL1, async (done: Function) => {
      console.info('[TextInputTest_0040] START');

      await Utils.sleep(1500);
      let strJson = getInspectorByKey('textInputD');
      let obj: ESObject = JSON.parse(strJson);

      console.info('[TextInputTest_0040] fallbackLineSpacing: ' + obj.$attrs.fallbackLineSpacing);
      expect(obj.$attrs.fallbackLineSpacing).assertEqual('1');

      console.info('[TextInputTest_0040] END');
      done();
    });
  })
}