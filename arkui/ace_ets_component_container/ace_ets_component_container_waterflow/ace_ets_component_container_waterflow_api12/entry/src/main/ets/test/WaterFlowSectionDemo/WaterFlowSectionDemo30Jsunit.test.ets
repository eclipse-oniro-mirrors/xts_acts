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

export default function WaterFlowSectionDemo30Jsunit() {
  describe('WaterFlowSectionDemo30Jsunit', function () {
    beforeEach(async function (done) {
      console.info("WaterFlowSectionDemo30Jsunit beforeEach start");
      let options = {
        uri: 'MainAbility/pages/WaterFlowSectionDemo/WaterFlowSectionDemo30',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WaterFlowSectionDemo30Jsunit state pages:" + JSON.stringify(pages));
        if (!("WaterFlowSectionDemo30" == pages.name)) {
          console.info("get WaterFlowSectionDemo30Jsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push WaterFlowSectionDemo30Jsunit success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WaterFlowSectionDemo30Jsunit page error:" + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_SECTIONS_0290
     * @tc.name   WaterFlowSectionDemo30Jsunit_0100
     * @tc.desc   rowsGap: 10px
     * @tc.level  3
     */
    it('WaterFlowSectionDemo30Jsunit_0100', 0, async function (done) {
      console.info('WaterFlowSectionDemo30Jsunit_0100 START');
      await CommonFunc.sleep(1000);
      let str0 = CommonFunc.getComponentRect('WaterFlowSectionDemo30_0');
      let str1 = CommonFunc.getComponentRect('WaterFlowSectionDemo30_3');
      await CommonFunc.sleep(2000);
      console.log('WaterFlowSectionDemo30Jsunit_1111',str0.bottom,str1.top)
      console.log('WaterFlowSectionDemo30Jsunit_2222',str1.top - str0.bottom)
      expect(Math.round(str1.top - str0.bottom)).assertEqual(Math.round(10));
      console.info('WaterFlowSectionDemo30Jsunit_0100 END')
      done();
    });

  })
}