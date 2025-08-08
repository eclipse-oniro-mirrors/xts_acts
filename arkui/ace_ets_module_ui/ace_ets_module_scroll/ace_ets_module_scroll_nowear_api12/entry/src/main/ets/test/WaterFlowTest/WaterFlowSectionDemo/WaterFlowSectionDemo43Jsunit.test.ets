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

export default function WaterFlowSectionDemo43Jsunit() {
  describe('WaterFlowSectionDemo43Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("WaterFlowSectionDemo43Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WaterFlow/WaterFlowSectionDemo/WaterFlowSectionDemo43',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WaterFlowSectionDemo43Jsunit state pages:" + JSON.stringify(pages));
        if (!("WaterFlowSectionDemo43" == pages.name)) {
          console.info("get WaterFlowSectionDemo43Jsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WaterFlowSectionDemo43Jsunit success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WaterFlowSectionDemo43Jsunit page error:" + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_SECTIONS_0420
     * @tc.name   WaterFlowSectionDemo43Jsunit_0100
     * @tc.desc   columnsGap set 20, rowsGap set 20,
     * @tc.level  3
     * @tc.type
     * @tc.size
     */
    it('WaterFlowSectionDemo43Jsunit_0100', 0, async (done: Function) => {
      console.info('WaterFlowSectionDemo43Jsunit_0100 START');
      await CommonFunc.sleep(1000);
      let str0 = CommonFunc.getComponentRect('WaterFlowSectionDemo43_0');
      let str3 = CommonFunc.getComponentRect('WaterFlowSectionDemo43_3');
      let str4 = CommonFunc.getComponentRect('WaterFlowSectionDemo43_4');
      await CommonFunc.sleep(2000);
      console.log('WaterFlowSectionDemo43Jsunit_1111',str0.bottom,str3.top,str3.right,str4.left)
      console.log('WaterFlowSectionDemo43Jsunit_2222',str3.top - str0.bottom)
      console.log('WaterFlowSectionDemo43Jsunit_3333',str4.left - str3.right)
      expect(Math.abs(Math.round(str3.top - str0.bottom) - Math.round(vp2px(20))) <= 1).assertTrue();
      expect(Math.abs(Math.round(str4.left - str3.right) - Math.round(vp2px(20))) <= 1).assertTrue();
      console.info('WaterFlowSectionDemo43Jsunit_0100 END')
      done();
    });
  })
}