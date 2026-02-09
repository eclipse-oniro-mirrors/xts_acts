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

export default function Storage11Jsunit() {
  describe('Storage11Jsunit', () => {
    beforeAll(() => {
      console.info("Storage11Jsunit beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement02.api11.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("Storage11Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/Storage11',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Storage11Jsunit state pages:" + JSON.stringify(pages));
        if (!("Storage11" == pages.name)) {
          console.info("get Storage11Jsunit pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push Storage11Jsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Storage11Jsunit page error:" + err);
      }
      console.info("Storage11Jsunit beforeEach end");
    });



    //link给定的键值key存在，返回对应该键值的属性的双向绑定的数据 47
    /**
     * @tc.number   Storage11Jsunit_static_0100
     * @tc.name     Storage11Jsunit_static_0100
     * @tc.desc     Storage11Jsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('Storage11Jsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[Storage11Jsunit_static_0100] START');
      let driver = Driver.create()
      let Storage11Button1 = await driver.findComponent(ON.id('Storage11Button1'));
      await (Storage11Button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let Storage11ContentJson = inspector.getInspectorByKey('Storage11Content');
      let text = JSON.parseJsonElement(Storage11ContentJson);
      console.info("[Storage11Jsunit_static_0100] Storage11Content is: " + JSON.stringify(text));
      expect(text.getElement('$attrs').getString('content')).assertEqual('47');
      console.info('[Storage11Jsunit_static_0100] END');
      done();
    });

    //link给定的键值key不存在，返回undefined
    /**
     * @tc.number   Storage11Jsunit_static_0200
     * @tc.name     Storage11Jsunit_static_0200
     * @tc.desc     Storage11Jsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('Storage11Jsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Storage11Jsunit_static_0200] START');
      let driver = Driver.create()
      let Storage11Button2 = await driver.findComponent(ON.id('Storage11Button2'));
      await (Storage11Button2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let Storage11ContentJson = inspector.getInspectorByKey('Storage11Content');
      let text = JSON.parseJsonElement(Storage11ContentJson);
      console.info("[Storage11Jsunit_static_0200] Storage11Content is: " + JSON.stringify(text));
      expect(text.getElement('$attrs').getString('content')).assertEqual('undefined');
      console.info('[Storage11Jsunit_static_0200] END');
      done();
    });

    //setAndLink给定的键值key存在，返回对应该键值的属性的双向绑定的数据 47
    /**
     * @tc.number   Storage11Jsunit_static_0300
     * @tc.name     Storage11Jsunit_static_0300
     * @tc.desc     Storage11Jsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('Storage11Jsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Storage11Jsunit_static_0300] START');
      let driver = Driver.create()
      let Storage11Button3 = await driver.findComponent(ON.id('Storage11Button3'));
      await (Storage11Button3?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let Storage11ContentJson = inspector.getInspectorByKey('Storage11Content');
      let text = JSON.parseJsonElement(Storage11ContentJson);
      console.info("[Storage11Jsunit_static_0300] Storage11Content is: " + JSON.stringify(text));
      expect(text.getElement('$attrs').getString('content')).assertEqual('47');
      console.info('[Storage11Jsunit_static_0300] END');
      done();
    });

    //setAndLink给定的键值key不存在，初始化新的数据 5
    /**
     * @tc.number   Storage11Jsunit_static_0400
     * @tc.name     Storage11Jsunit_static_0400
     * @tc.desc     Storage11Jsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('Storage11Jsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Storage11Jsunit_static_0400] START');
      let driver = Driver.create()
      let Storage11Button4 = await driver.findComponent(ON.id('Storage11Button4'));
      await (Storage11Button4?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let Storage11ContentJson = inspector.getInspectorByKey('Storage11Content');
      let text = JSON.parseJsonElement(Storage11ContentJson);
      console.info("[Storage11Jsunit_static_0400] Storage11Content is: " + JSON.stringify(text));
      expect(text.getElement('$attrs').getString('content')).assertEqual('5');
      console.info('[Storage11Jsunit_static_0400] END');
      done();
    });

    //prop给定的键值key存在，返回对应该键值的属性的双向绑定的数据 47
    /**
     * @tc.number   Storage11Jsunit_static_0500
     * @tc.name     Storage11Jsunit_static_0500
     * @tc.desc     Storage11Jsunit_static_0500
     * @tc.level    Level.LEVEL0
     */
it('Storage11Jsunit_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Storage11Jsunit_static_0500] START');
      let driver = Driver.create()
      let Storage11Button5 = await driver.findComponent(ON.id('Storage11Button5'));
      await (Storage11Button5?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let Storage11ContentJson = inspector.getInspectorByKey('Storage11Content');
      let text = JSON.parseJsonElement(Storage11ContentJson);
      console.info("[Storage11Jsunit_static_0500] Storage11Content is: " + JSON.stringify(text));
      expect(text.getElement('$attrs').getString('content')).assertEqual('47');
      console.info('[Storage11Jsunit_static_0500] END');
      done();
    });

    //prop给定的键值key存在，返回undefined
    /**
     * @tc.number   Storage11Jsunit_static_0600
     * @tc.name     Storage11Jsunit_static_0600
     * @tc.desc     Storage11Jsunit_static_0600
     * @tc.level    Level.LEVEL0
     */
it('Storage11Jsunit_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Storage11Jsunit_static_0600] START');
      let driver = Driver.create()
      let Storage11Button6 = await driver.findComponent(ON.id('Storage11Button6'));
      await (Storage11Button6?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let Storage11ContentJson = inspector.getInspectorByKey('Storage11Content');
      let text = JSON.parseJsonElement(Storage11ContentJson);
      console.info("[Storage11Jsunit_static_0600] Storage11Content is: " + JSON.stringify(text));
      expect(text.getElement('$attrs').getString('content')).assertEqual('undefined');
      console.info('[Storage11Jsunit_static_0600] END');
      done();
    });

    //setAndProp给定的键值key存在，返回对应该键值的属性的双向绑定的数据 47
    /**
     * @tc.number   Storage11Jsunit_static_0700
     * @tc.name     Storage11Jsunit_static_0700
     * @tc.desc     Storage11Jsunit_static_0700
     * @tc.level    Level.LEVEL0
     */
it('Storage11Jsunit_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Storage11Jsunit_static_0700] START');
      let driver = Driver.create()
      let Storage11Button7 = await driver.findComponent(ON.id('Storage11Button7'));
      await (Storage11Button7?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let Storage11ContentJson = inspector.getInspectorByKey('Storage11Content');
      let text = JSON.parseJsonElement(Storage11ContentJson);
      console.info("[Storage11Jsunit_static_0700] Storage11Content is: " + JSON.stringify(text));
      expect(text.getElement('$attrs').getString('content')).assertEqual('47');
      console.info('[Storage11Jsunit_static_0700] END');
      done();
    });

    //setAndProp给定的键值key存在，返回对应该键值的属性的双向绑定的数据 5
    /**
     * @tc.number   Storage11Jsunit_static_0800
     * @tc.name     Storage11Jsunit_static_0800
     * @tc.desc     Storage11Jsunit_static_0800
     * @tc.level    Level.LEVEL0
     */
it('Storage11Jsunit_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Storage11Jsunit_static_0800] START');
      let driver = Driver.create()
      let Storage11Button8 = await driver.findComponent(ON.id('Storage11Button8'));
      await (Storage11Button8?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let Storage11ContentJson = inspector.getInspectorByKey('Storage11Content');
      let text = JSON.parseJsonElement(Storage11ContentJson);
      console.info("[Storage11Jsunit_static_0800] Storage11Content is: " + JSON.stringify(text));
      expect(text.getElement('$attrs').getString('content')).assertEqual('5');
      console.info('[Storage11Jsunit_static_0800] END');
      done();
    });
  })
}
