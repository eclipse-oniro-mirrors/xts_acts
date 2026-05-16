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

import CommonFunc from '../../../ets/MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index";
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function RichEditorStyledStringTest() {
  describe('RichEditorStyledStringTest', () => {
    beforeAll(() => {
      console.info("RichEditorStyledStringTest beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.api13.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info("RichEditorStyledStringTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/RichEditorStyledStringTest',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorStyledStringTest state pages:" + JSON.stringify(pages));
        if (!("RichEditorStyledStringTest" == pages.name)) {
          console.info("get RichEditorStyledStringTest pages.name:" + JSON.stringify(pages.name));
          // let result = await router.pushUrl(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push RichEditorStyledStringTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorStyledStringTest page error:" + err);
      }
      console.info("RichEditorStyledStringTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RichEditorStyledStringTest after each called");
    });

    
    /**
     * @tc.number   RichEditorStyledStringTest_static_0100
     * @tc.name     RichEditorStyledStringTest_static_0100
     * @tc.desc     RichEditorStyledStringTest_static_0100
     * @tc.level    Level.LEVEL2
     */
it('RichEditorStyledStringTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('RichEditorStyledStringTest_0100 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('searchStyle'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);



        let text1 =inspector.getInspectorByKey('gestureId');
        let Obj1 = JSON.parseJsonElement(text1);
        expect(Obj1.getElement('$attrs').getString('content')).assertEqual('100');
        await CommonFunc.sleep(500);

        let text2 =inspector.getInspectorByKey('decorationId');
        let Obj2 = JSON.parseJsonElement(text2);
        expect(Obj2.getElement('$attrs').getString('content')).assertEqual('1');
        await CommonFunc.sleep(500);

        let text3 =inspector.getInspectorByKey('textShadowId');
        let Obj3 = JSON.parseJsonElement(text3);
        expect(Obj3.getElement('$attrs').getString('content')).assertEqual('4');
        await CommonFunc.sleep(500);

        let text4 =inspector.getInspectorByKey('baselineOffsetId');
        let Obj4 = JSON.parseJsonElement(text4);
        expect(Obj4.getElement('$attrs').getString('content')).assertEqual('2');
        await CommonFunc.sleep(500);

        let text5 =inspector.getInspectorByKey('letterSpacingId');
        let Obj5 = JSON.parseJsonElement(text5);
        expect(Obj5.getElement('$attrs').getString('content')).assertEqual('3');
        await CommonFunc.sleep(500);

        let text6 =inspector.getInspectorByKey('urlId');
        let Obj6 = JSON.parseJsonElement(text6);
        expect(Obj6.getElement('$attrs').getString('content')).assertEqual('7');

      await CommonFunc.sleep(500);
      console.info('RichEditorStyledStringTest_0100 END');
      done();
    });
  })
}