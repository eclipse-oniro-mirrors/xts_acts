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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index";
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import RectValue from '../../../ets/MainAbility/common/Rect';
import { MessageManager, Callback, Message } from '../../../ets/MainAbility/common/MessageManager';
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
import { KeyCode } from '@ohos.multimodalInput.keyCode';
import { UtilsTest, startAbility } from '../Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function RichEditorShortCutKeys006() {
  describe('RichEditorShortCutKeys006', () => {
    beforeAll(() => {
      console.info("RichEditorShortCutKeys006 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      const defaultRouter = AppStorage.get<Router>("router") as Router
      console.info("RichEditorShortCutKeys006 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorShortCutKeys/RichEditorShortCutKeys006',
      }
      try {
        defaultRouter.clear();
        let pages: router.RouterState = defaultRouter.getState();
        console.info("get RichEditorShortCutKeys006 state pages: " + JSON.stringify(pages));
        if (!("RichEditorShortCutKeys006" == pages.name)) {
          console.info("get RichEditorShortCutKeys006 state pages.name: " + JSON.stringify(pages.name));
          defaultRouter.pushUrl(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorShortCutKeys006 success");
        }
      } catch (err) {
        console.error("push RichEditorShortCutKeys006 page error: " + err);
        expect().assertFail();
      }
    });


    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_static_0012
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_static_0012
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_static_0012
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_static_0012', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_static_0012 START');
        let driver = Driver.create();
        let get_content = await (driver.findComponent(ON.id('get_content')) as Promise<Component>);
        await get_content.click();
        await CommonFunc.sleep(500);
        let style = await (driver.findComponent(ON.id('style')) as Promise<Component>);
        let styleText = await style.getText();
        await CommonFunc.sleep(500);
        expect(styleText).assertContain('"fontWeight":11');
        let rich = await (driver.findComponent(ON.id('RichEditorShortCutKeys006')) as Promise<Component>);
        let pointCenter = await rich.getBoundsCenter();
        await driver.longClick(pointCenter.x, pointCenter.y);
        await CommonFunc.sleep(500);
        let selectAll = await (driver.findComponent(ON.text('全选')) as Promise<Component>);
        await selectAll.click();
        await CommonFunc.sleep(500);
        driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_B);
        await CommonFunc.sleep(2000);
        await get_content.click();
        await CommonFunc.sleep(500);
        styleText = await style.getText();
        await CommonFunc.sleep(500);
        expect(styleText).assertContain('"fontWeight":9');
        let select = await (driver.findComponent(ON.id('select')) as Promise<Component>);
        await select.click();
        await CommonFunc.sleep(500);
        driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_B);
        await CommonFunc.sleep(2000);
        await get_content.click();
        await CommonFunc.sleep(500);
        styleText = await style.getText();
        await CommonFunc.sleep(500);
        console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_static_0012 styleText', styleText);
        expect(styleText).assertContain('"value":"b"')
        expect(styleText).assertContain('"fontSize":35')
        expect(styleText).assertContain('"fontColor":"#FF000000"')
        expect(styleText).assertContain('"fontStyle":0')
        expect(styleText).assertContain('"type":0')
        expect(styleText).assertContain('"color":"#FF000000"')
        expect(styleText).assertContain('"style":0')
        expect(styleText).assertContain('"fontFamily":"HarmonyOS Sans"')
        expect(styleText).assertContain('"fontWeight":10')
        expect(styleText).assertContain('"lineHeight":0')
        expect(styleText).assertContain('"halfLeading":false')
        expect(styleText).assertContain('"strokeColor":"#FF000000"')
        expect(styleText).assertContain('"strokeWidth":0')
        expect(styleText).assertContain('"letterSpacing":0')
        expect(styleText).assertContain('"previewText":""')
        done();
      });

  })
}


