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

export default function TextAreaTest() {

  describe('TextAreaTest', () => {

    let PAGE_TAG = 'TextAreaTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`textTest/${PAGE_TAG}`, done);
    });

    /**
     * @tc.number    TextAreaTest_0010
     * @tc.name      TextAreaTest_0010
     * @tc.desc      test the attr of TextArea: includeFontPadding
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('TextAreaTest_0010', Level.LEVEL1, async (done: Function) => {
      console.info('[TextAreaTest_0010] START');

      await Utils.sleep(1500);
      let strJson1 = getInspectorByKey('textAreaA');
      let obj1: ESObject = JSON.parse(strJson1);

      console.info('[TextAreaTest_0010] includeFontPadding: ' + obj1.$attrs.includeFontPadding);
      expect(obj1.$attrs.includeFontPadding).assertEqual('0');

      console.info('[TextAreaTest_0010] END');
      done();
    });

    /**
     * @tc.number    TextAreaTest_0020
     * @tc.name      TextAreaTest_0020
     * @tc.desc      test the attr of TextArea: includeFontPadding
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('TextAreaTest_0020', Level.LEVEL1, async (done: Function) => {
      console.info('[TextAreaTest_0020] START');

      await Utils.sleep(1500);
      let strJson2 = getInspectorByKey('textAreaB');
      let obj2: ESObject = JSON.parse(strJson2);

      console.info('[TextAreaTest_0020] includeFontPadding: ' + obj2.$attrs.includeFontPadding);
      expect(obj2.$attrs.includeFontPadding).assertEqual('1');

      console.info('[TextAreaTest_0020] END');
      done();
    });

    /**
     * @tc.number    TextAreaTest_0030
     * @tc.name      TextAreaTest_0030
     * @tc.desc      test the attr of TextArea: fallbackLineSpacing
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('TextAreaTest_0030', Level.LEVEL1, async (done: Function) => {
      console.info('[TextAreaTest_0030] START');

     await Utils.sleep(1500);
      let strJson = getInspectorByKey('textAreaC');
      let obj: ESObject = JSON.parse(strJson);

      console.info('[TextAreaTest_0030] fallbackLineSpacing: ' + obj.$attrs.fallbackLineSpacing);
      expect(obj.$attrs.fallbackLineSpacing).assertEqual('0');

      console.info('[TextAreaTest_0030] END');
      done();
    });

    /**
     * @tc.number    TextAreaTest_0040
     * @tc.name      TextAreaTest_0040
     * @tc.desc      test the attr of TextArea: fallbackLineSpacing
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('TextAreaTest_0040', Level.LEVEL1, async (done: Function) => {
      console.info('[TextAreaTest_0040] START');

      await Utils.sleep(1500);
      let strJson = getInspectorByKey('textAreaD');
      let obj: ESObject = JSON.parse(strJson);

      console.info('[TextAreaTest_0040] fallbackLineSpacing: ' + obj.$attrs.fallbackLineSpacing);
      expect(obj.$attrs.fallbackLineSpacing).assertEqual('1');

      console.info('[TextAreaTest_0040] END');
      done();
    });
  })
}