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
import router from '@system.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';
import observer from '@ohos.arkui.observer';

export default function WaterFlowSectionDemo03Jsunit() {
  describe('WaterFlowSectionDemo03Jsunit', function () {
    beforeEach(async function (done) {
      console.info("WaterFlowSectionDemo03Jsunit beforeEach start");
      let options = {
        uri: 'MainAbility/pages/WaterFlowSectionDemo/WaterFlowSectionDemo03',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WaterFlowSectionDemo03Jsunit state pages:" + JSON.stringify(pages));
        if (!("WaterFlowSectionDemo03" == pages.name)) {
          console.info("get WaterFlowSectionDemo03Jsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push WaterFlowSectionDemo03Jsunit success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WaterFlowSectionDemo03Jsunit page error:" + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_SECTIONS_0020
     * @tc.name   WaterFlowSectionDemo03Jsunit_0100
     * @tc.desc   itemsCount: 5, crossCount: -1
     * @tc.level  2
     */
    it('WaterFlowSectionDemo03Jsunit_0100', 0, async function (done) {
      console.info('WaterFlowSectionDemo03Jsunit_0100 START');
      await CommonFunc.sleep(1000);
      let str0 = CommonFunc.getComponentRect('WaterFlowSectionDemo03_0');
      let str1 = CommonFunc.getComponentRect('WaterFlowSectionDemo03_1');
      await CommonFunc.sleep(2000);
      console.log('WaterFlowSectionDemo03Jsunit_1111',str0.bottom,str1.top)
      console.log('WaterFlowSectionDemo03Jsunit_2222',str1.top - str0.bottom)
      expect(Math.round(str1.top - str0.bottom)).assertEqual(Math.round(0));
      console.info('WaterFlowSectionDemo03Jsunit_0100 END')
      done();
    });

  })
}