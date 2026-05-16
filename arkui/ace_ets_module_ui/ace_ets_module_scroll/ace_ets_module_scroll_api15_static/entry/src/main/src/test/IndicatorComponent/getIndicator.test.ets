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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index";
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog'
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest, startAbility } from '../Util.test'

export default function getIndicator() {
  describe('getIndicator', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll15.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("getIndicator beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/IndicatorComponent/getIndicator",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get getIndicator state pages:" + JSON.stringify(pages));
        if (!("getIndicator" == pages.name)) {
          console.info("get getIndicator pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push getIndicator page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getIndicator page error:" + err);
      }
      console.info("getIndicator beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("getIndicator after each called");
    });


    
    /**
     * @tc.number   getIndicator_static_0100
     * @tc.name     getIndicator_static_0100
     * @tc.desc     getIndicator_static_0100
     * @tc.level    Level.LEVEL1
     */
it('getIndicator_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[getIndicator_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let strJson = inspector.getInspectorByKey('IndicatorComponent_1');
      console.info("[getIndicator_static_0100] component obj is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      console.info("[getIndicator_static_0100]: type: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$type')));
      console.info("[getIndicator_static_0100]: initialIndex: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('initialIndex')));
      console.info("[getIndicator_static_0100]: count: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('count')));
      console.info("[getIndicator_static_0100]: vertical: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('vertical')));
      console.info("[getIndicator_static_0100]: loop: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('loop')));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("IndicatorComponent");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('initialIndex')).assertEqual(0);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('count')).assertEqual(6);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('vertical')).assertEqual("true");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')).assertEqual("false");
      console.info('[getIndicator_static_0100] END');
      done();
    });
  })
}