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
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function WaterFlowSectionDemo43Jsunit() {
  describe('WaterFlowSectionDemo43Jsunit', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll.nowear.api12.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("WaterFlowSectionDemo43Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WaterFlow/WaterFlowSectionDemo/WaterFlowSectionDemo43',
      }
      try {
       const routerScroll = AppStorage.get<Router>("router") as Router
        routerScroll.clear();
        let pages = routerScroll.getState();
        console.info("get WaterFlowSectionDemo43Jsunit state pages:" + JSON.stringify(pages));
        if (!("WaterFlowSectionDemo43" == pages.name)) {
          console.info("get WaterFlowSectionDemo43Jsunit state pages.name:" + JSON.stringify(pages.name));
          routerScroll.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push WaterFlowSectionDemo43Jsunit page error:" + err);
        expect().assertFail();
      }
    });
    
    
/**
     * @tc.number   WaterFlowSectionDemo43Jsunit_static_0100
     * @tc.name     WaterFlowSectionDemo43Jsunit_static_0100
     * @tc.desc     WaterFlowSectionDemo43Jsunit_static_0100
     * @tc.level    Level.LEVEL1
     */
it('WaterFlowSectionDemo43Jsunit_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('WaterFlowSectionDemo43Jsunit_static_0100 START');
      await CommonFunc.sleep(1000);
      let str0 = CommonFunc.getComponentRect('WaterFlowSectionDemo43_0');
      let str3 = CommonFunc.getComponentRect('WaterFlowSectionDemo43_3');
      let str4 = CommonFunc.getComponentRect('WaterFlowSectionDemo43_4');
      await CommonFunc.sleep(2000);
      console.log('WaterFlowSectionDemo43Jsunit_1111',str0.bottom,str3.top,str3.right,str4.left)
      console.log('WaterFlowSectionDemo43Jsunit_2222',str3.top - str0.bottom)
      console.log('WaterFlowSectionDemo43Jsunit_3333',str4.left - str3.right)

      expect(Math.abs(Math.round(str3.top - str0.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
      expect(Math.abs(Math.round(str4.left - str3.right) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
      console.info('WaterFlowSectionDemo43Jsunit_static_0100 END')
      done();
    });
  })
}