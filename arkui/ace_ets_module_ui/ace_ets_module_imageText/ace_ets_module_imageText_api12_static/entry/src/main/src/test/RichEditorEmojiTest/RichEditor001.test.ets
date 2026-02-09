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
  WindowMode,Point,
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
export default function RichEditor001() {
  describe('RichEditor001', () => {
    beforeAll(() => {
       console.info("RichEditorOnWillChange001 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      const defaultRouter = AppStorage.get<Router>("router") as Router
      console.info("RichEditor beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorEmoji/RichEditor001',
      }
      try {
        defaultRouter.clear();
        let pages:router.RouterState = defaultRouter.getState();
        console.info("get RichEditor001 state pages: " + JSON.stringify(pages));
        if (!("RichEditor001" == pages.name)) {
          console.info("get RichEditor001 state pages.name: " + JSON.stringify(pages.name));
          defaultRouter.pushUrl(options);
          await CommonFunc.sleep(3500);
          console.info("push RichEditor001 success");
        }
      } catch (err) {
        console.error("push RichEditor001 page error: " + err);
        expect().assertFail();
      }
    });
    afterEach(()=>{
      const defaultRouter = AppStorage.get<Router>("router") as Router
      defaultRouter.replaceUrl({url:'MainAbility/pages/index/index'})

      await CommonFunc.sleep(3500);
    })
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_EMOJI_static_0021
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_EMOJI_static_0021
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_EMOJI_static_0021
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_EMOJI_static_0021', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_EMOJI_static_0021 START');
      let driver = Driver.create();
      let rich = await (driver.findComponent(ON.id('rich_struct')) as Promise<Component>);
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      let point = await (driver.findComponent(ON.id('get_position')) as Promise<Component>);
      await point.click();
      await CommonFunc.sleep(1000);
      let text = await (driver.findComponent(ON.id('position_text')) as Promise<Component>);
      let beginPosition = await text.getText();
      //KEYCODE_FORWARD_DEL
      await driver.triggerKey(2071);

      await CommonFunc.sleep(500);

      await point.click();
      await CommonFunc.sleep(1000);
      let endPosition = await text.getText();

      expect(beginPosition).assertEqual(endPosition);
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_EMOJI_static_0016
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_EMOJI_static_0016
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_EMOJI_static_0016
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_EMOJI_static_0016', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_EMOJI_static_0016 START');
      let driver = Driver.create();
      let rich = await (driver.findComponent(ON.id('rich_struct')) as Promise<Component>);
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_EMOJI_static_0016 rich');
      let pointCenter = await rich.getBoundsCenter();
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_EMOJI_static_0016 pointCenter');
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_EMOJI_static_0016 driver');
      let back = await (driver.findComponent(ON.id('back')) as Promise<Component>);
      await back.click();
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_EMOJI_static_0016 back');
      await CommonFunc.sleep(500);

      let point = await (driver.findComponent(ON.id('get_position')) as Promise<Component>);
      await point.click();
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_EMOJI_static_0016 point');
      await CommonFunc.sleep(500);
      let text = await (driver.findComponent(ON.id('position_text')) as Promise<Component>);
      let beginPosition = await text.getText();
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_EMOJI_static_0016 beginPosition');
      //KEYCODE_FORWARD_DEL
      await driver.triggerKey(2071);
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_EMOJI_static_0016 triggerKey');
      await CommonFunc.sleep(500);

      await point.click();
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_EMOJI_static_0016 point.click');
      await CommonFunc.sleep(1000);
      let endPosition = await text.getText();
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_EMOJI_static_0016 endPosition');
      expect(beginPosition).assertEqual(endPosition);
      done();
    });
  })
}


