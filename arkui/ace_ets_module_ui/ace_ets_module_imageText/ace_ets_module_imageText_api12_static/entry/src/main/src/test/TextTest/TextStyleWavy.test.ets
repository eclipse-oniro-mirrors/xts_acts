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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, MouseButton, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
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

export default function TextStyleWavy() {
  describe('TextStyleWavy', () => {
    beforeAll(() => {
      console.info("TextStyleWavy beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextStyleWavy beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/textPageWavy",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextStyleWavy state pages:" + JSON.stringify(pages));
        if (!("textPageWavy" == pages.name)) {
          console.info("get TextStyleWavy pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextStyleWavy page error:" + err);
      }
      console.info("TextStyleWavy beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textPageWavy after each called");
    });

    
    /**
     * @tc.number   TextStyleWavy_static_001
     * @tc.name     TextStyleWavy_static_001
     * @tc.desc     TextStyleWavy_static_001
     * @tc.level   Level.LEVEL0
     */
    it('TextStyleWavy_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextStyleWavy_001] START');

      let strJson = inspector.getInspectorByKey('textWavy');
      await CommonFunc.sleep(200);
      let obj  = JSON.parseJsonElement(strJson);
      console.info("[TextStyleWavy_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getString('decoration')).assertEqual('{"type":"TextDecorationType.Underline","color":"#FFFF0000","style":"TextDecorationStyle.WAVY"}');
      console.info('[TextStyleWavy_001] END');
      done();

    });

  })
}
