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
import { KeyCode } from '@ohos.multimodalInput.keyCode';

export default function onHoverUndefined() {
  describe('onHoverUndefined', () => {
    beforeAll(async (): Promise<void> => {
      console.info("onHoverUndefined beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.common.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("onHoverUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonMethod/onHoverUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get onHoverUndefined state pages:" + JSON.stringify(pages));
        if (!("onHoverUndefined" == pages.name)) {
          console.info("get onHoverUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push onHoverUndefined page error:" + err);
      }
      console.info("onHoverUndefined beforeEach end");

    });
    afterEach(async () => {
    });


    /**
     * @tc.number   onHoverUndefined_static_0001
     * @tc.name     onHoverUndefined_static_0001
     * @tc.desc     test onHover
     * @tc.level    Level.LEVEL1
     */
    it('onHoverUndefined_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[onHoverUndefined_static_0001] START');
      let driver: Driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('hover_btn1'));
      await CommonFunc.sleep(500);
      let point: Point = await (btn1?.getBoundsCenter() as Promise<Point>);

      let changeBtn = await driver.findComponent(ON.id('hover_btn2'));
      let point1: Point = await (changeBtn?.getBoundsCenter() as Promise<Point>);
      await driver.mouseMoveTo(point);
      await CommonFunc.sleep(500);
      await driver.mouseMoveTo(point1);
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('hover_btn1');
      let res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('label');
      expect(res).assertEqual('hover:0');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await driver.mouseMoveTo(point);
      await CommonFunc.sleep(500);
      await driver.mouseMoveTo(point1);
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('hover_btn1');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('label');
      expect(res).assertEqual('hover:2');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await driver.mouseMoveTo(point);
      await CommonFunc.sleep(500);
      strJson = inspector.getInspectorByKey('hover_btn1');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('label');
      expect(res)
        .assertEqual('hover:2');
      console.info('[onHoverUndefined_static_0001] END');
      done();
    });
  })
}