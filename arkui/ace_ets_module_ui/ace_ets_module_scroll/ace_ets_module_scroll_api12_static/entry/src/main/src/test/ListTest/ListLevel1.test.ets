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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, Component, ON, Rect } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test'
import events_emitter from '@ohos.events.emitter';
import inspector from '@ohos.arkui.inspector'
import { RecordData } from '@ohos.base';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function listLevel1Test() {
  describe('listLevel1Test', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("listLevel1 beforeEach start");
      try {
        const router = AppStorage.get<Router>("router") as Router
        let pages = router.getState();
        console.info("get listLevel1 state pages:" + JSON.stringify(pages));
        if (!("ListLevel1" == pages.name)) {
          console.info("get listLevel1 pages.name:" + JSON.stringify(pages.name));
          router.pushUrl({ url: "MainAbility/pages/List/ListLevel1" })
        }
      } catch (err: Error) {
        console.error("push listLevel1 page error:" + err);
      }
      console.info("listLevel1 beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("listLevel1 after each called");
    });


    
    /**
     * @tc.number   listLevel1Test_static_static_0100
     * @tc.name     listLevel1Test_static_static_0100
     * @tc.desc     listLevel1Test_static_static_0100
     * @tc.level    Level.LEVEL1
     */
it('listLevel1Test_static_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[listLevel1Test_static_static_0100] START');
      await CommonFunc.sleep(2000);
      let json = inspector.getInspectorByKey('listlevel1');
      let Obj1 = JSON.parseJsonElement(json);
      console.info("listlevel1 json info " + JSON.stringify(json));
      expect(Obj1.getElement('$attrs').getElement('divider').getString('strokeWidth')).assertEqual('2.00vp');
      expect(Obj1.getElement('$attrs').getElement('divider').getString('color')).assertEqual('#FFFFFFFF');
      expect(Obj1.getElement('$attrs').getElement('divider').getString('startMargin')).assertEqual('10.00vp');
      expect(Obj1.getElement('$attrs').getElement('divider').getString('endMargin')).assertEqual('10.00vp');
      expect(Obj1.getElement('$attrs').getString('contentStartOffset')).assertEqual('10.000000');
      expect(Obj1.getElement('$attrs').getString('contentEndOffset')).assertEqual('10.000000');
      console.info('[listLevel1Test_static_static_0100] END');
      done();
    });


    
    /**
     * @tc.number   listLevel1Test_static_static_0200
     * @tc.name     listLevel1Test_static_static_0200
     * @tc.desc     listLevel1Test_static_static_0200
     * @tc.level    Level.LEVEL1
     */
it('listLevel1Test_static_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[listLevel1Test_static_static_0200] START');
      try {
        AppStorage.setOrCreate<number | string>('startMargin', "30.00vp")
      } catch (err: Error) {
        console.log("[listLevel1Test_static_static_0200] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('listlevel1');

      console.info("[listLevel1Test_static_static_0200] JSON.parseJsonElement(strJson) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('divider').getString('startMargin'))
        .assertEqual("30.00vp");
      console.info('listLevel1Test_static_static_0200 END');
      done()
    });


    
    /**
     * @tc.number   listLevel1Test_static_static_0300
     * @tc.name     listLevel1Test_static_static_0300
     * @tc.desc     listLevel1Test_static_static_0300
     * @tc.level    Level.LEVEL1
     */
it('listLevel1Test_static_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[listLevel1Test_static_static_0300] START');
      try {
        AppStorage.setOrCreate<number | string>('startMargin', "30.90vp")
      } catch (err: Error) {
        console.log("[listLevel1Test_static_static_0300] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('listlevel1');

      console.info("[listLevel1Test_static_static_0300] JSON.parseJsonElement(strJson) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('divider').getString('startMargin'))
        .assertEqual('30.90vp');
      console.info('listLevel1Test_static_static_0300 END');
      done()
    });


    
    /**
     * @tc.number   listLevel1Test_static_static_0400
     * @tc.name     listLevel1Test_static_static_0400
     * @tc.desc     listLevel1Test_static_static_0400
     * @tc.level    Level.LEVEL1
     */
it('listLevel1Test_static_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[listLevel1Test_static_static_0400] START');
      try {
        AppStorage.setOrCreate<number | string>('startMargin', "0.00vp")
      } catch (err: Error) {
        console.log("[listLevel1Test_static_static_0400] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('listlevel1');

      console.info("[listLevel1Test_static_static_0400] JSON.parseJsonElement(strJson) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('divider').getString('startMargin'))
        .assertEqual("0.00vp");
      console.info('listLevel1Test_static_static_0400 END');
      done()
    });


    
    /**
     * @tc.number   listLevel1Test_static_static_0500
     * @tc.name     listLevel1Test_static_static_0500
     * @tc.desc     listLevel1Test_static_static_0500
     * @tc.level    Level.LEVEL1
     */
it('listLevel1Test_static_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[listLevel1Test_static_static_0500] START');
      try {
        AppStorage.setOrCreate<number | string>('endMargin', "30.00vp")
      } catch (err: Error) {
        console.log("[listLevel1Test_static_static_0500] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('listlevel1');

      console.info("[listLevel1Test_static_static_0500] JSON.parseJsonElement(strJson) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('divider').getString('endMargin'))
        .assertEqual("30.00vp");
      console.info('listLevel1Test_static_static_0500 END');
      done()
    });


    
    /**
     * @tc.number   listLevel1Test_static_static_0600
     * @tc.name     listLevel1Test_static_static_0600
     * @tc.desc     listLevel1Test_static_static_0600
     * @tc.level    Level.LEVEL1
     */
it('listLevel1Test_static_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[listLevel1Test_static_static_0600] START');
      try {
        AppStorage.setOrCreate<number | string>('endMargin', "0.00vp")
      } catch (err: Error) {
        console.log("[listLevel1Test_static_static_0600] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('listlevel1');

      console.info("[listLevel1Test_static_static_0600] JSON.parseJsonElement(strJson) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('divider').getString('endMargin'))
        .assertEqual("0.00vp");
      console.info('listLevel1Test_static_static_0600 END');
      done()
    });


    
    /**
     * @tc.number   listLevel1Test_static_static_0700
     * @tc.name     listLevel1Test_static_static_0700
     * @tc.desc     listLevel1Test_static_static_0700
     * @tc.level    Level.LEVEL1
     */
it('listLevel1Test_static_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[listLevel1Test_static_static_0700] START');
      try {
        AppStorage.setOrCreate<number | string>('endMargin', "30.90vp")
      } catch (err: Error) {
        console.log("[listLevel1Test_static_static_0700] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('listlevel1');

      console.info("[listLevel1Test_static_static_0700] JSON.parseJsonElement(strJson) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('divider').getString('endMargin'))
        .assertEqual("30.90vp");
      console.info('listLevel1Test_static_static_0700 END');
      done()
    });


    
    /**
     * @tc.number   listLevel1Test_static_static_0800
     * @tc.name     listLevel1Test_static_static_0800
     * @tc.desc     listLevel1Test_static_static_0800
     * @tc.level    Level.LEVEL1
     */
it('listLevel1Test_static_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[listLevel1Test_static_static_0800] START');
      try {
        AppStorage.setOrCreate<number | string>('startMargin', "30%")
      } catch (err: Error) {
        console.log("[listLevel1Test_static_static_0800] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('listlevel1');

      console.info("[listLevel1Test_static_static_0800] JSON.parseJsonElement(strJson) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('divider').getString('startMargin'))
        .assertEqual("30.00%");
      console.info('listLevel1Test_static_static_0800 END');
      done()
    });


    
    /**
     * @tc.number   listLevel1Test_static_static_0900
     * @tc.name     listLevel1Test_static_static_0900
     * @tc.desc     listLevel1Test_static_static_0900
     * @tc.level    Level.LEVEL1
     */
it('listLevel1Test_static_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[listLevel1Test_static_static_0900] START');
      try {
        AppStorage.setOrCreate<number | string>('endMargin', "5")
      } catch (err: Error) {
        console.log("[listLevel1Test_static_static_0900] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('listlevel1');

      console.info("[listLevel1Test_static_static_0900] JSON.parseJsonElement(strJson) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('divider').getString('endMargin'))
        .assertEqual("5.00vp");
      console.info('listLevel1Test_static_static_0900 END');
      done()
    });


    
    /**
     * @tc.number   listLevel1Test_static_1000
     * @tc.name     listLevel1Test_static_1000
     * @tc.desc     listLevel1Test_static_1000
     * @tc.level    Level.LEVEL1
     */
it('listLevel1Test_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[listLevel1Test_static_1000] START');
      try {
        // 1.2只能设置数字
        AppStorage.setOrCreate<number>('contentStartOffset', 200)
        AppStorage.setOrCreate<number>('contentEndOffset', 200)
      } catch (err: Error) {
        console.log("[listLevel1Test_static_1000] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('listlevel1');

      console.info("[listLevel1Test_static_1000] JSON.parseJsonElement(strJson) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('contentStartOffset'))
        .assertEqual("200.000000");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('contentEndOffset'))
        .assertEqual("200.000000");
      console.info('listLevel1Test_static_1000 END');
      done()
    });


    
    /**
     * @tc.number   listLevel1Test_static_1100
     * @tc.name     listLevel1Test_static_1100
     * @tc.desc     listLevel1Test_static_1100
     * @tc.level    Level.LEVEL1
     */
it('listLevel1Test_static_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[listLevel1Test_static_1100] START');
      AppStorage.setOrCreate<string>('padding', "5")
      AppStorage.setOrCreate<number>('contentEndOffset', 5)
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('listlevel1');

      console.info("[listLevel1Test_static_1100] JSON.parseJsonElement(strJson) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('padding')).assertEqual("5.00vp");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('contentEndOffset'))
        .assertEqual("5.000000");
      console.info('listLevel1Test_static_1100 END');
      done()
    });


    
    /**
     * @tc.number   listLevel1Test_static_1200
     * @tc.name     listLevel1Test_static_1200
     * @tc.desc     listLevel1Test_static_1200
     * @tc.level    Level.LEVEL1
     */
it('listLevel1Test_static_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[listLevel1Test_static_1200] START');
      try {
        AppStorage.setOrCreate<string>('padding', "0")
        AppStorage.setOrCreate<number>('contentStartOffset', 5)
      } catch (err: Error) {
        console.log("[listLevel1Test_static_1200] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('listlevel1');

      console.info("[listLevel1Test_static_1200] JSON.parseJsonElement(strJson) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('padding')).assertEqual("0.00vp");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('contentStartOffset'))
        .assertEqual("5.000000");
      console.info('listLevel1Test_static_1200 END');
      done()
    });


    
    /**
     * @tc.number   listLevel1Test_static_1300
     * @tc.name     listLevel1Test_static_1300
     * @tc.desc     listLevel1Test_static_1300
     * @tc.level    Level.LEVEL1
     */
it('listLevel1Test_static_1300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[listLevel1Test_static_1300] START');
      try {
        AppStorage.setOrCreate<string>('padding', "0")
        AppStorage.setOrCreate<number>('contentStartOffset', 5)
      } catch (err: Error) {
        console.log("[listLevel1Test_static_1300] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('listlevel1');
      console.info("[listLevel1Test_static_1300] JSON.parseJsonElement(strJson) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('padding')).assertEqual("0.00vp");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('contentStartOffset'))
        .assertEqual("5.000000");

      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let scrollColumn: Component = await driver.findComponent(ON.type('Scroll')) as Component;
      let button = await scrollColumn.scrollSearch(ON.id('GetItemRectButton')) as Component;
      await button.click();
      await CommonFunc.sleep(10000);
      let strJsonRectY: string = inspector.getInspectorByKey('itemRectY');
      let strJsonRectWidth: string = inspector.getInspectorByKey('itemRectWidth');
      let strJsonRectHeight: string = inspector.getInspectorByKey('itemRectHeight');
      console.info("[listLevel1Test_static_1300] JSON.parse(strJsonRectY) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonRectY).getElement('$attrs').getElement('content')));
      console.info("[listLevel1Test_static_1300] JSON.parse(strJsonRectWidth) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonRectWidth).getElement('$attrs').getElement('content')));
      console.info("[listLevel1Test_static_1300] JSON.parse(strJsonRectHeight) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonRectHeight).getElement('$attrs').getElement('content')));
      expect(JSON.parseJsonElement(strJsonRectY).getElement('$attrs').getString('content')).assertEqual('itemRectY:5');
      expect(JSON.parseJsonElement(strJsonRectWidth).getElement('$attrs').getString('content'))
        .assertEqual('itemRectWidth:200');
      expect(JSON.parseJsonElement(strJsonRectHeight).getElement('$attrs').getString('content'))
        .assertEqual('itemRectHeight:100');
      console.info('listLevel1Test_static_1300 END');
      done()
    });


    
    /**
     * @tc.number   listLevel1Test_static_1400
     * @tc.name     listLevel1Test_static_1400
     * @tc.desc     listLevel1Test_static_1400
     * @tc.level    Level.LEVEL1
     */
it('listLevel1Test_static_1400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[listLevel1Test_static_1400] START');
      try {
        AppStorage.setOrCreate<number>('contentStartOffset', 10)
        AppStorage.setOrCreate<number>('contentEndOffset', 10)
      } catch (err: Error) {
        console.log("[listLevel1Test_static_1400] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('listlevel1');
      console.info("[listLevel1Test_static_1400] JSON.parseJsonElement(strJson) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('contentStartOffset'))
        .assertEqual("10.000000");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('contentEndOffset'))
        .assertEqual("10.000000");

      let driver: Driver = Driver.create();
      let scrollColumn: Component = await driver.findComponent(ON.type('Scroll')) as Component;
      let button = await scrollColumn.scrollSearch(ON.id('currentOffsetButton')) as Component;
      await button.click();
      await CommonFunc.sleep(1000);
      let strJsonX: string = inspector.getInspectorByKey('xoffset');
      let strJsonY: string = inspector.getInspectorByKey('yoffset');
      await CommonFunc.sleep(1000);
      console.info("[listLevel1Test_static_1400] component xoffset is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonX).getElement('$attrs').getElement('content')));
      console.info("[listLevel1Test_static_1400] component yoffset is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonY).getElement('$attrs').getElement('content')));
      expect(JSON.parseJsonElement(strJsonX).getElement('$attrs').getString('content')).assertEqual("xoffset:0");
      expect(JSON.parseJsonElement(strJsonY).getElement('$attrs').getString('content')).assertEqual("yoffset:-5");
      console.info('listLevel1Test_static_1400 END');
      done()
    });


    
    /**
     * @tc.number   listLevel1Test_static_1500
     * @tc.name     listLevel1Test_static_1500
     * @tc.desc     listLevel1Test_static_1500
     * @tc.level    Level.LEVEL1
     */
it('listLevel1Test_static_1500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[listLevel1Test_static_1500] START');
      let listItemRect = CommonFunc.getComponentRectOnScreen('listitemlevel0');
      let top = listItemRect.top;
      let right = listItemRect.right;
      let left = listItemRect.left;
      let bottom = listItemRect.bottom;
      console.info("listLevel1Test_static_1500 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      const uiContext = AppStorage.get<UIContext>('uiContext')!;
      await driver.swipe((Math.round(right - uiContext.vp2px(10))).toInt(),
        (Math.round(bottom - height / 2)).toInt(), (Math.round(left + width / 2)).toInt(),
        (Math.round(bottom - height / 2)).toInt());
      await CommonFunc.sleep(3000);
      try {
        AppStorage.setOrCreate<string>('startDeleteAreaDistance', "50")
      } catch (err: Error) {
        console.log("[listLevel1Test_static_1500] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('listitemlevel1');
      console.info("[listLevel1Test_static_1500] JSON.parseJsonElement(strJson) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('startDeleteAreaDistance'))
        .assertEqual("50.00vp");
      console.info('listLevel1Test_static_1500 END');
      done()
    });


    
    /**
     * @tc.number   listLevel1Test_static_1600
     * @tc.name     listLevel1Test_static_1600
     * @tc.desc     listLevel1Test_static_1600
     * @tc.level    Level.LEVEL1
     */
it('listLevel1Test_static_1600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[listLevel1Test_static_1600] START');
      let listItemRect = CommonFunc.getComponentRectOnScreen('listitemlevel0');
      let top = listItemRect.top;
      let right = listItemRect.right;
      let left = listItemRect.left;
      let bottom = listItemRect.bottom;
      console.info("listLevel1Test_static_1600 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      const uiContext = AppStorage.get<UIContext>('uiContext')!;
      await driver.swipe(
        (Math.round(left + uiContext.vp2px(10))).toInt(),
        (Math.round(bottom - height / 2)).toInt(),
        (Math.round(left + width / 2)).toInt(),
        (Math.round(bottom - height / 2)).toInt());
      await CommonFunc.sleep(3000);
      try {
        AppStorage.setOrCreate<string>('endDeleteAreaDistance', "50")
      } catch (err: Error) {
        console.log("[listLevel1Test_static_1600] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('listitemlevel1');
      console.info("[listLevel1Test_static_1600] JSON.parseJsonElement(strJson) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('endDeleteAreaDistance'))
        .assertEqual("50.00vp");
      console.info('listLevel1Test_static_1600 END');
      done()
    });


    
    /**
     * @tc.number   listLevel1Test_static_1700
     * @tc.name     listLevel1Test_static_1700
     * @tc.desc     listLevel1Test_static_1700
     * @tc.level    Level.LEVEL1
     */
it('listLevel1Test_static_1700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[listLevel1Test_static_1700] START');
      let listItemRect = CommonFunc.getComponentRectOnScreen('listitemlevel0');
      let top = listItemRect.top;
      let right = listItemRect.right;
      let left = listItemRect.left;
      let bottom = listItemRect.bottom;
      console.info("listLevel1Test_static_1700 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      const uiContext = AppStorage.get<UIContext>('uiContext')!;
      await driver.swipe(
        (Math.round(right - uiContext.vp2px(10))).toInt(),
        (Math.round(bottom - height / 2)).toInt(),
        (Math.round(left + width / 2)).toInt(),
        (Math.round(bottom - height / 2)).toInt());
      await CommonFunc.sleep(3000);
      try {
        AppStorage.setOrCreate<string>('startDeleteAreaDistance', "100")
      } catch (err: Error) {
        console.log("[listLevel1Test_static_1700] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('listitemlevel1');
      console.info("[listLevel1Test_static_1700] JSON.parseJsonElement(strJson) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('startDeleteAreaDistance'))
        .assertEqual("100.00vp");
      console.info('listLevel1Test_static_1700 END');
      done()
    });
  })
}
