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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium';
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Callback, MessageManager } from '../../../ets/MainAbility/common/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import { startAbility, UtilsTest } from '../Util.test';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function bindMenuAnchorPosition() {
  describe('bindMenuAnchorPosition', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsDialog.api11.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("bindMenuAnchorPosition beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/menuControl/bindMenuAnchorPosition',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get bindMenuAnchorPosition state pages:" + JSON.stringify(pages));
        if (!("bindMenuAnchorPosition" == pages.name)) {
          console.info("get bindMenuAnchorPosition pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push bindMenuAnchorPosition page error:" + err);
      }
      console.info("bindMenuAnchorPosition beforeEach end");
    });

    
    
    /**
     * @tc.number   bindMenuAnchorPosition_static_0100
     * @tc.name     bindMenuAnchorPosition_static_0100
     * @tc.desc     bindMenuAnchorPosition_static_0100
     * @tc.level    Level.LEVEL0
     */
it('bindMenuAnchorPosition_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('bindMenuAnchorPosition_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('bindMenuAnchorPosition1'));
      button?.longClick();
      await CommonFunc.sleep(3000);

      driver.click(20, 20);
      await CommonFunc.sleep(2000);
      let text1 = await driver.findComponent(ON.id('menuPositionX'));
      let menuPositionX = Number.parseFloat(await (text1?.getText() as Promise<String>));

      let text2 = await driver.findComponent(ON.id('menuPositionY'));
      let menuPositionY = Number.parseFloat(await (text2?.getText() as Promise<String>));

      let text3 = await driver.findComponent(ON.id('textPositionX1'));
      let textPositionX = Number.parseFloat(await (text3?.getText() as Promise<String>));

      let text4 = await driver.findComponent(ON.id('textPositionY1'));
      let textPositionY = Number.parseFloat(await (text4?.getText() as Promise<String>));
      expect(textPositionX).assertLess(menuPositionX)
      expect(textPositionY).assertLess(menuPositionY)

      await CommonFunc.sleep(1000);
      await driver.click(200, 200);
      await CommonFunc.sleep(2000);
      console.info('[bindMenuAnchorPosition_static_0100] END');
      done();
    });

    
    
    /**
     * @tc.number   bindMenuAnchorPosition_static_0200
     * @tc.name     bindMenuAnchorPosition_static_0200
     * @tc.desc     bindMenuAnchorPosition_static_0200
     * @tc.level    Level.LEVEL0
     */
it('bindMenuAnchorPosition_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('bindMenuAnchorPosition_static_0200 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('bindMenuAnchorPosition2'));
      button?.longClick();
      await CommonFunc.sleep(3000);

      driver.click(20, 20);
      await CommonFunc.sleep(2000);

      let text1 = await driver.findComponent(ON.id('menuPositionX'));
      let menuPositionX = Number.parseFloat(await (text1?.getText() as Promise<String>));

      let text2 = await driver.findComponent(ON.id('menuPositionY'));
      let menuPositionY = Number.parseFloat(await (text2?.getText() as Promise<String>));

      let text3 = await driver.findComponent(ON.id('textPositionX2'));
      let textPositionX = Number.parseFloat(await (text3?.getText() as Promise<String>));

      let text4 = await driver.findComponent(ON.id('textPositionY2'));
      let textPositionY = Number.parseFloat(await (text4?.getText() as Promise<String>));
      expect(textPositionY).assertLess(menuPositionY)

      await CommonFunc.sleep(1000);
      await driver.click(200, 200);
      await CommonFunc.sleep(2000);
      console.info('[bindMenuAnchorPosition_static_0200] END');
      done();
    });

    
    
    /**
     * @tc.number   bindMenuAnchorPosition_static_0300
     * @tc.name     bindMenuAnchorPosition_static_0300
     * @tc.desc     bindMenuAnchorPosition_static_0300
     * @tc.level    Level.LEVEL0
     */
it('bindMenuAnchorPosition_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('bindMenuAnchorPosition_static_0300 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('bindMenuAnchorPosition3'));
      button?.longClick();
      await CommonFunc.sleep(3000);

      driver.click(20, 20);
      await CommonFunc.sleep(2000);
      let text1 = await driver.findComponent(ON.id('menuPositionX'));
      let menuPositionX = Number.parseFloat(await (text1?.getText() as Promise<String>));

      let text2 = await driver.findComponent(ON.id('menuPositionY'));
      let menuPositionY = Number.parseFloat(await (text2?.getText() as Promise<String>));

      let text3 = await driver.findComponent(ON.id('textPositionX3'));
      let textPositionX = Number.parseFloat(await (text3?.getText() as Promise<String>));

      let text4 = await driver.findComponent(ON.id('textPositionY3'));
      let textPositionY = Number.parseFloat(await (text4?.getText() as Promise<String>));
      expect(menuPositionX).assertLess(textPositionX)
      expect(textPositionY).assertLess(menuPositionY)

      await CommonFunc.sleep(1000);
      await driver.click(200, 200);
      await CommonFunc.sleep(2000);
      console.info('[bindMenuAnchorPosition_static_0300] END');
      done();
    });
  })
}

