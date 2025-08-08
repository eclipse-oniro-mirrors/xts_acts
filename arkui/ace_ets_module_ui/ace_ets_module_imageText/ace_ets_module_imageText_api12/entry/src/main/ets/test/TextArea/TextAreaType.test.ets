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


export default function TextAreaTypeTest() {
  describe('TextAreaTypeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextAreaTypeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextArea/TextAreaType',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextAreaTypeTest state pages: " + JSON.stringify(pages));
        if (!("TextAreaType" == pages.name)) {
          console.info("get TextAreaTypeTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextAreaTypeTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextAreaTypeTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_TextAreaTypeTest_0010
     * @tc.name      TextAreaTypeTest_0010
     * @tc.desc      test TextArea: TextAreaType.NUMBER_DECIMAL
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('TextAreaTypeTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('[TextAreaTypeTest_0010] START');
      let strJson = getInspectorByKey('TextAreaType_NUMBER_DECIMAL');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaTypeTest_0010] TextAreaType: ' + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('TextAreaType.NUMBER_DECIMAL');
      console.info('[TextAreaTypeTest_0010] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_TextAreaTypeTest_0020
     * @tc.name      TextAreaTypeTest_0020
     * @tc.desc      test TextArea: TextAreaType.URL
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('TextAreaTypeTest_0020', Level.LEVEL0, async (done: Function) => {
      console.info('[TextAreaTypeTest_0020] START');
      let strJson = getInspectorByKey('TextAreaType_URL');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaTypeTest_0020] TextAreaType: ' + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('TextAreaType.URL');
      console.info('[TextAreaTypeTest_0020] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_TextAreaTypeTest_0030
     * @tc.name      TextAreaTypeTest_0030
     * @tc.desc      test TextArea: default
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('TextAreaTypeTest_0030', Level.LEVEL0, async (done: Function) => {
      console.info('[TextAreaTypeTest_0030] START');
      let strJson = getInspectorByKey('TextAreaType_default');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaTypeTest_0030] TextAreaType: ' + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('TextAreaType.NORMAL');
      console.info('[TextAreaTypeTest_0030] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_TextAreaTypeTest_0040
     * @tc.name      TextAreaTypeTest_0040
     * @tc.desc      test TextArea: undefined
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('TextAreaTypeTest_0040', Level.LEVEL0, async (done: Function) => {
      console.info('[TextAreaTypeTest_0040] START');
      let strJson = getInspectorByKey('TextAreaType_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaTypeTest_0040] TextAreaType: ' + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('TextAreaType.NORMAL');
      console.info('[TextAreaTypeTest_0040] END');
      done();
    });
  })
}