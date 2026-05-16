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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, MouseButton, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import text from "@ohos.graphics.text"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import { UIContext,Router } from '@ohos.arkui.UIContext';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest,  startAbility} from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function styledStringAddApi() {
  describe('styledStringAddApi', () => {

    beforeAll(() => {
      console.info("styledStringAddApi beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("styledStringAddApi beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/styledStringAddApi",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get styledStringAddApi state pages:" + JSON.stringify(pages));
        if (!("styledStringAddApi" == pages.name)) {
          console.info("get styledStringAddApi pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push styledStringAddApi page error:" + err);
      }
      console.info("styledStringAddApi beforeEach end");
    }); 

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("styledStringAddApi after each called");
    });

    

    /**
     * @tc.number   styledStringAddApi_static_001
     * @tc.name     styledStringAddApi_static_001
     * @tc.desc     styledStringAddApi_static_001
     * @tc.level   Level.LEVEL0
     */
    it('styledStringAddApi_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[styledStringAddApi_001] START');
      let driver = Driver.create();
      let text = await (driver.findComponent(ON.id('styledStringAddApi')) as Promise<Component>);
      await CommonFunc.sleep(1000);
      await text.inputText('0');

      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('styledStringText');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[styledStringAddApi_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getString('content')).assertEqual('0');
      console.info('[styledStringAddApi_001] END');
      done();
    });

    /**
     * @tc.number   styledStringAddApi_static_002
     * @tc.name     styledStringAddApi_static_002
     * @tc.desc     styledStringAddApi_static_002
     * @tc.level   Level.LEVEL3
     */
    it('styledStringAddApi_static_002', Level.LEVEL3, async () => {
      let msg = 'testPositionWithAffinity'
      console.info(msg + 'begin');
      try {
        let positionWithAffinity: text.PositionWithAffinity = {
          position: 20,
          affinity: text.Affinity.UPSTREAM
        } as text.PositionWithAffinity
      } catch (err) {
        console.info(msg + 'test PositionWithAffinity error ' + JSON.stringify(err));
        expect().assertFail();
      }
    })




  })
}
