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
export default function RichEditorAttributeStrings007() {
  describe('RichEditorAttributeStrings007', () => {
    beforeAll(() => {
       console.info("RichEditorOnWillChange001 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      const defaultRouter = AppStorage.get<Router>("router") as Router
      console.info("RichEditorAttributeStrings007 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorAttributeStrings/RichEditorAttributeStrings007',
      }
      try {
        defaultRouter.clear();
        let pages:router.RouterState = defaultRouter.getState();
        console.info("get RichEditorAttributeStrings007 state pages: " + JSON.stringify(pages));
        if (!("RichEditorAttributeStrings007" == pages.name)) {
          console.info("get RichEditorAttributeStrings007 state pages.name: " + JSON.stringify(pages.name));
          defaultRouter.pushUrl(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorAttributeStrings007 success");
        }
      } catch (err) {
        console.error("push RichEditorAttributeStrings007 page error: " + err);
        expect().assertFail();
      }
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_static_0039
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_static_0039
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_static_0039
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_static_0039', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_static_0039 START');
      let driver = Driver.create();
      let rich = await (driver.findComponent(ON.id('RichEditorAttributeStrings007')) as Promise<Component>);
      let getBounds = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.x, getBounds.y );
      await CommonFunc.sleep(500);
      let toStyledString = await (driver.findComponent(ON.id('toStyledString')) as Promise<Component>);
      await toStyledString.click();
      await CommonFunc.sleep(500);
      let spans = await (driver.findComponent(ON.id('spans')) as Promise<Component>);
      let spansText = await spans.getText();
      await CommonFunc.sleep(500);
      let str = 'spans:012345678901234567890123456789012345678901234567890123456789012345678901234567890123' +
        '4567890123456789abcdefghigklmnopqrstuvwxyzabcdefghigklmnopqrstuvwxyzabcdefghigklmnopqrstuvwx' +
        'yzabcdefghigklmnopqrstuvwxyzabcdefghigklmnopqrstuvwxyzabcdefghigklmnopqrstuvwxyzabcdefghigklm' +
        'nopqrstuvwxyzabcdefghigklmnopqrstuvwxyz';
      expect(spansText).assertEqual(str);
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_static_0040
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_static_0040
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_static_0040
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_static_0040', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_static_0040 START');
      let driver = Driver.create();
      let addImage = await (driver.findComponent(ON.id('addImage')) as Promise<Component>);
      await addImage.click();
      await CommonFunc.sleep(500);
      let toStyledString = await (driver.findComponent(ON.id('toStyledString')) as Promise<Component>);
      await toStyledString.click();
      await CommonFunc.sleep(500);
      let spans = await (driver.findComponent(ON.id('spans')) as Promise<Component>);
      let spansText = await spans.getText();
      await CommonFunc.sleep(500);
      let str = 'spans:012345678901234567890123456789012345678901234567890123456789012345678901234567890123' +
        '4567890123456789abcdefghigklmnopqrstuvwxyzabcdefghigklmnopqrstuvwxyzabcdefghigklmnopqrstuvwx' +
        'yzabcdefghigklmnopqrstuvwxyzabcdefghigklmnopqrstuvwxyzabcdefghigklmnopqrstuvwxyzabcdefghigklm' +
        'nopqrstuvwxyzabcdefghigklmnopqrstuvwxyz    ';
      expect(spansText).assertEqual(str);
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_static_0041
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_static_0041
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_static_0041
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_static_0041', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_static_0041 START');
      let driver = Driver.create();
      let builder = await (driver.findComponent(ON.id('builder')) as Promise<Component>);
      await builder.click();
      await CommonFunc.sleep(500);
      let addSpans = await (driver.findComponent(ON.id('addSpans')) as Promise<Component>);
      await addSpans.click();
      await CommonFunc.sleep(500);
      let toStyledString = await (driver.findComponent(ON.id('toStyledString')) as Promise<Component>);
      await toStyledString.click();
      await CommonFunc.sleep(500);
      let spans = await (driver.findComponent(ON.id('spans')) as Promise<Component>);
      let spansText = await spans.getText();
      await CommonFunc.sleep(500);
      let str = 'spans:012345678901234567890123456789012345678901234567890123456789012345678901234567890123' +
        '4567890123456789abcdefghigklmnopqrstuvwxyzabcdefghigklmnopqrstuvwxyzabcdefghigklmnopqrstuvwx' +
        'yzabcdefghigklmnopqrstuvwxyzabcdefghigklmnopqrstuvwxyzabcdefghigklmnopqrstuvwxyzabcdefghigklm' +
        'nopqrstuvwxyzabcdefghigklmnopqrstuvwxyz          ';
      console.log('000000000:'+ spansText);
      console.log('000000000:'+ str);
      expect(spansText).assertEqual(str);
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_static_0043
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_static_0043
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_static_0043
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_static_0043', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_static_0043 START');
      let driver = Driver.create();
      let toStyledString1 = await (driver.findComponent(ON.id('toStyledString1')) as Promise<Component>);
      await toStyledString1.click();
      await CommonFunc.sleep(500);
      let spans = await (driver.findComponent(ON.id('spans')) as Promise<Component>);
      let spansText = await spans.getText();
      await CommonFunc.sleep(500);
      expect(spansText).assertEqual('spans:');
      let toStyledString2 = await (driver.findComponent(ON.id('toStyledString2')) as Promise<Component>);
      await toStyledString2.click();
      await CommonFunc.sleep(500);
      spansText = await spans.getText();
      await CommonFunc.sleep(500);
      expect(spansText).assertEqual('spans:1');
      done();
    });

  })
}


