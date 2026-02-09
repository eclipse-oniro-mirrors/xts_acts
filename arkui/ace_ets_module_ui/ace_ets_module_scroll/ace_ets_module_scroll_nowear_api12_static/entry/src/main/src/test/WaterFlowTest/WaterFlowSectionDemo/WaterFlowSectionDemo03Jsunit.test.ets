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

export default function WaterFlowSectionDemo03Jsunit() {
  describe('WaterFlowSectionDemo03Jsunit', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll.nowear.api12.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("WaterFlowSectionDemo03Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WaterFlow/WaterFlowSectionDemo/WaterFlowSectionDemo03',
      }
      try {
       const routerScroll = AppStorage.get<Router>("router") as Router
        routerScroll.clear();
        let pages = routerScroll.getState();
        console.info("get WaterFlowSectionDemo03Jsunit state pages:" + JSON.stringify(pages));
        if (!("WaterFlowSectionDemo03" == pages.name)) {
          console.info("get WaterFlowSectionDemo03Jsunit state pages.name:" + JSON.stringify(pages.name));
          routerScroll.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push WaterFlowSectionDemo03Jsunit page error:" + err);
        expect().assertFail();
      }
    });
    
    
/**
     * @tc.number   WaterFlowSectionDemo03Jsunit_static_0100
     * @tc.name     WaterFlowSectionDemo03Jsunit_static_0100
     * @tc.desc     WaterFlowSectionDemo03Jsunit_static_0100
     * @tc.level    Level.LEVEL1
     */
it('WaterFlowSectionDemo03Jsunit_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('WaterFlowSectionDemo03Jsunit_static_0100 START');
      await CommonFunc.sleep(1000);
      let str0 = CommonFunc.getComponentRect('WaterFlowSectionDemo03_0');
      let str1 = CommonFunc.getComponentRect('WaterFlowSectionDemo03_1');
      await CommonFunc.sleep(2000);
      console.log('WaterFlowSectionDemo03Jsunit_1111',str0.bottom,str1.top)
      console.log('WaterFlowSectionDemo03Jsunit_2222',str1.top - str0.bottom)
      expect(Math.round(str1.top - str0.bottom)).assertEqual(Math.round(0));
      console.info('WaterFlowSectionDemo03Jsunit_static_0100 END')
      done();
    });

  })
}