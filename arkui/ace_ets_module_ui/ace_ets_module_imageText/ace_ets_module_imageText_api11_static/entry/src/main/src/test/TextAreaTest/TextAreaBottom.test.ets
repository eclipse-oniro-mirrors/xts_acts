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
import router from '@ohos.router';
import {Component,  Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function textArea_bottom() {
  describe('textArea_bottom', () => {

    beforeAll(() => {
      console.info("textArea_bottom beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("textArea_bottom beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextArea/textArea_bottom',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get textArea_bottom state pages:" + JSON.stringify(pages));
        if (!("textArea_bottom" == pages.name)) {
          console.info("get textArea_bottom pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push textArea_bottom page error:" + err);
      }
      console.info("textArea_bottom beforeEach end");
    });


    
    /**
     * @tc.number   textArea_bottom_static_001
     * @tc.name     textArea_bottom_static_001
     * @tc.desc     textArea_bottom_static_001
     * @tc.level    Level.LEVEL2
     */
    it('textArea_bottom_static_001', Level.LEVEL2, async (done: ()=>void) => {

      console.info('[textArea_bottom_static_001] START');
      await CommonFunc.sleep(1000);
      if (AppStorage.get<number>("winLeft") == 0) {
        console.log('get Initial value')
        let text_00 = CommonFunc.getComponentRect('textArea_bottom_text_00');
        let text_01 = CommonFunc.getComponentRect('textArea_bottom_text_01');
        let text_02 = CommonFunc.getComponentRect('textArea_bottom_text_02');
        let text_03 = CommonFunc.getComponentRect('textArea_bottom_text_03');
        let column_01 = CommonFunc.getComponentRect('textArea_bottom_column_01');

        let driver = Driver.create();
        await CommonFunc.sleep(500);
        await driver.mouseScroll({x:360, y:800}, true, 30, 2072)
        await CommonFunc.sleep(1000);

        console.log('assert  click before position')
        let textArea_01 = CommonFunc.getComponentRect('textArea_bottom_textArea_01');
        let y1 = textArea_01.top
        await driver.click(
          (Math.round(textArea_01.left + (textArea_01.right - textArea_01.left) /2)) as Int,(Math.round(textArea_01.top + (textArea_01.bottom - textArea_01.top) /45)) as Int
        );
        await CommonFunc.sleep(1000);

        console.log('assert click after position')
        let textArea_02 = CommonFunc.getComponentRect('textArea_bottom_textArea_01');
        let y2 = textArea_02.top

        expect(y1).assertEqual(y2);
      }

      done();
    });

    
    /**
     * @tc.number   textArea_bottom_static_002
     * @tc.name     textArea_bottom_static_002
     * @tc.desc     textArea_bottom_static_002
     * @tc.level    Level.LEVEL2
     */
    it('textArea_bottom_static_002', Level.LEVEL2, async (done: ()=>void) => {

      console.info('[textArea_bottom_static_002] START');
      await CommonFunc.sleep(1000);
      if (AppStorage.get<number>("winLeft") == 0) {
        console.log('get Initial value')
        let text_00 = CommonFunc.getComponentRect('textArea_bottom_text_00');
        let text_01 = CommonFunc.getComponentRect('textArea_bottom_text_01');
        let text_02 = CommonFunc.getComponentRect('textArea_bottom_text_02');
        let text_03 = CommonFunc.getComponentRect('textArea_bottom_text_03');
        let column_01 = CommonFunc.getComponentRect('textArea_bottom_column_01');

        let driver = Driver.create();
        await CommonFunc.sleep(500);
        await driver.mouseScroll({x:360, y:640}, true, 30, 2072)
        await CommonFunc.sleep(1000);

        let textArea_01 = CommonFunc.getComponentRect('textArea_bottom_textArea_01');

        console.log('assert position')
        let y1 = textArea_01.bottom
        await driver.click(
          (Math.round(textArea_01.left + (textArea_01.right - textArea_01.left) /2)) as Int,(Math.round(textArea_01.top + (textArea_01.bottom - textArea_01.top) /2)) as Int
        );
        await CommonFunc.sleep(1000);
        let textArea_02 = CommonFunc.getComponentRect('textArea_bottom_textArea_01');
        let y2 = textArea_02.bottom

        expect(y1).assertEqual(y2);
      }

      done();
    });

    
    /**
     * @tc.number   textArea_bottom_static_003
     * @tc.name     textArea_bottom_static_003
     * @tc.desc     textArea_bottom_static_003
     * @tc.level    Level.LEVEL2
     */
    it('textArea_bottom_static_003', Level.LEVEL2, async (done: ()=>void) => {

      console.info('[textArea_bottom_static_003] START');
      await CommonFunc.sleep(1000);
      if (AppStorage.get<number>("winLeft") == 0) {
        console.log('get Initial value')
        let text_00 = CommonFunc.getComponentRect('textArea_bottom_text_00');
        let text_01 = CommonFunc.getComponentRect('textArea_bottom_text_01');
        let text_02 = CommonFunc.getComponentRect('textArea_bottom_text_02');
        let text_03 = CommonFunc.getComponentRect('textArea_bottom_text_03');
        let column_01 = CommonFunc.getComponentRect('textArea_bottom_column_01');

        let driver = Driver.create();
        await CommonFunc.sleep(500);
        await driver.mouseScroll({x:360, y:640}, true, 30, 2072)
        await CommonFunc.sleep(1000);

        let textArea_01 = CommonFunc.getComponentRect('textArea_bottom_textArea_01');
        console.log('assert position')
        let y1 = textArea_01.bottom
        await driver.click(
          (Math.round(textArea_01.left + (textArea_01.right - textArea_01.left) /2)) as Int,(Math.round(textArea_01.top + (textArea_01.bottom - textArea_01.top) /45 *44)) as Int
        );
        await CommonFunc.sleep(1000);
        let textArea_02 = CommonFunc.getComponentRect('textArea_bottom_textArea_01');
        let y2 = textArea_02.bottom

        expect(y1).assertEqual(y2);
      }

      done();
    });

  })
}
