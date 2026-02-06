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


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from "../../../../hypium/index";
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import RectValue from '../../../ets/MainAbility/common/Rect';
import {MessageManager,Callback,Message} from '../../../ets/MainAbility/common/MessageManager';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UIContext } from '@ohos.arkui.UIContext'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import text from "@ohos.graphics.text";
import {KeyCode} from '@ohos.multimodalInput.keyCode';
import {UtilsTest,startAbility} from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function RichEditorThreeStrikes003() {
  describe('RichEditorThreeStrikes003', () => {
    beforeAll(() => {
      console.info("RichEditorThreeStrikes003 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      const defaultRouter = AppStorage.get<Router>("router") as Router
      console.info("RichEditor beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorThreeStrikes/RichEditorThreeStrikes003',
      }
      try {
        defaultRouter.clear();
        let pages:router.RouterState = defaultRouter.getState();
        console.info("get RichEditorThreeStrikes003 state pages: " + JSON.stringify(pages));
        if (!("RichEditorThreeStrikes003" == pages.name)) {
          console.info("get RichEditorThreeStrikes003 state pages.name: " + JSON.stringify(pages.name));
          defaultRouter.pushUrl(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorThreeStrikes003 success");
        }
      } catch (err) {
        console.error("push RichEditorThreeStrikes003 page error: " + err);
        expect().assertFail();
      }
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_THREESTRIKES_static_0008
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_THREESTRIKES_static_0008
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_THREESTRIKES_static_0008
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_THREESTRIKES_static_0008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_THREESTRIKES_static_0008 START');
      let driver = Driver.create();
      let rich = await (driver.findComponent(ON.id('RichEditorThreeStrikes003')) as Promise<Component>);
      let getBounds = await rich.getBounds();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.left + 50, getBounds.top + 30);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 50, getBounds.top + 30);
      await CommonFunc.sleep(500);
      await driver.click(getBounds.left + 55, getBounds.top + 30);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 55, getBounds.top + 30);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 55, getBounds.top + 30);
      await CommonFunc.sleep(500);
      let message = await (driver.findComponent(ON.id('message')) as Promise<Component>);
      let messageText = await message.getText();
      await CommonFunc.sleep(500);
      expect(messageText).assertContain('"start"');
      expect(messageText).assertContain('"end"');
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_THREESTRIKES_static_0009
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_THREESTRIKES_static_0009
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_THREESTRIKES_static_0009
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_THREESTRIKES_static_0009', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_THREESTRIKES_static_0009 START');
      let driver = Driver.create();
      let rich = await (driver.findComponent(ON.id('RichEditorThreeStrikes003')) as Promise<Component>);
      let getBounds = await rich.getBounds();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.left + 50, getBounds.top + 30);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 50, getBounds.top + 30);
      await CommonFunc.sleep(500);
      await driver.click(getBounds.left + 100, getBounds.top + 30);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 100, getBounds.top + 30);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 100, getBounds.top + 30);
      await CommonFunc.sleep(500);
      let message = await (driver.findComponent(ON.id('message')) as Promise<Component>);
      let messageText = await message.getText();
      await CommonFunc.sleep(500);
      expect(messageText).assertContain('"start"');
      expect(messageText).assertContain('"end"');
      done();
    });

  })
}


