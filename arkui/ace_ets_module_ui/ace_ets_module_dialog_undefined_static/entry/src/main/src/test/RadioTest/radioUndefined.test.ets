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

import events_emitter from '@ohos.events.emitter';
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix,
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';
import type { KeyCode } from '@ohos.multimodalInput.keyCode';

export default function radioUndefined() {
  describe('radioUndefined', () => {
    beforeAll(async ():Promise<void> => {
      console.info("radioUndefined beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.dialog.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("radioUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Radio/radioUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get radioUndefined state pages:" + JSON.stringify(pages));
        if (!("radioUndefined" == pages.name)) {
          console.info("get radioUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push radioUndefined page error:" + err);
      }
      console.info("radioUndefined beforeEach end");

    });
    afterEach(async () => {
    });

    /**
     * @tc.number   radioUndefined_static_0001
     * @tc.name     radioUndefined_static_0001
     * @tc.desc     test checked
     * @tc.level    Level.LEVEL1
     */
    it('radioUndefined_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[radioUndefined_static_0001] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('Radio_1');
      console.info("[radioUndefined_static_0001] checked: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('checked'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('checked'))
        .assertEqual('false');

      let changeBtn = await driver.findComponent(ON.id('Radio_btn1'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('Radio_1');
      console.info("[radioUndefined_static_0001] checked: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('checked'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('checked'))
        .assertEqual('true');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('Radio_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('checked'))
        .assertEqual('false');
      console.info('[radioUndefined_static_0001] END');
      done();
    });

    /**
     * @tc.number   radioUndefined_static_0002
     * @tc.name     radioUndefined_static_0002
     * @tc.desc     test radioStyle
     * @tc.level    Level.LEVEL1
     */
    it('radioUndefined_static_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[radioUndefined_static_0002] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('Radio_1');
      let radioStyle = JSON.parseJsonElement(strJson).getElement('$attrs').getString('radioStyle');
      console.info("[radioUndefined_static_0002] radioStyle: " + radioStyle);

      let changeBtn = await driver.findComponent(ON.id('Radio_btn2'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('Radio_1');
      console.info("[radioUndefined_static_0002] radioStyle: " +
        JSON.parseJsonElement(strJson).getElement('$attrs').getString('radioStyle'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('radioStyle')).assertContain('#FFFF00FF');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('Radio_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('radioStyle')).assertEqual(radioStyle);
      console.info('[radioUndefined_static_0002] END');
      done();
    });

    /**
     * @tc.number   radioUndefined_static_0003
     * @tc.name     radioUndefined_static_0003
     * @tc.desc     test onChange
     * @tc.level    Level.LEVEL1
     */
    it('radioUndefined_static_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[radioUndefined_static_0003] START');
      let driver: Driver = Driver.create();

      let changeBtn1 = await driver.findComponent(ON.id('Radio_btn1'));
      await (changeBtn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('Radio_text'));
      expect(await (text?.getText() as Promise<string>)).assertEqual('change:0');

      let changeBtn = await driver.findComponent(ON.id('Radio_btn3'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (changeBtn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<string>)).assertEqual('change:1');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (changeBtn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<string>)).assertEqual('change:1');
      done();
    });

    /**
     * @tc.number   radioUndefined_static_0004
     * @tc.name     radioUndefined_static_0004
     * @tc.desc     test keyboardAppearance
     * @tc.level    Level.LEVEL1
     */
    it('radioUndefined_static_0004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[radioUndefined_static_0004] START');
      let driver: Driver = Driver.create();

      let circle = await driver.findComponent(ON.id('Radio_Circle'));
      expect(circle === null).assertTrue();

      let changeBtn = await driver.findComponent(ON.id('Radio_btn4'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      circle = await driver.findComponent(ON.id('Radio_Circle'));
      expect(circle !== null).assertTrue();


      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      circle = await driver.findComponent(ON.id('Radio_Circle'));
      expect(circle === null).assertTrue();
      console.info('[radioUndefined_static_0004] END');
      done();
    });
  })
}