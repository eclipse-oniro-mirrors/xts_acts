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
export default function RichEditorCustomSpan014() {
  describe('RichEditorCustomSpan014', () => {
    beforeAll(() => {
       console.info("RichEditorOnWillChange001 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      const defaultRouter = AppStorage.get<Router>("router") as Router
      console.info("RichEditorCustomSpan014 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorCustomSpan/RichEditorCustomSpan014',
      }
      try {
        defaultRouter.clear();
        let pages:router.RouterState = defaultRouter.getState();
        console.info("get RichEditorCustomSpan014 state pages: " + JSON.stringify(pages));
        if (!("RichEditorCustomSpan014" == pages.name)) {
          console.info("get RichEditorCustomSpan014 state pages.name: " + JSON.stringify(pages.name));
          defaultRouter.pushUrl(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorCustomSpan014 success");
        }
      } catch (err) {
        console.error("push RichEditorCustomSpan014 page error: " + err);
        expect().assertFail();
      }
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_static_0021
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_static_0021
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_static_0021
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_static_0021', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_static_0021 START');
      let driver = Driver.create();
      let rich = await (driver.findComponent(ON.id('RichEditorCustomSpan014')) as Promise<Component>);
      let getBounds = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.x, getBounds.y );
      await CommonFunc.sleep(500);
      let imageTop = await (driver.findComponent(ON.id('imageTop')) as Promise<Component>);
      await imageTop.click();
      await CommonFunc.sleep(500);
      let addCustom = await (driver.findComponent(ON.id('addCustom')) as Promise<Component>);
      await addCustom.click();
      await CommonFunc.sleep(500);
      let getStyles = await (driver.findComponent(ON.id('getStyles')) as Promise<Component>);
      await getStyles.click();
      await CommonFunc.sleep(500);
      let stylesInfo = await (driver.findComponent(ON.id('stylesInfo')) as Promise<Component>);
      let stylesInfoText = await stylesInfo.getText();
      await CommonFunc.sleep(500);
      let str = '{"start":5,"length":1,"styledKey":400,"styledValue":{"type_":"CustomSpan","width":80,"word":"Hello"}}';
      expect(stylesInfoText).assertContain(str);
      let replaceStyledString = await (driver.findComponent(ON.id('replaceStyledString')) as Promise<Component>);
      await replaceStyledString.click();
      await CommonFunc.sleep(500);
      await getStyles.click();
      await CommonFunc.sleep(500);
      stylesInfoText = await stylesInfo.getText();
      await CommonFunc.sleep(500);
      str = '{"start":5,"length":1,"styledKey":400,"styledValue":{"type_":"CustomSpan","width":60,"word":"word"}}';
      expect(stylesInfoText).assertContain(str);
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_static_0022
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_static_0022
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_static_0022
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_static_0022', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_static_0022 START');
      let driver = Driver.create();

      let getString = await (driver.findComponent(ON.id('getString')) as Promise<Component>);
      await getString.click();
      await CommonFunc.sleep(500);
      let styleString = await (driver.findComponent(ON.id('styleString')) as Promise<Component>);
      let styleStringText = await styleString.getText();
      await CommonFunc.sleep(500);
      expect(styleStringText).assertContain('styleString:1234  ');
      let replaceString = await (driver.findComponent(ON.id('replaceString')) as Promise<Component>);
      await replaceString.click();
      await CommonFunc.sleep(500);
      await getString.click();
      await CommonFunc.sleep(500);
      styleStringText = await styleString.getText();
      await CommonFunc.sleep(500);
      expect(styleStringText).assertContain('styleString:hello  ');
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_static_0023
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_static_0023
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_static_0023
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_static_0023', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_static_0023 START');
      let driver = Driver.create();
      let getStyles = await (driver.findComponent(ON.id('getStyles')) as Promise<Component>);
      await getStyles.click();
      await CommonFunc.sleep(500);
      let stylesInfo = await (driver.findComponent(ON.id('stylesInfo')) as Promise<Component>);
      let stylesInfoText = await stylesInfo.getText();
      await CommonFunc.sleep(500);
      let str = '{"start":6,"length":1,"styledKey":400,"styledValue":{"type_":"CustomSpan","width":60,"word":"word"}}';
      expect(stylesInfoText).assertContain(str);
      let replaceCustom = await (driver.findComponent(ON.id('replaceCustom')) as Promise<Component>);
      await replaceCustom.click();
      await CommonFunc.sleep(500);
      await getStyles.click();
      await CommonFunc.sleep(500);
      stylesInfoText = await stylesInfo.getText();
      await CommonFunc.sleep(500);
      str = '{"start":6,"length":1,"styledKey":400,"styledValue":{"type_":"CustomSpan","width":90,"word":"custom"}}';
      expect(stylesInfoText).assertContain(str);
      done();
    });

  })
}


