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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';

export default function textStrategyJsunit() {
  describe('textStrategyJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("textStrategyJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/textStrategy',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textStrategyJsunit state pages: " + JSON.stringify(pages));
        if (!("textStrategy" == pages.name)) {
          console.info("get textStrategyJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push textStrategyJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textStrategyJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /* *
    * @tc.number: SUB_ACE_textStrategyJsunit_0100
    * @tc.name: textStrategyJsunit_0100
    * @tc.desc: The enumeration value of lineBreakStrategy
    * @tc.level: Level 2
    * @tc.type:
    * @tc.size:
    */
    it('textStrategyJsunit_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('textStrategyJsunit_0100 START');

      let strJson = getInspectorByKey('text_Strategy_1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textStrategyJsunit_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.lineBreakStrategy).assertEqual("greedy");

      let strJson2 = getInspectorByKey('text_Strategy_2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[textStrategyJsunit_0100] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.lineBreakStrategy).assertEqual("high-quality");

      let strJson3 = getInspectorByKey('text_Strategy_3');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("[textStrategyJsunit_0100] component obj3 is: " + JSON.stringify(obj3));
      expect(obj3.$attrs.lineBreakStrategy).assertEqual("balanced");
      console.info('[textStrategyJsunit_0100] END');
      done();
    });
  })
}

