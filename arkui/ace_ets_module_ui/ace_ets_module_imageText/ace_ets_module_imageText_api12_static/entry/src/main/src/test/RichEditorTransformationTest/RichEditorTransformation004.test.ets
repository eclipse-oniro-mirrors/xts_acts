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
export default function RichEditorTransformation004() {
  describe('RichEditorTransformation004', () => {
    beforeAll(() => {
      console.info("RichEditorTransformation004 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      const defaultRouter = AppStorage.get<Router>("router") as Router
      console.info("RichEditorTransformation004 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorTransformation/RichEditorTransformation004',
      }
      try {
        defaultRouter.clear();
        let pages:router.RouterState = defaultRouter.getState();
        console.info("get RichEditorTransformation004 state pages: " + JSON.stringify(pages));
        if (!("RichEditorTransformation004" == pages.name)) {
          console.info("get RichEditorTransformation004 state pages.name: " + JSON.stringify(pages.name));
          defaultRouter.pushUrl(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorTransformation004 success");
        }
      } catch (err) {
        console.error("push RichEditorTransformation004 page error: " + err);
        expect().assertFail();
      }
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AffineTransformation_static_006
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AffineTransformation_static_006
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AffineTransformation_static_006
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AffineTransformation_static_006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AffineTransformation_static_006 START');
      let driver = Driver.create();
      let rich = await (driver.findComponent(ON.id('RichEditorTransformation004')) as Promise<Component>);
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('RichEditorTransformation004');
      let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);
      expect(JSON.stringify(obj.getElement('$attrs').getString('fontColor'))).assertContain('000000');
      expect(JSON.stringify(obj.getElement('$attrs').getString('fontStyle'))).assertEqual('"FontStyle.Normal"');
      let setTypingStyle = await (driver.findComponent(ON.id('setTypingStyle')) as Promise<Component>);
      await setTypingStyle.click();
      driver.triggerKey(KeyCode.KEYCODE_A);
      await CommonFunc.sleep(500);
      driver.triggerKey(KeyCode.KEYCODE_F);
      await CommonFunc.sleep(500);
      let getTypingStyle = await (driver.findComponent(ON.id('getTypingStyle')) as Promise<Component>);
      await getTypingStyle.click();
      let textStyle = await (driver.findComponent(ON.id('textStyle')) as Promise<Component>);
      let textStyleText = await textStyle.getText();
      await CommonFunc.sleep(500);
      expect(textStyleText).assertContain('"fontColor":"#FF008000"');
      expect(textStyleText).assertContain('"fontFamily":"Arial"');
      expect(textStyleText).assertContain('"fontSize":"40.00vp"');
      expect(textStyleText).assertContain('"fontStyle":1');
      expect(textStyleText).assertContain('fontWeight":12');
      expect(textStyleText).assertContain('"decoration":{"type":2,"color":"#80A91AF6"}');
      done();
    });

  })
}


