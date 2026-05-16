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
 
import { describe, beforeAll, beforeEach, afterEach, afterAll,  it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc, { RectValue } from '../../MainAbility/common/Common';

export default function ReactiveComponentContentReuseNullUndefinedTest() {
  describe('ReactiveComponentContentReuseNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ReactiveComponentContentReuseNullUndefinedTest beforeEach start");
      let options : router.RouterOptions = {
        url: "MainAbility/pages/ComponentContent/ReactiveComponentContentReuseNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ReactiveComponentContentReuseNullUndefined state pages: " + JSON.stringify(pages));
        if (!("ReactiveComponentContentReuseNullUndefined" == pages.name)) {
          console.info("get ReactiveComponentContentReuseNullUndefined state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(2000);
          console.info("push ReactiveComponentContentReuseNullUndefined success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ReactiveComponentContentReuseNullUndefined page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   ReactiveComponentContentReuseNullUndefinedTest_0100
     * @tc.number SUB_ARKUI_API_ReactiveComponentContentReuseNullUndefinedTest_0100
     * @tc.desc   setOvalShape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ReactiveComponentContentReuseNullUndefinedTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ReactiveComponentContentReuseNullUndefinedTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('ReactiveComponentContentReuseNullUndefined');
      expect(JSON.parse(strJson1).$type).assertEqual('List');
      
      console.info('[ReactiveComponentContentReuseNullUndefinedTest_0100 ] END');
      done();
    });
  })
}