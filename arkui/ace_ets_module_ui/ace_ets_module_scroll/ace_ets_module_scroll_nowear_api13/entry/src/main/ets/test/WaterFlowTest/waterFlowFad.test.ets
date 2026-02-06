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
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';

export default function waterFlowFad() {
  describe('waterFlowFad', () => {
    beforeEach(async (done: Function) => {
      console.info("waterFlowFad beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/WaterFlow/waterFlowFad",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get waterFlowFad state pages:" + JSON.stringify(pages));
        if (!("waterFlowFad" == pages.name)) {
          console.info("get waterFlowFad pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push waterFlowFad page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push waterFlowFad page error:" + err);
      }
      console.info("waterFlowFad beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("waterFlowFad after each called");
    });

    /**
     * @tc.number    waterFlowFad_001
     * @tc.name      waterFlowFad_0100
     * @tc.desc      Implement WaterFlow component to enable edge fade effect and set edge fade length.
     * @tc.level     Level 2
     * @tc.type
     * @tc.size
     */
    it('waterFlowFad_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[waterFlowFad_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('flow_fadingEdge');
      console.info("[waterFlowFad_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[waterFlowFad_0100] fadingEdge: " + JSON.stringify(JSON.parse(strJson).$attrs.fadingEdge));
      console.info("[waterFlowFad_0100] FadingEdgeOptions: " + JSON.stringify(JSON.parse(strJson).$attrs.FadingEdgeOptions));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$type).assertEqual('WaterFlow');
      expect(JSON.parse(strJson).$attrs.fadingEdge).assertEqual(true);
      console.info('[waterFlowFad_0100] END');
      done();
    });
  })
}
