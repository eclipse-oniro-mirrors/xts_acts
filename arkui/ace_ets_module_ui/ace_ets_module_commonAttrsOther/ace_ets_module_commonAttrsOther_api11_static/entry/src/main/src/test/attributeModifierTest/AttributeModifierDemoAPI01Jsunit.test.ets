'use static';
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  Point,
  PointerMatrix,
  Rect,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Callback, MessageManager } from '../../../ets/MainAbility/utils/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import display from '@ohos.display'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import { UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: String = 'testTag';
let testAbilityContext: common.UIAbilityContext;


export default function AttributeModifierDemoAPI01Jsunit() {
  describe('AttributeModifierDemoAPI01Jsunit', () => {
    beforeAll(async (): Promise<void> => {
      console.info("AttributeModifierDemoAPI01Jsunit beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.commonAttrsOther.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("AttributeModifierDemoAPI01Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/attributeModifier/AttributeModifierDemoAPI01',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get AttributeModifierDemoAPI01Jsunit state pages:" + JSON.stringify(pages));
        if (!("AttributeModifierDemoAPI01" == pages.name)) {
          console.info("get AttributeModifierDemoAPI01Jsunit pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push AttributeModifierDemoAPI01Jsunit page error:" + err);
      }
      console.info("AttributeModifierDemoAPI01Jsunit beforeEach end");
    });

    
    /**
     * @tc.number   AttributeModifierDemoAPI01Jsunit_static_0100
     * @tc.name     AttributeModifierDemoAPI01Jsunit_static_0100
     * @tc.desc     AttributeModifierDemoAPI01Jsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('AttributeModifierDemoAPI01Jsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('AttributeModifierDemoAPI01Jsunit_static_0100 START');

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('AttributeModifierDemoAPI01EnabledButton'));
      await CommonFunc.sleep(1000);
      await (btn1?.click() as Promise<void>);
      console.log('test start btn1 click after')
      await CommonFunc.sleep(1000);

      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.id('AttributeModifierDemoAPI01isDark'));
      await CommonFunc.sleep(1000);
      await (btn2?.click() as Promise<void>);
      console.log('test start btn2 click after')
      await CommonFunc.sleep(4000);

      let strcontent = inspector.getInspectorByKey('AttributeModifierDemoAPI01Button');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strcontent);
      console.info('AttributeModifierDemoAPI01Jsunit_static_0100 component obj is: ' + obj.getElement('$attrs'));
      console.info('AttributeModifierDemoAPI01Jsunit_static_0100 component obj.backgroundColor is: ' +
      obj.getElement('$attrs').getString('backgroundColor'));
      console.info('AttributeModifierDemoAPI01Jsunit_static_0100 component obj.width is: ' +
      obj.getElement('$attrs').getString('width'));
      expect(obj.getElement('$attrs').getString('width')).assertEqual('300.00px');
      console.info('AttributeModifierDemoAPI01Jsunit_static_0100 END')
      done();
    });

  })
}