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
export default function RichEditorSetStyledString004() {
  describe('RichEditorSetStyledString004', () => {
    beforeAll(() => {
      console.info("RichEditorSetStyledString004 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      const defaultRouter = AppStorage.get<Router>("router") as Router
      console.info("RichEditorSetStyledString004 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorSetStyledString/RichEditorSetStyledString004',
      }
      try {
        defaultRouter.clear();
        let pages:router.RouterState = defaultRouter.getState();
        console.info("get RichEditorSetStyledString004 state pages: " + JSON.stringify(pages));
        if (!("RichEditorSetStyledString004" == pages.name)) {
          console.info("get RichEditorSetStyledString004 state pages.name: " + JSON.stringify(pages.name));
          defaultRouter.pushUrl(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorSetStyledString004 success");
        }
      } catch (err) {
        console.error("push RichEditorSetStyledString004 page error: " + err);
        expect().assertFail();
      }
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0011
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0011
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0011
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0011', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0011 START');
      let driver = Driver.create();
      let rich = await (driver.findComponent(ON.id('RichEditorSetStyledString004')) as Promise<Component>);
      let getBounds = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);

      await driver.click(getBounds.x, getBounds.y);
      await CommonFunc.sleep(1000);

      let add_text = await (driver.findComponent(ON.id('add_text')) as Promise<Component>);
      await add_text.click();
      await CommonFunc.sleep(500);

      let image_top = await (driver.findComponent(ON.id('image_top')) as Promise<Component>);
      await image_top.click();
      await CommonFunc.sleep(500);
      let subString = await (driver.findComponent(ON.id('subString')) as Promise<Component>);
      await subString.click();
      await CommonFunc.sleep(500);
      let content = await (driver.findComponent(ON.id('content')) as Promise<Component>);
      let contentText = await content.getText();
      await CommonFunc.sleep(500);
      expect(contentText).assertContain('content:textstring');
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0012
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0012
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0012
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0012', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0012 START');
      let driver = Driver.create();
      let rich = await (driver.findComponent(ON.id('RichEditorSetStyledString004')) as Promise<Component>);
      let getBounds = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);

      await driver.click(getBounds.x, getBounds.y);
      await CommonFunc.sleep(1000);

      let get_length = await (driver.findComponent(ON.id('get_length')) as Promise<Component>);
      await get_length.click();
      await CommonFunc.sleep(500);
      let content = await (driver.findComponent(ON.id('content')) as Promise<Component>);
      let contentText = await content.getText();
      await CommonFunc.sleep(500);
      expect(contentText).assertContain('content:11');
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0051
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0051
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0051
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0051', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0051 START');
      let driver = Driver.create();
      let add_text = await (driver.findComponent(ON.id('add_text')) as Promise<Component>);
      await add_text.click();
      await CommonFunc.sleep(500);
      let get_length = await (driver.findComponent(ON.id('get_length')) as Promise<Component>);
      await get_length.click();
      await CommonFunc.sleep(500);
      let content = await (driver.findComponent(ON.id('content')) as Promise<Component>);
      let contentText = await content.getText();
      await CommonFunc.sleep(500);
      expect(contentText).assertContain('content:17');
      done();
    });

  })
}


