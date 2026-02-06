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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  Point,
  PointerMatrix,
  Rect,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Callback, MessageManager } from '../../../ets/MainAbility/utils/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import display from '@ohos.display'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import { UtilsTest } from '../Util.test'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function customDialogHoverMode() {
  describe('customDialogHoverMode', () => {
    beforeAll(() => {
      console.info("customDialogHoverMode beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsDialog.api14.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("customDialogHoverMode beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CustomDialog/customDialogHoverMode',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get customDialogHoverMode state pages:" + JSON.stringify(pages));
        if (!("customDialogHoverMode" == pages.name)) {
          console.info("get customDialogHoverMode pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push customDialogHoverMode page error:" + err);
      }
      console.info("customDialogHoverMode beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("MultiNavigation after each called");
    });
    
    
    
/**
     * @tc.number   customDialogHoverMode_static_0100
     * @tc.name     customDialogHoverMode_static_0100
     * @tc.desc     customDialogHoverMode_static_0100
     * @tc.level    Level.LEVEL0
     */
it('customDialogHoverMode_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('customDialogHoverMode_0100 START');
      if (display.isFoldable() && display.getFoldStatus() == 3) {
        let driver = Driver.create()
        await CommonFunc.sleep(1000);
        let col = await driver.findComponent(ON.id('col'))
        let height = await (col?.getBoundsCenter() as Promise<Point>)
        console.info('col is' + height.y)
        let btn1 = await driver.findComponent(ON.id('btn1'));
        await (btn1?.click() as Promise<void>)
        await CommonFunc.sleep(1000);
        let btn2 = await driver.findComponent(ON.id('customDialog'));
        await (btn2?.click() as Promise<void>)
        await CommonFunc.sleep(1000);
        let btn4 = await driver.findComponent(ON.id('confirm'))
        let rect = await (btn4?.getBounds() as Promise<Rect>)
        console.info(`rect is: ` + JSON.stringify(rect))
        expect(rect.top - height.y < 0).assertTrue();
        await CommonFunc.sleep(1000);
        await (btn4?.click() as Promise<void>)
        await CommonFunc.sleep(1000);
      }
      console.info('[customDialogHoverMode_0100] END');
      done();
    });
    
    
    
/**
     * @tc.number   customDialogHoverMode_static_0200
     * @tc.name     customDialogHoverMode_static_0200
     * @tc.desc     customDialogHoverMode_static_0200
     * @tc.level    Level.LEVEL0
     */
it('customDialogHoverMode_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('customDialogHoverMode_0200 START');
      if (display.isFoldable() && display.getFoldStatus() == 3) {
        let driver = Driver.create()
        await CommonFunc.sleep(1000);
        let col = await driver.findComponent(ON.id('col'))
        let height = await (col?.getBoundsCenter() as Promise<Point>)
        console.info('col is' + height.y)
        let btn1 = await driver.findComponent(ON.id('btn1'));
        await (btn1?.click() as Promise<void>)
        await CommonFunc.sleep(1000);
        let btn2 = await driver.findComponent(ON.id('btn2'));
        await (btn2?.click() as Promise<void>)
        await CommonFunc.sleep(1000);
        let btn3 = await driver.findComponent(ON.id('customDialog'))
        await (btn3?.click() as Promise<void>)
        await CommonFunc.sleep(1000);
        let btn4 = await driver.findComponent(ON.id('confirm'))
        let rect = await (btn4?.getBounds() as Promise<Rect>)
        console.info(`rect is: ` + JSON.stringify(rect))
        expect(rect.top - height.y > 0).assertTrue();
        await CommonFunc.sleep(1000);
        await (btn4?.click() as Promise<void>)
        await CommonFunc.sleep(1000);
      }
      console.info('[customDialogHoverMode_0200] END');
      done();
    });
  })
}