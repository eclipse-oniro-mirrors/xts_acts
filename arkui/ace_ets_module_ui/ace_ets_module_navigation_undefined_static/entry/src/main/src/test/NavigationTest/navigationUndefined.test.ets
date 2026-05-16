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
import events_emitter from '@ohos.events.emitter';
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
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

export default function NavigationUndefinedTest() {
  describe('NavigationUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("NavigationUndefinedTest beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.navigation.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("NavigationUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/navigationUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get NavigationUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("navigationUndefined" == pages.name)) {
          console.info("get NavigationUndefinedTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(4000);
        }
      } catch (err) {
        console.error("push NavigationUndefinedTest page error:" + err);
      }
      console.info("NavigationUndefinedTest beforeEach end");

    });
    afterEach(async () => {
    });


    /**
     * @tc.number   NavigationUndefinedTest_static_0001
     * @tc.name     NavigationUndefinedTest_static_0001
     * @tc.desc     NavigationUndefinedTest_static_0001
     * @tc.level    Level.LEVEL1
     */
    it('NavigationUndefinedTest_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[NavigationUndefinedTest_static_0001] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyNavigation');
      await CommonFunc.sleep(1000);

      console.info("[NavigationUndefinedTest_static_0001] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[NavigationUndefinedTest_static_0001] navBarWidth: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('navBarWidth')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('navBarWidth')))
        .assertEqual('\"100.00vp\"');
      let changeBtn = await driver.findComponent(ON.id('Navigation_NavBarWidth'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[NavigationUndefinedTest_static_0001] click Navigation_NavBarWidth");
      strJson = inspector.getInspectorByKey('MyNavigation');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('navBarWidth')))
        .assertEqual('\"240.00vp\"');
      await CommonFunc.sleep(1000);
      console.info('[NavigationUndefinedTest_static_0001] END');
      done();
    });

    /**
     * @tc.number   NavigationUndefinedTest_static_0002
     * @tc.name     NavigationUndefinedTest_static_0002
     * @tc.desc     NavigationUndefinedTest_static_0002
     * @tc.level    Level.LEVEL1
     */
    it('NavigationUndefinedTest_static_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[NavigationUndefinedTest_static_0002] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyNavigation');
      await CommonFunc.sleep(1000);

      console.info("[NavigationUndefinedTest_static_0002] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[NavigationUndefinedTest_static_0002] navBarPosition: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('navBarPosition')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('navBarPosition')))
        .assertEqual('\"NavBarPosition.End\"');
      let changeBtn = await driver.findComponent(ON.id('Navigation_NavBarPosition'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[NavigationUndefinedTest_static_0002] click Navigation_NavBarPosition");
      strJson = inspector.getInspectorByKey('MyNavigation');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('navBarPosition')))
        .assertEqual('\"NavBarPosition.Start\"');
      await CommonFunc.sleep(1000);
      console.info('[NavigationUndefinedTest_static_0002] END');
      done();
    });

    /**
     * @tc.number   NavigationUndefinedTest_static_0003
     * @tc.name     NavigationUndefinedTest_static_0003
     * @tc.desc     NavigationUndefinedTest_static_0003
     * @tc.level    Level.LEVEL1
     */
    it('NavigationUndefinedTest_static_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[NavigationUndefinedTest_static_0003] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyNavigation');
      await CommonFunc.sleep(1000);
      let changeBtn1 = await driver.findComponent(ON.id('Navigation_HideTitleBar'));
      await (changeBtn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let changeBtn2 = await driver.findComponent(ON.id('Navigation_HideBackButton'));
      await (changeBtn2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      console.info("[NavigationUndefinedTest_static_0003] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[NavigationUndefinedTest_static_0003] backButtonIcon: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('backButtonIcon')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('backButtonIcon')))
        .assertEqual('\"resource:///16777255.png\"');
      let changeBtn = await driver.findComponent(ON.id('Navigation_BackButtonIcon'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[NavigationUndefinedTest_static_0003] click Navigation_BackButtonIcon");
      strJson = inspector.getInspectorByKey('MyNavigation');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('backButtonIcon')))
        .assertEqual('\"\"');
      await (changeBtn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (changeBtn2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[NavigationUndefinedTest_static_0003] END');
      done();
    });

    /**
     * @tc.number   NavigationUndefinedTest_static_0004
     * @tc.name     NavigationUndefinedTest_static_0004
     * @tc.desc     NavigationUndefinedTest_static_0004
     * @tc.level    Level.LEVEL1
     */
    it('NavigationUndefinedTest_static_0004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[NavigationUndefinedTest_static_0004] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyNavigation');
      await CommonFunc.sleep(1000);
      let changeBtn1 = await driver.findComponent(ON.id('Navigation_HideTitleBar'));
      await (changeBtn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[NavigationUndefinedTest_static_0004] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[NavigationUndefinedTest_static_0004] menus: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('menus')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('menus')))
        .assertEqual('\"{\\"items\\":[]}\"');
      let changeBtn = await driver.findComponent(ON.id('Navigation_Menus'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[NavigationUndefinedTest_static_0004] click Navigation_Menus");
      strJson = inspector.getInspectorByKey('MyNavigation');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('menus')))
        .assertEqual('\"\"');
      await (changeBtn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[NavigationUndefinedTest_static_0004] END');
      done();
    });

    /**
     * @tc.number   NavigationUndefinedTest_static_0005
     * @tc.name     NavigationUndefinedTest_static_0005
     * @tc.desc     NavigationUndefinedTest_static_0005
     * @tc.level    Level.LEVEL1
     */
    it('NavigationUndefinedTest_static_0005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[NavigationUndefinedTest_static_0005] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('NavBarStateButton');
      let res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('label');
      console.info("[NavigationUndefinedTest_static_0005] label : " + res);
      expect(res).assertEqual('NavBarState:true');
      let changeBtn1 = await driver.findComponent(ON.id('hideNavBar'));
      await (changeBtn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('NavBarStateButton');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('label');
      console.info("[NavigationUndefinedTest_static_0005] label : " + res);
      expect(res).assertEqual('NavBarState:false');

      let changeBtn2 = await driver.findComponent(ON.id('Navigation_OnNavBarStateChange'));
      await (changeBtn2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (changeBtn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('NavBarStateButton');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('label');
      console.info("[NavigationUndefinedTest_static_0005] label : " + res);
      expect(res).assertEqual('NavBarState:false');
      await (changeBtn2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[NavigationUndefinedTest_static_0005] END');
      done();
    });

    /**
     * @tc.number   NavigationUndefinedTest_static_0006
     * @tc.name     NavigationUndefinedTest_static_0006
     * @tc.desc     NavigationUndefinedTest_static_0006
     * @tc.level    Level.LEVEL1
     */
    it('NavigationUndefinedTest_static_0006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[NavigationUndefinedTest_static_0006] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyNavigation');
      await CommonFunc.sleep(1000);

      console.info("[NavigationUndefinedTest_static_0006] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[NavigationUndefinedTest_static_0006] hideTitleBar: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('hideTitleBar')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('hideTitleBar')))
        .assertEqual('true');
      let changeBtn = await driver.findComponent(ON.id('Navigation_HideTitleBar'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[NavigationUndefinedTest_static_0006] click Navigation_HideTitleBar");
      strJson = inspector.getInspectorByKey('MyNavigation');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('hideTitleBar')))
        .assertEqual('false');
      await CommonFunc.sleep(1000);
      console.info('[NavigationUndefinedTest_static_0006] END');
      done();
    });

    /**
     * @tc.number   NavigationUndefinedTest_static_0007
     * @tc.name     NavigationUndefinedTest_static_0007
     * @tc.desc     NavigationUndefinedTest_static_0007
     * @tc.level    Level.LEVEL1
     */
    it('NavigationUndefinedTest_static_0007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[NavigationUndefinedTest_static_0007] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyNavigation');
      await CommonFunc.sleep(1000);

      console.info("[NavigationUndefinedTest_static_0007] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      let changeBtn1 = await driver.findComponent(ON.id('Navigation_HideTitleBar'));
      await (changeBtn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[NavigationUndefinedTest_static_0007] click Navigation_HideTitleBar");
      console.info("[NavigationUndefinedTest_static_0007] hideBackButton: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('hideBackButton')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('hideBackButton')))
        .assertEqual('true');
      let changeBtn = await driver.findComponent(ON.id('Navigation_HideBackButton'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[NavigationUndefinedTest_static_0007] click Navigation_HideBackButton");
      strJson = inspector.getInspectorByKey('MyNavigation');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('hideBackButton')))
        .assertEqual('false');
      await (changeBtn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[NavigationUndefinedTest_static_0007] END');
      done();
    });

    /**
     * @tc.number   NavigationUndefinedTest_static_0008
     * @tc.name     NavigationUndefinedTest_static_0008
     * @tc.desc     NavigationUndefinedTest_static_0008
     * @tc.level    Level.LEVEL1
     */
    it('NavigationUndefinedTest_static_0008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[NavigationUndefinedTest_static_0008] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyNavigation');
      await CommonFunc.sleep(1000);

      console.info("[NavigationUndefinedTest_static_0008] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      let changeBtn1 = await driver.findComponent(ON.id('Navigation_HideTitleBar'));
      await (changeBtn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[NavigationUndefinedTest_static_0008] click Navigation_HideTitleBar");
      console.info("[NavigationUndefinedTest_static_0008] title: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('title')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('title')))
        .assertEqual('\"This is a title\"');
      let changeBtn = await driver.findComponent(ON.id('Navigation_Title'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[NavigationUndefinedTest_static_0008] click Navigation_Title");
      strJson = inspector.getInspectorByKey('MyNavigation');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('title')))
        .assertEqual('\"\"');
      await (changeBtn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[NavigationUndefinedTest_static_0008] END');
      done();
    });

    /**
     * @tc.number   NavigationUndefinedTest_static_0009
     * @tc.name     NavigationUndefinedTest_static_0009
     * @tc.desc     NavigationUndefinedTest_static_0009
     * @tc.level    Level.LEVEL1
     */
    it('NavigationUndefinedTest_static_0009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[NavigationUndefinedTest_static_0009] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let changeBtn1 = await driver.findComponent(ON.id('hideNavBar'));
      await (changeBtn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyNavigation');
      await CommonFunc.sleep(1000);
      console.info("[NavigationUndefinedTest_static_0009] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[NavigationUndefinedTest_static_0009] hideNavBar: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('hideNavBar')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('hideNavBar')))
        .assertEqual('true');
      let changeBtn = await driver.findComponent(ON.id('Navigation_HideNavBar'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[NavigationUndefinedTest_static_0009] click Navigation_HideNavBar");
      strJson = inspector.getInspectorByKey('MyNavigation');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('hideNavBar')))
        .assertEqual('false');
      await CommonFunc.sleep(1000);
      console.info('[NavigationUndefinedTest_static_0009] END');
      done();
    });

    /**
     * @tc.number   NavigationUndefinedTest_static_0010
     * @tc.name     NavigationUndefinedTest_static_0010
     * @tc.desc     test minContentWidth
     * @tc.level    Level.LEVEL1
     */
    it('NavigationUndefinedTest_static_0010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[NavigationUndefinedTest_static_0010] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);

      // 初始状态：isMinContentWidth=false，minContentWidth=150
      let strJson = inspector.getInspectorByKey('MyNavigation');
      await CommonFunc.sleep(1000);

      console.info("[NavigationUndefinedTest_static_0010] Initial minContentWidth: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('minContentWidth')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('minContentWidth')))
        .assertEqual('\"150.00vp\"');

      // 第一次点击：isMinContentWidth 从 false 变为 true，minContentWidth 变为 undefined (默认值 360)
      let changeBtn = await driver.findComponent(ON.id('Navigation_MinContentWidth'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[NavigationUndefinedTest_static_0010] click Navigation_MinContentWidth");
      strJson = inspector.getInspectorByKey('MyNavigation');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('minContentWidth')))
        .assertEqual('\"360.00vp\"');

      // 第二次点击：isMinContentWidth 从 true 变回 false，minContentWidth 变回 150
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('MyNavigation');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('minContentWidth')))
        .assertEqual('\"150.00vp\"');

      await CommonFunc.sleep(1000);
      console.info('[NavigationUndefinedTest_static_0010] END');
      done();
    });

    /**
     * @tc.number   NavigationUndefinedTest_static_0011
     * @tc.name     NavigationUndefinedTest_static_0011
     * @tc.desc     test navBarWidthRange
     * @tc.level    Level.LEVEL1
     */
    it('NavigationUndefinedTest_static_0011', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[NavigationUndefinedTest_static_0011] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);

      // 初始状态：isNavBarWidthRange=false，navBarWidthRange=["10vp", "500vp"]
      let strJson = inspector.getInspectorByKey('MyNavigation');
      await CommonFunc.sleep(1000);

      console.info("[NavigationUndefinedTest_static_0011] Initial navBarWidthRange: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('navBarWidthRange')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('navBarWidthRange')))
        .assertEqual('\"10.00vp, 500.00vp\"');

      // 第一次点击：isNavBarWidthRange 从 false 变为 true，navBarWidthRange 变为 undefined (默认值 [240, 432])
      let changeBtn = await driver.findComponent(ON.id('Navigation_NavBarWidthRange'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[NavigationUndefinedTest_static_0011] click Navigation_NavBarWidthRange");
      strJson = inspector.getInspectorByKey('MyNavigation');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('navBarWidthRange')))
        .assertEqual('\"240.00vp, 432.00vp\"');

      // 第二次点击：isNavBarWidthRange 从 true 变回 false，navBarWidthRange 变回 ["10vp", "500vp"]
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('MyNavigation');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('navBarWidthRange')))
        .assertEqual('\"10.00vp, 500.00vp\"');

      await CommonFunc.sleep(1000);
      console.info('[NavigationUndefinedTest_static_0011] END');
      done();
    });

  })
}
