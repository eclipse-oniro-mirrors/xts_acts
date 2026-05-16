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
import { Component, Driver, UiWindow, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, ON} from '@ohos.UiTest';
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

export default function ScrollToIndexForWaterFlowJsunit02() {
  describe('ScrollToIndexForWaterFlowJsunit02', () => {

    beforeAll(() => {
      console.info("ScrollToIndexForWaterFlowJsunit02 beforeEach start");
      await UtilsTest.msSleep(4000);
      await startAbility("com.arkui.ace.scroll.nowear.api11.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("ScrollToIndexForWaterFlowJsunit02 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Scroll/ScrollToIndex/ScrollToIndexForWaterFlow02',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ScrollToIndexForWaterFlowJsunit02 state pages:" + JSON.stringify(pages));
        if (!("ScrollToIndexForWaterFlow02" == pages.name)) {
          console.info("get ScrollToIndexForWaterFlowJsunit02 pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ScrollToIndexForWaterFlowJsunit02 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ScrollToIndexForWaterFlowJsunit02 page error:" + err);
      }
      console.info("ScrollToIndexForWaterFlowJsunit02 beforeEach end");
    });
    
    
    
    
/**
     * @tc.number   ScrollToIndexForWaterFlow02_static_0100
     * @tc.name     ScrollToIndexForWaterFlow02_static_0100
     * @tc.desc     ScrollToIndexForWaterFlow02_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ScrollToIndexForWaterFlow02_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ScrollToIndexForWaterFlow02_static_0900] START');
      let driver = Driver.create();

      await driver.delayMs(1000);
      let button = await driver.findComponent(ON.text('Grid-66-true'));
      await (button?.click() as Promise<void>)
      await driver.delayMs(2000);
      let button_Item = await driver.findComponent(ON.text('Item-99-true'));
      await (button_Item?.click() as Promise<void>)
      await driver.delayMs(2000);
      let textItemCom = await driver.findComponent(ON.text("NN99"));
      let currentItemID = await textItemCom!.getId();
      await driver.delayMs(2000);
      let isSmoothObj = await driver.findComponent(ON.id("isHaveSmooth_WaterFlow02"));
      console.log('isSmoothText' + isSmoothObj);
      console.log('isSmoothText' + JSON.stringify(isSmoothObj));
      expect(isSmoothObj).assertInstanceOf("Object");
      expect(currentItemID).assertEqual("ItemTextWaterFlow02_99");

      console.info('[ScrollToIndexForWaterFlow02_static_0900] END');
      done();
    });

    
    
/**
     * @tc.number   ScrollToIndexForWaterFlow02_static_0200
     * @tc.name     ScrollToIndexForWaterFlow02_static_0200
     * @tc.desc     ScrollToIndexForWaterFlow02_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ScrollToIndexForWaterFlow02_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ScrollToIndexForWaterFlow02_static_0200] START');
      let driver = Driver.create();

      await driver.delayMs(1000);
      let button_Item = await driver.findComponent(ON.text("Item-10-false"));
      await (button_Item?.click() as Promise<void>)
      await driver.delayMs(3000);
      let textItemCom = await driver.findComponent(ON.text("NN10"));
      let currentItemID = await textItemCom!.getId();
      await driver.delayMs(3000);
      expect(currentItemID).assertEqual("ItemTextWaterFlow02_10");

      console.info('[ScrollToIndexForWaterFlow02_static_0200] END');
      done();
    });
  })
}