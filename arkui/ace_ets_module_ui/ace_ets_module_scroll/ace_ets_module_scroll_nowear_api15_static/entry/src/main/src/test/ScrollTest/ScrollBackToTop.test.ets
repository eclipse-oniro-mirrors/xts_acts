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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, On, ON, MouseButton } from '@kit.TestKit';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';

export default function ScrollBackToTopTest() {
  describe('ScrollBackToTopTest', () => {
    beforeAll(() => {
      console.info("ScrollBackToTopTest beforeEach start");
      await UtilsTest.msSleep(4000);
      await startAbility("com.arkui.ace.scroll.nowear.api15.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("ScrollBackToTopTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Scroll/ScrollBackToTop",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ScrollBackToTopTest state pages:" + JSON.stringify(pages));
        if (pages == null || !("ScrollSwipe" == pages.name)) {
          console.info("get ScrollBackToTopTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ScrollBackToTopTest page error:" + err);
      }
      console.info("ScrollBackToTopTest beforeEach end");
    });

    
    
/**
     * @tc.number   ScrollTest1_static_0100
     * @tc.name     ScrollTest1_static_0100
     * @tc.desc     ScrollTest1_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ScrollTest1_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ScrollTest_0100 START');
      await sleep(1000)
      let driverScroll = Driver.create();
      let scroll = await (driverScroll.findComponent(ON.id('Scroll_4')) as Promise<Component>);
      let rect = await scroll.getBounds();
      let top = rect.top;
      let left = rect.left;
      let right = rect.right;
      let bottom = rect.bottom;
      console.info("ScrollTest_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      // create driver
      let driverTop =  Driver.create();
      let topButton = await driverTop.findComponent(ON.id('Top'));
      let driverSwitch =  Driver.create();
      let switchButton = await driverSwitch.findComponent(ON.id('Switch'))
      await sleep(1000);  //wait for driver to be ready
      await driverScroll.swipe(
        Math.round(left + width * 0.2) as int,
        Math.round(bottom - height / 4) as int,
        Math.round(left + width * 0.2) as int,
        Math.round(bottom - height / 2) as int
      );
      //waiting for scroll to complete
      await sleep(2000);
      await (topButton?.click() as Promise<void>);
      await sleep(1500)
      let stopJson = inspector.getInspectorByKey('ScrollBackToTop');
      expect(JSON.parseJsonElement(stopJson).getElement('$attrs').getString('content') !== 'onDidScrollBackToTop').assertTrue();

      await (switchButton?.click() as Promise<void>);
      await sleep(500)
      await (topButton?.click() as Promise<void>);
      await sleep(1500)

      await driverScroll.swipe(
        Math.round(left + width * 0.2) as int,
        Math.round(bottom - height / 4) as int,
        Math.round(left + width * 0.2) as int,
        Math.round(bottom - height / 2) as int
      );
      await sleep(2000);
      await (switchButton?.click() as Promise<void>);
      await sleep(500)
      await (topButton?.click() as Promise<void>);
      await sleep(1500)

      await driverScroll.swipe(
        Math.round(left + width * 0.2) as int,
        Math.round(bottom - height / 4) as int,
        Math.round(left + width * 0.2) as int,
        Math.round(bottom - height / 2) as int
      );
      await sleep(2000);
      await (switchButton?.click() as Promise<void>);
      await sleep(500)
      await (topButton?.click() as Promise<void>);
      await sleep(3000); //waiting for backToTop

      let strJson = inspector.getInspectorByKey('Scroll_1');
      let strJson1 = inspector.getInspectorByKey('Scroll_2');
      let strJson3 = inspector.getInspectorByKey('ScrollBackToTop');
      let strJson4 = inspector.getInspectorByKey('ScrollAbnormal');
      console.info("getInspectorByKey result for Scroll_1: " + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("getInspectorByKey result for Scroll_2: " + strJson1);
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("getInspectorByKey result for ScrollBackToTop: " + strJson3);
      let obj3 = JSON.parseJsonElement(strJson3);
      let obj4 = JSON.parseJsonElement(strJson4);
      // output console info
      console.info("[ScrollTest_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ScrollTest_static_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[ScrollTest_static_0100] component obj3 is: " + JSON.stringify(obj3));
      console.info("[ScrollTest_static_0100] component obj4 is: " + JSON.stringify(obj4));
      // assertEqual backToTop event
      expect(obj.getElement("$attrs").getString("content")).assertEqual('onWillScroll');
      expect(obj3.getElement("$attrs").getString("content")).assertEqual('onDidScrollBackToTop');
      expect(obj4.getElement("$attrs").getString("content")).assertEqual('DidAbnormal');
      console.info('[ScrollTest_static_0100] END');
      done()
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