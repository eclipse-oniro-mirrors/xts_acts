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
import {Component,  Driver, UiWindow, ON,MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
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

export default function textArea_top() {
  describe('textArea_top', () => {
    beforeAll(() => {
      console.info("textArea_top beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("textArea_top beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextArea/textArea_top',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get textArea_top state pages:" + JSON.stringify(pages));
        if (!("textArea_top" == pages.name)) {
          console.info("get textArea_top pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push textArea_top page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textArea_top page error:" + err);
      }
      console.info("textArea_top beforeEach end");
    });

    
    /**
     * @tc.number   textArea_top_static_001
     * @tc.name     textArea_top_static_001
     * @tc.desc     textArea_top_static_001
     * @tc.level    Level.LEVEL2
     */
    it('textArea_top_static_001', Level.LEVEL2, async (done: ()=>void) => {

      console.info('[textArea_top_static_001] START');
      await CommonFunc.sleep(1000);

      if (AppStorage.get<number>("winLeft") == 0) {
        console.log('get Initial value')
        let text_00 = CommonFunc.getComponentRect('textArea_top_text_00');
        let text_01 = CommonFunc.getComponentRect('textArea_top_text_01');
        let textArea_01 = CommonFunc.getComponentRect('textArea_top_textArea_01');
        let column_01 = CommonFunc.getComponentRect('textArea_top_column_01');

        console.log('assert position')
        expect(textArea_01.top).assertEqual(column_01.top);
        console.log('textArea_01.top' + textArea_01.top)
        console.log('column_01.top' + column_01.top)

        let driver = Driver.create();
        await driver.click(
          // vp2px(100),vp2px(10)
          Math.round((textArea_01.left + (textArea_01.right - textArea_01.left) /2)) as Int,Math.round((textArea_01.top + (textArea_01.bottom - textArea_01.top) /45)) as Int
        );
        await CommonFunc.sleep(1000);

        expect(textArea_01.top).assertEqual(column_01.top);
        console.log('textArea_01.top' + textArea_01.top)
        console.log('column_01.top' + column_01.top)
      }

      done();
    });
    
    /**
     * @tc.number   textArea_top_static_002
     * @tc.name     textArea_top_static_002
     * @tc.desc     textArea_top_static_002
     * @tc.level    Level.LEVEL2
     */
    it('textArea_top_static_002', Level.LEVEL2, async (done: ()=>void) => {

      console.info('[textArea_top_static_002] START');
      await CommonFunc.sleep(1000);

      if (AppStorage.get<number>("winLeft") == 0) {
        console.log('get Initial value')
        let text_00 = CommonFunc.getComponentRect('textArea_top_text_00');
        let text_01 = CommonFunc.getComponentRect('textArea_top_text_01');
        let textArea_01 = CommonFunc.getComponentRect('textArea_top_textArea_01');
        let column_01 = CommonFunc.getComponentRect('textArea_top_column_01');

        console.log('assert position')
        expect(textArea_01.top).assertEqual(column_01.top);
        console.log('textArea_01.top' + textArea_01.top)
        console.log('column_01.top' + column_01.top)
        const uiContext = AppStorage.get<UIContext>('uiContext');
        let driver = Driver.create();
        await driver.click(
          Math.round(uiContext!.vp2px(100)) as Int,Math.round(uiContext!.vp2px(200)) as Int
          // (textArea_01.left + (textArea_01.right - textArea_01.left) /2),(textArea_01.top + (textArea_01.bottom - textArea_01.top) /2)
        );
        await CommonFunc.sleep(1000);

        expect(textArea_01.top).assertEqual(column_01.top);
        console.log('textArea_01.top' + textArea_01.top)
        console.log('column_01.top' + column_01.top)
      }

      done();
    });

    
    /**
     * @tc.number   textArea_top_static_003
     * @tc.name     textArea_top_static_003
     * @tc.desc     textArea_top_static_003
     * @tc.level    Level.LEVEL2
     */
    it('textArea_top_static_003', Level.LEVEL2, async (done: ()=>void) => {

      console.info('[textArea_top_static_003] START');
      await CommonFunc.sleep(1000);

      if (AppStorage.get<number>("winLeft") == 0) {
        console.log('get Initial value')
        let text_00 = CommonFunc.getComponentRect('textArea_top_text_00');
        let text_01 = CommonFunc.getComponentRect('textArea_top_text_01');
        let textArea_01 = CommonFunc.getComponentRect('textArea_top_textArea_01');
        let column_01 = CommonFunc.getComponentRect('textArea_top_column_01');

        console.log('assert position')
        expect(textArea_01.top).assertEqual(column_01.top);
        console.log('textArea_01.top' + textArea_01.top)
        console.log('column_01.top' + column_01.top)

        let driver = Driver.create();
        await CommonFunc.sleep(500);
        await driver.click(
          Math.round((textArea_01.left + (textArea_01.right - textArea_01.left) /2)) as Int,Math.round((textArea_01.top + (textArea_01.bottom - textArea_01.top) /45 * 44)) as Int
        );
        await CommonFunc.sleep(1000);

        let text_02 = CommonFunc.getComponentRect('textArea_top_text_02');
      }

      done();
    });

  })
}
