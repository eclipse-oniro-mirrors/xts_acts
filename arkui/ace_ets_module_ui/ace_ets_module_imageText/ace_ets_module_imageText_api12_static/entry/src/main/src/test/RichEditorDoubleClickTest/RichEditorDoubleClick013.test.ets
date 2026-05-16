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
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import { UIContext } from '@ohos.arkui.UIContext'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import text from "@ohos.graphics.text";
import {KeyCode} from '@ohos.multimodalInput.keyCode';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function RichEditorDoubleClick013() {
  describe('RichEditorDoubleClick013', () => {
    beforeAll(() => {
       console.info("RichEditorOnWillChange001 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      const defaultRouter = AppStorage.get<Router>("router") as Router
      console.info("RichEditor beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorDoubleClick/RichEditorDoubleClick013',
      }
      try {
        defaultRouter.clear();
        let pages:router.RouterState = defaultRouter.getState();
        console.info("get RichEditorDoubleClick013 state pages: " + JSON.stringify(pages));
        if (!("RichEditorDoubleClick013" == pages.name)) {
          console.info("get RichEditorDoubleClick013 state pages.name: " + JSON.stringify(pages.name));
          defaultRouter.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorDoubleClick013 success");
        }
      } catch (err) {
        console.error("push RichEditorDoubleClick013 page error: " + err);
        expect().assertFail();
      }
    });
    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_doubleclick_static_018
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_doubleclick_static_018
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_doubleclick_static_018
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_doubleclick_static_018', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_doubleclick_static_018 START');
      let driver = Driver.create();
      let rich = await (driver.findComponent(ON.id('RichEditorDoubleClick013')) as Promise<Component>);
      let getBounds = await rich.getBounds();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.left + 50, getBounds.top + 20);
      await CommonFunc.sleep(500);
      await driver.click(getBounds.left + 110, getBounds.top + 20);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 110, getBounds.top + 20);
      await CommonFunc.sleep(100);
      let message = await (driver.findComponent(ON.id('message')) as Promise<Component>);
      let messageText = await message.getText();
      await CommonFunc.sleep(500);
      expect(messageText).assertContain('"start"');
      expect(messageText).assertContain('"end"');
      let addTextSpan = await (driver.findComponent(ON.id('addTextSpan')) as Promise<Component>);
      await addTextSpan.click();
      await CommonFunc.sleep(500);
      messageText = await message.getText();
      await CommonFunc.sleep(500);
      expect(messageText).assertContain('"start"');
      expect(messageText).assertContain('"end"');
      await driver.click(getBounds.left + 110, getBounds.top + 20);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 110, getBounds.top + 20);
      await CommonFunc.sleep(100);
      messageText = await message.getText();
      await CommonFunc.sleep(500);
      expect(messageText).assertContain('"start"');
      expect(messageText).assertContain('"end"');
      let setTypingStyle = await (driver.findComponent(ON.id('setTypingStyle')) as Promise<Component>);
      await setTypingStyle.click();
      await CommonFunc.sleep(500);
      messageText = await message.getText();
      await CommonFunc.sleep(500);
      expect(messageText).assertContain('"start"');
      expect(messageText).assertContain('"end"');
      let deleteSpans = await (driver.findComponent(ON.id('deleteSpans')) as Promise<Component>);
      await deleteSpans.click();
      await CommonFunc.sleep(500);
      messageText = await message.getText();
      await CommonFunc.sleep(500);
      expect(messageText).assertContain('"start"');
      expect(messageText).assertContain('"end"');
      done();
    });

  })
}


