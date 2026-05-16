'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
  expect,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,Level
} from '../../../../hypium/index';
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function Extend0010TestJsunit() {
  describe('Extend0010TestJsunit', () => {

    beforeAll(() => {
      console.info("Extend0010TestJsunit beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("Extend0010TestJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Extend/Extend0010",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Extend0010TestJsunit state pages:" + JSON.stringify(pages));
        if (!("Extend0010TestJsunit" == pages.name)) {
          console.info("get Extend0010TestJsunit pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Extend0010TestJsunit page error:" + err);
      }
      console.info("Extend0010TestJsunit beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Extend0010TestJsunit after each called");
    });

    
    
    /**
     * @tc.number   Extend0010TestJsunit_static_001
     * @tc.name     Extend0010TestJsunit_static_001
     * @tc.desc     Extend0010TestJsunit_static_001
     * @tc.level    Level.LEVEL0
     */
it('Extend0010TestJsunit_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Extend0010TestJsunit_static_001] START');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey('tv_extend0010Id'));
      console.info('[Extend0010TestJsunit_static_001] component obj background is: ' +
      JSON.stringify(obj.getElement('$attrs').getString('backgroundColor')));
      console.info("[Extend0010TestJsunit_static_001] component obj width is: " + JSON.stringify(obj.getElement('$attrs').getString('width')));
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual("100");
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF0000FF');
      console.info('[Extend0010TestJsunit_static_001] END');
      let obj1 = JSON.parseJsonElement(inspector.getInspectorByKey('tv_extend0020Id'));
      console.info('[Extend0010TestJsunit_static_001] component obj1 background is: ' +
      JSON.stringify(obj1.getElement('$attrs').getString('backgroundColor')));
      console.info("[Extend0010TestJsunit_static_001] component obj1 width is: " + JSON.stringify(obj1.getElement('$attrs').getString('width')));
      expect(obj1.getElement('$attrs').getString('fontWeight')).assertEqual("200");
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFFC0CB');
      console.info('[Extend0010TestJsunit_static_001] END');
      let obj2 = JSON.parseJsonElement(inspector.getInspectorByKey('tv_extend0030Id'));
      console.info('[Extend0010TestJsunit_static_001] component obj2 background is: ' +
      JSON.stringify(obj2.getElement('$attrs').getString('backgroundColor')));
      console.info("[Extend0010TestJsunit_static_001] component obj2 width is: " + JSON.stringify(obj2.getElement('$attrs').getString('width')));
      expect(obj2.getElement('$attrs').getString('fontWeight')).assertEqual("300");
      expect(obj2.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFFA500');
      console.info('[Extend0010TestJsunit_static_001] END');
      done();
    });
  })
}
