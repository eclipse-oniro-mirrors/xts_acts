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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext,Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function textAreaPreview() {
  describe('textAreaPreview', () => {
    beforeAll(() => {
      console.info("textAreaPreview beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("textAreaPreview beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextArea/textAreaPreview",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get textAreaPreview state pages:" + JSON.stringify(pages));
        if (!("textAreaPreview" == pages.name)) {
          console.info("get textAreaPreview pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push textAreaPreview page error:" + err);
      }
      console.info("textAreaPreview beforeEach end");
    }); 

    /**
     * @tc.number   textAreaPreview_static_0100
     * @tc.name     textAreaPreview_static_0100
     * @tc.desc     textAreaPreview_static_0100
     * @tc.level   Level.LEVEL0
     */
    it('textAreaPreview_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textAreaPreview_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('enablePreview_textArea');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textAreaPreview_0100] component obj is: " + JSON.stringify(obj));
      console.info("[textAreaPreview_0100] enablePreviewText: " + JSON.stringify(obj.getElement('$attrs').getBoolean('enablePreviewText')));
      expect(obj.getElement('$attrs').getBoolean('enablePreviewText')).assertEqual(true);
      console.info('[textAreaPreview_0100] END');
      done();
    });

  })
}