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

export default function WaterFlowSectionDemo37Jsunit() {
  describe('WaterFlowSectionDemo37Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("WaterFlowSectionDemo37Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WaterFlow/WaterFlowSectionDemo/WaterFlowSectionDemo37',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WaterFlowSectionDemo37Jsunit state pages:" + JSON.stringify(pages));
        if (!("WaterFlowSectionDemo37" == pages.name)) {
          console.info("get WaterFlowSectionDemo37Jsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WaterFlowSectionDemo37Jsunit success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WaterFlowSectionDemo37Jsunit page error:" + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   WaterFlowSectionDemo37Jsunit_0100
     * @tc.number SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_SECTIONS_0360
     * @tc.desc   itemsCount: 5, crossCount: -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WaterFlowSectionDemo37Jsunit_0100', Level.LEVEL1, async (done: Function) => {
      console.info('WaterFlowSectionDemo37Jsunit_0100 START');
      await CommonFunc.sleep(1000);
      let str0 = CommonFunc.getComponentRect('WaterFlowSectionDemo37_0');
      let str1 = CommonFunc.getComponentRect('WaterFlowSectionDemo37_1');
      await CommonFunc.sleep(2000);
      console.log('WaterFlowSectionDemo37Jsunit_1111',str0.bottom,str1.top)
      console.log('WaterFlowSectionDemo37Jsunit_2222',str1.top - str0.bottom)
      expect(Math.round(str1.top - str0.bottom)).assertEqual(Math.round(0));
      console.info('WaterFlowSectionDemo37Jsunit_0100 END')
      done();
    });

  })
}