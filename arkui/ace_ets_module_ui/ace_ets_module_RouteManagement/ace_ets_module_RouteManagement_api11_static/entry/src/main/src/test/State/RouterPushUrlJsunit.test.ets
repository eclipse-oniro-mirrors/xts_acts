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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest } from '../Util.test';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
const waitUiReadyMs = 1000;

export default function RouterPushUrlJsunit() {
  describe('RouterPushUrlJsunit', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.RouteManagement.api11.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("RouterPushUrlJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/RouterPushOne',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get RouterPushUrlJsunit state pages: " + JSON.stringify(pages));
        if (!("RouterPushOne" == pages.name)) {
          console.info("get RouterPushUrlJsunit state pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          routerInstance.clear()
        }
      } catch (err) {
        console.error("push RouterPushUrlJsunit page error:" + err);
      }
    });

    afterEach(async () => {
      const routerInstance = AppStorage.get<Router>("router") as Router
      await CommonFunc.sleep(1000);
      routerInstance.clear()
    });

    

    
/**
     * @tc.number   RouterPushUrlJsunit_static_0001
     * @tc.name     RouterPushUrlJsunit_static_0001
     * @tc.desc     RouterPushUrlJsunit_static_0001
     * @tc.level    Level.LEVEL2
     */
it('RouterPushUrlJsunit_static_0001', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[RouterPushUrlJsunit_static_0001] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let btn = await driver.findComponent(ON.id('turn_RouterPushUrlTwo_noParms'));
      await driver.delayMs(waitUiReadyMs);
      await (btn?.click() as Promise<void>);
      await driver.delayMs(waitUiReadyMs);
      let text = await driver.findComponent(ON.id('Text_RouterPushTwo'));
      await driver.delayMs(waitUiReadyMs);
      let txt = await (text?.getText() as Promise<string>)
      expect(txt).assertEqual("RouterPushTwo ")
      done();
    });

    

    
/**
     * @tc.number   RouterPushUrlJsunit_static_0002
     * @tc.name     RouterPushUrlJsunit_static_0002
     * @tc.desc     RouterPushUrlJsunit_static_0002
     * @tc.level    Level.LEVEL2
     */
it('RouterPushUrlJsunit_static_0002', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[RouterPushUrlJsunit_static_0002] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let btn = await driver.findComponent(ON.id('turn_RouterPushUrlTwo_hasParms'));
      await driver.delayMs(waitUiReadyMs);
      await (btn?.click() as Promise<void>);
      await driver.delayMs(waitUiReadyMs);
      let text = await driver.findComponent(ON.id('Text_RouterPushTwo'));
      await driver.delayMs(waitUiReadyMs);
      let txt = await (text?.getText() as Promise<string>)
      expect(txt).assertEqual("RouterPushTwo params")
      done();
    });

    

    
/**
     * @tc.number   RouterPushUrlJsunit_static_0003
     * @tc.name     RouterPushUrlJsunit_static_0003
     * @tc.desc     RouterPushUrlJsunit_static_0003
     * @tc.level    Level.LEVEL2
     */
it('RouterPushUrlJsunit_static_0003', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[RouterPushUrlJsunit_static_0003] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      const routerInstance = AppStorage.get<Router>("router") as Router
      let Length = routerInstance.getLength()
      expect("Length = " + Length).assertEqual("Length = 1")
      let btn1 = await driver.findComponent(ON.id('turn_RouterPushUrlTwo_noParms'));
      await driver.delayMs(waitUiReadyMs);
      await (btn1?.click() as Promise<void>);
      await driver.delayMs(waitUiReadyMs);
      let pageTwoLength = routerInstance.getLength()
      expect("pageTwoLength = " + pageTwoLength).assertEqual("pageTwoLength = 2")
      let pages = routerInstance.getState();
      expect(pages.index).assertEqual(2)
      let btn2 = await driver.findComponent(ON.id('turn_RouterPushUrlOne_RouterMode_Standard'));
      await driver.delayMs(waitUiReadyMs);
      await (btn2?.click() as Promise<void>);
      await driver.delayMs(waitUiReadyMs);
      let pageOneLength = routerInstance.getLength()
      expect("pageOneLength = " + pageOneLength).assertEqual("pageOneLength = 3")
      pages = routerInstance.getState();
      expect(pages.index).assertEqual(3)
      done()
    });

    

    
/**
     * @tc.number   RouterPushUrlJsunit_static_0004
     * @tc.name     RouterPushUrlJsunit_static_0004
     * @tc.desc     RouterPushUrlJsunit_static_0004
     * @tc.level    Level.LEVEL2
     */
it('RouterPushUrlJsunit_static_0004', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[RouterPushUrlJsunit_static_0004] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      const routerInstance = AppStorage.get<Router>("router") as Router
      let Length = routerInstance.getLength()
      expect(Length).assertEqual("1")
      let btn1 = await driver.findComponent(ON.id('turn_RouterPushUrlTwo_noParms'));
      await driver.delayMs(waitUiReadyMs);
      await (btn1?.click() as Promise<void>);
      await driver.delayMs(waitUiReadyMs);
      let pageTwoLength = routerInstance.getLength()
      expect("pageTwoLength = " + pageTwoLength).assertEqual("pageTwoLength = 2")
      let pages = routerInstance.getState();
      expect(pages.index).assertEqual(2)
      let btn2 = await driver.findComponent(ON.id('turn_RouterPushUrlOne_RouterMode_Single'));
      await driver.delayMs(waitUiReadyMs);
      await (btn2?.click() as Promise<void>);
      await driver.delayMs(waitUiReadyMs);
      let pageOneLength = routerInstance.getLength()
      expect("pageOneLength = " + pageOneLength).assertEqual("pageOneLength = 2")
      pages = routerInstance.getState();
      expect(pages.index).assertEqual(2)
      done()
    });

    

    
/**
     * @tc.number   RouterPushUrlJsunit_static_0005
     * @tc.name     RouterPushUrlJsunit_static_0005
     * @tc.desc     RouterPushUrlJsunit_static_0005
     * @tc.level    Level.LEVEL2
     */
it('RouterPushUrlJsunit_static_0005', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[RouterPushUrlJsunit_static_0005] START');
      let driver = Driver.create();
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let btn = await (scrollBar?.scrollSearch(ON.id('turn_RouterPushReplace_noParms')) as Promise<Component | null>);
      await driver.delayMs(waitUiReadyMs);
      await (btn?.click() as Promise<void>);
      const routerInstance = AppStorage.get<Router>("router") as Router
      let Length = routerInstance.getLength()
      expect(Length).assertEqual("1")
      await driver.delayMs(waitUiReadyMs);
      let scrollBar2 = await driver.findComponent(ON.type('Scroll'));
      let text = await (scrollBar2?.scrollSearch(ON.id('Text_RouterPushTwo')) as Promise<Component | null>);
      await driver.delayMs(waitUiReadyMs);
      let txt = await (text?.getText() as Promise<string>)
      expect(txt).assertEqual("RouterPushTwo ")
      done();
    });

    

    
/**
     * @tc.number   RouterPushUrlJsunit_static_0006
     * @tc.name     RouterPushUrlJsunit_static_0006
     * @tc.desc     RouterPushUrlJsunit_static_0006
     * @tc.level    Level.LEVEL2
     */
it('RouterPushUrlJsunit_static_0006', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[RouterPushUrlJsunit_static_0006] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let btn = await (scrollBar?.scrollSearch(ON.id('turn_RouterPushReplace_hasParms')) as Promise<Component | null>);
      await driver.delayMs(waitUiReadyMs);
      await (btn?.click() as Promise<void>);
      const routerInstance = AppStorage.get<Router>("router") as Router
      let Length = routerInstance.getLength()
      expect(Length).assertEqual("1")
      await driver.delayMs(waitUiReadyMs);
      let scrollBar2 = await driver.findComponent(ON.type('Scroll'));
      let text = await (scrollBar2?.scrollSearch(ON.id('Text_RouterPushTwo')) as Promise<Component | null>);
      await driver.delayMs(waitUiReadyMs);
      let txt = await (text?.getText() as Promise<string>)
      expect(txt).assertEqual("RouterPushTwo params")
      done();
    });

    

    
/**
     * @tc.number   RouterPushUrlJsunit_static_0007
     * @tc.name     RouterPushUrlJsunit_static_0007
     * @tc.desc     RouterPushUrlJsunit_static_0007
     * @tc.level    Level.LEVEL2
     */
it('RouterPushUrlJsunit_static_0007', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[RouterPushUrlJsunit_static_0007] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let btn = await (scrollBar?.scrollSearch(ON.id('turn_UIRouterPushUrlTwo_noParms')) as Promise<Component | null>);
      await driver.delayMs(waitUiReadyMs);
      await (btn?.click() as Promise<void>);
      await driver.delayMs(waitUiReadyMs);
      let scrollBar2 = await driver.findComponent(ON.type('Scroll'));
      let text = await (scrollBar2?.scrollSearch(ON.id('Text_UIRouterPushTwo')) as Promise<Component | null>);
      await driver.delayMs(waitUiReadyMs);
      let txt = await (text?.getText() as Promise<string>)
      expect(txt).assertEqual("UIRouterPushTwo ")
      done();
    });

    

    
/**
     * @tc.number   RouterPushUrlJsunit_static_0008
     * @tc.name     RouterPushUrlJsunit_static_0008
     * @tc.desc     RouterPushUrlJsunit_static_0008
     * @tc.level    Level.LEVEL2
     */
it('RouterPushUrlJsunit_static_0008', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[RouterPushUrlJsunit_static_0008] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let btn = await (scrollBar?.scrollSearch(ON.id('turn_UIRouterPushUrlTwo_hasParms')) as Promise<Component | null>);
      await driver.delayMs(waitUiReadyMs);
      await (btn?.click() as Promise<void>);
      await driver.delayMs(waitUiReadyMs);
      let scrollBar2 = await driver.findComponent(ON.type('Scroll'));
      let text = await (scrollBar2?.scrollSearch(ON.id('Text_UIRouterPushTwo')) as Promise<Component | null>);
      await driver.delayMs(waitUiReadyMs);
      let txt = await (text?.getText() as Promise<string>)
      expect(txt).assertEqual("UIRouterPushTwo params")
      done();
    });

    

    
/**
     * @tc.number   RouterPushUrlJsunit_static_0009
     * @tc.name     RouterPushUrlJsunit_static_0009
     * @tc.desc     RouterPushUrlJsunit_static_0009
     * @tc.level    Level.LEVEL2
     */
it('RouterPushUrlJsunit_static_0009', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[RouterPushUrlJsunit_static_0009] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      const routerInstance = AppStorage.get<Router>("router") as Router
      let Length = routerInstance.getLength()
      expect("Length = " + Length).assertEqual("Length = 1")
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let btn1 = await (scrollBar?.scrollSearch(ON.id('turn_UIRouterPushUrlTwo_noParms')) as Promise<Component | null>);
      await driver.delayMs(waitUiReadyMs);
      await (btn1?.click() as Promise<void>);
      await driver.delayMs(waitUiReadyMs);
      let pageTwoLength = routerInstance.getLength()
      expect("pageTwoLength = " + pageTwoLength).assertEqual("pageTwoLength = 2")
      let pages = routerInstance.getState();
      expect(pages.index).assertEqual(2)
      let scrollBar2 = await driver.findComponent(ON.type('Scroll'));
      let btn2 = await (scrollBar2?.scrollSearch(ON.id('turn_UIRouterPushUrlOne_RouterMode_Standard')) as Promise<Component | null>);
      await driver.delayMs(waitUiReadyMs);
      await (btn2?.click() as Promise<void>);
      await driver.delayMs(waitUiReadyMs);
      let pageOneLength = routerInstance.getLength()
      expect("pageOneLength = " + pageOneLength).assertEqual("pageOneLength = 3")
      pages = routerInstance.getState();
      expect(pages.index).assertEqual(3)
      done()
    });

    

    
/**
     * @tc.number   RouterPushUrlJsunit_static_0010
     * @tc.name     RouterPushUrlJsunit_static_0010
     * @tc.desc     RouterPushUrlJsunit_static_0010
     * @tc.level    Level.LEVEL2
     */
it('RouterPushUrlJsunit_static_0010', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[RouterPushUrlJsunit_static_0010] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      const routerInstance = AppStorage.get<Router>("router") as Router
      let Length = routerInstance.getLength()
      expect(Length).assertEqual("1")
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let btn1 = await (scrollBar?.scrollSearch(ON.id('turn_UIRouterPushUrlTwo_noParms')) as Promise<Component | null>);
      await driver.delayMs(waitUiReadyMs);
      await (btn1?.click() as Promise<void>);
      await driver.delayMs(waitUiReadyMs);
      let pageTwoLength = routerInstance.getLength()
      expect("pageTwoLength = " + pageTwoLength).assertEqual("pageTwoLength = 2")
      let pages = routerInstance.getState();
      expect(pages.index).assertEqual(2)
      let scrollBar2 = await driver.findComponent(ON.type('Scroll'));
      let btn2 = await (scrollBar2?.scrollSearch(ON.id('turn_UIRouterPushUrlOne_RouterMode_Single')) as Promise<Component | null>);
      await driver.delayMs(waitUiReadyMs);
      await (btn2?.click() as Promise<void>);
      await driver.delayMs(waitUiReadyMs);
      let pageOneLength = routerInstance.getLength()
      expect("pageOneLength = " + pageOneLength).assertEqual("pageOneLength = 2")
      pages = routerInstance.getState();
      expect(pages.index).assertEqual(2)
      done()
    });

    

    
/**
     * @tc.number   RouterPushUrlJsunit_static_0011
     * @tc.name     RouterPushUrlJsunit_static_0011
     * @tc.desc     RouterPushUrlJsunit_static_0011
     * @tc.level    Level.LEVEL2
     */
it('RouterPushUrlJsunit_static_0011', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[RouterPushUrlJsunit_static_0011] START');
      let driver = Driver.create();
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let btn = await (scrollBar?.scrollSearch(ON.id('turn_UIRouterPushReplace_noParms')) as Promise<Component | null>);
      await driver.delayMs(waitUiReadyMs);
      await (btn?.click() as Promise<void>);
      const routerInstance = AppStorage.get<Router>("router") as Router
      let Length = routerInstance.getLength()
      expect(Length).assertEqual("1")
      await driver.delayMs(waitUiReadyMs);
      let scrollBar2 = await driver.findComponent(ON.type('Scroll'))
      let text = await (scrollBar2?.scrollSearch(ON.id('Text_UIRouterPushTwo')) as Promise<Component | null>);
      await driver.delayMs(waitUiReadyMs);
      let txt = await (text?.getText() as Promise<string>)
      expect(txt).assertEqual("UIRouterPushTwo ")
      done();
    });

    

    
/**
     * @tc.number   RouterPushUrlJsunit_static_0012
     * @tc.name     RouterPushUrlJsunit_static_0012
     * @tc.desc     RouterPushUrlJsunit_static_0012
     * @tc.level    Level.LEVEL2
     */
it('RouterPushUrlJsunit_static_0012', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[RouterPushUrlJsunit_static_0012] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let btn = await (scrollBar?.scrollSearch(ON.id('turn_UIRouterPushReplace_hasParms')) as Promise<Component | null>);
      await driver.delayMs(waitUiReadyMs);
      await (btn?.click() as Promise<void>);
      const routerInstance = AppStorage.get<Router>("router") as Router
      let Length = routerInstance.getLength()
      expect(Length).assertEqual("1")
      await driver.delayMs(waitUiReadyMs);
      let scrollBar2 = await driver.findComponent(ON.type('Scroll'));
      let text = await (scrollBar2?.scrollSearch(ON.id('Text_UIRouterPushTwo')) as Promise<Component | null>);
      await driver.delayMs(waitUiReadyMs);
      let txt = await (text?.getText() as Promise<string>)
      expect(txt).assertEqual("UIRouterPushTwo params")
      done();
    });

  })
}
