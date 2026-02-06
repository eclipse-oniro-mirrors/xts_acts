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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import inspector from '@ohos.arkui.inspector'
import {
  Entry,
  Text,
  TextAttribute,
  Column,
  Button,
  ButtonAttribute,
  ClickEvent,
  Image,
  ImageFit,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign
} from '@ohos.arkui.component'
import { Driver, ON,Component } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import router from '@ohos.router';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;


export default function ParagraphSpacingTest() {
  describe('ParagraphSpacingTest', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.imageText.api18.static", "EntryAbility")

    });
    beforeEach(async (): Promise<void> => {
      console.info("ParagraphSpacingTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/ParagraphSpacing',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get ParagraphSpacingTest state pages: " + JSON.stringify(pages));
        if (!("ParagraphSpacing" == pages.name)) {
          console.info("get ParagraphSpacingTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ParagraphSpacingTest page error: " + err);
        expect().assertFail();
      }
    });

    
    
    /**
     * @tc.number   ParagraphSpacingTest_static_0010
     * @tc.name     ParagraphSpacingTest_static_0010
     * @tc.desc     ParagraphSpacingTest_static_0010
     * @tc.level    Level.LEVEL0
     */
it('ParagraphSpacingTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {      console.info('[ParagraphSpacingTest_0010] START');
      await CommonFunc.sleep(500);
      console.info("[ParagraphSpacingTest_0010] value1:" + JSON.stringify(AppStorage.get<number>('paragraphSpacing1')));
      expect(AppStorage.get<number>('paragraphSpacing1')).assertEqual(10);
      AppStorage.delete('paragraphSpacing1')
      console.info('[ParagraphSpacingTest_0010] END');
      done();
    });



    /**
     * @tc.number   ParagraphSpacingTest_static_0020
     * @tc.name     ParagraphSpacingTest_static_0020
     * @tc.desc     ParagraphSpacingTest_static_0020
     * @tc.level    Level.LEVEL0
     */
it('ParagraphSpacingTest_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {      console.info('[ParagraphSpacingTest_0020] START');
      await CommonFunc.sleep(500);
      console.info("[ParagraphSpacingTest_0020] value2:" + JSON.stringify(AppStorage.get<number>('paragraphSpacing2')));
      expect(AppStorage.get<number>('paragraphSpacing2')).assertEqual(20);
      AppStorage.delete('paragraphSpacing2')
      console.info('[ParagraphSpacingTest_0020] END');
      done();
    });

    
    
    /**
     * @tc.number   ParagraphSpacingTest_static_0030
     * @tc.name     ParagraphSpacingTest_static_0030
     * @tc.desc     ParagraphSpacingTest_static_0030
     * @tc.level    Level.LEVEL0
     */
it('ParagraphSpacingTest_static_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {      console.info('[ParagraphSpacingTest_0030] START');
      await CommonFunc.sleep(500);
      console.info("[ParagraphSpacingTest_0030] value3:" + JSON.stringify(AppStorage.get<number>('paragraphSpacing3')));
       expect(AppStorage.get<number>('paragraphSpacing3')).assertEqual(0);
      AppStorage.delete('paragraphSpacing3')
      console.info('[ParagraphSpacingTest_0030] END');
      done();
    });

    

  })
}
