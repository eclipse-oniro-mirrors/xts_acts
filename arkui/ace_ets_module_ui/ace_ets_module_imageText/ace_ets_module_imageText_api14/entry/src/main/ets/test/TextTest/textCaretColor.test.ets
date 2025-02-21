/*
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import { Driver, ON} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function textCaretColor() {
  describe('textCaretColor', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/textCaretColor',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textCaretColor state success " + JSON.stringify(pages));
        if (!("textCaretColor" == pages.name)) {
          console.info("get textCaretColor state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push textCaretColor page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textCaretColor page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textCaretColor after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         textCaretColor0001
     * @tc.desic        textCaretColor0001
     */
    it('textCaretColor0001', 0, async () => {
      console.info('textCaretColor0001 START');
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('text');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textCaretColor0001] component obj is: " + JSON.stringify(obj));
      console.info("[textCaretColor0001] caretColor: " + JSON.stringify(obj.$attrs.caretColor));
      console.info("[textCaretColor0001] selectedBackgroundColor: " + JSON.stringify(obj.$attrs.selectedBackgroundColor));
      expect(obj.$attrs.caretColor).assertEqual('#FFFF0000');
      expect(obj.$attrs.selectedBackgroundColor).assertEqual('#33008000');
      console.info('[textCaretColor0001] END');
    });


  })
}
