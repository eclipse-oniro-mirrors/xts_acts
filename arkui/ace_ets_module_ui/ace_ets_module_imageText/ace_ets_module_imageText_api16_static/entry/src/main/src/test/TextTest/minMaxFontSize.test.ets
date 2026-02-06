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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index.ets"
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Component, Driver, MouseButton, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import router from '@ohos.router'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function minMaxFontSize() {
  describe('minMaxFontSize', () => {
    beforeAll(() => {
      console.info("minMaxFontSize beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api16.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("minMaxFontSize beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/minMaxFontSize",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get minMaxFontSize state pages:" + "");
        if (!("minMaxFontSize" == pages.name)) {
          console.info("get minMaxFontSize pages.name:" + "");
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push minMaxFontSize page error:" + err);
      }
      console.info("minMaxFontSize beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("minMaxFontSize after each called");
    });

    
    

    /**
     * @tc.number   minMaxFontSize_static_0001
     * @tc.name     minMaxFontSize_static_0001
     * @tc.desc     minMaxFontSize_static_0001
     * @tc.level    Level.LEVEL0
     */
it('minMaxFontSize_static_0001', Level.LEVEL0, async () => {
        let driver = Driver.create();
        console.info('minMaxFontSize minMaxFontSize_static_0001 START');
        await CommonFunc.sleep(500);

        let strJson = inspector.getInspectorByKey('text1');
        let obj = JSON.parseJsonElement(strJson);
        console.log('minMaxFontSize_static_0001---obj.$attrs.minFontSize---' +
        obj.getElement('$attrs').getString('minFontSize'));
        console.log('minMaxFontSize_static_0001---obj.$attrs.maxFontSize---' +
        obj.getElement('$attrs').getString('maxFontSize'));
        expect(obj.getElement('$attrs').getString('minFontSize')).assertEqual("10.00fp");
        expect(obj.getElement('$attrs').getString('maxFontSize')).assertEqual("30.00fp");
        // 10.00fp    30.00fp
        let strJson2 = inspector.getInspectorByKey('text2');
        let obj2 = JSON.parseJsonElement(strJson2);
        console.log('minMaxFontSize_static_0001---obj2.$attrs.minFontSize---' +
         obj2.getElement('$attrs').getString('minFontSize'));
        console.log('minMaxFontSize_static_0001---obj2.$attrs.maxFontSize---' +
         obj2.getElement('$attrs').getString('maxFontSize'));
        expect(obj2.getElement('$attrs').getString('minFontSize')).assertEqual("10.00fp");
        expect(obj2.getElement('$attrs').getString('maxFontSize')).assertEqual("30.00fp");
        //0.00fp    0.00fp
        let strJson3 = inspector.getInspectorByKey('text3');
        let obj3 = JSON.parseJsonElement(strJson3);
        console.log('minMaxFontSize_static_0001---obj3.$attrs.minFontSize---' +
        obj3.getElement('$attrs').getString('minFontSize'));
        console.log('minMaxFontSize_static_0001---obj3.$attrs.maxFontSize---' +
        obj3.getElement('$attrs').getString('maxFontSize'));
        expect(obj3.getElement('$attrs').getString('minFontSize')).assertContain("0.00");
        expect(obj3.getElement('$attrs').getString('maxFontSize')).assertContain("0.00");
        //0.00fp    0.00fp
        console.info("[minMaxFontSize_static_0001] end");
    });
  })
}
