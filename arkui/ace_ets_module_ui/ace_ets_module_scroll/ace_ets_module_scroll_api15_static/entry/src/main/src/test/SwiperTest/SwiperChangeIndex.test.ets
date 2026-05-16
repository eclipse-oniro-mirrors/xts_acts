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
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  it,
  expect,
  Level,
  TestType,
  Size,
  afterAll
} from "../../../../hypium/index"
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
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;


export default function SwiperChangeIndexTest() {
  describe('SwiperChangeIndexTest', () => {
    beforeAll(() => {
      console.info("SwiperChangeIndexTest beforeEach start");

      
      await UtilsTest.startAbility("com.arkui.ace.scroll15.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info('SwiperChangeIndexTest beforeEach start');
      const swiperChangeIndex = AppStorage.get<Router>("router") as Router
      swiperChangeIndex.clear();
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/SwiperChangeIndex',
      }
      try {
        let pages = swiperChangeIndex.getState();
        console.info('get SwiperChangeIndexTest state pages: ' + JSON.stringify(pages));
        if (!('SwiperChangeIndex' == pages.name)) {
          console.info('get SwiperChangeIndexTest state pages.name: ' + JSON.stringify(pages.name));
          swiperChangeIndex.pushUrl(options);
          await CommonFunc.sleep(1000);
        }
      } catch (err) {
        console.error('push SwiperChangeIndexTest page error: ' + err);
        expect().assertFail();
      }
    });


    
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_CHANGE_INDEX_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_CHANGE_INDEX_static_0100 START");
        await CommonFunc.sleep(1000);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btn1'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let strJson2: string = inspector.getInspectorByKey('text1');
        let marq2 = JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content');
        await CommonFunc.sleep(1000);
        console.info('JSON.parse(strJson2).$attrs.content ' + marq2)
        expect(marq2).assertEqual("6");
        await CommonFunc.sleep(1000);
        console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_CHANGE_INDEX_static_0100 END');
        done();
      });


    
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_CHANGE_INDEX_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_CHANGE_INDEX_static_0200 START");
        await CommonFunc.sleep(1000);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btn2'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let strJson2: string = inspector.getInspectorByKey('text2');
        let marq2 = JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content');
        await CommonFunc.sleep(1000);
        console.info('JSON.parse(strJson2).$attrs.content ' + marq2)
        expect(marq2).assertEqual("0");
        await CommonFunc.sleep(1000);
        console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_CHANGE_INDEX_static_0200 END');
        done();
      });


    
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_CHANGE_INDEX_static_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_CHANGE_INDEX_static_0300 START");
        await CommonFunc.sleep(1000);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btn3'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let strJson2: string = inspector.getInspectorByKey('text3');
        let marq2 = JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content');
        await CommonFunc.sleep(1000);
        console.info('JSON.parse(strJson2).$attrs.content ' + marq2)
        expect(marq2).assertEqual("0");
        await CommonFunc.sleep(1000);
        console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_CHANGE_INDEX_static_0300 END');
        done();
      });


    
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_CHANGE_INDEX_static_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_CHANGE_INDEX_static_0400 START");
        await CommonFunc.sleep(1000);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btn4'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let strJson2: string = inspector.getInspectorByKey('text4');
        let marq2 = JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content');
        await CommonFunc.sleep(1000);
        console.info('JSON.parse(strJson2).$attrs.content ' + marq2)
        expect(marq2).assertEqual("");
        await CommonFunc.sleep(1000);
        console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_CHANGE_INDEX_static_0400 END');
        done();
      });


    
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_CHANGE_INDEX_static_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_CHANGE_INDEX_static_0500 START");
        await CommonFunc.sleep(1000);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btn5'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let strJson2: string = inspector.getInspectorByKey('text5');
        let marq2 = JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content');
        await CommonFunc.sleep(1000);
        console.info('JSON.parse(strJson2).$attrs.content ' + marq2)
        expect(marq2).assertEqual("0");
        await CommonFunc.sleep(1000);
        console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_CHANGE_INDEX_static_0500 END');
        done();
      });

  })
}