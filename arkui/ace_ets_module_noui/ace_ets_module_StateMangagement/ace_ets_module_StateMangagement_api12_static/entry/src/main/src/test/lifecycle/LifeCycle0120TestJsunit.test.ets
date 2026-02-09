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
import { UIElementInfo } from '@ohos.UiTest';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function LifeCycle0120TestJsunit() {
  describe('LifeCycle0120TestJsunit', () => {

    beforeAll(() => {
      console.info("LifeCycle0120TestJsunit beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("LifeCycle0120TestJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/lifecycle/LifeCycle0120",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get LifeCycle0120TestJsunit state pages:" + JSON.stringify(pages));
        if (!("LifeCycle0120TestJsunit" == pages.name)) {
          console.info("get LifeCycle0120TestJsunit pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push LifeCycle0120TestJsunit page error:" + err);
      }
      console.info("LifeCycle0120TestJsunit beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("LifeCycle0120TestJsunit after each called");
    });

    
    
    /**
     * @tc.number   LifeCycle0120TestJsunit_static_001
     * @tc.name     LifeCycle0120TestJsunit_static_001
     * @tc.desc     LifeCycle0120TestJsunit_static_001
     * @tc.level    Level.LEVEL0
     */
it('LifeCycle0120TestJsunit_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[LifeCycle0120TestJsunit_static_001] START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('tvLifeCycle0120Page');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[LifeCycle0050TestJsunit_001] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('onPageShow');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component|null = await driver.findComponent(ON.id("btnLifeCycle0120Back"));
      await CommonFunc.sleep(1000);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let observer1 =  driver.createUIEventObserver()
      let callback1 = (UiElementInfo : UIElementInfo) => {
        try {
          console.info('UIElementInfo bundleName:'+ UiElementInfo.bundleName)
          console.info('UIElementInfo text:'+ UiElementInfo.text)
          console.info('UIElementInfo type:'+ UiElementInfo.type)
          expect(UiElementInfo.bundleName == 'com.arkui.ace.StateMangagement.api12').assertTrue()
          expect(UiElementInfo.text == 'onPageHide').assertTrue()
          expect(UiElementInfo.type == 'Toast').assertTrue()
        } catch (err) {
          console.info(err)
        }
      }
      observer1.onceToastShow(callback1)
      console.info('[LifeCycle0120TestJsunit_static_001] END');
      done();
    });
  })
}
