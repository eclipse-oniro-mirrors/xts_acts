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

export default function BuilderParam001() {
  describe('BuilderParam001', () => {
    beforeEach(async (done: Function) => {
      console.info("BuilderParam001 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/BuilderParam/BuilderParam001",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get BuilderParam001 state pages:" + JSON.stringify(pages));
        if (!("BuilderParam001" == pages.name)) {
          console.info("get BuilderParam001 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push BuilderParam001 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push BuilderParam001 page error:" + err);
      }
      console.info("BuilderParam001 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("BuilderParam001 after each called");
    });

    /**
     * @tc.name   BuilderParam001
     * @tc.number BuilderParam001
     * @tc.desc   Test  BuildParam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuilderParam001', Level.LEVEL0, async (done: Function) => {
      console.info('[BuilderParam001] START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('Text2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[BuilderParam001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('componentBuilder');
      console.info('[BuilderParam001] END');
      done();
    });
  })
}
