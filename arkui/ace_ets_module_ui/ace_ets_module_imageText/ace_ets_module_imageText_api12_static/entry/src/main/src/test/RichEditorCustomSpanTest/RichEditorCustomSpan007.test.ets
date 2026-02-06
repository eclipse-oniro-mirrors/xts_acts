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
export default function RichEditorCustomSpan007() {
  describe('RichEditorCustomSpan007', () => {
    beforeAll(() => {
       console.info("RichEditorOnWillChange001 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      const defaultRouter = AppStorage.get<Router>("router") as Router
      console.info("RichEditorCustomSpan007 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorCustomSpan/RichEditorCustomSpan007',
      }
      try {
        defaultRouter.clear();
        let pages:router.RouterState = defaultRouter.getState();
        console.info("get RichEditorCustomSpan007 state pages: " + JSON.stringify(pages));
        if (!("RichEditorCustomSpan007" == pages.name)) {
          console.info("get RichEditorCustomSpan007 state pages.name: " + JSON.stringify(pages.name));
          defaultRouter.pushUrl(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorCustomSpan007 success");
        }
      } catch (err) {
        console.error("push RichEditorCustomSpan007 page error: " + err);
        expect().assertFail();
      }
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_static_0010
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_static_0010
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_static_0010
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_static_0010 START');
      let driver = Driver.create();
      let rich = await (driver.findComponent(ON.id('RichEditorCustomSpan007')) as Promise<Component>);
      let getBounds = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.x, getBounds.y );
      await CommonFunc.sleep(1000);
      let addCustom = await (driver.findComponent(ON.id('addCustom')) as Promise<Component>);
      await addCustom.click();
      await CommonFunc.sleep(500);
      let imageTop = await (driver.findComponent(ON.id('imageTop')) as Promise<Component>);
      await imageTop.click();
      await CommonFunc.sleep(500);
      let getContent = await (driver.findComponent(ON.id('getContent')) as Promise<Component>);
      await getContent.click();
      await CommonFunc.sleep(500);
      let content = await (driver.findComponent(ON.id('content')) as Promise<Component>);
      let contentText = await content.getText();
      await CommonFunc.sleep(500);
      expect(contentText).assertContain('content:abcd  ');
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_static_0011
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_static_0011
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_static_0011
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_static_0011', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_static_0011 START');
      let driver = Driver.create();
      let getStyles = await (driver.findComponent(ON.id('getStyles')) as Promise<Component>);
      await getStyles.click();
      await CommonFunc.sleep(500);
      let stylesInfo = await (driver.findComponent(ON.id('stylesInfo')) as Promise<Component>);
      let stylesInfoText = await stylesInfo.getText();
      await CommonFunc.sleep(500);
      let str = '[{"start":5,"length":1,"styledKey":300,"styledValue":{}},' +
        '{"start":4,"length":1,"styledKey":400,"styledValue":{"type_":"CustomSpan","width":80,"word":"Hello"}},' +
        '{"start":0,"length":4,"styledKey":0,"styledValue":{}}]';
      expect(stylesInfoText).assertContain(str);
      done();
    });

  })
}


