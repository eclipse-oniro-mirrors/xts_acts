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
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';


export default function GridDragEventUndefinedTest() {
  describe('GridDragEventUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("GridDragEventUndefinedTest beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.scroll.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("GridDragEventUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/gridDragEventUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get GridDragEventUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("gridDragEventUndefined" == pages.name)) {
          console.info("get GridDragEventUndefinedTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push GridDragEventUndefinedTest page error:" + err);
      }
      console.info("GridDragEventUndefinedTest beforeEach end");

    });
    afterEach(async () => {
    });


    /**
     * @tc.number   GridDragEventUndefinedTest_static_0001
     * @tc.name     GridDragEventUndefinedTest_static_0001
     * @tc.desc     test onItemDragStart
     * @tc.level    Level.LEVEL1
     */
    it('GridDragEventUndefinedTest_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[GridDragEventUndefinedTest_static_0001] START');
      let driver: Driver = Driver.create()
      let changeBtn = await driver.findComponent(ON.id('Grid_onItemDragStartValue'));
      await CommonFunc.sleep(500);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let gridItem = await driver.findComponent(ON.id('Grid_item1'));
      await CommonFunc.sleep(500);
      let gird = await driver.findComponent(ON.id('Grid_2')) as Component;
      await CommonFunc.sleep(500);
      await (gridItem?.dragTo(gird) as Promise<void>);
      await CommonFunc.sleep(500);
      let text = await driver.findComponent(ON.id('Grid_text'));
      await CommonFunc.sleep(500);
      expect(await (text?.getText() as Promise<String>)).assertEqual('onItemDragStart');

      await CommonFunc.sleep(500);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let resetTextBtn = await driver.findComponent(ON.id('Grid_resetText'));
      await CommonFunc.sleep(500);
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await (gridItem?.dragTo(gird) as Promise<void>);
      await CommonFunc.sleep(500);
      expect(await (text?.getText() as Promise<String>)).assertEqual('Hello World');
      console.info('[GridDragEventUndefinedTest_static_0001] END');
      done();
    });

    /**
     * @tc.number   GridDragEventUndefinedTest_static_0002
     * @tc.name     GridDragEventUndefinedTest_static_0002
     * @tc.desc     test _onItemDragEnter
     * @tc.level    Level.LEVEL1
     */
    it('GridDragEventUndefinedTest_static_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[GridDragEventUndefinedTest_static_0002] START');
      let driver: Driver = Driver.create()
      let changeBtn = await driver.findComponent(ON.id('Grid_onItemDragEnterValue'));
      await CommonFunc.sleep(500);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let gridItem = await driver.findComponent(ON.id('Grid_item2'));
      await CommonFunc.sleep(500);
      let gird = await driver.findComponent(ON.id('Grid_1')) as Component;
      await CommonFunc.sleep(500);
      await (gridItem?.dragTo(gird) as Promise<void>);
      await CommonFunc.sleep(500);
      let text = await driver.findComponent(ON.id('Grid_text'));
      await CommonFunc.sleep(500);
      expect(await (text?.getText() as Promise<String>)).assertEqual('onItemDragEnter');

      await CommonFunc.sleep(500);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let resetTextBtn = await driver.findComponent(ON.id('Grid_resetText'));
      await CommonFunc.sleep(500);
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await (gridItem?.dragTo(gird) as Promise<void>);
      await CommonFunc.sleep(500);
      expect(await (text?.getText() as Promise<String>)).assertEqual('Hello World');
      console.info('[GridDragEventUndefinedTest_static_0002] END');
      done();
    });

    /**
    * @tc.number   GridDragEventUndefinedTest_static_0003
    * @tc.name     GridDragEventUndefinedTest_static_0003
    * @tc.desc     test onItemDragLeave
    * @tc.level    Level.LEVEL1
    */
    it('GridDragEventUndefinedTest_static_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[GridDragEventUndefinedTest_static_0003] START');
      let driver: Driver = Driver.create()
      let changeBtn = await driver.findComponent(ON.id('Grid_onItemDragLeaveValue'));
      await CommonFunc.sleep(500);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let gridItem = await driver.findComponent(ON.id('Grid_item2'));
      await CommonFunc.sleep(500);
      let gird = await driver.findComponent(ON.id('Grid_1')) as Component;
      await CommonFunc.sleep(500);
      await (gridItem?.dragTo(gird) as Promise<void>);
      await CommonFunc.sleep(500);
      let text = await driver.findComponent(ON.id('Grid_text'));
      await CommonFunc.sleep(500);
      expect(await (text?.getText() as Promise<String>)).assertEqual('onItemDragLeave');

      await CommonFunc.sleep(500);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let resetTextBtn = await driver.findComponent(ON.id('Grid_resetText'));
      await CommonFunc.sleep(500);
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await (gridItem?.dragTo(gird) as Promise<void>);
      await CommonFunc.sleep(500);
      expect(await (text?.getText() as Promise<String>)).assertEqual('Hello World');
      console.info('[GridDragEventUndefinedTest_static_0003] END');
      done();
    });

    /**
    * @tc.number   GridDragEventUndefinedTest_static_0004
    * @tc.name     GridDragEventUndefinedTest_static_0004
    * @tc.desc     test onItemDragMove
    * @tc.level    Level.LEVEL1
    */
    it('GridDragEventUndefinedTest_static_0004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[GridDragEventUndefinedTest_static_0004] START');
      let driver: Driver = Driver.create()
      let changeBtn = await driver.findComponent(ON.id('Grid_onItemDragMoveValue'));
      await CommonFunc.sleep(500);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let gridItem = await driver.findComponent(ON.id('Grid_item2'));
      await CommonFunc.sleep(500);
      let gird = await driver.findComponent(ON.id('Grid_3')) as Component;
      await CommonFunc.sleep(500);
      await (gridItem?.dragTo(gird) as Promise<void>);
      await CommonFunc.sleep(500);
      let text = await driver.findComponent(ON.id('Grid_text'));
      await CommonFunc.sleep(500);
      expect(await (text?.getText() as Promise<String>)).assertEqual('onItemDragMove');

      await CommonFunc.sleep(500);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let resetTextBtn = await driver.findComponent(ON.id('Grid_resetText'));
      await CommonFunc.sleep(500);
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await (gridItem?.dragTo(gird) as Promise<void>);
      await CommonFunc.sleep(500);
      expect(await (text?.getText() as Promise<String>)).assertEqual('Hello World');
      console.info('[GridDragEventUndefinedTest_static_0004] END');
      done();
    });

    /**
    * @tc.number   GridDragEventUndefinedTest_static_0005
    * @tc.name     GridDragEventUndefinedTest_static_0005
    * @tc.desc     test onItemDrop
    * @tc.level    Level.LEVEL1
    */
    it('GridDragEventUndefinedTest_static_0005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[GridDragEventUndefinedTest_static_0005] START');
      let driver: Driver = Driver.create()
      let changeBtn = await driver.findComponent(ON.id('Grid_onItemDropValue'));
      await CommonFunc.sleep(500);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let gridItem = await driver.findComponent(ON.id('Grid_item2'));
      await CommonFunc.sleep(500);
      let gird = await driver.findComponent(ON.id('Grid_3')) as Component;
      await CommonFunc.sleep(500);
      await (gridItem?.dragTo(gird) as Promise<void>);
      await CommonFunc.sleep(500);
      let text = await driver.findComponent(ON.id('Grid_text'));
      await CommonFunc.sleep(500);
      expect(await (text?.getText() as Promise<String>)).assertEqual('onItemDrop');
      
      await CommonFunc.sleep(500);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let resetTextBtn = await driver.findComponent(ON.id('Grid_resetText'));
      await CommonFunc.sleep(500);
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await (gridItem?.dragTo(gird) as Promise<void>);
      await CommonFunc.sleep(500);
      expect(await (text?.getText() as Promise<String>)).assertEqual('Hello World');
      console.info('[GridDragEventUndefinedTest_static_0005] END');
      done();
    });
  })
}