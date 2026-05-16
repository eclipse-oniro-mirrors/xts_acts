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


export default function overlayUndefined() {
  describe('overlayUndefined', () => {
    beforeAll(async (): Promise<void> => {
      console.info("overlayUndefined beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.common.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("overlayUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonMethod/overlayUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get overlayUndefined state pages:" + JSON.stringify(pages));
        if (!("overlayUndefined" == pages.name)) {
          console.info("get overlayUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push overlayUndefined page error:" + err);
      }
      console.info("overlayUndefined beforeEach end");

    });
    afterEach(async () => {
    });


    /**
     * @tc.number   overlayUndefined_static_0001
     * @tc.name     overlayUndefined_static_0001
     * @tc.desc     test overlay
     * @tc.level    Level.LEVEL1
     */
    it('overlayUndefined_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[overlayUndefined_static_0001] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('overlay_image');
      let res = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('overlay').getString('title');
      expect(res).assertEqual('');

      let changeBtn = await driver.findComponent(ON.id('overlay_btn1'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000)

      strJson = inspector.getInspectorByKey('overlay_image');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('overlay').getString('title');
      expect(res).assertEqual('Overlay...');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('overlay_image');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('overlay').getString('title');
      expect(res).assertEqual('');
      console.info('[overlayUndefined_static_0001] END');
      done();
    });

  })
}