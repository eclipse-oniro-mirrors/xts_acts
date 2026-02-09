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


export default function TextAreaTypeApi11Test() {
  describe('TextAreaTypeApi11Test', () => {
    beforeEach(async (done: Function) => {
      console.info("TextAreaTypeApi11Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextAreaApi11/TextAreaTypeApi11',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextAreaTypeApi11Test state pages: " + JSON.stringify(pages));
        if (!("TextAreaType" == pages.name)) {
          console.info("get TextAreaTypeApi11Test state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextAreaTypeApi11Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextAreaTypeApi11Test page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   TextAreaTypeApi11Test_0010
     * @tc.number SUB_ACE_TextAreaTypeApi11Test_0010
     * @tc.desc   test TextArea: TextAreaType.NORMAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextAreaTypeApi11Test_0010', Level.LEVEL0, async (done: Function) => {
      console.info('[TextAreaTypeApi11Test_0010] START');
      let strJson = getInspectorByKey('TextAreaTypeApi11_NORMAL');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaTypeApi11Test_0010] TextAreaType: ' + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('TextAreaType.NORMAL');
      console.info('[TextAreaTypeApi11Test_0010] END');
      done();
    });

    /**
     * @tc.name   TextAreaTypeApi11Test_0020
     * @tc.number SUB_ACE_TextAreaTypeApi11Test_0020
     * @tc.desc   test TextArea: TextAreaType.NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextAreaTypeApi11Test_0020', Level.LEVEL0, async (done: Function) => {
      console.info('[TextAreaTypeApi11Test_0020] START');
      let strJson = getInspectorByKey('TextAreaTypeApi11_NUMBER');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaTypeApi11Test_0020] TextAreaType: ' + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('TextAreaType.NUMBER');
      console.info('[TextAreaTypeApi11Test_0020] END');
      done();
    });
  })
}