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
export default function LocalBuilder0040TestJsunit() {
  describe('LocalBuilder0040TestJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("LocalBuilder0040TestJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/local_builder/LocalBuilder0040",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LocalBuilder0040TestJsunit state pages:" + JSON.stringify(pages));
        if (!("LocalBuilder0040" == pages.name)) {
          console.info("get LocalBuilder0040TestJsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push LocalBuilder0040TestJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LocalBuilder0040TestJsunit page error:" + err);
      }
      console.info("LocalBuilder0040TestJsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("LocalBuilder0040TestJsunit after each called");
    });

    /**
     * @tc.number    LocalBuilder0040TestJsunit_001
     * @tc.name      LocalBuilder0040TestJsunit_001
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('LocalBuilder0040TestJsunit_001', Level.LEVEL0, async (done: Function) => {
      console.info('[LocalBuilder0040TestJsunit_001] START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('tvLocalBuilder0040');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[LocalBuilder0040TestJsunit_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('HelloLocalBuilder');
      console.info('[LocalBuilder0040TestJsunit_001] END');
      done();
    });
  })
}
