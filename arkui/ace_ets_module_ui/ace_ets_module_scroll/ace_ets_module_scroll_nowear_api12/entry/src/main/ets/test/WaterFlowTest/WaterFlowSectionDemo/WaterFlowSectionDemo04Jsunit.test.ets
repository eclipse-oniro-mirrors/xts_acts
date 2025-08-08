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
import CommonFunc from '../../../MainAbility/utils/Common';
import observer from '@ohos.arkui.observer';

export default function WaterFlowSectionDemo04Jsunit() {
  describe('WaterFlowSectionDemo04Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("WaterFlowSectionDemo04Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WaterFlow/WaterFlowSectionDemo/WaterFlowSectionDemo04',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WaterFlowSectionDemo04Jsunit state pages:" + JSON.stringify(pages));
        if (!("WaterFlowSectionDemo04" == pages.name)) {
          console.info("get WaterFlowSectionDemo04Jsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WaterFlowSectionDemo04Jsunit success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WaterFlowSectionDemo04Jsunit page error:" + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_SECTIONS_0030
     * @tc.name   WaterFlowSectionDemo04Jsunit_0100
     * @tc.desc   itemsCount: 5, crossCount: 0
     * @tc.level  3
     * @tc.type
     * @tc.size
     */
    it('WaterFlowSectionDemo04Jsunit_0100', Level.LEVEL1, async (done: Function) => {
      console.info('WaterFlowSectionDemo04Jsunit_0100 START');
      await CommonFunc.sleep(1000);
      let str0 = CommonFunc.getComponentRect('WaterFlowSectionDemo04_0');
      let str1 = CommonFunc.getComponentRect('WaterFlowSectionDemo04_1');
      await CommonFunc.sleep(2000);
      console.log('WaterFlowSectionDemo04Jsunit_1111',str0.bottom,str1.top)
      console.log('WaterFlowSectionDemo04Jsunit_2222',str1.top - str0.bottom)
      expect(Math.round(str1.top - str0.bottom)).assertEqual(Math.round(0));
      console.info('WaterFlowSectionDemo04Jsunit_0100 END')
      done();
    });

  })
}