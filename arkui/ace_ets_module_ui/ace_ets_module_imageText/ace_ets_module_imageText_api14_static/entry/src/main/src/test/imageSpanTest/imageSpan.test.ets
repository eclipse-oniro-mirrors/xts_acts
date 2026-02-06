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
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';


let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


const waitUiReadyMs = 1000;
interface optionsObj {
  uri: string
}
export default function imageSpanJsunit() {
  describe('imageSpanJsunit', (): void => {
    beforeAll(() => {
      console.info("imageSpanJsunit beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api14.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("imageSpanJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/imageSpan/imageSpan",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get imageSpanJsunit state pages:" + "");
        if (!("imageTwo" == pages.name)) {
          console.info("get imageSpanJsunit pages.name:" + "");
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push imageSpanJsunit page error:" + err);
      }
      console.info("imageSpanJsunit beforeEach end");
    });

       
    

    /**
     * @tc.number   imageSpanJsunit_static_0100
     * @tc.name     imageSpanJsunit_static_0100
     * @tc.desc     imageSpanJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('imageSpanJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('imageSpanJsunit_0100 START');
      await CommonFunc.sleep(1000);
      // get the image component and test attribute
      let strJson = inspector.getInspectorByKey('imageSpan1');
      let obj = JSON.parseJsonElement(strJson);
      console.info('imageSpanJsunit_0100 component obj is: ' + obj.getElement('$attrs').getString('colorFilter'));
      expect(obj.getElement('$attrs').getString('colorFilter')).assertEqual('1.000000 0.000000 0.000000 0.000000 0.000000 0.000000 ' +
        '1.000000 0.000000 0.000000 0.000000 0.000000 0.000000 1.000000 0.000000 0.000000 0.000000 0.000000 ' +
        '0.000000 1.000000 0.000000 ');
      done();
    });
  })
}