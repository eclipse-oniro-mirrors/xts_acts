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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
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
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test'
import { UtilsTest } from '../Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function alphabetBorderRadiusTest() {
  describe('alphabetBorderRadiusTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("alphabetBorderRadiusTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/AlphabetIndexer/alphabetBorderRadius",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get alphabetBorderRadiusTest state pages:" + JSON.stringify(pages));
        if (!("alphabetBorderRadius" == pages.name)) {
          console.info("get alphabetBorderRadiusTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push alphabetBorderRadiusTest page error:" + err);
      }
      console.info("alphabetBorderRadiusTest beforeEach end");
    });


    
    /**
     * @tc.number   alphabetBorderRadiusTest_static_001
     * @tc.name     alphabetBorderRadiusTest_static_001
     * @tc.desc     alphabetBorderRadiusTest_static_001
     * @tc.level    Level.LEVEL0
     */
it('alphabetBorderRadiusTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[alphabetBorderRadiusTest_static_001] START');
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('alphabet_borderRadius');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[alphabetBorderRadiusTest_static_001] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('itemBorderRadius')).assertEqual('10.00vp');
      expect(obj.getElement('$attrs').getString('indexerBorderRadius')).assertEqual('14.00vp');
      console.info('[alphabetBorderRadiusTest_static_001] END');
      done();
    });


    
    /**
     * @tc.number   alphabetBorderRadiusTest_static_002
     * @tc.name     alphabetBorderRadiusTest_static_002
     * @tc.desc     alphabetBorderRadiusTest_static_002
     * @tc.level    Level.LEVEL0
     */
it('alphabetBorderRadiusTest_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[alphabetBorderRadiusTest_static_002] START');
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('alphabet_borderRadius');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[alphabetBorderRadiusTest_static_002] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('popupItemBorderRadius')).assertEqual('10.00vp');
      expect(obj.getElement('$attrs').getString('popupBorderRadius')).assertEqual('14.00vp');
      console.info('[alphabetBorderRadiusTest_static_002] END');
      done();
    });


    
    /**
     * @tc.number   alphabetBorderRadiusTest_static_003
     * @tc.name     alphabetBorderRadiusTest_static_003
     * @tc.desc     alphabetBorderRadiusTest_static_003
     * @tc.level    Level.LEVEL0
     */
it('alphabetBorderRadiusTest_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[alphabetBorderRadiusTest_static_003] START');
      await CommonFunc.sleep(1000);

      let indexerOffset = CommonFunc.getComponentRectOnScreen('alphabet_borderRadius2');
      let height = indexerOffset.bottom - indexerOffset.top;
      let width = indexerOffset.right - indexerOffset.left;
      console.info("alphabetBorderRadiusTest_static_003 value : width is" + width + " height is " + height);

      let strJson = inspector.getInspectorByKey('alphabet_borderRadius2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[alphabetBorderRadiusTest_static_003] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('itemBorderRadius')).assertEqual('16.00vp');
      console.info('[alphabetBorderRadiusTest_static_003] END');
      done();
    });


    
    /**
     * @tc.number   alphabetBorderRadiusTest_static_004
     * @tc.name     alphabetBorderRadiusTest_static_004
     * @tc.desc     alphabetBorderRadiusTest_static_004
     * @tc.level    Level.LEVEL0
     */
it('alphabetBorderRadiusTest_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[alphabetBorderRadiusTest_static_004] START');
      await CommonFunc.sleep(1000);

      let indexerOffset = CommonFunc.getComponentRectOnScreen('alphabet_borderRadius3');
      let height = indexerOffset.bottom - indexerOffset.top;
      let width = indexerOffset.right - indexerOffset.left;
      console.info("alphabetBorderRadiusTest_static_004 value : width is" + width + " height is " + height);

      let strJson = inspector.getInspectorByKey('alphabet_borderRadius3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[alphabetBorderRadiusTest_static_004] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('itemBorderRadius')).assertEqual('24.00vp');
      console.info('[alphabetBorderRadiusTest_static_004] END');
      done();
    });


    
    /**
     * @tc.number   alphabetBorderRadiusTest_static_005
     * @tc.name     alphabetBorderRadiusTest_static_005
     * @tc.desc     alphabetBorderRadiusTest_static_005
     * @tc.level    Level.LEVEL0
     */
it('alphabetBorderRadiusTest_static_005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[alphabetBorderRadiusTest_static_005] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('layout_indexer'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let indexerOffset = CommonFunc.getComponentRectOnScreen('alphabet_borderRadius2');
      let height = indexerOffset.bottom - indexerOffset.top;
      let width = indexerOffset.right - indexerOffset.left;
      console.info("alphabetBorderRadiusTest_static_005 value : width is" + width + " height is " + height);

      let strJson = inspector.getInspectorByKey('alphabet_borderRadius2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[alphabetBorderRadiusTest_static_005] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('itemBorderRadius')).assertEqual('16.00vp');
      console.info('[alphabetBorderRadiusTest_static_005] END');
      done();
    });


    
    /**
     * @tc.number   alphabetBorderRadiusTest_static_006
     * @tc.name     alphabetBorderRadiusTest_static_006
     * @tc.desc     alphabetBorderRadiusTest_static_006
     * @tc.level    Level.LEVEL0
     */
it('alphabetBorderRadiusTest_static_006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[alphabetBorderRadiusTest_static_006] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('layout_indexer'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let indexerOffset = CommonFunc.getComponentRectOnScreen('alphabet_borderRadius3');
      let height = indexerOffset.bottom - indexerOffset.top;
      let width = indexerOffset.right - indexerOffset.left;
      console.info("alphabetBorderRadiusTest_static_006 value : width is" + width + " height is " + height);

      let strJson = inspector.getInspectorByKey('alphabet_borderRadius3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[alphabetBorderRadiusTest_static_006] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('itemBorderRadius')).assertEqual('24.00vp');
      console.info('[alphabetBorderRadiusTest_static_006] END');
      done();
    });
  })
}
