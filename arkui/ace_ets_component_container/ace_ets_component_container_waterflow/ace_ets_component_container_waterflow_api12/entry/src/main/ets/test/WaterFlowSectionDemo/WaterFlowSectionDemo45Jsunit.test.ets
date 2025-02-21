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

export default function WaterFlowSectionDemo45Jsunit() {
  describe('WaterFlowSectionDemo45Jsunit', function () {
    beforeEach(async function (done) {
      console.info("WaterFlowSectionDemo45Jsunit beforeEach start");
      let options = {
        uri: 'MainAbility/pages/WaterFlowSectionDemo/WaterFlowSectionDemo45',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WaterFlowSectionDemo45Jsunit state pages:" + JSON.stringify(pages));
        if (!("WaterFlowSectionDemo45" == pages.name)) {
          console.info("get WaterFlowSectionDemo45Jsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push WaterFlowSectionDemo45Jsunit success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WaterFlowSectionDemo45Jsunit page error:" + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_SECTIONS_0440
     * @tc.name   WaterFlowSectionDemo45Jsunit_0100
     * @tc.desc   columnsGap set 20, rowsGap set 20
     * @tc.level  1
     */
    it('WaterFlowSectionDemo45Jsunit_0100', 0, async function (done) {
      console.info('WaterFlowSectionDemo45Jsunit_0100 START');
      await CommonFunc.sleep(1000);
      let str2 = CommonFunc.getComponentRect('WaterFlowSectionDemo45_2');
      let str3 = CommonFunc.getComponentRect('WaterFlowSectionDemo45_3');
      let str5 = CommonFunc.getComponentRect('WaterFlowSectionDemo45_5');
      let strColumn = CommonFunc.getComponentRect('WaterFlowSectionDemo45_Column');
      await CommonFunc.sleep(3000);
      console.log('WaterFlowSectionDemo45Jsunit_1111',str2.top,str2.right,str3.left,str3.bottom,str5.top,strColumn.top,strColumn.right,strColumn.left)
      console.log('WaterFlowSectionDemo45Jsunit_top',str2.top - strColumn.top)
      console.log('WaterFlowSectionDemo45Jsunit_bottom',str5.top - str3.bottom)
      console.log('WaterFlowSectionDemo45Jsunit_left',str3.left - strColumn.left)
      console.log('WaterFlowSectionDemo45Jsunit_right',strColumn.right - str2.right)
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(str2.top - strColumn.top) - Math.round(vp2px(10))) <= 1).assertTrue();
      expect(Math.round(str5.top - str3.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.abs(Math.round(str3.left - strColumn.left) - Math.round(vp2px(10))) <= 1).assertTrue();
      expect(Math.abs(Math.round(strColumn.right - str2.right) - Math.round(vp2px(10))) <= 1).assertTrue();
      await CommonFunc.sleep(1000);
      console.info('WaterFlowSectionDemo45Jsunit_0100 END')
      done();
    });
  })
}