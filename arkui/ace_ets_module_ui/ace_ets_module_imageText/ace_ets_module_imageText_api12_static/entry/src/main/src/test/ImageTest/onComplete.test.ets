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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, ON, Component, Rect } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function onComplete() {
  describe('onComplete', (): void => {
    beforeAll(() => {
      console.info("onComplete beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("onComplete beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Image/onComplete',
      }
      try {

        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get onComplete state pages:" + JSON.stringify(pages));
        if (!("onComplete" == pages.name)) {
          console.info("get onComplete pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push onComplete page error:" + err);
      }
      console.info("onComplete beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("onComplete after each called");
    });
    
    /**
     * @tc.number   onComplete_static_0100
     * @tc.name     onComplete_static_0100
     * @tc.desc     onComplete_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('onComplete_static_0100',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[onComplete_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let text1 = inspector.getInspectorByKey('DloadingStatus');
      let Obj1 = JSON.parseJsonElement(text1);
      expect(Obj1.getElement('$attrs').getString('content')).assertEqual('1');
      console.info('[onSelectionChange1_0100] END');
      done();
    });



    
    /**
     * @tc.number   onComplete_static_0200
     * @tc.name     onComplete_static_0200
     * @tc.desc     onComplete_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('onComplete_static_0200',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[onComplete_0200] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let text1 = inspector.getInspectorByKey('DcontentWidth');
      let Obj1 = JSON.parseJsonElement(text1);
      expect(Math.abs(Math.round(Number(Obj1.getElement('$attrs').getString('content')) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue();
      console.info('[onSelectionChange1_0200] END');
      done();
    });



    
    /**
     * @tc.number   onComplete_static_0300
     * @tc.name     onComplete_static_0300
     * @tc.desc     onComplete_static_0300
     * @tc.level    Level.LEVEL0
     */
    it('onComplete_static_0300',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[onComplete_0300] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let text1 = inspector.getInspectorByKey('DcontentHeight');
      let Obj1 = JSON.parseJsonElement(text1);
      expect(Math.abs(Math.round(Number(Obj1.getElement('$attrs').getString('content')) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue();
      console.info('[onSelectionChange1_0300] END');
      done();
    });


    
    /**
     * @tc.number   onComplete_static_0400
     * @tc.name     onComplete_static_0400
     * @tc.desc     onComplete_static_0400
     * @tc.level    Level.LEVEL0
     */
    it('onComplete_static_0400',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[onComplete_0400] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let text1 = inspector.getInspectorByKey('DcontentOffsetX');
      let Obj1 = JSON.parseJsonElement(text1);
      expect(Obj1.getElement('$attrs').getString('content')).assertEqual('0');
      console.info('[onSelectionChange1_0400] END');
      done();
    });


    
    /**
     * @tc.number   onComplete_static_0500
     * @tc.name     onComplete_static_0500
     * @tc.desc     onComplete_static_0500
     * @tc.level    Level.LEVEL0
     */
    it('onComplete_static_0500',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[onComplete_0500] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let text1 = inspector.getInspectorByKey('DcontentOffsetY');
      let Obj1 = JSON.parseJsonElement(text1);
      expect(Obj1.getElement('$attrs').getString('content')).assertEqual('0');
      console.info('[onSelectionChange1_0500] END');
      done();
    });



  })
}
