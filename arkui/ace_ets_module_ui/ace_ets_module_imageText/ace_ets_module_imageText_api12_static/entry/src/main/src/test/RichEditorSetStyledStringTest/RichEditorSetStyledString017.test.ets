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
export default function RichEditorSetStyledString017() {
  describe('RichEditorSetStyledString017', () => {
    beforeAll(() => {
      console.info("RichEditorSetStyledString017 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      const defaultRouter = AppStorage.get<Router>("router") as Router
      console.info("RichEditorSetStyledString017 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorSetStyledString/RichEditorSetStyledString017',
      }
      try {
        defaultRouter.clear();
        let pages:router.RouterState = defaultRouter.getState();
        console.info("get RichEditorSetStyledString017 state pages: " + JSON.stringify(pages));
        if (!("RichEditorSetStyledString017" == pages.name)) {
          console.info("get RichEditorSetStyledString017 state pages.name: " + JSON.stringify(pages.name));
          defaultRouter.pushUrl(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorSetStyledString017 success");
        }
      } catch (err) {
        console.error("push RichEditorSetStyledString017 page error: " + err);
        expect().assertFail();
      }
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0052
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0052
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0052
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0052', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0052 START');
      let driver = Driver.create();
      let rich = await (driver.findComponent(ON.id('RichEditorSetStyledString017')) as Promise<Component>);
      let getBounds = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.x, getBounds.y);
      await CommonFunc.sleep(1000);
      let get_fontColor = await (driver.findComponent(ON.id('get_fontColor')) as Promise<Component>);
      await get_fontColor.click();
      await CommonFunc.sleep(500);
      let colorStr = await (driver.findComponent(ON.id('colorStr')) as Promise<Component>);
      let colorStrText = await colorStr.getText();
      await CommonFunc.sleep(500);
      expect(colorStrText).assertContain('colorStr:#FFFFA500,#FF0000FF,#FFFF00FF,#FFFF0000,');
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0053
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0053
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0053
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0053', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0053 START');
      let driver = Driver.create();
      let sizeStr = await (driver.findComponent(ON.id('sizeStr')) as Promise<Component>);
      let sizeStrText = await sizeStr.getText();
      await CommonFunc.sleep(500);
      expect(sizeStrText).assertContain('sizeStr:10,20,30,40,');
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0054
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0054
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0054
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0054', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0054 START');
      let driver = Driver.create();
      let styleStr = await (driver.findComponent(ON.id('styleStr')) as Promise<Component>);
      let styleStrText = await styleStr.getText();
      await CommonFunc.sleep(500);
      expect(styleStrText).assertContain('styleStr:1,0,undefined,undefined,');
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0055
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0055
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0055
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0055', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0055 START');
      let driver = Driver.create();
      let weightStr = await (driver.findComponent(ON.id('weightStr')) as Promise<Component>);
      let weightStrText = await weightStr.getText();
      await CommonFunc.sleep(500);
      expect(weightStrText).assertContain('weightStr:11,9,13,10,');
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0056
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0056
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0056
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0056', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0056 START');
      let driver = Driver.create();
      let familyStr = await (driver.findComponent(ON.id('familyStr')) as Promise<Component>);
      let familyStrText = await familyStr.getText();
      await CommonFunc.sleep(500);
      let str = 'familyStr:' + CommonFunc.FONT_FAMILY + ',Arial,Arial,Arial,';
      expect(familyStrText).assertContain(str);
      done();
    });
  })
}


