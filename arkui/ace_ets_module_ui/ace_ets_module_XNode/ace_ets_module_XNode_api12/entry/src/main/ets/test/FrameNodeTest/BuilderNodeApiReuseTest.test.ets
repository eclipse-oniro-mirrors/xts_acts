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
import { describe, beforeAll, beforeEach, afterEach, afterAll,  it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
export default function BuilderNodeApiReuseTest() {
  describe('BuilderNodeApiReuseTest', () => {
    beforeEach(async (done: Function) => {
      console.info("BuilderNodeApiReuseTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/FrameNode/BuilderNodeApiReuse",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get BuilderNodeApiReuseTest state pages: " + JSON.stringify(pages));
        if (!("BuilderNodeApiReuse" == pages.name)) {
          console.info("get BuilderNodeApiReuseTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push BuilderNodeApiReuseTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push BuilderNodeApiReuseTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    BuilderNodeApiReuseTest_0100
     * @tc.name      BuilderNodeApiReuseTest_0100
     * @tc.desc      frameNode: BuilderNodeApiReuse
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('BuilderNodeApiReuseTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('BuilderNodeApiReuseTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('BuilderNodeApiReuse_item1');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[BuilderNodeApiReuseTest_0100] component obj is: ",obj, obj.$attrs.fontSize);
      expect(obj.$attrs.fontSize).assertEqual('50.00fp');
      console.info('[BuilderNodeApiReuseTest_0100] END');
      done();
    });    
  })
}