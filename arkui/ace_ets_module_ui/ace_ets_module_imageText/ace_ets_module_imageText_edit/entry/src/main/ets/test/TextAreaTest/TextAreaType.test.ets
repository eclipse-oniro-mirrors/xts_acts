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

import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';

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
      }
      done();
    });

    /**
     * @tc.name   textAreaType_0100
     * @tc.number textAreaType_0100
     * @tc.desc   Test TextArea type property with TextAreaType.PHONE_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textAreaType_0100', Level.LEVEL0, async () => {
      console.info('[textAreaType_0100] START');
      let strJson: string = getInspectorByKey('key_textArea_type_phoneNumber');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[textAreaType_0100] obj is: " + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('TextAreaType.PHONE_NUMBER');
      console.info('[textAreaType_0100] END');
    });

    /**
     * @tc.name   textAreaType_0200
     * @tc.number textAreaType_0200
     * @tc.desc   Test TextArea type property with TextAreaType.EMAIL
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textAreaType_0200', Level.LEVEL0, async () => {
      console.info('[textAreaType_0200] START');
      let strJson: string = getInspectorByKey('key_textArea_type_email');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[textAreaType_0200] obj is: " + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('TextAreaType.EMAIL');
      console.info('[textAreaType_0200] END');
    });
  })
}
