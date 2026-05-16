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
import events_emitter from '@ohos.events.emitter';
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
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
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';

export default function OnChildTouchTestUndefinedTest() {
  describe('OnChildTouchTestUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("OnChildTouchTestUndefinedTest beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.common.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("OnChildTouchTestUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonMethod/onChildTouchTestUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get OnChildTouchTestUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("onChildTouchTestUndefined" == pages.name)) {
          console.info("get OnChildTouchTestUndefinedTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push OnChildTouchTestUndefined page error:" + err);
      }
      console.info("OnChildTouchTestUndefinedTest beforeEach end");

    });
    afterEach(async () => {
    });


    /**
     * @tc.number   OnChildTouchTestUndefinedTest_static_0100
     * @tc.name     OnChildTouchTestUndefinedTest_static_0100
     * @tc.desc     OnChildTouchTestUndefinedTest_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('OnChildTouchTestUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[OnChildTouchTestUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let myButton = await driver.findComponent(ON.id('MyButtonChildTouchTest'));
      await CommonFunc.sleep(1000);
      await (myButton?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyButtonChildTouchTest');
      let res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('label');
      expect(res).assertEqual('button');

      let changeBtn = await driver.findComponent(ON.id('Common_OnChildTouchTest'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (myButton?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('MyButtonChildTouchTest');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('label');
      expect(res).assertEqual('button1');
      await (changeBtn?.click() as Promise<void>);
      console.info('[OnChildTouchTestUndefinedTest_static_0100] END');
      done();
    });

  })
}
