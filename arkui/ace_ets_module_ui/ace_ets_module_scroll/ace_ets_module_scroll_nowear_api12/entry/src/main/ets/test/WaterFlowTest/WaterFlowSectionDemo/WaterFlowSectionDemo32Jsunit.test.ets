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

export default function WaterFlowSectionDemo32Jsunit() {
  describe('WaterFlowSectionDemo32Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("WaterFlowSectionDemo32Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WaterFlow/WaterFlowSectionDemo/WaterFlowSectionDemo32',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WaterFlowSectionDemo32Jsunit state pages:" + JSON.stringify(pages));
        if (!("WaterFlowSectionDemo32" == pages.name)) {
          console.info("get WaterFlowSectionDemo32Jsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WaterFlowSectionDemo32Jsunit success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WaterFlowSectionDemo32Jsunit page error:" + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_SECTIONS_0310
     * @tc.name   WaterFlowSectionDemo32Jsunit_0100
     * @tc.desc   crossCount: 3
     * @tc.level  1
     * @tc.type
     * @tc.size
     */
    it('WaterFlowSectionDemo32Jsunit_0100', Level.LEVEL1, async (done: Function) => {
      console.info('WaterFlowSectionDemo32Jsunit_0100 START');
      await CommonFunc.sleep(1000);
      let str0 = CommonFunc.getComponentRect('WaterFlowSectionDemo32_3');
      let str1 = CommonFunc.getComponentRect('WaterFlowSectionDemo32_4');
      let str2 = CommonFunc.getComponentRect('WaterFlowSectionDemo32_5');
      await CommonFunc.sleep(2000);
      console.log('WaterFlowSectionDemo32Jsunit_1111',str0.right,str1.right,str2.left)
      console.log('WaterFlowSectionDemo32Jsunit_2222',str1.right - str0.right)
      console.log('WaterFlowSectionDemo32Jsunit_3333',str2.left - str0.right)
      expect(Math.floor(Math.abs(str1.right - str0.right)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(str2.left - str0.right)) <= 1).assertTrue();
      console.info('WaterFlowSectionDemo32Jsunit_0100 END')
      done();
    });

  })
}