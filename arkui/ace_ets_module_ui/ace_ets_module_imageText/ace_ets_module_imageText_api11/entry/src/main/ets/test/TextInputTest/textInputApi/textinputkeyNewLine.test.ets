/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from "../../../MainAbility/common/Common";
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function textInputApiTest() {
  describe('textInputApiTest', () => {
    beforeEach(async (done: Function) => {
      console.info("textInputApiTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/textInputApi/input_keytype',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textInputApiTest state pages:" + JSON.stringify(pages));
        if (!("input_keytype" == pages.name)) {
          console.info("get textInputApiTest  pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push textInputApiTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textInputApiTest page error:" + err);
      }
      console.info("textInputApiTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textInputApiTest after each called");
    });

    /* *
       * @tc.number: SUB_ACE_TextInputApiTest_001
       * @tc.name  : textInputApiTest_001
       * @tc.desc  : test the enterKeyType enum
       * @tc.level : Level 2
       */
    it('textInputApiTest_001', 0, async (done: Function) => {
      // default
      let strJson = getInspectorByKey('textInputkeyN');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textInputApiTest] get inspector value is: " + JSON.stringify(obj));
      console.info("[textInput1] get inspector value is: " + JSON.stringify(obj.$attrs.enterKeyType));
      expect(obj.$attrs.enterKeyType).assertEqual('EnterKeyType.Done')
      done();

    });
  })
}
