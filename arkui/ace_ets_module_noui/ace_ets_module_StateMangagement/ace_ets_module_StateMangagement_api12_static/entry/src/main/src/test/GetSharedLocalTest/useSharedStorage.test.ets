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
import { $r } from '@ohos.arkui.component';
import resourceManager from '@ohos.resourceManager';
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function useSharedStorageTest() {
  describe('useSharedStorageTest', () => {
    beforeAll(async () => {


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/GetSharedLocal/useSharedStorage',
      }
      try {
        const useSharedStorageTest = AppStorage.get<Router>("router") as Router
        useSharedStorageTest.clear();
        let pages = useSharedStorageTest.getState();
        console.info("get useSharedStorageTest state success " + JSON.stringify(pages));
        if (!("useSharedStorageTest" == pages.name)) {
          console.info("get useSharedStorageTest state success " + JSON.stringify(pages.name));
          // let result = await useSharedStorageTest.pushUrl(options);
          useSharedStorageTest.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push useSharedStorageTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push useSharedStorageTest page error: " + err);
      }
    });


    
    
    /**
     * @tc.number   useSharedStorageTest_static_0100
     * @tc.name     useSharedStorageTest_static_0100
     * @tc.desc     useSharedStorageTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('useSharedStorageTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('useSharedStorageTest_static_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('useSharedStorage_1');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[useSharedStorageTest_static_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('propBM:40');
      console.info('[useSharedStorageTest_static_0100] END');
      done();
    });
  })
}

