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
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function TextAreaTypeApi12Test() {
  describe('TextAreaTypeApi12Test', () => {
    beforeEach(async (done: Function) => {
      console.info("TextAreaTypeApi12Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextAreaApi12/TextAreaTypeApi12',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextAreaTypeApi12Test state pages: " + JSON.stringify(pages));
        if (!("TextAreaTypeApi12" == pages.name)) {
          console.info("get TextAreaTypeApi12Test state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextAreaTypeApi12Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextAreaTypeApi12Test page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   TextAreaTypeApi12Test_0010
     * @tc.number SUB_ACE_TextAreaTypeApi12Test_0010
     * @tc.desc   test TextArea: TextAreaType.NUMBER_DECIMAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextAreaTypeApi12Test_0010', Level.LEVEL0, async (done: Function) => {
      console.info('[TextAreaTypeApi12Test_0010] START');
      let strJson = getInspectorByKey('TextAreaTypeApi12_NUMBER_DECIMAL');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaTypeApi12Test_0010] TextAreaType: ' + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('TextAreaType.NUMBER_DECIMAL');
      console.info('[TextAreaTypeApi12Test_0010] END');
      done();
    });

    /**
     * @tc.name   TextAreaTypeApi12Test_0020
     * @tc.number SUB_ACE_TextAreaTypeApi12Test_0020
     * @tc.desc   test TextArea: TextAreaType.URL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextAreaTypeApi12Test_0020', Level.LEVEL0, async (done: Function) => {
      console.info('[TextAreaTypeApi12Test_0020] START');
      let strJson = getInspectorByKey('TextAreaTypeApi12_URL');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaTypeApi12Test_0020] TextAreaType: ' + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('TextAreaType.URL');
      console.info('[TextAreaTypeApi12Test_0020] END');
      done();
    });

    /**
     * @tc.name   TextAreaTypeApi12Test_0030
     * @tc.number SUB_ACE_TextAreaTypeApi12Test_0030
     * @tc.desc   test TextArea: default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextAreaTypeApi12Test_0030', Level.LEVEL0, async (done: Function) => {
      console.info('[TextAreaTypeApi12Test_0030] START');
      let strJson = getInspectorByKey('TextAreaTypeApi12_default');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaTypeApi12Test_0030] TextAreaType: ' + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('TextAreaType.NORMAL');
      console.info('[TextAreaTypeApi12Test_0030] END');
      done();
    });

    /**
     * @tc.name   TextAreaTypeApi12Test_0040
     * @tc.number SUB_ACE_TextAreaTypeApi12Test_0040
     * @tc.desc   test TextArea: undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextAreaTypeApi12Test_0040', Level.LEVEL0, async (done: Function) => {
      console.info('[TextAreaTypeApi12Test_0040] START');
      let strJson = getInspectorByKey('TextAreaTypeApi12_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaTypeApi12Test_0040] TextAreaType: ' + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('TextAreaType.NORMAL');
      console.info('[TextAreaTypeApi12Test_0040] END');
      done();
    });
  })
}