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


export default function TextAreaTypeApi20Test() {
  describe('TextAreaTypeApi20Test', () => {
    beforeEach(async (done: Function) => {
      console.info("TextAreaTypeApi20Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextAreaApi20/TextAreaTypeApi20',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextAreaTypeApi20Test state pages: " + JSON.stringify(pages));
        if (!("TextAreaTypeApi20" == pages.name)) {
          console.info("get TextAreaTypeApi20Test state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextAreaTypeApi20Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextAreaTypeApi20Test page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   TextAreaTypeApi20Test_0010
     * @tc.number SUB_ACE_TextAreaTypeApi20Test_0010
     * @tc.desc   test TextArea: TextAreaType.ONE_TIME_CODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextAreaTypeApi20Test_0010', Level.LEVEL0, async (done: Function) => {
      console.info('[TextAreaTypeApi20Test_0010] START');
      let strJson = getInspectorByKey('TextAreaTypeApi20_ONE_TIME_CODE');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaTypeApi20Test_0010] TextAreaType: ' + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('TextAreaType.ONE_TIME_CODE');
      console.info('[TextAreaTypeApi20Test_0010] END');
      done();
    });
    
    /**
     * @tc.name   TextAreaTypeApi20Test_0020
     * @tc.number SUB_ACE_TextAreaTypeApi20Test_0020
     * @tc.desc   test TextArea: undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextAreaTypeApi20Test_0020', Level.LEVEL0, async (done: Function) => {
      console.info('[TextAreaTypeApi20Test_0020] START');
      let strJson = getInspectorByKey('TextAreaTypeApi20_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaTypeApi20Test_0020] TextAreaType: ' + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('TextAreaType.NORMAL');
      console.info('[TextAreaTypeApi20Test_0020] END');
      done();
    });

    /**
     * @tc.name   TextAreaTypeApi20Test_0030
     * @tc.number SUB_ACE_TextAreaTypeApi20Test_0030
     * @tc.desc   test TextArea: default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextAreaTypeApi20Test_0030', Level.LEVEL0, async (done: Function) => {
      console.info('[TextAreaTypeApi20Test_0030] START');
      let strJson = getInspectorByKey('TextAreaTypeApi20_default');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaTypeApi20Test_0030] TextAreaType: ' + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('TextAreaType.NORMAL');
      console.info('[TextAreaTypeApi20Test_0030] END');
      done();
    });

    /**
     * @tc.name   TextAreaTypeApi20Test_0040
     * @tc.number SUB_ACE_TextAreaTypeApi20Test_0040
     * @tc.desc   test TextAreaModifier: TextAreaType.ONE_TIME_CODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextAreaTypeApi20Test_0040', Level.LEVEL0, async (done: Function) => {
      console.info('[TextAreaTypeApi20Test_0040] START');
      let strJson = getInspectorByKey('TextAreaTypeApi20_Modifier');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaTypeApi20Test_0040] TextAreaType: ' + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('TextAreaType.ONE_TIME_CODE');
      console.info('[TextAreaTypeApi20Test_0040] END');
      done();
    });
  })
}