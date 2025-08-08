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


export default function TextInputTypeTest() {
  describe('TextInputTypeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextInputTypeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/TextInputType',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextInputTypeTest state pages: " + JSON.stringify(pages));
        if (!("TextInputType" == pages.name)) {
          console.info("get TextInputTypeTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextInputTypeTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextInputTypeTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_TextInputTypeTest_0010
     * @tc.name      TextInputTypeTest_0010
     * @tc.desc      test TextInput type: InputType.URL
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('TextInputTypeTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('[TextInputTypeTest_0010] START');
      let strJson = getInspectorByKey('TextInputType_URL');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextInputTypeTest_0010] TextInputType: ' + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('InputType.URL');
      console.info('[TextInputTypeTest_0010] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_TextInputTypeTest_0020
     * @tc.name      TextInputTypeTest_0020
     * @tc.desc      test TextInput type: default
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('TextInputTypeTest_0020', Level.LEVEL0, async (done: Function) => {
      console.info('[TextInputTypeTest_0020] START');
      let strJson = getInspectorByKey('TextInputType_default');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextInputTypeTest_0020] TextInputType: ' + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('InputType.Normal');
      console.info('[TextInputTypeTest_0020] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_TextInputTypeTest_0030
     * @tc.name      TextInputTypeTest_0030
     * @tc.desc      test TextInput type: undefined
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('TextInputTypeTest_0030', Level.LEVEL0, async (done: Function) => {
      console.info('[TextInputTypeTest_0030] START');
      let strJson = getInspectorByKey('TextInputType_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextInputTypeTest_0030] TextInputType: ' + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('InputType.Normal');
      console.info('[TextInputTypeTest_0030] END');
      done();
    });
  })
}