'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import { Component, Driver, ON, UiWindow } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { AppStorage } from '@ohos.arkui.stateManagement'
import {
  Button,
  ButtonAttribute,
  ClickEvent,
  Column,
  Entry,
  Image,
  ImageFit,
  Scroller,
  Text,
  TextAttribute,
} from '@ohos.arkui.component'
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { startAbility, UtilsTest } from '../Util.test.ets';
import { UtilsTest } from '../Util.test';

export default function waterFlowEmptyLazy() {

  describe('waterFlowEmptyLazy', () => {
    beforeAll(async (): Promise<void> => {
      console.info("waterFlowEmptyLazy beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.scroll.api24.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("waterFlowEmptyLazy beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/WaterFlow/waterFlowEmptyLazy",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get waterFlowEmptyLazy state pages:" + JSON.stringify(pages));
        if (!("waterFlowEmptyLazy" == pages.name)) {
          console.info("get waterFlowEmptyLazy pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
        }
      } catch (err) {
        console.error("push waterFlowEmptyLazy page error:" + err);
      }
      console.info("waterFlowEmptyLazy beforeEach end");
    });


    // ============================================================
    // WaterFlowAttribute.supportEmptyBranchInLazyLoading
    // ============================================================
    /**
     * @tc.name   waterFlowEmptyLazy_0100
     * @tc.number SUB_ARKUI_WATERFLOW_SUPPORTEMPTYBRANCHINLAZYLOADING_0100
     * @tc.desc   Test supportEmptyBranchInLazyLoading of the WaterFlow set true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('waterFlowEmptyLazy_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[waterFlowEmptyLazy_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('waterFlow_emptyLazy_true');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[waterFlowEmptyLazy_0100]supportEmptyBranchInLazyLoading:" +
        JSON.stringify(obj.getElement('$attrs').getBoolean('supportEmptyBranchInLazyLoading')));
      await CommonFunc.sleep(500);
      expect(obj.getElement('$attrs').getBoolean('supportEmptyBranchInLazyLoading')).assertEqual(true);
      console.info('[waterFlowEmptyLazy_0100] END');
      done();
    });

    /**
     * @tc.name   waterFlowEmptyLazy_0200
     * @tc.number SUB_ARKUI_WATERFLOW_SUPPORTEMPTYBRANCHINLAZYLOADING_0200
     * @tc.desc   Test supportEmptyBranchInLazyLoading of the WaterFlow set false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('waterFlowEmptyLazy_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[waterFlowEmptyLazy_0200] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('waterFlow_emptyLazy_false');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[waterFlowEmptyLazy_0200]supportEmptyBranchInLazyLoading:" +
         JSON.stringify(obj.getElement('$attrs').getBoolean('supportEmptyBranchInLazyLoading')));
      await CommonFunc.sleep(500);
      expect(obj.getElement('$attrs').getBoolean('supportEmptyBranchInLazyLoading')).assertEqual(false);
      console.info('[waterFlowEmptyLazy_0200] END');
      done();
    });

    /**
     * @tc.name   waterFlowEmptyLazy_0300
     * @tc.number SUB_ARKUI_WATERFLOW_SUPPORTEMPTYBRANCHINLAZYLOADING_0400
     * @tc.desc   Test supportEmptyBranchInLazyLoading of the WaterFlow set undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('waterFlowEmptyLazy_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[waterFlowEmptyLazy_0300] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('waterFlow_emptyLazy_undefined');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[waterFlowEmptyLazy_0300]supportEmptyBranchInLazyLoading:" +
        JSON.stringify(obj.getElement('$attrs').getBoolean('supportEmptyBranchInLazyLoading')));
      await CommonFunc.sleep(500);
      expect(obj.getElement('$attrs').getBoolean('supportEmptyBranchInLazyLoading')).assertEqual(false);
      console.info('[waterFlowEmptyLazy_0300] END');
      done();
    });
  });
}