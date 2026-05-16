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

export default function textContentAlignTest() {

  describe('TextContentAlignTest', () => {

    let PAGE_TAG = 'TextContentAlignTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`textContentAlign/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   textContentAlignTest_001
     * @tc.number textContentAlignTest_001
     * @tc.desc   test the attr of Text: textContentAlign(TextContentAlign.TOP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textContentAlignTest_001', Level.LEVEL1, async (done: Function) => {
      console.info('[textContentAlignTest_001] START');

      await Utils.sleep(100);
      let strJson = getInspectorByKey('textTop');
      let obj: ESObject = JSON.parse(strJson);

      console.info('[textContentAlignTest_001] textContentAlign: ' + obj.$attrs.textContentAlign);
      expect(obj.$attrs.textContentAlign).assertEqual('TextContentAlign.TOP');

      console.info('[textContentAlignTest_001] END');
      done();
    })

    /**
     * @tc.name   textContentAlignTest_002
     * @tc.number textContentAlignTest_002
     * @tc.desc   test the attr of Text: textContentAlign(TextContentAlign.CENTER)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textContentAlignTest_002', Level.LEVEL1, async (done: Function) => {
      console.info('[textContentAlignTest_002] START');

      await Utils.sleep(100);
      let strJson = getInspectorByKey('textCenter');
      let obj: ESObject = JSON.parse(strJson);

      console.info('[textContentAlignTest_002] textContentAlign: ' + obj.$attrs.textContentAlign);
      expect(obj.$attrs.textContentAlign).assertEqual('TextContentAlign.CENTER');

      console.info('[textContentAlignTest_002] END');
      done();
    })

    /**
     * @tc.name   textContentAlignTest_003
     * @tc.number textContentAlignTest_003
     * @tc.desc   test the attr of Text: textContentAlign(TextContentAlign.BOTTOM)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textContentAlignTest_003', Level.LEVEL1, async (done: Function) => {
      console.info('[textContentAlignTest_003] START');

      await Utils.sleep(100);
      let strJson = getInspectorByKey('textBottom');
      let obj: ESObject = JSON.parse(strJson);

      console.info('[textContentAlignTest_003] textContentAlign: ' + obj.$attrs.textContentAlign);
      expect(obj.$attrs.textContentAlign).assertEqual('TextContentAlign.BOTTOM');

      console.info('[textContentAlignTest_003] END');
      done();
    })
  })
}