'use static';
/**
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
import {
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test'
import { UtilsTest } from '../Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function PopupAlphaTest() {
  describe('PopupAlphaTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("PopupAlphaTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AlphabetIndexer/PopupAlpha',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        let pages = router.getState();
        console.info("get PopupAlphaTest state pages: " + JSON.stringify(pages));
        if (!("PopupAlpha" == pages.name)) {
          console.info("get PopupAlphaTest state pages.name: " + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push PopupAlphaTest page error: " + err);
        expect().assertFail();
      }
    });

    
    /**
     * @tc.number   PopupAlphaTest_static_0100
     * @tc.name     PopupAlphaTest_static_0100
     * @tc.desc     PopupAlphaTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('PopupAlphaTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('PopupAlphaTest_static_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('PopupAlpha_1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PopupAlphaTest_static_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('popupItemBorderRadius')).assertEqual('24.00vp');
      console.info('[PopupAlphaTest_static_0100] END');
      done();
    });


    
    /**
     * @tc.number   PopupAlphaTest_static_0200
     * @tc.name     PopupAlphaTest_static_0200
     * @tc.desc     PopupAlphaTest_static_0200
     * @tc.level    Level.LEVEL0
     */
it('PopupAlphaTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('PopupAlphaTest_static_0200 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('PopupAlpha_1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PopupAlphaTest_static_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('itemBorderRadius')).assertEqual('14.00vp');
      console.info('[PopupAlphaTest_static_0200] END');
      done();
    });


    
    /**
     * @tc.number   PopupAlphaTest_static_0300
     * @tc.name     PopupAlphaTest_static_0300
     * @tc.desc     PopupAlphaTest_static_0300
     * @tc.level    Level.LEVEL0
     */
it('PopupAlphaTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('PopupAlphaTest_static_0300 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('PopupAlpha_1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PopupAlphaTest_static_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('popupBackgroundBlurStyle')).assertEqual('BlurStyle.NONE');
      console.info('[PopupAlphaTest_static_0300] END');
      done();
    });


    
    /**
     * @tc.number   PopupAlphaTest_static_0400
     * @tc.name     PopupAlphaTest_static_0400
     * @tc.desc     PopupAlphaTest_static_0400
     * @tc.level    Level.LEVEL0
     */
it('PopupAlphaTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('PopupAlphaTest_static_0400 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('PopupAlpha_1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PopupAlphaTest_static_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('popupTitleBackground')).assertEqual('#FFCCCCCC');
      console.info('[PopupAlphaTest_static_0300] END');
      done();
    });
  })
}

