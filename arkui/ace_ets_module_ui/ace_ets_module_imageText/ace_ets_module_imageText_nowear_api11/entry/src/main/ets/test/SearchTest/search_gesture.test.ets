/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';

const searchIconLeftSpace = 12;
const searchIconRightSpace = 8;
const defaultSearchIconWidth = 16;
const relativeContentRectLeftWidth = parseInt(vp2px(searchIconLeftSpace + searchIconRightSpace + defaultSearchIconWidth).toFixed(2));

export default function search_gesture() {
  describe('search_gesture', () => {
    beforeEach(async (done: Function) => {
      console.info("search_gesture beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/SearchGesture',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get search_caret state pages: " + JSON.stringify(pages));
        if (!("SearchGesture" == pages.name)) {
          console.info("get search_gesture state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push search_gesture page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push search_gesture page error: " + err);
        expect().assertFail();
      }
      done();
    });

   /* *
      * @tc.number: SUB_ACE_UI_SEARCH_GESTURE_0100
      * @tc.name  : search_gesture_001
      * @tc.desc  : click caret, check caret to singleHandle and the text selection menu appears
      * @tc.level : Level 0
      * @tc.type : Function
      * @tc.size : MediumTest
      */
    it('search_gesture_001', 0, async (done: Function) => {

      console.info('[search_gesture_001] START');
      if (globalThis.winLeft == 0) {
        let driver = Driver.create();
        let searchComponent = await driver.findComponent(ON.id('SearchGesture'));
        await searchComponent.click();
        await CommonFunc.sleep(1000);
        console.info('search_gesture_001 click success');
        //first step: input hello
        await searchComponent.inputText('hello');
		await driver.triggerKey(2047)
        await CommonFunc.sleep(1000);

        //second step: get caret position and click caret
        let button = await driver.findComponent(ON.id('SearchCaret11'));
        await button.click();
        await CommonFunc.sleep(1000);
        let strJson1 = getInspectorByKey('SearchCaretXText');
        let obj1: ESObject = JSON.parse(strJson1);
        await CommonFunc.sleep(1000);
        console.info(`[search_gesture_001] caretOffsetX is:${obj1.$attrs.content}`);
        let caretRelativeX = parseInt(obj1.$attrs.content);
        let searchRect = CommonFunc.getComponentRectOnScreen('SearchGesture');
        let clickX = Math.round(searchRect.left + caretRelativeX + relativeContentRectLeftWidth);
        let clickY =  Math.round((searchRect.bottom + searchRect.top)/2);
        await driver.click(clickX, clickY);
        await CommonFunc.sleep(1000);

        //check the text selection menu appearing
        let selectAllButton = await driver.findComponent(ON.text('全选'));
        let result = selectAllButton ? '1':'0';
        expect(result).assertEqual('1');
        //handle state and caret twinking state
        let strJson2 = getInspectorByKey('SearchGesture');
        await CommonFunc.sleep(300);
        console.info(`[search_gesture_001] SearchGesture obj is:${strJson2}`);
        let obj2: ESObject = JSON.parse(strJson2);
        await CommonFunc.sleep(1000);
        console.info(`[search_gesture_001] IsSingleHandle is:${obj2.$attrs.IsSingleHandle}, caret twinkling ? ${obj2.$attrs.CaretTwinkling}`);
        expect(obj2.$attrs.IsSingleHandle).assertEqual('true');
      }

      console.info('[search_gesture_001] END');
      done();
    });

/* *
   * @tc.number: SUB_ACE_UI_SEARCH_GESTURE_0200
   * @tc.name  : search_gesture_002
   * @tc.desc  : longClick and check selection state
   * @tc.level : Level 0
   * @tc.type : Function
   * @tc.size : MediumTest
   */
    it('SUB_ACE_UI_SEARCH_GESTURE_0200', 0, async (done: Function) => {

      console.info('[search_gesture_002] START');
      if (globalThis.winLeft == 0) {
        let driver: Driver = Driver.create();
        let searchComponent: Component = await driver.findComponent(ON.id('SearchGesture'));
        await searchComponent.click();
        await CommonFunc.sleep(1000);
        console.info('[search_gesture_002] click success');
        //first step: longClick on content and check
        let button = await driver.findComponent(ON.id('SearchCaret11'));
        await button.click();
        await CommonFunc.sleep(1000);
        let strJson1 = getInspectorByKey('SearchCaretXText');
        let obj1: ESObject = JSON.parse(strJson1);
        await CommonFunc.sleep(1000);
        console.info(`[search_gesture_002] caretOffsetX is:${obj1.$attrs.content}`);
        let caretRelativeX = parseInt(obj1.$attrs.content);
        let searchRect = CommonFunc.getComponentRectOnScreen('SearchGesture');
        let clickX = Math.round(searchRect.left + caretRelativeX + relativeContentRectLeftWidth - vp2px(10));
        let clickY =  Math.round((searchRect.bottom + searchRect.top)/2);
        await driver.longClick(clickX, clickY);
        await CommonFunc.sleep(1000);
        let selectAllButton1 = await driver.findComponent(ON.text('全选'));
        expect(selectAllButton1 ? '1':'0').assertEqual('1');
        let copyButton1 = await driver.findComponent(ON.text('复制'));
        expect(copyButton1 ? '1':'0').assertEqual('1');
        let cutButton1 = await driver.findComponent(ON.text('剪切'));
        expect(cutButton1 ? '1':'0').assertEqual('1');
        let strJson = getInspectorByKey('SearchGesture');
        let obj: ESObject = JSON.parse(strJson);
        console.info(`[search_gesture_002] first step Search selectOverlay obj is:${strJson}`);
        expect(obj.$attrs.IsSingleHandle).assertEqual('false');

        //second step: longClick on an empty space and check
        let clickX2 = Math.round(searchRect.left + caretRelativeX + relativeContentRectLeftWidth + vp2px(2));
        await driver.longClick(clickX2, clickY);
        await CommonFunc.sleep(1000);
        let strJson3 = getInspectorByKey('SearchGesture');
        let obj3: ESObject = JSON.parse(strJson3);
        console.info(`[search_gesture_002] second step Search selectOverlay obj is:${strJson3}`);

        //Third step:  after clear text , longClick and check
        let search: Component = await driver.findComponent(ON.text('这是预置文本', MatchPattern.CONTAINS));
        await search.clearText();
        await CommonFunc.sleep(500);
        let strJson2 = getInspectorByKey('SearchGesture');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info(`[search_gesture_002] after clear text, obj2 is:${strJson2}`);
        expect(obj2.$attrs.value).assertEqual('');
        let point = await search.getBoundsCenter();
        await CommonFunc.sleep(500);
        await driver.longClick(point.x, point.y);
        await CommonFunc.sleep(500);
        let strJson4 = getInspectorByKey('SearchGesture');
        let obj4: ESObject = JSON.parse(strJson4);
        console.info(`[search_gesture_002] third step Search selectOverlay obj is:${strJson4}`);
        expect(obj4.$attrs.IsSingleHandle).assertEqual('true');
      }
      
      console.info('[search_gesture_002] END');
      done();
    });

    /* *
       * @tc.number: SUB_ACE_UI_SEARCH_GESTURE_0300
       * @tc.name  : search_gesture_003
       * @tc.desc  : input long text and press enter,check focus state
       * @tc.level : Level 2
       * @tc.type : Function
       * @tc.size : MediumTest
       */
    it('SUB_ACE_UI_SEARCH_GESTURE_0300', 0, async (done: Function) => {

      console.info('[search_gesture_003] START');
      let driver: Driver = Driver.create();
      let searchComponent: Component = await driver.findComponent(ON.id('SearchGesture'));
      await searchComponent.click();
      await CommonFunc.sleep(500);
      console.info('[search_gesture_003] click success');
      //first step: input long text
      await searchComponent.inputText('helloWORLD!helloWORLD!helloWORLD!helloWORLD!helloWORLD!helloWORLD!');
	  await driver.triggerKey(2047)
      await CommonFunc.sleep(1000);

      //second step: trigger enter and check focus state
      await driver.triggerKey(2119);
      await CommonFunc.sleep(1000);
      let focusState = await searchComponent.isFocused();
      expect(focusState).assertEqual(false);

      console.info('[search_gesture_003] END');
      done();
    });

/* *
   * @tc.number: SUB_ACE_UI_SEARCH_GESTURE_0400
   * @tc.name  : search_gesture_004
   * @tc.desc  : move mouse and check mouse form
   * @tc.level : Level 2
   * @tc.type : Function
   * @tc.size : MediumTest
   */
    it('SUB_ACE_UI_SEARCH_GESTURE_0400', 0, async (done: Function) => {

      console.info('[search_gesture_004] START');
      let driver: Driver = Driver.create();
      let searchComponent: Component = await driver.findComponent(ON.id('SearchGesture'));
      await searchComponent.click();
      await CommonFunc.sleep(500);
      console.info('[search_gesture_004] click success');
      //first step: get searchComponent point
      let point = await searchComponent.getBoundsCenter();
      await CommonFunc.sleep(300);

      //second step: move mouse on searchComponent and check mouse state
      await driver.mouseMoveTo(point);
      await CommonFunc.sleep(300);
      let focusState = await searchComponent.isFocused();
      expect(focusState).assertEqual(true);
      //third step: move mouse out searchComponent and check mouse state
      let searchRect = await searchComponent.getBounds();
      await driver.mouseMoveTo({x:point.x, y:Math.round(searchRect.bottom+vp2px(2))});
      await CommonFunc.sleep(300);
      let focusState2 = await searchComponent.isFocused();
      expect(focusState2).assertEqual(true);

      console.info('[search_gesture_004] END');
      done();
    });

 /* *
    * @tc.number: SUB_ACE_UI_SEARCH_GESTURE_0500
    * @tc.name  : search_gesture_005
    * @tc.desc  : click different position and check caret
    * @tc.level : Level 2
    * @tc.type : Function
    * @tc.size : MediumTest
    */
    it('SUB_ACE_UI_SEARCH_GESTURE_0500', 0, async (done: Function) => {

      console.info('[search_gesture_005] START');
      let driver: Driver = Driver.create();
      let searchComponent: Component = await driver.findComponent(ON.id('SearchCaret'));
      await searchComponent.click();
      await CommonFunc.sleep(500);
      console.info('[search_gesture_005] click success');
      //first step: input hello and click the head of line,check caret position
      await searchComponent.inputText('hello');
	  await driver.triggerKey(2047)
      await CommonFunc.sleep(500);
      let searchRect = await searchComponent.getBounds();
      let clickX = Math.round(searchRect.left + relativeContentRectLeftWidth);
      let clickY = Math.round((searchRect.top + searchRect.bottom)/2);
      await driver.click(clickX, clickY)
      let button = await driver.findComponent(ON.id('GetCaret'));
      await button.click();
      await CommonFunc.sleep(500);
      let strJson1 = getInspectorByKey('SearchCaretIndexText');
      await CommonFunc.sleep(300);
      console.info(`[search_gesture_005] SearchCaretIndexText obj is:${strJson1}`);
      let obj1: ESObject = JSON.parse(strJson1);
      await CommonFunc.sleep(500);
      console.info(`[search_gesture_005] caretIndex is:${obj1.$attrs.content}`);
      expect(obj1.$attrs.content).assertEqual('0')

      //second step: click the center of line and check caret position
      let searchButton: Component = await driver.findComponent(ON.id('Search2Caret13'));
	    await CommonFunc.sleep(500);
      await searchButton.click()
      await CommonFunc.sleep(500);
      await button.click();
      await CommonFunc.sleep(500);
      let strJson2 = getInspectorByKey('SearchCaretIndexText');
      await CommonFunc.sleep(300);
      console.info(`[search_gesture_005] SearchCaretIndexText obj is:${strJson2}`);
      let obj2: ESObject = JSON.parse(strJson2);
      await CommonFunc.sleep(500);
      console.info(`[search_gesture_001] caretIndex is:${obj2.$attrs.content}`);
      expect(obj2.$attrs.content).assertEqual('2')

      //third step: click the center of line and check caret position
      let searchButton2: Component = await driver.findComponent(ON.id('Search2Caret11'));
      await CommonFunc.sleep(500);
      await searchButton2.click()
      await CommonFunc.sleep(500);
      await button.click();
      await CommonFunc.sleep(500);
      let strJson3 = getInspectorByKey('SearchCaretIndexText');
      await CommonFunc.sleep(300);
      console.info(`[search_gesture_005] SearchCaretIndexText obj is:${strJson3}`);
      let obj3: ESObject = JSON.parse(strJson3);
      await CommonFunc.sleep(500);
      console.info(`[search_gesture_005] caretIndex is:${obj3.$attrs.content}`);
      expect(obj3.$attrs.content).assertEqual('11')

      console.info('[search_gesture_005] END');
      done();
    });

  })
}