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
export default function RichEditorSetStyledString015() {
  describe('RichEditorSetStyledString015', () => {
    beforeAll(() => {
      console.info("RichEditorSetStyledString015 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      const defaultRouter = AppStorage.get<Router>("router") as Router
      console.info("RichEditorSetStyledString015 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorSetStyledString/RichEditorSetStyledString015',
      }
      try {
        defaultRouter.clear();
        let pages:router.RouterState = defaultRouter.getState();
        console.info("get RichEditorSetStyledString015 state pages: " + JSON.stringify(pages));
        if (!("RichEditorSetStyledString015" == pages.name)) {
          console.info("get RichEditorSetStyledString015 state pages.name: " + JSON.stringify(pages.name));
          defaultRouter.pushUrl(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorSetStyledString015 success");
        }
      } catch (err) {
        console.error("push RichEditorSetStyledString015 page error: " + err);
        expect().assertFail();
      }
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0043
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0043
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0043
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0043', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0043 START');
      let driver = Driver.create();
      let rich = await (driver.findComponent(ON.id('RichEditorSetStyledString015')) as Promise<Component>);
      let getBounds = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.x, getBounds.y);
      await CommonFunc.sleep(500);
      let image_top = await (driver.findComponent(ON.id('image_top')) as Promise<Component>);
      await image_top.click();
      await CommonFunc.sleep(500);
      let get_care = await (driver.findComponent(ON.id('get_care')) as Promise<Component>);
      await get_care.click();
      await CommonFunc.sleep(500);
      let careNum = await (driver.findComponent(ON.id('careNum')) as Promise<Component>);
      let careNumText = await careNum.getText();
      await CommonFunc.sleep(500);
      expect(careNumText).assertContain('careNum:5');
      let set_care = await (driver.findComponent(ON.id('set_care')) as Promise<Component>);
      await set_care.click();
      await CommonFunc.sleep(500);
      await get_care.click();
      await CommonFunc.sleep(500);
      careNumText = await careNum.getText();
      await CommonFunc.sleep(500);
      expect(careNumText).assertContain('careNum:2');
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0045
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0045
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0045
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0045', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0045 START');
      let driver = Driver.create();
      let setTypingStyle = await (driver.findComponent(ON.id('setTypingStyle')) as Promise<Component>);
      await setTypingStyle.click();
      await CommonFunc.sleep(500);
      driver.triggerKey(KeyCode.KEYCODE_A);
      await CommonFunc.sleep(500);
      let getTypingStyle = await (driver.findComponent(ON.id('getTypingStyle')) as Promise<Component>);
      await getTypingStyle.click();
      await CommonFunc.sleep(500);
      let textStyle = await (driver.findComponent(ON.id('textStyle')) as Promise<Component>);
      let textStyleText = await textStyle.getText();
      await CommonFunc.sleep(500);
      expect(textStyleText).assertContain('"fontColor":"#FF0000FF"');
      expect(textStyleText).assertContain('"fontFamily":"MiSans-Bold"');
      expect(textStyleText).assertContain('"fontSize":"50.00vp"');
      expect(textStyleText).assertContain('"fontStyle":1');
      expect(textStyleText).assertContain('"fontWeight":13');
      expect(textStyleText).assertContain('"decoration":{"type":1,"color":"#FF008000"}');
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0044
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0044
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0044
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0044', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0044 START');
      let driver = Driver.create();
      driver.triggerKey(KeyCode.KEYCODE_C);
      await CommonFunc.sleep(500);
      driver.triggerKey(KeyCode.KEYCODE_D);
      await CommonFunc.sleep(500);
      let getTypingStyle = await (driver.findComponent(ON.id('getTypingStyle')) as Promise<Component>);
      await getTypingStyle.click();
      await CommonFunc.sleep(500);
      let textStyle = await (driver.findComponent(ON.id('textStyle')) as Promise<Component>);
      let textStyleText = await textStyle.getText();
      await CommonFunc.sleep(500);
      expect(textStyleText).assertContain('"fontColor":"#FF0000FF"');
      expect(textStyleText).assertContain('"fontFamily":"MiSans-Bold"');
      expect(textStyleText).assertContain('"fontSize":"50.00vp"');
      expect(textStyleText).assertContain('"fontStyle":1');
      expect(textStyleText).assertContain('"fontWeight":13');
      expect(textStyleText).assertContain('"decoration":{"type":1,"color":"#FF008000"}');
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0046
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0046
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0046
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0046', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0046 START');
      let driver = Driver.create();
      let rich = await (driver.findComponent(ON.id('RichEditorSetStyledString015')) as Promise<Component>);
      let getBounds = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.longClick(getBounds.x, getBounds.y);
      await CommonFunc.sleep(500);
      let close_menu = await (driver.findComponent(ON.id('close_menu')) as Promise<Component>);
      await close_menu.click();
      await CommonFunc.sleep(500);
      let selectAll = await driver.findComponent(ON.text('全选'));
      if(selectAll == null){
        expect(selectAll).assertNull();
      }
      await CommonFunc.sleep(500);

      done();
    });
  })
}


