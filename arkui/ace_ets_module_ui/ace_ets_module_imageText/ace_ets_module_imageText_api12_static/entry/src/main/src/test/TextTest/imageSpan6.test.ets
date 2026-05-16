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
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
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
import { UtilsTest,  startAbility} from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function imageSpanTest6() {
  describe('imageSpanTest6', () => {
    beforeAll(() => {
      console.info("imageSpanTest6 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("imageSpanTest6 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/imageSpan6",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get imageSpanTest6 state pages:" + JSON.stringify(pages));
        if (!("imageSpan6" == pages.name)) {
          console.info("get imageSpanTest6 pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push imageSpanTest6 page error:" + err);
      }
      console.info("imageSpanTest6 beforeEach end");
    }); 

    
     
    /**
     * @tc.number   imageSpanTest6_static_0100
     * @tc.name     imageSpanTest6_static_0100
     * @tc.desc     imageSpanTest6_static_0100
     * @tc.level   Level.LEVEL0
     */
    it('imageSpanTest6_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('imageSpanTest6_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ImageSpan_onComplete_6');
      let obj  = JSON.parseJsonElement(strJson);
      console.info("[imageSpanTest6_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('onComplete succ');
      console.info('[imageSpanTest6_0100] END');
      done();
    });

    
    /**
     * @tc.number   imageSpanTest6_static_0200
     * @tc.name     imageSpanTest6_static_0200
     * @tc.desc     imageSpanTest6_static_0200
     * @tc.level   Level.LEVEL0
     */
    it('imageSpanTest6_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('imageSpanTest6_0200 START');
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let Button = await (driver.findComponent(ON.id('ImageSpan_onComplete_6')) as Promise<Component>);
      await Button.click();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ImageSpan_onComplete_62');
      let obj  = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('2');
      console.info('[imageSpanTest6_0200] END');
      done();
    });
  })
}

