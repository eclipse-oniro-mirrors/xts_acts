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


export default function TextAreaTextDirectionTest() {
  describe('TextAreaTextDirectionTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextAreaTextDirectionTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextAreaApi23/TextAreaTextDirection',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextAreaTextDirectionTest state pages: " + JSON.stringify(pages));
        if (!("TextAreaTextDirection" == pages.name)) {
          console.info("get TextAreaTextDirectionTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextAreaTextDirectionTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextAreaTextDirectionTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   TextAreaTextDirectionTest_0010
     * @tc.number SUB_ACE_TextAreaTextDirectionTest_0010
     * @tc.desc   test the textDirection of TextArea: TextDirection.LTR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextAreaTextDirectionTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[TextAreaTextDirectionTest_0010] START');
      let strJson = getInspectorByKey('textArea_textDirection_LTR');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaTextDirectionTest_0010] value: ' + JSON.stringify(obj.$attrs.textDirection));
      expect(obj.$attrs.textDirection).assertEqual('LTR');
      console.info('[TextAreaTextDirectionTest_0010] END');
      done();
    });

    /**
     * @tc.name   TextAreaTextDirectionTest_0020
     * @tc.number SUB_ACE_TextAreaTextDirectionTest_0020
     * @tc.desc   test the textDirection of TextArea: TextDirection.RTL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextAreaTextDirectionTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[TextAreaTextDirectionTest_0020] START');
      let strJson = getInspectorByKey('textArea_textDirection_RTL');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaTextDirectionTest_0020] value: ' + JSON.stringify(obj.$attrs.textDirection));
      expect(obj.$attrs.textDirection).assertEqual('RTL');
      console.info('[TextAreaTextDirectionTest_0020] END');
      done();
    });

    /**
     * @tc.name   TextAreaTextDirectionTest_0030
     * @tc.number SUB_ACE_TextAreaTextDirectionTest_0030
     * @tc.desc   test the textDirection of TextArea: TextDirection.DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextAreaTextDirectionTest_0030', Level.LEVEL2, async (done: Function) => {
      console.info('[TextAreaTextDirectionTest_0030] START');
      let strJson = getInspectorByKey('textArea_textDirection_DEFAULT');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaTextDirectionTest_0030] value: ' + JSON.stringify(obj.$attrs.textDirection));
      expect(obj.$attrs.textDirection).assertEqual('DEFAULT');
      console.info('[TextAreaTextDirectionTest_0030] END');
      done();
    });

    /**
     * @tc.name   TextAreaTextDirectionTest_0040
     * @tc.number SUB_ACE_TextAreaTextDirectionTest_0040
     * @tc.desc   test the textDirection of TextArea: TextDirection.AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextAreaTextDirectionTest_0040', Level.LEVEL2, async (done: Function) => {
      console.info('[TextAreaTextDirectionTest_0040] START');
      let strJson = getInspectorByKey('textArea_textDirection_AUTO');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaTextDirectionTest_0040] value: ' + JSON.stringify(obj.$attrs.textDirection));
      expect(obj.$attrs.textDirection).assertEqual('AUTO');
      console.info('[TextAreaTextDirectionTest_0040] END');
      done();
    });

    /**
     * @tc.name   TextAreaTextDirectionTest_0050
     * @tc.number SUB_ACE_TextAreaTextDirectionTest_0050
     * @tc.desc   test the textDirection of TextArea: undefined(TextDirection.DEFAULT)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextAreaTextDirectionTest_0050', Level.LEVEL2, async (done: Function) => {
      console.info('[TextAreaTextDirectionTest_0050] START');
      let strJson = getInspectorByKey('textArea_textDirection_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaTextDirectionTest_0050] value: ' + JSON.stringify(obj.$attrs.textDirection));
      expect(obj.$attrs.textDirection).assertEqual('DEFAULT');
      console.info('[TextAreaTextDirectionTest_0050] END');
      done();
    });

    /**
     * @tc.name   TextAreaTextDirectionTest_0060
     * @tc.number SUB_ACE_TextAreaTextDirectionTest_0060
     * @tc.desc   test the textDirection of TextArea: default(TextDirection.DEFAULT)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextAreaTextDirectionTest_0060', Level.LEVEL2, async (done: Function) => {
      console.info('[TextAreaTextDirectionTest_0060] START');
      let strJson = getInspectorByKey('textArea_textDirection_default');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaTextDirectionTest_0060] value: ' + JSON.stringify(obj.$attrs.textDirection));
      expect(obj.$attrs.textDirection).assertEqual('DEFAULT');
      console.info('[TextAreaTextDirectionTest_0060] END');
      done();
    });
  })
}