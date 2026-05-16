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
import {Component, Driver, UiWindow, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, ON} from '@ohos.UiTest';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog'
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest, startAbility } from '../../Util.test';

export default function ScrollToIndexForWaterFlowJsunit01() {
  describe('ScrollToIndexForWaterFlowJsunit01', () => {

    beforeAll(() => {
      console.info("ScrollToIndexForWaterFlowJsunit01 beforeEach start");
      await UtilsTest.msSleep(4000);
      await startAbility("com.arkui.ace.scroll.nowear.api11.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("ScrollToIndexForWaterFlowJsunit01 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Scroll/ScrollToIndex/ScrollToIndexForWaterFlow01",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ScrollToIndexForWaterFlow01 state pages:" + JSON.stringify(pages));
        if (!("ScrollToIndexForWaterFlow01" == pages.name)) {
          console.info("get ScrollToIndexForWaterFlow01 pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ScrollToIndexForWaterFlow01 page error:" + err);
        expect().assertFail();
      }
      console.info("ScrollToIndexForWaterFlowJsunit01 beforeEach end");
    });

    
    
/**
     * @tc.number   ScrollToIndexForWaterFlow01_static_0100
     * @tc.name     ScrollToIndexForWaterFlow01_static_0100
     * @tc.desc     ScrollToIndexForWaterFlow01_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ScrollToIndexForWaterFlow01_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ApiCommponentAdd02Jsunit_static_0900] START');
      let driver = Driver.create();
      await driver.delayMs(1000);

      let button = await driver.findComponent(ON.text("30"));
      await (button?.click() as Promise<void>)
      await driver.delayMs(2000);
      let textItemCom = await driver.findComponent(ON.text("N30"));
      let currentItemID = await textItemCom!.getId();
      expect(currentItemID).assertEqual("ItemTextWaterFlow01_30");
      console.info('[ApiCommponentAdd02Jsunit_static_0900] END');
      done();
    });

    
    
/**
     * @tc.number   ScrollToIndexForWaterFlow01_static_0200
     * @tc.name     ScrollToIndexForWaterFlow01_static_0200
     * @tc.desc     ScrollToIndexForWaterFlow01_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ScrollToIndexForWaterFlow01_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ScrollToIndexForWaterFlow01_static_0200] START');
      let driver = Driver.create();
      await driver.delayMs(1000);

      let button = await driver.findComponent(ON.text("66-true"));
      await (button?.click() as Promise<void>)
      await driver.delayMs(2000);
      let textItemCom = await driver.findComponent(ON.text("N66"));
      let currentItemID = await textItemCom!.getId();

      await driver.delayMs(2000);
      let isSmoothText = await driver.findComponent(ON.id("isSmooth"));
      console.log('isSmoothText' + isSmoothText);
      console.log('isSmoothText' + JSON.stringify(isSmoothText));
      expect(isSmoothText).assertInstanceOf("Object");
      expect(currentItemID).assertEqual("ItemTextWaterFlow01_66");

      console.info('[ScrollToIndexForWaterFlow01_static_0200] END');
      done();
    });

    
    
/**
     * @tc.number   ScrollToIndexForWaterFlow01_static_0300
     * @tc.name     ScrollToIndexForWaterFlow01_static_0300
     * @tc.desc     ScrollToIndexForWaterFlow01_static_0300
     * @tc.level    Level.LEVEL1
     */
it('ScrollToIndexForWaterFlow01_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ScrollToIndexForWaterFlow01_static_0300] START');
      let driver = Driver.create();

      await driver.delayMs(1000);
      let moreColumnsBtn = await driver.findComponent(ON.text("moreColumns"));
      await (moreColumnsBtn?.click() as Promise<void>)
      await driver.delayMs(2000);
      let button = await driver.findComponent(ON.text("u-99-false"));
      await (button?.click() as Promise<void>)
      await driver.delayMs(2000);
      let textItemCom = await driver.findComponent(ON.text("N99"));
      let currentItemID = await textItemCom!.getId();
      await driver.delayMs(2000);
      expect(currentItemID).assertEqual("ItemTextWaterFlow01_99");

      console.info('[ScrollToIndexForWaterFlow01_static_0300] END');
      done();
    });
  })
}