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

import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import Utils  from "../../../ets/MainAbility/common/Utils";

export default function radioJsunit2() {
  describe('radioJsunit2', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.picker.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Radio/radio2',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get radio state pages:" + JSON.stringify(pages));
        if (!("radio2" == pages.name)) {
          console.info("get radio pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push radio page error " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("radio after each called");
    });

    
    /**
     * @tc.number   testRadio_100
     * @tc.name     testRadio_100
     * @tc.desc     testRadio_100
     * @tc.level    Level.LEVEL1
     */
it('testRadio_100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testRadio_100] START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('radio1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("testRadio_100_component obj is: " + JSON.stringify(obj));
      console.info("testRadio_100_obj.getElement('$attrs').getString(value): " + obj.getElement('$attrs').getString('value'));
      expect(obj.getString('$type')).assertEqual('Radio');
      expect(obj.getElement('$attrs').getString('checked')).assertEqual('true');
      console.info('testRadio_100 END');
      done();
    });

    
    /**
     * @tc.number   testRadio_200
     * @tc.name     testRadio_200
     * @tc.desc     testRadio_200
     * @tc.level    Level.LEVEL1
     */
it('testRadio_200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testRadio_200] START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('radio2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("testRadio_200_component obj is: " + JSON.stringify(obj));
      expect(obj.getString('$type')).assertEqual('Radio');
      expect(obj.getElement('$attrs').getString('checked')).assertEqual('false');
      console.info('testRadio_200 END');
      done();
    });

    
    /**
     * @tc.number   testRadio_300
     * @tc.name     testRadio_300
     * @tc.desc     testRadio_300
     * @tc.level    Level.LEVEL1
     */
it('testRadio_300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testRadio_300] START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('radio3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("testRadio_300_component obj is: " + JSON.stringify(obj));
      expect(obj.getString('$type')).assertEqual('Radio');
      expect(obj.getElement('$attrs').getString('checked')).assertEqual('false');
      console.info('testRadio_300 END');
      done();
    });
  })
}