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
export default function RichEditorQueryLayout020() {
  describe('RichEditorQueryLayout020', () => {
    beforeAll(() => {
      console.info("RichEditorQueryLayout020 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      const defaultRouter = AppStorage.get<Router>("router") as Router
      console.info("RichEditorQueryLayout020 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorQueryLayout/RichEditorQueryLayout020',
      }
      try {
        defaultRouter.clear();
        let pages:router.RouterState = defaultRouter.getState();
        console.info("get RichEditorQueryLayout020 state pages: " + JSON.stringify(pages));
        if (!("RichEditorQueryLayout020" == pages.name)) {
          console.info("get RichEditorQueryLayout020 state pages.name: " + JSON.stringify(pages.name));
          defaultRouter.pushUrl(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorQueryLayout020 success");
        }
      } catch (err) {
        console.error("push RichEditorQueryLayout020 page error: " + err);
        expect().assertFail();
      }
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_QUERYLAYOUTPARAGRAPHSTYLE_static_0022
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_QUERYLAYOUTPARAGRAPHSTYLE_static_0022
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_QUERYLAYOUTPARAGRAPHSTYLE_static_0022
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_QUERYLAYOUTPARAGRAPHSTYLE_static_0022', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_QUERYLAYOUTPARAGRAPHSTYLE_static_0022 START');
      let driver = Driver.create();
      let rich = await (driver.findComponent(ON.id('rich_struct')) as Promise<Component>);
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(KeyCode.KEYCODE_DEL);
      await CommonFunc.sleep(500);

      await driver.triggerKey(KeyCode.KEYCODE_DEL);
      await CommonFunc.sleep(500);

      let delLayoutStyle = await (driver.findComponent(ON.id('delLayoutStyle')) as Promise<Component>);
      let delLayoutStyleText = await delLayoutStyle.getText();
      await CommonFunc.sleep(500);
      expect(delLayoutStyleText.indexOf('"borderRadius":"10.00px"') > 0).assertEqual(true);
      expect(delLayoutStyleText.indexOf('"margin":{"top":"21.00px","left":"21.00px","right":"21.00px","bottom":"21.00px"}') > 0).assertEqual(true);

      let paragraphStyle = await (driver.findComponent(ON.id('paragraphStyle')) as Promise<Component>);
      let paragraphStyleText = await paragraphStyle.getText();
      await CommonFunc.sleep(500);
      expect(paragraphStyleText).assertContain('"textAlign":0');
      expect(paragraphStyleText).assertContain('"leadingMargin":{"size":["20.00vp","0.00vp"]}');
      expect(paragraphStyleText).assertContain('"wordBreak":2');
      expect(paragraphStyleText).assertContain('"lineBreakStrategy":0');
      done();
    });

  })
}


