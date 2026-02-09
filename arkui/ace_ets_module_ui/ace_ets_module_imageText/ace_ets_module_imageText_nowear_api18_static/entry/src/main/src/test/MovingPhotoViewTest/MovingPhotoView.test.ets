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
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function MovingPhotoViewTest() {
  describe('MovingPhotoViewTest', () => {
    beforeAll(() => {
      console.info("MovingPhotoViewTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.api18.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("MovingPhotoViewTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/MovingPhotoView/MovingPhotoView',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get MovingPhotoViewTest state pages: " + JSON.stringify(pages));
        if (!("MovingPhotoView" == pages.name)) {
          console.info("get MovingPhotoViewTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push MovingPhotoViewTest page error: " + err);
        expect().assertFail();
      }
    });

    
    /**
     * @tc.number   MovingPhotoViewTest_static_0120
     * @tc.name     MovingPhotoViewTest_static_0120
     * @tc.desc     MovingPhotoViewTest_static_0120
     * @tc.level    Level.LEVEL2
     */
it('MovingPhotoViewTest_static_0120', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('MovingPhotoViewTest_0120 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('MovingPhotoView_enableAnalyzer'));
      await CommonFunc.sleep(500);
      await (button?.click() as  Promise<void>);
      await CommonFunc.sleep(500);

        let strJson = inspector.getInspectorByKey('MovingPhotoView_enableAnalyzerFlag');
        console.log('MovingPhotoViewTest_0120', JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual("true");

      console.info('MovingPhotoViewTest_0120 END');
      done();
    });

    
    /**
     * @tc.number   MovingPhotoViewTest_static_0130
     * @tc.name     MovingPhotoViewTest_static_0130
     * @tc.desc     MovingPhotoViewTest_static_0130
     * @tc.level    Level.LEVEL2
     */
it('MovingPhotoViewTest_static_0130', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('MovingPhotoViewTest_0130 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('MovingPhotoView_refreshButton'));
      await CommonFunc.sleep(500);
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(500);


        let strJson = inspector.getInspectorByKey('MovingPhotoView_refresh');
        console.log('MovingPhotoViewTest_0130', JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual("refresh succ");

      console.info('MovingPhotoViewTest_0130 END');
      done();
    });
  })
}