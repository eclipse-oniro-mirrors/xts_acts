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

import router from '@ohos.router';
import { describe, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium"
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function TextAreaSetStyledPlaceholderTest() {
  describe('TextAreaSetStyledPlaceholderTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextAreaSetStyledPlaceholderTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextAreaApi22/TextAreaSetStyledPlaceholder',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextAreaSetStyledPlaceholderTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        await CommonFunc.sleep(1000);
        if (!("TextAreaSetStyledPlaceholder" == pages.name)) {
          console.info("get TextAreaSetStyledPlaceholderTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push TextAreaSetStyledPlaceholderTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextAreaSetStyledPlaceholderTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextAreaSetStyledPlaceholderTest after each called");
    });

    /**
     * @tc.name   TextAreaSetStyledPlaceholderTest_0010
     * @tc.number SUB_ACE_BASIC_ETS_API_TextAreaSetStyledPlaceholderTest_0010
     * @tc.desc   test TextArea setStyledPlaceholder: default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextAreaSetStyledPlaceholderTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[TextAreaSetStyledPlaceholderTest_0010] START');
      let strJson = getInspectorByKey('TextArea_setStyledPlaceholder_default');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaSetStyledPlaceholderTest_0010] TextArea: ' +
      JSON.stringify(obj.$attrs.placeholder));
      expect(obj.$attrs.placeholder).assertEqual('TextArea default');
      console.info("[TextAreaSetStyledPlaceholderTest_0010] END");
      done();
    });

    /**
     * @tc.name   TextAreaSetStyledPlaceholderTest_0020
     * @tc.number SUB_ACE_BASIC_ETS_API_TextAreaSetStyledPlaceholderTest_0020
     * @tc.desc   test TextArea setStyledPlaceholder: set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextAreaSetStyledPlaceholderTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[TextAreaSetStyledPlaceholderTest_0020] START');
      let strJson = getInspectorByKey('TextArea_setStyledPlaceholder_set');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaSetStyledPlaceholderTest_0020] TextArea: ' +
      JSON.stringify(obj.$attrs.placeholder));
      expect(obj.$attrs.placeholder).assertEqual('setStyledPlaceholder succ');
      console.info("[TextAreaSetStyledPlaceholderTest_0020] END");
      done();
    });
  })
}