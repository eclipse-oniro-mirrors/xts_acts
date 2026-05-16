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
  PointerMatrix,
  Point
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


export default function dragControlUndefined() {
  describe('dragControlUndefined', () => {
    beforeAll(async (): Promise<void> => {
      console.info("dragControlUndefined beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.common.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("dragControlUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonMethod/dragControlUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get dragControlUndefined state pages:" + JSON.stringify(pages));
        if (!("dragControlUndefined" == pages.name)) {
          console.info("get dragControlUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push dragControlUndefined page error:" + err);
      }
      console.info("dragControlUndefined beforeEach end");

    });
    afterEach(async () => {
    });


    /**
     * @tc.number   dragControlUndefined_static_0001
     * @tc.name     dragControlUndefined_static_0001
     * @tc.desc     test allowDrop value to undefined
     * @tc.level    Level.LEVEL1
     */
    it('dragControlUndefined_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[dragControlUndefined_static_0001] START');
      let driver: Driver = Driver.create();
      let resetBtn = await driver.findComponent(ON.id('DC_resetBtn'));
      await (resetBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let image = await driver.findComponent(ON.id('DC_image2'));
      await CommonFunc.sleep(500);
      let row = await driver.findComponent(ON.id('DC_dropRow1')) as Component;
      await CommonFunc.sleep(500);
      await (image?.dragTo(row) as Promise<void>);
      await CommonFunc.sleep(500);
      let text = await driver.findComponent(ON.id('DC_text2'));
      expect(await (text?.getText() as Promise<string>)).assertEqual('allowDrop1');// undefined

      let changeBtn = await driver.findComponent(ON.id('DC_btn3'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      await (resetBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await (image?.dragTo(row) as Promise<void>);
      await CommonFunc.sleep(500);
      expect(await (text?.getText() as Promise<string>)).assertEqual('hello');// value

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await (image?.dragTo(row) as Promise<void>);
      await CommonFunc.sleep(500);
      expect(await (text?.getText() as Promise<string>)).assertEqual('allowDrop1'); // undefined
      console.info('[dragControlUndefined_static_0001] END');
      done();
    });


    /**
     * @tc.number   dragControlUndefined_static_0002
     * @tc.name     dragControlUndefined_static_0002
     * @tc.desc     test allowDrop null to undefined
     * @tc.level    Level.LEVEL1
     */
    it('dragControlUndefined_static_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[dragControlUndefined_static_0001] START');
      let driver: Driver = Driver.create();
      let resetBtn = await driver.findComponent(ON.id('DC_resetBtn'));
      await (resetBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let image = await driver.findComponent(ON.id('DC_image2'));
      await CommonFunc.sleep(500);
      let row = await driver.findComponent(ON.id('DC_dropRow2')) as Component;
      await CommonFunc.sleep(500);
      await (image?.dragTo(row) as Promise<void>);
      await CommonFunc.sleep(500);
      let text = await driver.findComponent(ON.id('DC_text2'));
      expect(await (text?.getText() as Promise<string>)).assertEqual('allowDrop2');// undefined

      let changeBtn = await driver.findComponent(ON.id('DC_btn4'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      await (resetBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await (image?.dragTo(row) as Promise<void>);
      await CommonFunc.sleep(500);
      // value
      expect(await (text?.getText() as Promise<string>)).assertEqual('hello');// null

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await (image?.dragTo(row) as Promise<void>);
      await CommonFunc.sleep(500);

      expect(await (text?.getText() as Promise<string>)).assertEqual('allowDrop2'); // undefined
      console.info('[dragControlUndefined_static_0001] END');
      done();
    });

    /**
     * @tc.number   dragControlUndefined_static_0003
     * @tc.name     dragControlUndefined_static_0003
     * @tc.desc     test dragControlUndefined_static_0003 null to undefined
     * @tc.level    Level.LEVEL1
     */
    it('dragControlUndefined_static_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[dragControlUndefined_static_0003] START');
      let driver: Driver = Driver.create();
      let resetBtn = await driver.findComponent(ON.id('DC_resetBtn'));
      await (resetBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let image = await driver.findComponent(ON.id('DC_image1'));
      await (image?.longClick() as Promise<void>);
      await CommonFunc.sleep(500);
      let text = await driver.findComponent(ON.id('DC_text1'));
      expect(await (text?.getText() as Promise<string>)).assertEqual('hello');

      let changeBtn = await driver.findComponent(ON.id('DC_btn1'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      await (image?.longClick() as Promise<void>);
      await CommonFunc.sleep(500);
      expect(await (text?.getText() as Promise<string>)).assertEqual('dragPreview');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      await (resetBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await (image?.longClick() as Promise<void>);
      await CommonFunc.sleep(500);
      expect(await (text?.getText() as Promise<string>)).assertEqual('hello');
      console.info('[dragControlUndefined_static_0003] END');
      done();
    });
  })
}