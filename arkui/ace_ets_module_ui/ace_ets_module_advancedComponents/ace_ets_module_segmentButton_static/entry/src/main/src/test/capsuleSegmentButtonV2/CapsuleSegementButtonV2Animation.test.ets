'use static'
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
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  it,
  expect,
  Level,
  TestType,
  Size
} from "../../../../hypium/index";
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
import deviceInfo from "@ohos.deviceInfo"
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';

export default function CapsuleSegementButtonV2Animation() {
  describe('CapsuleSegementButtonV2Animation', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.arkui.ace.advanced.segmentButton.static", "EntryAbility")
    })
    beforeEach(async (): Promise<void> => {
      console.info("CapsuleSegementButtonV2Animation beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/capsuleSegmentButtonV2/CapsuleSegementButtonV2Animation",
      }
      try {
        const pageRouter = AppStorage.get<Router>("router") as Router
        pageRouter.clear();
        let pages = pageRouter.getState();
        console.info("get CapsuleSegementButtonV2Animation state pages: " + JSON.stringify(pages));
        if (!("CapsuleSegementButtonV2Animation" == pages.name)) {
          console.info("get CapsuleSegementButtonV2Animation state pages.name: " + JSON.stringify(pages.name));
          pageRouter.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push CapsuleSegementButtonV2Animation page error:" + err);
      }
      console.info("CapsuleSegementButtonV2Animation beforeEach end");
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("CapsuleSegementButtonV2Animation after each called");
    });

    /**
     * @tc.name   CapsuleSegementButtonV2Animation_001
     * @tc.number CapsuleSegementButtonV2Animation_001
     * @tc.desc   Test MultiSegmentButtonV2 selectedIndexes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CapsuleSegementButtonV2Animation_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[CapsuleSegementButtonV2Animation_001] START");
      const driver = Driver.create();
      await CommonFunc.sleep(1000);
      const button = await driver.findComponent(ON.id('true'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let textJ = inspector.getInspectorByKey('text');
      let text = JSON.parseJsonElement(textJ);

      expect(text.getElement('$attrs').getString('content')).assertEqual('true');
      console.log("[CapsuleSegementButtonV2Animation_001] END");
      done();
    })
  })
}