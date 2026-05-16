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
export default function RichEditorLayoutStyle003() {
  describe('RichEditorLayoutStyle003', () => {
    beforeAll(() => {
       console.info("RichEditorOnWillChange001 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      const defaultRouter = AppStorage.get<Router>("router") as Router
      console.info("RichEditorLayoutStyle003 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorLayoutStyle/RichEditorLayoutStyle003',
      }
      try {
        defaultRouter.clear();
        let pages:router.RouterState = defaultRouter.getState();
        console.info("get RichEditorLayoutStyle003 state pages: " + JSON.stringify(pages));
        if (!("RichEditorLayoutStyle003" == pages.name)) {
          console.info("get RichEditorLayoutStyle003 state pages.name: " + JSON.stringify(pages.name));
          defaultRouter.pushUrl(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorLayoutStyle003 success");
        }
      } catch (err) {
        console.error("push RichEditorLayoutStyle003 page error: " + err);
        expect().assertFail();
      }
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LAYOUTSTYLE_static_0090
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LAYOUTSTYLE_static_0090
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LAYOUTSTYLE_static_0090
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LAYOUTSTYLE_static_0090', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LAYOUTSTYLE_static_0090 START');
      let driver = Driver.create();
      let rich = await (driver.findComponent(ON.id('RichEditorLayoutStyle003')) as Promise<Component>);
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      let imageStyle = await (driver.findComponent(ON.id('imageStyle')) as Promise<Component>);
      let imageStyleText = await imageStyle.getText();
      await CommonFunc.sleep(500);
      console.info("[RichEditorLayoutStyle003.test.ets] component obj attrs is: " + imageStyleText);
      expect(imageStyleText).assertEqual("imageStyle:{\"margin\":{\"top\":\"0.00px\",\"left\":\"0.00px\",\"right\":\"0.00px\",\"bottom\":\"0.00px\"}}");
      done();
    });

  })
}


