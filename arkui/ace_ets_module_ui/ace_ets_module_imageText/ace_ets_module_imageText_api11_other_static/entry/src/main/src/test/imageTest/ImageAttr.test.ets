'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import router from '@ohos.router';
import window from '@ohos.window';
import events_emitter from '@ohos.events.emitter';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  TestType,
  Size
} from "../../../../hypium/index"
import {
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
import { AppStorage } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';

export default function ImageAttr() {
  describe('ImageAttr', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("ImageAttr beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/image/ImageAttr',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ImageAttr state pages:" + JSON.stringify(pages));
        if (!("ImageAttr" == pages.name)) {
          console.info("get ImageAttr pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ImageAttr page result:" + JSON.stringify(result));
        }

      } catch (err) {
        console.error("push ImageAttr page error: " + err);
      }

    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ImageAttr after each called");
    });

    
    
/**
     * @tc.number   ImageAttr_static_001
     * @tc.name     ImageAttr_static_001
     * @tc.desc     ImageAttr_static_001
     * @tc.level    Level.LEVEL2
     */
it('ImageAttr_static_001', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ImageAttr_static_001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('changeTop'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('changeBottom'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('top_test');
      await CommonFunc.sleep(200);
      let obj1 = JSON.parseJsonElement(strJson1);
      await CommonFunc.sleep(1000);
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('30');
      let strJson2 = inspector.getInspectorByKey('bottom_test');
      await CommonFunc.sleep(200);
      let obj2 = JSON.parseJsonElement(strJson2);
      await CommonFunc.sleep(1000);
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('0');
      console.info('[ImageAttr_static_001] END');
      done();
    });

    
    
/**
     * @tc.number   ImageAttr_static_002
     * @tc.name     ImageAttr_static_002
     * @tc.desc     ImageAttr_static_002
     * @tc.level    Level.LEVEL2
     */
it('ImageAttr_static_002', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ImageAttr_static_002] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create()

      let button2 = await driver.findComponent(ON.id('changeleft'));
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let button3 = await driver.findComponent(ON.id('changeright'));
      await (button3?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson3 = inspector.getInspectorByKey('left_test');
      await CommonFunc.sleep(200);
      let obj3 = JSON.parseJsonElement(strJson3);
      await CommonFunc.sleep(1000);
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('30');

      let strJson4 = inspector.getInspectorByKey('right_test');
      await CommonFunc.sleep(200);
      let obj4 = JSON.parseJsonElement(strJson4);
      await CommonFunc.sleep(1000);
      expect(obj4.getElement('$attrs').getString('content')).assertEqual('0');

      console.info('[ImageAttr_static_002] END');
      done();
    });
  })
}


