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
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest, startAbility } from '../Util.test';

export default function ListBackToTopTest() {
  describe('ListBackToTopTest', () => {
    beforeAll(() => {
      console.info("ListBackToTopTest beforeEach start");
      await UtilsTest.msSleep(4000);
      await startAbility("com.arkui.ace.scroll.nowear.api15.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      const SUITE: string = 'ListBackToTop'
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/ListBackToTop",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        if (pages == null || !("ListSwipe" == pages.name)) {
          routerInstance.pushUrl(options).then(() => {
            console.info(`${SUITE} router.pushUrl success`);
          })
        }
      } catch (err) {
        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }
    });
    
    
/**
     * @tc.number   ListBackToTop_static_0100
     * @tc.name     ListBackToTop_static_0100
     * @tc.desc     ListBackToTop_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ListBackToTop_static_0100', Level.LEVEL0, async () => {
      console.info('ListBackToTop_static_0100 START');
      await sleep(1000)
      let driverList: Driver = Driver.create();
      let list = await driverList.findComponent(ON.id('listScroll_4'));
      let rect = await (list?.getBounds() as Promise<Rect>);
      let top = rect.top;
      let left = rect.left;
      let right = rect.right;
      let bottom = rect.bottom;
      console.info("ListBackToTop_static_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      // create driver
      let driverTop = Driver.create();
      let topButton = await driverTop.findComponent(ON.id('Top'));
      let driverSwitch = Driver.create();
      let switchButton = await driverSwitch.findComponent(ON.id('Switch'))
      await sleep(1000);
      await driverList.swipe(
        Math.round(left + width * 0.2) as int,
        Math.round(bottom - height / 4) as int,
        Math.round(left + width * 0.2) as int,
        Math.round(bottom - height / 2) as int
      );
      await sleep(2000);
      await (topButton?.click() as Promise<void>);
      await sleep(1500)
      let stopJson = inspector.getInspectorByKey('listBackToTop');
      expect(JSON.parseJsonElement(stopJson).getElement('$attrs').getString('content') !== 'onDidListBackToTop').assertTrue();
      
      await (switchButton?.click() as Promise<void>);
      await sleep(500)
      await (topButton?.click() as Promise<void>);
      await sleep(1500)

      await driverList.swipe(
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

      await driverList.swipe(
        Math.round(left + width * 0.2) as int,
        Math.round(bottom - height / 4) as int,
        Math.round(left + width * 0.2) as int,
        Math.round(bottom - height / 2) as int
      );
      await sleep(2000);
      await (switchButton?.click() as Promise<void>);
      await sleep(500)
      await (topButton?.click() as Promise<void>);
      await sleep(1000); //waiting for scroll complete

      let strJson = inspector.getInspectorByKey('listScroll_1');
      let strJson1 = inspector.getInspectorByKey('listScroll_2');
      let strJson2 = inspector.getInspectorByKey('listScroll_3');
      let strJson3 = inspector.getInspectorByKey('listBackToTop');
      let strJson4 = inspector.getInspectorByKey('listAbnormal');

      console.info("getInspectorByKey result for listScroll_1: " + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("getInspectorByKey result for listScroll_2: " + strJson1);
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("getInspectorByKey result for listScroll_3: " + strJson2);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("getInspectorByKey result for listBackToTop: " + strJson3);
      let obj3 = JSON.parseJsonElement(strJson3);
      let obj4 = JSON.parseJsonElement(strJson4);
      
      console.info("[ListScrollTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ListScrollTest_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[ListScrollTest_0100] component obj2 is: " + JSON.stringify(obj2));
      console.info("[ListScrollTest_0100] component obj3 is: " + JSON.stringify(obj3));
      console.info("[ListScrollTest_0100] component obj4 is: " + JSON.stringify(obj4));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('onWillScroll');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('onScrollVisibleContentChange');
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('onDidListBackToTop');
      expect(obj4.getElement('$attrs').getString('content')).assertEqual('DidAbnormal');
      console.info('[ListBackToTop_static_0100] END');
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
