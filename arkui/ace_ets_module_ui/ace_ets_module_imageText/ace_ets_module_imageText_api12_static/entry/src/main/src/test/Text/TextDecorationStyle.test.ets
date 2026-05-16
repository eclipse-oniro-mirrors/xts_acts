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
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
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


export default function typeNodeTextDecorationStyleTest() {
  describe('typeNodeTextDecorationStyleTest', () => {
    beforeAll(() => {
      console.info("typeNodeTextDecorationStyleTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("typeNodeTextDecorationStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/TextDecorationStyle",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get typeNodeTextDecorationStyleTest state pages:" + JSON.stringify(pages));
        if (!("TextDecorationStyle" == pages.name)) {
          console.info("get typeNodeTextDecorationStyleTest pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push typeNodeTextDecorationStyleTest page error:" + err);
      }
      console.info("typeNodeTextDecorationStyleTest beforeEach end");
    }); 


    
    /**
     * @tc.number   TextDecorationStyleTest_static_0100
     * @tc.name     TextDecorationStyleTest_static_0100
     * @tc.desc     TextDecorationStyleTest_static_0100
     * @tc.level   Level.LEVEL0
     */
    it('TextDecorationStyleTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('TextDecorationStyleTest_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('TypeNode_TextDecorationStyleTest');
      let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);
      console.info("[ypeNodeTextDecorationStyleTest_0100] component obj is: " , JSON.stringify(obj.getElement('$attrs').getString('decoration')));
      let c: string = JSON.parseJsonElement(obj.getElement('$attrs').getString('decoration')).getString('style')
      console.info("[ypeNodeTextDecorationStyleTest_0100] component obj22222 is: " , c);
      expect(c).assertEqual('TextDecorationStyle.DOUBLE');
      console.info('[ypeNodeTextDecorationStyleTest_0100] END');
      done();
    });
  })
}

