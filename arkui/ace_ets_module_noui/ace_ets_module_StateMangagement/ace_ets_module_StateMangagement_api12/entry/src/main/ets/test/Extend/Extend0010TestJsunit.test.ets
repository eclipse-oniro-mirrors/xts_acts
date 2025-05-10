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
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';

export default function Extend0010TestJsunit() {
  describe('Extend0010TestJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("Extend0010TestJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Extend/Extend0010",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Extend0010TestJsunit state pages:" + JSON.stringify(pages));
        if (!("Extend00100010" == pages.name)) {
          console.info("get Extend0010TestJsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Extend0010TestJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Extend0010TestJsunit page error:" + err);
      }
      console.info("Extend0010TestJsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Extend0010TestJsunit after each called");
    });

    /**
     * @tc.number Extend0010TestJsunit_001
     * @tc.name Extend0010TestJsunit_001
     * @tc.desc Frequently updating and modifying the values of parent components
     * @tc.level Level 0
     * @tc.type
     * @tc.size
     */
    it('Extend0010TestJsunit_001', 0, async (done: Function) => {
      console.info('[Extend0010TestJsunit_001] START');
      await CommonFunc.sleep(2000);
      let obj: ESObject = JSON.parse(getInspectorByKey('tv_extend0010Id'));
      console.info('[Extend0010TestJsunit_001] component obj background is: ' +
      JSON.stringify(obj.$attrs.backgroundColor));
      console.info("[Extend0010TestJsunit_001] component obj width is: " + JSON.stringify(obj.$attrs.width));
      expect(obj.$attrs.fontWeight).assertEqual("100");
      expect(obj.$attrs.backgroundColor).assertEqual('#FF0000FF');
      console.info('[Extend0010TestJsunit_001] END');
      let obj1: ESObject = JSON.parse(getInspectorByKey('tv_extend0020Id'));
      console.info('[Extend0010TestJsunit_001] component obj1 background is: ' +
      JSON.stringify(obj1.$attrs.backgroundColor));
      console.info("[Extend0010TestJsunit_001] component obj1 width is: " + JSON.stringify(obj1.$attrs.width));
      expect(obj1.$attrs.fontWeight).assertEqual("200");
      expect(obj1.$attrs.backgroundColor).assertEqual('#FFFFC0CB');
      console.info('[Extend0010TestJsunit_001] END');
      let obj2: ESObject = JSON.parse(getInspectorByKey('tv_extend0030Id'));
      console.info('[Extend0010TestJsunit_001] component obj2 background is: ' +
      JSON.stringify(obj2.$attrs.backgroundColor));
      console.info("[Extend0010TestJsunit_001] component obj2 width is: " + JSON.stringify(obj2.$attrs.width));
      expect(obj2.$attrs.fontWeight).assertEqual("300");
      expect(obj2.$attrs.backgroundColor).assertEqual('#FFFFA500');
      console.info('[Extend0010TestJsunit_001] END');
      done();
    });
  })
}
