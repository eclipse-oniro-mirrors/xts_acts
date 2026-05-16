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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix,
  Point,
  Rect
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import router from '@ohos.router';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

const searchIconLeftSpace = 12;
const searchIconRightSpace = 8;
const defaultSearchIconWidth = 16;
export default function search_gesture() {
  describe('search_gesture', () => {
    beforeAll(() => {
      console.info("search_gesture beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("search_gesture beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Search/SearchGesture",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get search_gesture state pages:" + "");
        if (!("SearchGesture" == pages.name)) {
          console.info("get search_gesture pages.name:" + "");
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push search_gesture page error:" + err);
      }
      console.info("search_gesture beforeEach end");
    });
    
    /**
     * @tc.number   search_gesture_static_001
     * @tc.name     search_gesture_static_001
     * @tc.desc     search_gesture_static_001
     * @tc.level    Level.LEVEL0
     */
// it('search_gesture_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
//
//       console.info('[search_gesture_001] START');
//       if (AppStorage.get<number>("winLeft") == 0) {
//         let driver = Driver.create();
//         let searchComponent = await driver.findComponent(ON.id('SearchGesture'));
//         if (searchComponent != undefined) {
//           await (searchComponent.click() as Promise<void>)
//           await CommonFunc.sleep(1000);
//           console.info('search_gesture_001 click success');
//           //first step: input hello
//           await (searchComponent.inputText('hello') as Promise<void>);
//           await driver.triggerKey(2047)
//           await CommonFunc.sleep(1000);
//         }
//         //second step: get caret position and click caret
//         let button = await driver.findComponent(ON.id('SearchCaret11'));
//         await (button?.click() as Promise<void>);
//         await CommonFunc.sleep(1000);
//         let strJson = inspector.getInspectorByKey('SearchCaretXText');
//         let obj = JSON.parseJsonElement(strJson);
//         await CommonFunc.sleep(1000);
//         console.info(`[search_gesture_001] caretOffsetX is:${obj.getElement('$attrs').getString('content')}`);
//         let caretRelativeX = parseInt(obj.getElement('$attrs').getString('content'));
//         let searchRect = CommonFunc.getComponentRectOnScreen('SearchGesture');
//         let clickX = Math.round(searchRect.left + caretRelativeX + Number.parseInt(Number(AppStorage.get<UIContext>('uiContext')!.vp2px(searchIconLeftSpace + searchIconRightSpace + defaultSearchIconWidth)).toFixed(2))) as int;
//         let clickY = Math.round((searchRect.bottom + searchRect.top) / 2) as int;
//         await (driver.click(clickX, clickY) as Promise<void>);
//         await CommonFunc.sleep(1000);
//
//         //check the text selection menu appearing
//         let selectAllButton = await driver.findComponent(ON.text('全选'));
//         let result = selectAllButton ? '1' : '0';
//
//         //handle state and caret twinking state
//         let strJson2 = inspector.getInspectorByKey('SearchGesture');
//         await CommonFunc.sleep(300);
//         console.info(`[search_gesture_001] SearchGesture obj is:${strJson2}`);
//         let obj2 = JSON.parseJsonElement(strJson2);
//         await CommonFunc.sleep(1000);
//         console.info(`[search_gesture_001] IsSingleHandle is:${obj2.getElement('$attrs')
//           .getString('IsSingleHandle')}, caret twinkling ? ${obj2.getElement('$attrs').getString('CaretTwinkling')}`);
//         expect(result).assertEqual('1');
//         expect(obj2.getElement('$attrs').getString('IsSingleHandle')).assertEqual('true');
//       }
//       console.info('[search_gesture_001] END');
//       done();
//     });
    
    /**
     * @tc.number   SUB_ACE_UI_SEARCH_GESTURE_static_0200
     * @tc.name     SUB_ACE_UI_SEARCH_GESTURE_static_0200
     * @tc.desc     SUB_ACE_UI_SEARCH_GESTURE_static_0200
     * @tc.level    Level.LEVEL0
     */
// it('SUB_ACE_UI_SEARCH_GESTURE_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
//
//       console.info('[search_gesture_002] START');
//       if (AppStorage.get<number>("winLeft") == 0) {
//         let driver = Driver.create();
//         let searchComponent = await driver.findComponent(ON.id('SearchGesture'));
//         await (searchComponent?.click() as Promise<void>);
//         await CommonFunc.sleep(1000);
//         console.info('[search_gesture_002] click success');
//         //first step: longClick on content and check
//         let button = await driver.findComponent(ON.id('SearchCaret11'));
//         await (button?.click() as Promise<void>);
//         await CommonFunc.sleep(1000);
//         let strJson = inspector.getInspectorByKey('SearchCaretXText');
//         let obj = JSON.parseJsonElement(strJson);
//         await CommonFunc.sleep(1000);
//         console.info(`[search_gesture_002] caretOffsetX is:${obj.getElement('$attrs').getString('content')}`);
//         let caretRelativeX = parseInt(obj.getElement('$attrs').getString('content'));
//         let searchRect = CommonFunc.getComponentRectOnScreen('SearchGesture');
//         let clickX = Math.round(searchRect.left + caretRelativeX + (Number.parseInt(Number(AppStorage.get<UIContext>('uiContext')!.vp2px(searchIconLeftSpace + searchIconRightSpace + defaultSearchIconWidth)).toFixed(2))) - AppStorage.get<UIContext>('uiContext')!.vp2px(10)) as int;
//         let clickY = Math.round((searchRect.bottom + searchRect.top) / 2) as int;
//         await (driver.longClick(clickX, clickY) as Promise<void>);
//         await CommonFunc.sleep(1000);
//         let selectAllButton1 = await driver.findComponent(ON.text('全选'));
//
//         let copyButton1 = await driver.findComponent(ON.text('复制'));
//
//         let cutButton1 = await driver.findComponent(ON.text('剪切'));
//
//         let strJson2 = inspector.getInspectorByKey('SearchGesture');
//         let obj2 = JSON.parseJsonElement(strJson2);
//         console.info(`[search_gesture_002] first step Search selectOverlay obj2 is:${strJson2}`);
//
//         //second step: longClick on an empty space and check
//         let clickX2 = Math.round(searchRect.left + caretRelativeX + (Number.parseInt(Number(AppStorage.get<UIContext>('uiContext')!.vp2px(searchIconLeftSpace + searchIconRightSpace + defaultSearchIconWidth)).toFixed(2))) + AppStorage.get<UIContext>('uiContext')!.vp2px(2)) as int;
//         await (driver.longClick(clickX2, clickY) as Promise<void>);
//         await CommonFunc.sleep(1000);
//         let strJson3 = inspector.getInspectorByKey('SearchGesture');
//         let obj3 = JSON.parseJsonElement(strJson3);
//         console.info(`[search_gesture_002] second step Search selectOverlay obj3 is:${strJson3}`);
//
//         //Third step:  after clear text , longClick and check
//         let search = await driver.findComponent(ON.text('这是预置文本', MatchPattern.CONTAINS));
//         await (search?.clearText() as Promise<void>);
//         await CommonFunc.sleep(500);
//         let strJson4 = inspector.getInspectorByKey('SearchGesture');
//         let obj4 = JSON.parseJsonElement(strJson4);
//         console.info(`[search_gesture_002] after clear text, obj4 is:${strJson4}`);
//
//         expect(copyButton1 ? '1' : '0').assertEqual('1');
//         expect(selectAllButton1 ? '1' : '0').assertEqual('1');
//         expect(cutButton1 ? '1' : '0').assertEqual('1');
//         expect(obj2.getElement('$attrs').getString('IsSingleHandle')).assertEqual('false');
//         expect(obj4.getElement('$attrs').getString('value')).assertEqual('');
//
//         if (search != null && search != undefined) {
//           let point: Point = await (search.getBoundsCenter() as Promise<Point>);
//           await CommonFunc.sleep(500);
//           await (driver.longClick(point.x as int, point.y as int) as Promise<void>);
//           await CommonFunc.sleep(500);
//           let strJson5 = inspector.getInspectorByKey('SearchGesture');
//           let obj5 = JSON.parseJsonElement(strJson5);
//           console.info(`[search_gesture_002] third step Search selectOverlay obj is:${strJson4}`);
//           expect(obj5.getElement('$attrs').getString('IsSingleHandle')).assertEqual('true');
//
//         }
//       }
//
//       console.info('[search_gesture_002] END');
//       done();
//     });


    
    
    
    /**
     * @tc.number   SUB_ACE_UI_SEARCH_GESTURE_static_0300
     * @tc.name     SUB_ACE_UI_SEARCH_GESTURE_static_0300
     * @tc.desc     SUB_ACE_UI_SEARCH_GESTURE_static_0300
     * @tc.level    Level.LEVEL2
     */
// it('SUB_ACE_UI_SEARCH_GESTURE_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
//
//       console.info('[search_gesture_003] START');
//       let driver = Driver.create();
//       let searchComponent = await driver.findComponent(ON.id('SearchGesture'));
//       if (searchComponent != null && searchComponent != undefined) {
//         await (searchComponent.click() as Promise<void>);
//         await CommonFunc.sleep(500);
//         console.info('[search_gesture_003] click success');
//         //first step: input long text
//         await (searchComponent.inputText('helloWORLD!helloWORLD!helloWORLD!helloWORLD!helloWORLD!helloWORLD!') as Promise<void>);
//         await driver.triggerKey(2047)
//         await CommonFunc.sleep(1000);
//
//         //second step: trigger enter and check focus state
//         await driver.triggerKey(2119);
//         await CommonFunc.sleep(1000);
//         let focusState = await (searchComponent.isFocused() as Promise<Boolean>);
//         expect(focusState).assertEqual(false);
//         console.info('[search_gesture_003] END');
//         done();
//       }
//     });


    
    
    
    /**
     * @tc.number   SUB_ACE_UI_SEARCH_GESTURE_static_0400
     * @tc.name     SUB_ACE_UI_SEARCH_GESTURE_static_0400
     * @tc.desc     SUB_ACE_UI_SEARCH_GESTURE_static_0400
     * @tc.level    Level.LEVEL2
     */
// it('SUB_ACE_UI_SEARCH_GESTURE_static_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
//
//       console.info('[search_gesture_004] START');
//       let driver = Driver.create();
//       let searchComponent = await driver.findComponent(ON.id('SearchGesture'));
//       if (searchComponent != null && searchComponent != undefined) {
//         await (searchComponent.click() as Promise<void>);
//         await CommonFunc.sleep(500);
//         console.info('[search_gesture_004] click success');
//         //first step: get searchComponent point
//         let point: Point = await (searchComponent.getBoundsCenter() as Promise<Point>);
//         await CommonFunc.sleep(300);
//
//         //second step: move mouse on searchComponent and check mouse state
//         await (driver.mouseMoveTo(point as Point) as Promise<void>);
//         await CommonFunc.sleep(300);
//         let focusState = await (searchComponent.isFocused() as Promise<boolean>);
//
//         //third step: move mouse out searchComponent and check mouse state
//         let searchRect = await searchComponent.getBounds();
//         await driver.mouseMoveTo({
//           x: (point.x as int), y: Math.round(searchRect.bottom + AppStorage.get<UIContext>('uiContext')!.vp2px(2)) as int
//         });
//         await CommonFunc.sleep(300);
//         let focusState2 = await (searchComponent.isFocused() as Promise<boolean>);
//         expect(focusState).assertEqual(true);
//         expect(focusState2).assertEqual(true);
//
//       }
//
//       console.info('[search_gesture_004] END');
//       done();
//     });


    
    
    
    /**
     * @tc.number   SUB_ACE_UI_SEARCH_GESTURE_static_0500
     * @tc.name     SUB_ACE_UI_SEARCH_GESTURE_static_0500
     * @tc.desc     SUB_ACE_UI_SEARCH_GESTURE_static_0500
     * @tc.level    Level.LEVEL2
     */
it('SUB_ACE_UI_SEARCH_GESTURE_static_0500', Level.LEVEL2, async (done: () => void): Promise<void> => {

      console.info('[search_gesture_005] START');
      let driver = Driver.create();
      let searchComponent = await driver.findComponent(ON.id('SearchCaret'));
      await (searchComponent?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      console.info('[search_gesture_005] click success');
      //first step: input hello and click the head of line,check caret position
      await (searchComponent?.inputText('hello') as Promise<void>);
      await driver.triggerKey(2047)
      await CommonFunc.sleep(500);
      let searchRect = await (searchComponent?.getBounds() as Promise<Rect>);
      let clickX = Math.round(searchRect.left + (Number.parseInt(Number(AppStorage.get<UIContext>('uiContext')!.vp2px(searchIconLeftSpace + searchIconRightSpace + defaultSearchIconWidth)).toFixed(2)))) as int;
      let clickY = Math.round((searchRect.top + searchRect.bottom) / 2) as int;
      await driver.click(clickX, clickY)
      let button = await driver.findComponent(ON.id('GetCaret'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let strJson1 = inspector.getInspectorByKey('SearchCaretIndexText');
      await CommonFunc.sleep(300);
      console.info(`[search_gesture_005] SearchCaretIndexText obj is:${strJson1}`);
      let obj1 = JSON.parseJsonElement(strJson1);
      await CommonFunc.sleep(500);
      console.info(`[search_gesture_005] caretIndex is:${obj1.getElement('$attrs').getString('content')}`);
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('0')

      //second step: click the center of line and check caret position
      let searchButton = await driver.findComponent(ON.id('Search2Caret13'));
      await CommonFunc.sleep(500);
      if (searchButton != null && searchButton != undefined) {
        await searchButton.click()
        await CommonFunc.sleep(500);
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(500);
        let strJson2 = inspector.getInspectorByKey('SearchCaretIndexText');
        await CommonFunc.sleep(300);
        console.info(`[search_gesture_005] SearchCaretIndexText obj is:${strJson2}`);
        let obj2 = JSON.parseJsonElement(strJson2);
        await CommonFunc.sleep(500);
        console.info(`[search_gesture_001] caretIndex is:${obj2.getElement('$attrs').getString('content')}`);
        expect(obj2.getElement('$attrs').getString('content')).assertEqual('2')

      }

      //third step: click the center of line and check caret position
      let searchButton2 = await driver.findComponent(ON.id('Search2Caret11'));
      await CommonFunc.sleep(500);
      if (searchButton2 != null && searchButton2 != undefined) {
        await searchButton2.click()
        await CommonFunc.sleep(500);
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(500);
        let strJson3 = inspector.getInspectorByKey('SearchCaretIndexText');
        await CommonFunc.sleep(300);
        console.info(`[search_gesture_005] SearchCaretIndexText obj is:${strJson3}`);
        let obj3 = JSON.parseJsonElement(strJson3);
        await CommonFunc.sleep(500);
        console.info(`[search_gesture_005] caretIndex is:${obj3.getElement('$attrs').getString('content')}`);
        expect(obj3.getElement('$attrs').getString('content')).assertEqual('11')

      }
      console.info('[search_gesture_005] END');
      done();
    });
  })
}