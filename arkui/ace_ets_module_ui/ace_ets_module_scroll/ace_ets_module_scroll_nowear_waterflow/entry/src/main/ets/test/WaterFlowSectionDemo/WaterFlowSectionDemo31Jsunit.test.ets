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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import observer from '@ohos.arkui.observer';

export default function WaterFlowSectionDemo31Jsunit() {
  describe('WaterFlowSectionDemo31Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("WaterFlowSectionDemo31Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WaterFlowSectionDemo/WaterFlowSectionDemo31',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WaterFlowSectionDemo31Jsunit state pages:" + JSON.stringify(pages));
        if (!("WaterFlowSectionDemo31" == pages.name)) {
          console.info("get WaterFlowSectionDemo31Jsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WaterFlowSectionDemo31Jsunit success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WaterFlowSectionDemo31Jsunit page error:" + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   WaterFlowSectionDemo31Jsunit_0100
     * @tc.number SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_SECTIONS_0300
     * @tc.desc   rowsGap: Resource 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('WaterFlowSectionDemo31Jsunit_0100', Level.LEVEL3, async (done: Function) => {
      console.info('WaterFlowSectionDemo31Jsunit_0100 START');
      await CommonFunc.sleep(1000);
      let str0 = CommonFunc.getComponentRect('WaterFlowSectionDemo31_0');
      let str1 = CommonFunc.getComponentRect('WaterFlowSectionDemo31_3');
      await CommonFunc.sleep(2000);
      console.log('WaterFlowSectionDemo31Jsunit_1111',str0.bottom,str1.top)
      console.log('WaterFlowSectionDemo31Jsunit_2222',str1.top - str0.bottom)
      expect(Math.abs(Math.round(str1.top - str0.bottom) - Math.round(vp2px(10))) <= 1).assertTrue();
      console.info('WaterFlowSectionDemo31Jsunit_0100 END')
      done();
    });

  })
}