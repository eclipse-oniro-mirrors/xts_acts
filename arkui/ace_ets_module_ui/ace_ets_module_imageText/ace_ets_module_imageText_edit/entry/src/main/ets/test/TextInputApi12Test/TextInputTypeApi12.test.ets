/**
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
import { describe, beforeEach, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';


export default function TextInputTypeApi12Test() {
  describe('TextInputTypeApi12Test', () => {
    beforeEach(async (done: Function) => {
      console.info("TextInputTypeApi12Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInputApi12/TextInputTypeApi12',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextInputTypeApi12Test state pages: " + JSON.stringify(pages));
        if (!("TextInputTypeApi12" == pages.name)) {
          console.info("get TextInputTypeApi12Test state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextInputTypeApi12Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextInputTypeApi12Test page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   TextInputTypeApi12Test_0010
     * @tc.number SUB_ACE_TextInputTypeApi12Test_0010
     * @tc.desc   test TextInput type: InputType.URL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextInputTypeApi12Test_0010', Level.LEVEL0, async (done: Function) => {
      console.info('[TextInputTypeApi12Test_0010] START');
      let strJson = getInspectorByKey('TextInputTypeApi12_URL');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextInputTypeApi12Test_0010] TextInputType: ' + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('InputType.URL');
      console.info('[TextInputTypeApi12Test_0010] END');
      done();
    });

    /**
     * @tc.name   TextInputTypeApi12Test_0020
     * @tc.number SUB_ACE_TextInputTypeApi12Test_0020
     * @tc.desc   test TextInput type: default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextInputTypeApi12Test_0020', Level.LEVEL0, async (done: Function) => {
      console.info('[TextInputTypeApi12Test_0020] START');
      let strJson = getInspectorByKey('TextInputTypeApi12_default');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextInputTypeApi12Test_0020] TextInputType: ' + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('InputType.Normal');
      console.info('[TextInputTypeApi12Test_0020] END');
      done();
    });

    /**
     * @tc.name   TextInputTypeApi12Test_0030
     * @tc.number SUB_ACE_TextInputTypeApi12Test_0030
     * @tc.desc   test TextInput type: undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextInputTypeApi12Test_0030', Level.LEVEL0, async (done: Function) => {
      console.info('[TextInputTypeApi12Test_0030] START');
      let strJson = getInspectorByKey('TextInputTypeApi12_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextInputTypeApi12Test_0030] TextInputType: ' + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('InputType.Normal');
      console.info('[TextInputTypeApi12Test_0030] END');
      done();
    });
  })
}