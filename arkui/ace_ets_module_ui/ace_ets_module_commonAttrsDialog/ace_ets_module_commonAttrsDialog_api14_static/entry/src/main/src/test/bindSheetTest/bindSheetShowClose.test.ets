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

export default function bindSheetShowClose() {
  describe('bindSheetShowClose', () => {
    beforeAll(() => {
      console.info("bindSheetShowClose beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsDialog.api14.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("bindSheetShowClose beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/bindSheetTest/bindSheetShowClose',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get bindSheetShowClose state pages:" + JSON.stringify(pages));
        if (!("bindSheetShowClose" == pages.name)) {
          console.info("get bindSheetShowClose pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push bindSheetShowClose page error:" + err);
      }
      console.info("bindSheetShowClose beforeEach end");
    });


    
    
    
/**
     * @tc.number   bindSheetShowClose_static_0100
     * @tc.name     bindSheetShowClose_static_0100
     * @tc.desc     bindSheetShowClose_static_0100
     * @tc.level    Level.LEVEL0
     */
it('bindSheetShowClose_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('bindSheetShowClose_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btn'));
      await (button?.click() as Promise<void>)
      console.info('[bindSheetShowClose_0100] click btn');
      await CommonFunc.sleep(1000);
      let title = await driver.findComponent(ON.id('row'));
      await CommonFunc.sleep(1000);
      let rect = await (title!.getBounds() as Promise<Rect>);
      console.info(`rect is: ` + JSON.stringify(rect))
      let titleWidth = rect.right - rect.left
      console.info('[bindSheetShowClose_0100] titleWidth' + titleWidth);
      let button1 = await driver.findComponent(ON.id('showClose'));
      await (button1?.click() as Promise<void>)
      console.info('[bindSheetShowClose_0100] showClose');
      await CommonFunc.sleep(1000);
      let title2 = await driver.findComponent(ON.id('row'));
      let rect2 = await (title2?.getBounds() as Promise<Rect>);
      console.info(`rect2 is: ` + JSON.stringify(rect2))
      let titleWidth2 = rect2.right - rect2.left
      console.info('[bindSheetShowClose_0100] titleWidth2 ' + titleWidth2);
      expect(titleWidth2 - titleWidth > 0).assertTrue()
      let button2 = await driver.findComponent(ON.id('close'));
      await (button2?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      console.info('[bindSheetShowClose_0100] END');
      done();
    });
  })
}

