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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../MainAbility/utils/Common';
import observer from '@ohos.arkui.observer';

export default function WaterFlowSectionDemo35Jsunit() {
  describe('WaterFlowSectionDemo35Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("WaterFlowSectionDemo35Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WaterFlow/WaterFlowSectionDemo/WaterFlowSectionDemo35',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WaterFlowSectionDemo35Jsunit state pages:" + JSON.stringify(pages));
        if (!("WaterFlowSectionDemo35" == pages.name)) {
          console.info("get WaterFlowSectionDemo35Jsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WaterFlowSectionDemo35Jsunit success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WaterFlowSectionDemo35Jsunit page error:" + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_SECTIONS_0340
     * @tc.name   WaterFlowSectionDemo35Jsunit_0100
     * @tc.desc   set five Section ,get length
     * @tc.level  1
     * @tc.type
     * @tc.size
     */
    it('WaterFlowSectionDemo35Jsunit_0100', 0, async (done: Function) => {
      console.info('WaterFlowSectionDemo35Jsunit_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('WaterFlowSectionDemo35_text');
      let obj: ESObject = JSON.parse(strJson);
      await CommonFunc.sleep(1000);
      console.info('WaterFlowSectionDemo35Jsunit_0100 component obj is: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('5');
      console.info('WaterFlowSectionDemo35Jsunit_0100 END')
      done();
    });

  })
}