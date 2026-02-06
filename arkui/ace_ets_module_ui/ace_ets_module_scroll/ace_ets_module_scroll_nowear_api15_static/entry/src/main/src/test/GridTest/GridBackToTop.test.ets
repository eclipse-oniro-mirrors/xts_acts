'use static';
/*
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import { Component, Driver, On, ON, MouseButton, Rect } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import { UtilsTest, startAbility } from '../Util.test';

export default function GridBackToTopTest() {
  describe('GridBackToTopTest', () => {
    beforeAll(() => {
      console.info("GridBackToTopTest beforeEach start");
      await UtilsTest.msSleep(4000);
      await startAbility("com.arkui.ace.scroll.nowear.api15.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("GridBackToTopTest beforeEach start");
      const SUITE: string = 'GridBackToTop'
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/GridBackToTop",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get GridBackToTopTest state pages:" + JSON.stringify(pages));
        if (pages == null || !("GridSwipe" == pages.name)) {
          console.info("get GridBackToTopTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options).then(() => {
            console.info(`${SUITE} router.pushUrl success`);
          });
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push GridBackToTopTest page error:" + err);
      }
      console.info("GridBackToTopTest beforeEach end");
    });
    
    
/**
     * @tc.number   GridScrollTest1_static_0100
     * @tc.name     GridScrollTest1_static_0100
     * @tc.desc     GridScrollTest1_static_0100
     * @tc.level    Level.LEVEL1
     */
it('GridScrollTest1_static_0100', Level.LEVEL1, async () => {
      console.info('GridScrollTest_0100 START');
      await sleep(1500)
      let driverGrid: Driver = Driver.create();
      let grid: Component = await driverGrid.findComponent(ON.id('gridScroll_4')) as Component;
      let rect = await  (grid.getBounds() as Promise<Rect>)
      let top = rect.top;
      let left = rect.left;
      let right = rect.right;
      let bottom = rect.bottom;
      console.info("GridScrollTest_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      let driverTop = Driver.create();
      let topButton: Component = await driverTop.findComponent(ON.id('Top')) as Component;
      let driverSwitch = Driver.create();
      let switchButton: Component = await driverSwitch.findComponent(ON.id('Switch')) as Component;
      await sleep(1500);

      await driverGrid.swipe(
        Math.round(left + width * 0.2) as int,
        Math.round(bottom - height / 4) as int,
        Math.round(left + width * 0.2) as int,
        Math.round(bottom - height / 2) as int
      );
      await sleep(2000);
      await topButton.click();
      await sleep(1500)
      let stopJson = inspector.getInspectorByKey('gridBackToTop');
      console.info("getInspectorByKey result for stopJson: " + stopJson);
      console.info("getInspectorByKey result for $attrs: " + JSON.parseJsonElement(stopJson).getElement("$attrs"));
      console.info("getInspectorByKey result for content: " + JSON.parseJsonElement(stopJson).getElement("$attrs").getString("content"));
      expect(JSON.parseJsonElement(stopJson).getElement("$attrs").getString("content") !== 'onDidGridBackToTop').assertTrue();

      await switchButton.click();
      await sleep(500)
      await topButton.click();
      await sleep(1500)

      await driverGrid.swipe(
        Math.round(left + width * 0.2) as int,
        Math.round(bottom - height / 4) as int,
        Math.round(left + width * 0.2) as int,
        Math.round(bottom - height / 2) as int
      );
      await sleep(2000);
      await switchButton.click();
      await sleep(500)
      await topButton.click();
      await sleep(1500)

      await driverGrid.swipe(
        Math.round(left + width * 0.2) as int,
        Math.round(bottom - height / 4) as int,
        Math.round(left + width * 0.2) as int,
        Math.round(bottom - height / 2) as int
      );
      await sleep(2000);
      await switchButton.click();
      await sleep(500)
      await topButton.click();
      await sleep(1000); //waiting for scroll to top

      // Retrieve the text content of scrolling related events
      let strJson = inspector.getInspectorByKey('gridScroll_1');
      let strJson1 = inspector.getInspectorByKey('gridScroll_2');
      let strJson3 = inspector.getInspectorByKey('gridBackToTop');
      let strJson4 = inspector.getInspectorByKey('gridAbnormal');
      console.info("getInspectorByKey result for gridScroll_1: " + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("getInspectorByKey result for gridScroll_2: " + strJson1);
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("getInspectorByKey result for gridBackToTop: " + strJson3);
      let obj3 = JSON.parseJsonElement(strJson3);
      let obj4 = JSON.parseJsonElement(strJson4);
      // output the event information
      console.info("[GridScrollTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[GridScrollTest_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[GridScrollTest_0100] component obj3 is: " + JSON.stringify(obj3));
      console.info("[GridScrollTest_0100] component obj4 is: " + JSON.stringify(obj4));
      // verify the event information
      expect(obj.getElement("$attrs").getString("content")).assertEqual('onWillScroll');
      expect(obj3.getElement("$attrs").getString("content")).assertEqual('onDidGridBackToTop');
      expect(obj4.getElement("$attrs").getString("content")).assertEqual('DidAbnormal');
      console.info('[GridScrollTest_0100] END');
    })
  })
}

async function sleep(count:int) : Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, count)
  })
}
