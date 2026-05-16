
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from '../../MainAbility/common/Utils';
import { UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';


export default function dividerJsunit() {
  describe('dividerJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("dividerJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextPicker/divider',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Divider state pages: " + JSON.stringify(pages));
        if (!("divider" == pages.name)) {
          console.info("get Divider state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push Divider page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Divider page error: " + err);
      }
      done();
    })

    /**
     * @tc.name   ArkUI_TextPicker_DividerJsunit_1000
     * @tc.number ArkUI_TextPicker_DividerJsunit_1000
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_TextPicker_DividerJsunit_1000', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUI_TextPicker_DividerJsunit_1000] START');
      let strJson = getInspectorByKey('dividerKey0');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_TextPicker_DividerJsunit_1000] obj is: " + JSON.stringify(obj.$attrs.divider));
      expect(obj.$attrs.divider.strokeWidth).assertEqual('10.00vp');
      expect(obj.$attrs.divider.startMargin).assertEqual('11.00vp');
      expect(obj.$attrs.divider.endMargin).assertEqual('12.00vp');
      expect(obj.$attrs.divider.color).assertEqual('#FF008000');
      console.info('[ArkUI_TextPicker_DividerJsunit_1000] END');
      done();
    });

    });
  
}
