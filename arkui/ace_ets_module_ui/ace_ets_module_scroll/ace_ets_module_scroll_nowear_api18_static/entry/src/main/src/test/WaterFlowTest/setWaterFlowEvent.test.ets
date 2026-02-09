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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

export default function setWaterFlowEvent() {
  describe('setWaterFlowEvent', () => {
    beforeAll(() => {
      console.info("setWaterFlowEvent beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.scroll.nowear.api18.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("setWaterFlowEvent beforeEach start");
      let options: router.RouterOptions = {
        url:  "MainAbility/pages/WaterFlow/setWaterFlowEvent"
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get setWaterFlowEvent state pages:" + JSON.stringify(pages));
        if (!("setWaterFlowEvent" == pages.name)) {
          console.info("get setWaterFlowEvent pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push setWaterFlowEvent page error:" + err);
      }
      console.info("setWaterFlowEvent beforeEach end");
    });

    

/**
     * @tc.number   setWaterFlowEvent_static_0100
     * @tc.name     setWaterFlowEvent_static_0100
     * @tc.desc     setWaterFlowEvent_static_0100
     * @tc.level    Level.LEVEL0
     */
it('setWaterFlowEvent_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[setWaterFlowEvent_static_0100] START');
      let driver = Driver.create()
      let btnEvent = await driver.findComponent(ON.id('WaterFlow_addCommonEvent_04'));
      await (btnEvent?.click() as Promise<void>);
      await CommonFunc.sleep(1500)

      let swipeScroll = CommonFunc.getComponentRectOnScreen('key_WaterFlow_set');
      let top = swipeScroll.top;
      let right = swipeScroll.right;
      let left = swipeScroll.left;
      let bottom = swipeScroll.bottom;
      console.info("setWaterFlowEvent_static_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await driver.swipe(Math.round(left + width/2) as int, Math.round(top + height*0.8) as int, Math.round(left + width/2) as int, Math.round(top + height*0.2) as int);
      await CommonFunc.sleep(2000);
      let btn = await driver.findComponent(ON.id('WaterFlow_setOnReach_04'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1500);

      let btn1 = await driver.findComponent(ON.id('WaterFlow_setOnWill_04'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let strJson1 = inspector.getInspectorByKey('WaterFlow_setOnWill_04');
      console.info("[setWaterFlowEvent_static_0100] content1: " + JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('setOnWillScroll_setOnDidScroll');

      let btn2 = await driver.findComponent(ON.id('WaterFlow_setOnScroll_04'));
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let strJson2 = inspector.getInspectorByKey('WaterFlow_setOnScroll_04');
      console.info("[setWaterFlowEvent_static_0100] content3: " + JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('setOnScrollStart_setOnScrollStop');

      let btn3 = await driver.findComponent(ON.id('WaterFlow_setOnScrollIndex_04'));
      await (btn3?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let strJson3 = inspector.getInspectorByKey('WaterFlow_setOnScrollIndex_04');
      console.info("[setWaterFlowEvent_static_0100] content4: " + JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content')).assertEqual('setOnScrollFrameBegin_setOnScrollIndex');
      console.info('[setWaterFlowEvent_static_0100] END');
      done();
    });
  })
}
