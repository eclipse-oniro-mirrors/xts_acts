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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc from "../../../MainAbility/common/Common";
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function symbolSpanApi2Test() {
  describe('symbolSpanApi2Test', () => {
    beforeEach(async (done: Function) => {
      console.info("symbolSpanApi2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/symbolSpan/symbolSpanApi/symbolspan',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get symbolSpanApi2  state pages:" + JSON.stringify(pages));
        if (!("symbolSpanApi2 " == pages.name)) {
          console.info("get symbolSpanApi2 pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push symbolSpanApi2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push symbolSpanApi2 page error:" + err);
      }
      console.info("symbolSpanApi2 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("symbolSpanApi2 after each called");
    });

    /**
     * @tc.name   symbolSpanApi2Test_0100
     * @tc.number SUB_ACE_RICHEDITOR_symbolSpanApi2Test_0100
     * @tc.desc   set api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanApi2Test_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[symbolSpanApi2Test_0100] START');
      await CommonFunc.sleep(2000);

      let symbolSpanApi = getInspectorByKey('singleSym');
      console.info("[symbolSpanApi2Test_0100]  " + JSON.parse(symbolSpanApi))
      let Obj1: ESObject = JSON.parse(symbolSpanApi);
      expect(Obj1.$attrs.renderingStrategy).assertEqual('SymbolRenderingStrategy.SINGLE');

      console.info('[testRichEditor_0100] END');
      done();
    });

    /**
     * @tc.name   lifeCycleTest_0200
     * @tc.number SUB_ACE_RICHEDITOR_lifeCycleTest_0200
     * @tc.desc   set api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('lifeCycleTest_0200', Level.LEVEL2, async (done: Function) => {
      console.info('[symbolSpanApi2Test_0200] START');
      await CommonFunc.sleep(2000);

      let obj2 = getInspectorByKey('lifecycle');
      console.info("[symbolSpanApi2Test_0200]  " + JSON.parse(obj2))
      let Obj1: ESObject = JSON.parse(obj2);
      expect(Obj1.$attrs.content).assertEqual('life test');

      console.info('[testRichEditor_0100] END');
      done();
    });

  })
}
