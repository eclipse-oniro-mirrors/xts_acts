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

export default function TextInputSetStyledPlaceholderTest() {
  describe('TextInputSetStyledPlaceholderTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextInputSetStyledPlaceholderTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInputApi22/TextInputSetStyledPlaceholder',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextInputSetStyledPlaceholderTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        await CommonFunc.sleep(1000);
        if (!("TextInputSetStyledPlaceholder" == pages.name)) {
          console.info("get TextInputSetStyledPlaceholderTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push TextInputSetStyledPlaceholderTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextInputSetStyledPlaceholderTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextInputSetStyledPlaceholderTest after each called");
    });

    /**
     * @tc.name   TextInputSetStyledPlaceholderTest_0010
     * @tc.number SUB_ACE_BASIC_ETS_API_TextInputSetStyledPlaceholderTest_0010
     * @tc.desc   test TextInput setStyledPlaceholder: default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextInputSetStyledPlaceholderTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[TextInputSetStyledPlaceholderTest_0010] START');
      let strJson = getInspectorByKey('TextInput_setStyledPlaceholder_default');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextInputSetStyledPlaceholderTest_0010] TextInput: ' +
      JSON.stringify(obj.$attrs.placeholder));
      expect(obj.$attrs.placeholder).assertEqual('TextInput default');
      console.info("[TextInputSetStyledPlaceholderTest_0010] END");
      done();
    });

    /**
     * @tc.name   TextInputSetStyledPlaceholderTest_0020
     * @tc.number SUB_ACE_BASIC_ETS_API_TextInputSetStyledPlaceholderTest_0020
     * @tc.desc   test TextInput setStyledPlaceholder: set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextInputSetStyledPlaceholderTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[TextInputSetStyledPlaceholderTest_0020] START');
      let strJson = getInspectorByKey('TextInput_setStyledPlaceholder_set');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextInputSetStyledPlaceholderTest_0020] TextInput: ' +
      JSON.stringify(obj.$attrs.placeholder));
      expect(obj.$attrs.placeholder).assertEqual('setStyledPlaceholder succ');
      console.info("[TextInputSetStyledPlaceholderTest_0020] END");
      done();
    });
  })
}