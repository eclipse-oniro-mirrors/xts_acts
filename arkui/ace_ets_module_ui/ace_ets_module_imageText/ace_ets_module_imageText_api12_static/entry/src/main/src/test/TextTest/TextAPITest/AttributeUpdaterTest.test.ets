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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../../hypium/index';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from "@ohos.UiTest";
import router from "@ohos.router";
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { UIContext,Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest,  startAbility} from '../../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function AttributeUpdaterTest() {
  describe("AttributeUpdaterTest", () => {
    beforeAll(() => {
      console.info("AttributeUpdaterTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("AttributeUpdaterTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/TextAPI/AttributeUpdater",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get AttributeUpdaterTest state pages:" + JSON.stringify(pages));
        if (!("AttributeUpdater" == pages.name)) {
          console.info("get AttributeUpdaterTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push AttributeUpdaterTest page error:" + err);
      }
      console.info("AttributeUpdaterTest beforeEach end");
    }); 

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("AttributeUpdaterTest after each called");
    });

    /**
     * @tc.number   AttributeUpdaterTest_static_001
     * @tc.name     AttributeUpdaterTest_static_001
     * @tc.desc     AttributeUpdaterTest_static_001
     * @tc.level   Level.LEVEL0
     */
    it("AttributeUpdaterTest_static_001", Level.LEVEL0, (done: () => void): Promise<void> => {
      console.info("[AttributeUpdaterTest_001] START");
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn = await (driver.findComponent(ON.id("text")) as Promise<Component>);
      await btn.click();
      await CommonFunc.sleep(1500);
      let text = inspector.getInspectorByKey("text");
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(text).getElement('$attrs').getString('content')).assertEqual("Updated");
      console.info("[AttributeUpdaterTest_001] END");
      done();
    });
  })
}
