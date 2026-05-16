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
import CommonFunc from '../../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function arkuiNodeRenderTest() {
  describe('arkuiNodeRenderTest', () => {
    beforeEach(async (done: Function) => {
      console.info("arkuiNodeRenderTest beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get arkuiNodeRenderTest state pages:" + JSON.stringify(pages));
        if (!("arkuirendernode" == pages.name)) {
          console.info("get arkuiNodeRenderTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/NodeContainer/arkuinode/arkuirendernode"})
          await CommonFunc.sleep(2000);
          console.info("push arkuiNodeRenderTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push arkuiNodeRenderTest page error:" + err);
      }
      console.info("arkuiNodeRenderTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("arkuiNodeRenderTest after each called");
    });

    /**
     * @tc.name   arkuiNodeRenderTest_0100
     * @tc.number SUB_ACE_arkuiNodeRenderTest
     * @tc.desc   test the render
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('arkuiNodeRenderTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[arkuiNodeRenderTest_0100] START');
      await CommonFunc.sleep(2000);
      let json = getInspectorByKey('nodetext');
      let Obj1: ESObject = JSON.parse(json);
      console.info("arkuiNodeRenderTest_0100 json info " + JSON.stringify(json));
      expect(Obj1.$attrs.content).assertEqual('hello');
      done();
    });

  })
}
