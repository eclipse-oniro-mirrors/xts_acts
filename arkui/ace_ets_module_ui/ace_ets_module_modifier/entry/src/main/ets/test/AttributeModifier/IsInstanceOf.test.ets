/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeEach, afterEach, it, expect, Level} from '@ohos/hypium';
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'
import Utils from '../Utils';
import router from '@ohos.router';

export default function IsInstanceOfTest() {
  describe('IsInstanceOfTest', () => {
    beforeEach(async (done: Function) => {
      console.info("alphabetIndexerJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AttributeModifier/IsInstanceOf',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get alphabetIndexer state pages: " + JSON.stringify(pages));
        if (!("alphabetIndexer" == pages.name)) {
          console.info("get alphabetIndexer state pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push alphabetIndexer page error: " + err);
      }
      done();
    })

    /**
     * @tc.name   IsInstanceOfTest_0100
     * @tc.number SUB_ARKUI_API_Modifier_IsInstanceOfTest_0100
     * @tc.desc   Test ModifierUtils.isInstanceOf with Text component
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('IsInstanceOfTest_0100', Level.LEVEL0, async () => {
      console.info('[IsInstanceOfTest_0100] START');

      expect(AppStorage.get('IsInstanceOf_aaa')).assertEqual(false);
      AppStorage.delete('IsInstanceOf_aaa');

      expect(AppStorage.get('IsInstanceOf_Button')).assertEqual(true);
      AppStorage.delete('IsInstanceOf_Button');

      expect(AppStorage.get('IsInstanceOf_empty_string')).assertEqual(false);
      AppStorage.delete('IsInstanceOf_empty_string');

      expect(AppStorage.get('IsInstanceOf_null_1')).assertEqual(false);
      AppStorage.delete('IsInstanceOf_null_1');

      expect(AppStorage.get('IsInstanceOf_undefined_1')).assertEqual(false);
      AppStorage.delete('IsInstanceOf_undefined_1');

      expect(AppStorage.get('IsInstanceOf_null_2')).assertEqual(false);
      AppStorage.delete('IsInstanceOf_null_2');

      expect(AppStorage.get('IsInstanceOf_undefined_2')).assertEqual(false);
      AppStorage.delete('IsInstanceOf_undefined_2');

      console.info('[IsInstanceOfTest_0100] END');
    })
  })
}
