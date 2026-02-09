'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import observer from '@ohos.arkui.observer';
import { UtilsTest, startAbility, stopApplication } from '../../Util.test';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function WaterFlowSectionDemo33Jsunit() {
  describe('WaterFlowSectionDemo33Jsunit', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll.nowear.api12.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("WaterFlowSectionDemo33Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WaterFlow/WaterFlowSectionDemo/WaterFlowSectionDemo33',
      }
      try {
       const routerScroll = AppStorage.get<Router>("router") as Router
        routerScroll.clear();
        let pages = routerScroll.getState();
        console.info("get WaterFlowSectionDemo33Jsunit state pages:" + JSON.stringify(pages));
        if (!("WaterFlowSectionDemo33" == pages.name)) {
          console.info("get WaterFlowSectionDemo33Jsunit state pages.name:" + JSON.stringify(pages.name));
          routerScroll.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push WaterFlowSectionDemo33Jsunit page error:" + err);
        expect().assertFail();
      }
    });
    
    
/**
     * @tc.number   WaterFlowSectionDemo33Jsunit_static_0100
     * @tc.name     WaterFlowSectionDemo33Jsunit_static_0100
     * @tc.desc     WaterFlowSectionDemo33Jsunit_static_0100
     * @tc.level    Level.LEVEL1
     */
it('WaterFlowSectionDemo33Jsunit_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('WaterFlowSectionDemo33Jsunit_static_0100 START');
      await CommonFunc.sleep(1000);
      let str0 = CommonFunc.getComponentRect('WaterFlowSectionDemo33_0');
      let str8 = CommonFunc.getComponentRect('WaterFlowSectionDemo33_8');
      let str9 = CommonFunc.getComponentRect('WaterFlowSectionDemo33_9');
      let str15 = CommonFunc.getComponentRect('WaterFlowSectionDemo33_15');
      let str16 = CommonFunc.getComponentRect('WaterFlowSectionDemo33_16');
      let str19 = CommonFunc.getComponentRect('WaterFlowSectionDemo33_19');
      let str24 = CommonFunc.getComponentRect('WaterFlowSectionDemo33_24');
      let str31 = CommonFunc.getComponentRect('WaterFlowSectionDemo33_31');
      await CommonFunc.sleep(5000);
      console.log('WaterFlowSectionDemo33Jsunit_1111',str0.right,str8.right,str8.top,str9.top,str16.top,str19.top,str15.bottom)
      console.log('WaterFlowSectionDemo33Jsunit_2222',str0.right - str8.right)
      console.log('WaterFlowSectionDemo33Jsunit_3333',str8.top - str9.top)
      console.log('WaterFlowSectionDemo33Jsunit_4444',str16.top - str15.bottom)
      console.log('WaterFlowSectionDemo33Jsunit_5555',str19.top - str15.bottom)
      expect(Math.round(str0.right - str8.right)).assertEqual(Math.round(0));
      expect(Math.round(str8.top - str9.top)).assertEqual(Math.round(0));
      expect(Math.round(str16.top - str19.top)).assertEqual(Math.round(0));
      expect(Math.round(str24.top - str31.top)).assertEqual(Math.round(0));
      await CommonFunc.sleep(3000);
      console.info('WaterFlowSectionDemo33Jsunit_static_0100 END')
      done();
    });

  })
}