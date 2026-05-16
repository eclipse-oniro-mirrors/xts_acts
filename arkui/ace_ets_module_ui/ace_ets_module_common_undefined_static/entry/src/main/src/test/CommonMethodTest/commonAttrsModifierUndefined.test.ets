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

export default function CommonAttrsModifierUndefinedTest() {
  describe('CommonAttrsModifierUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("CommonAttrsModifierUndefinedTest beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.common.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("CommonAttrsModifierUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonMethod/commonAttrsModifierUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get CommonAttrsModifierUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("commonAttrsModifierUndefined" == pages.name)) {
          console.info("get CommonAttrsModifierUndefinedTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push CommonAttrsModifierUndefinedTest page error:" + err);
      }
      console.info("CommonAttrsModifierUndefinedTest beforeEach end");

    });
    afterEach(async () => {
    });


    /**
     * @tc.number   CommonAttrsModifierUndefinedTest_static_0100
     * @tc.name     CommonAttrsModifierUndefinedTest_static_0100
     * @tc.desc     CommonAttrsModifierUndefinedTest_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('CommonAttrsModifierUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[CommonAttrsModifierUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyColumnModifier');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('backgroundImageResizable')))
        .assertEqual('\"ImageResizableSlice: {left: 8.00vp, right: 8.00vp, top: 8.00vp, bottom: 8.00vp}\"');

      let changeBtn = await driver.findComponent(ON.id('Common_BackgroundImageResizable'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('MyColumnModifier');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('backgroundImageResizable')))
        .assertContain('0.00');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[CommonAttrsModifierUndefinedTest_static_0100] END');
      done();
    });
    /**
     * @tc.number   CommonAttrsModifierUndefinedTest_static_0200
     * @tc.name     CommonAttrsModifierUndefinedTest_static_0200
     * @tc.desc     CommonAttrsModifierUndefinedTest_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('CommonAttrsModifierUndefinedTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[CommonAttrsModifierUndefinedTest_static_0200] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyColumnModifier');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('hoverEffect')))
        .assertEqual('\"HoverEffect.Scale\"');

      let changeBtn = await driver.findComponent(ON.id('Common_HoverEffect'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('MyColumnModifier');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('hoverEffect')))
        .assertEqual('\"HoverEffect.Auto\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[CommonAttrsModifierUndefinedTest_static_0200] END');
      done();
    });
    /**
     * @tc.number   CommonAttrsModifierUndefinedTest_static_0300
     * @tc.name     CommonAttrsModifierUndefinedTest_static_0300
     * @tc.desc     CommonAttrsModifierUndefinedTest_static_0300
     * @tc.level    Level.LEVEL1
     */
    it('CommonAttrsModifierUndefinedTest_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[CommonAttrsModifierUndefinedTest_static_0300] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyColumnModifier');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('backgroundImageSize')))
        .assertEqual('\"ImageSize.Cover\"');

      let changeBtn = await driver.findComponent(ON.id('Common_BackgroundImageSize'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('MyColumnModifier');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('backgroundImageSize')))
        .assertEqual('\"ImageSize.Auto\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[CommonAttrsModifierUndefinedTest_static_0300] END');
      done();
    });
    /**
     * @tc.number   CommonAttrsModifierUndefinedTest_static_0400
     * @tc.name     CommonAttrsModifierUndefinedTest_static_0400
     * @tc.desc     CommonAttrsModifierUndefinedTest_static_0400
     * @tc.level    Level.LEVEL1
     */
    it('CommonAttrsModifierUndefinedTest_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[CommonAttrsModifierUndefinedTest_static_0400] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyColumnModifier');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('hitTestBehavior')))
        .assertEqual('\"HitTestMode.Block\"');

      let changeBtn = await driver.findComponent(ON.id('Common_HitTestBehavior'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('MyColumnModifier');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('hitTestBehavior')))
        .assertEqual('\"HitTestMode.Default\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[CommonAttrsModifierUndefinedTest_static_0400] END');
      done();
    });

    /**
     * @tc.number   CommonAttrsModifierUndefinedTest_static_0500
     * @tc.name     CommonAttrsModifierUndefinedTest_static_0500
     * @tc.desc     CommonAttrsModifierUndefinedTest_static_0500
     * @tc.level    Level.LEVEL1
     */
    it('CommonAttrsModifierUndefinedTest_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[CommonAttrsModifierUndefinedTest_static_0500] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let myButton = await driver.findComponent(ON.id('MyButton'));
      await CommonFunc.sleep(1000);
      await (myButton?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyButton');
      let res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('label');
      expect(res).assertEqual('click:1');

      let changeBtn = await driver.findComponent(ON.id('Common_OnClick'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (myButton?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('MyButton');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('label');
      expect(res).assertEqual('click:1');
      await (changeBtn?.click() as Promise<void>);
      console.info('[CommonAttrsModifierUndefinedTest_static_0500] END');
      done();
    });

  })
}
