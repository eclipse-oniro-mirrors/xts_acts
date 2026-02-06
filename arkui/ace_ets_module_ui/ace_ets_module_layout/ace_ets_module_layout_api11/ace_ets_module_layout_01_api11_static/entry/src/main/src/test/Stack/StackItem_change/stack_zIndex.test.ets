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


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level } from '../../../../../hypium/index';
import router from '@ohos.router';
import {Alignment} from '@ohos.arkui.component'
import RectValue from '../../../../ets/MainAbility/common/Rect';
import CommonFunc from "../../../../ets/MainAbility/common/Common";
import {GlobalContext} from '../../../../ets/MainAbility/common/GlobalContext'
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
import { UIContext } from "@ohos.arkui.UIContext";
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import window from '@ohos.window';
import screenshot from "@ohos.screenshot"
import inspector from '@ohos.arkui.inspector'
import image from '@ohos.multimedia.image';
import { UtilsTest } from '../../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

function imageComparisonAssert(left: double, top: double) {
  let theWinTop:long = 0;
  let theWinLeft:long = 0;
  let isTrue = true
  try {
    // let winTop = window.getLastWindow(AppStorage.get<common.BaseContext>('abilityContext'));
    const uiContext = AppStorage.get<UIContext>('uiContext');
    let windowClass: window.Window | undefined = undefined;
    windowClass = await window.getLastWindow(AppStorage.get<common.BaseContext>('abilityContext') as common.BaseContext);
    let properties: window.WindowProperties = windowClass.getWindowProperties();
    theWinTop = properties.windowRect.top + top as long
    theWinLeft = properties.windowRect.left + left + uiContext!.vp2px(10) as long
    console.log("===================================== theWinTop " + theWinTop + " theWinLeft " + theWinLeft)
  } catch (exception) {
    console.error('Failed to obtain the top window. Cause: ' + JSON.stringify(exception));
  }
  await CommonFunc.sleep(3000);
  let screenshotOptions: screenshot.ScreenshotOptions = {
    "screenRect": {
      "left": theWinLeft,
      "top": theWinTop,
      "width": 50,
      "height": 50
    },
    "imageSize": {
      "width": 50,
      "height": 50
    },
    "rotation": 0,
    "displayId": 0
  };
  try {
    screenshot.save(screenshotOptions, (err, data: image.PixelMap|undefined) => {
      if (err) {
        console.log('Failed to save screenshot. Code: ' + err);
        isTrue = false;
      }
      else {
        console.log('Succeeded in saving sreenshot. Pixel bytes number: ' + data?.getPixelBytesNumber());
        let PixelBytesNumber = data!.getPixelBytesNumber();
        const color = new ArrayBuffer(PixelBytesNumber);
        data?.readPixelsToBuffer(color, (err, res) => {
          if (err) {
            console.log('Failed to read image pixel data.' + err);
            isTrue = false;
          } else {
            let bufferArr = new Uint8Array(color);
            console.info('bufferArr', bufferArr)
            for (let i = 0; i < bufferArr.length; i += 40) {
              if (bufferArr[i] != 255 || bufferArr[i + 1] != 0 || bufferArr[i + 2] != 0) {
                isTrue = false;
                break;
              }
            }
          }
        })
        data!.release();
      }
    });
  } catch (exception) {
    console.error('Failed to save screenshot. exception: ' + exception);
    isTrue = false;
  }
  ;
  await CommonFunc.sleep(5000);
  return isTrue;
}

export default function Stack_ZIndex() {
  describe('Stack_ZIndex_Test', () => {
    beforeAll(async () => {
      console.info("Stack_Position_ChangeTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility");

    })

    beforeEach(async (): Promise<void> => {
      console.info("Stack_ZIndex beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Stack/StackItem_change/stack_zIndex",
      };
      try {
        const routerInstance = AppStorage.get<Router>("router")
        routerInstance!.clear();
        let pages = routerInstance!.getState();
        console.info("get Stack_ZIndex state pages:" + JSON.stringify(pages));
        if (!("stack_zIndex" == pages.name)) {
          console.info("get Stack_ZIndex pages.name:" + JSON.stringify(pages.name));
          routerInstance!.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Stack_ZIndex page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Stack_ZIndex beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Stack_ZIndex after each called");
    });
    
    /**
     * @tc.number   testStackZIndexWithAlignmentStart
     * @tc.name     testStackZIndexWithAlignmentStart
     * @tc.desc     testStackZIndexWithAlignmentStart
     * @tc.level    Level.LEVEL0
     */
    it('testStackZIndexWithAlignmentStart', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testStackZIndexWithAlignmentStart] START');
      
      AppStorage.get<MessageManager<number|Alignment>>("messageManager")?.notify({
        name: 'addAlignContent', value: Alignment.Start
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Stack_ZIndex_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Start');
      let Stack_ZIndex_011: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_011');
      let Stack_ZIndex_012: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_012');
      let Stack_ZIndex_01: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_01');
      let Stack_ZIndex_01_width = Stack_ZIndex_01.right - Stack_ZIndex_01.left;
      let Stack_ZIndex_01_height = Stack_ZIndex_01.bottom - Stack_ZIndex_01.top;
      let theTop: number = Stack_ZIndex_012.top;
      // let num = imageComparisonAssert(0, theTop);
      await CommonFunc.sleep(1000);
      // console.log('[testStackZIndexWithAlignmentStart] num is', num);
      // expect(num).assertEqual(true);
      console.log('Stack_ZIndex_01.left is', Stack_ZIndex_01.left);
      expect(Math.abs(Stack_ZIndex_01.left - Stack_ZIndex_011.left) <= 1).assertTrue();
      expect(Math.abs(Stack_ZIndex_01.left - Stack_ZIndex_012.left) <= 1).assertTrue();
      console.log('Stack_ZIndex_011.top - Stack_ZIndex_01.top is', Stack_ZIndex_011.top - Stack_ZIndex_01.top);
      expect(Math.abs(Math.round(Stack_ZIndex_011.top - Stack_ZIndex_01.top) -
      Math.round(Stack_ZIndex_01.bottom - Stack_ZIndex_011.bottom)) <= 1).assertTrue();
      console.log('Stack_ZIndex_012.top - Stack_ZIndex_01.top is', Stack_ZIndex_012.top - Stack_ZIndex_01.top);
      expect(Math.abs(Math.round(Stack_ZIndex_012.top - Stack_ZIndex_01.top) -
      Math.round(Stack_ZIndex_01.bottom - Stack_ZIndex_012.bottom)) <= 1).assertTrue();
      console.log('Stack_ZIndex_01_height is', Stack_ZIndex_01_height);
      console.log('Stack_ZIndex_01_width is', Stack_ZIndex_01_width);
      console.log('Stack_ZIndex_011.bottom - Stack_ZIndex_011.top is', Stack_ZIndex_011.bottom - Stack_ZIndex_011.top);
      expect(Math.floor(Math.abs(Stack_ZIndex_011.bottom - Stack_ZIndex_011.top - Stack_ZIndex_01_height * 0.7)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_012.bottom - Stack_ZIndex_012.top is', Stack_ZIndex_012.bottom - Stack_ZIndex_012.top);
      expect(Math.floor(Math.abs(Stack_ZIndex_012.bottom - Stack_ZIndex_012.top - Stack_ZIndex_01_height * 0.5)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_011.right - Stack_ZIndex_011.left is', Stack_ZIndex_011.right - Stack_ZIndex_011.left);
      expect(Math.floor(Math.abs(Stack_ZIndex_011.right - Stack_ZIndex_011.left - Stack_ZIndex_01_width * 0.7)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_012.right - Stack_ZIndex_012.left is', Stack_ZIndex_012.right - Stack_ZIndex_012.left);
      expect(Math.floor(Math.abs(Stack_ZIndex_012.right - Stack_ZIndex_012.left - Stack_ZIndex_01_width * 0.5)) <= 1)
        .assertTrue();
      console.info('[testStackZIndexWithAlignmentStart] END');
      done();
    });
    
    /**
     * @tc.number   testStackZIndexWithAlignmentCenter
     * @tc.name     testStackZIndexWithAlignmentCenter
     * @tc.desc     testStackZIndexWithAlignmentCenter
     * @tc.level    Level.LEVEL0
     */
    it('testStackZIndexWithAlignmentCenter', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testStackZIndexWithAlignmentCenter] START');
      AppStorage.get<MessageManager<number|Alignment>>("messageManager")?.notify({
        name: 'addAlignContent', value: Alignment.Center
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Stack_ZIndex_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Center');
      let Stack_ZIndex_011: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_011');
      let Stack_ZIndex_012: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_012');
      let Stack_ZIndex_01: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_01');
      let Stack_ZIndex_01_width = Stack_ZIndex_01.right - Stack_ZIndex_01.left;
      let Stack_ZIndex_01_height = Stack_ZIndex_01.bottom - Stack_ZIndex_01.top;
      let theTop: number = Stack_ZIndex_012.top;
      let theLeft: number = Stack_ZIndex_012.left;
      // let num = imageComparisonAssert(theLeft, theTop);
      await CommonFunc.sleep(1000);
      // console.log('[testStackZIndexWithAlignmentCenter] num is', num);
      // expect(num).assertEqual(true);
      console.log('Stack_ZIndex_011.left - Stack_ZIndex_01.left is', Stack_ZIndex_011.left - Stack_ZIndex_01.left);
      expect(Math.abs(Math.round(Stack_ZIndex_011.left - Stack_ZIndex_01.left) -
      Math.round(Stack_ZIndex_01.right - Stack_ZIndex_011.right)) <= 1).assertTrue();
      console.log('Stack_ZIndex_012.left - Stack_ZIndex_01.left is', Stack_ZIndex_012.left - Stack_ZIndex_01.left);
      expect(Math.abs(Math.round(Stack_ZIndex_012.left - Stack_ZIndex_01.left) -
      Math.round(Stack_ZIndex_01.right - Stack_ZIndex_012.right)) <= 1).assertTrue();
      console.log('Stack_ZIndex_011.top - Stack_ZIndex_01.top is', Stack_ZIndex_011.top - Stack_ZIndex_01.top);
      expect(Math.abs(Math.round(Stack_ZIndex_011.top - Stack_ZIndex_01.top) -
      Math.round(Stack_ZIndex_01.bottom - Stack_ZIndex_011.bottom)) <= 1).assertTrue();
      console.log('Stack_ZIndex_012.top - Stack_ZIndex_01.top is', Stack_ZIndex_012.top - Stack_ZIndex_01.top);
      expect(Math.abs(Math.round(Stack_ZIndex_012.top - Stack_ZIndex_01.top) -
      Math.round(Stack_ZIndex_01.bottom - Stack_ZIndex_012.bottom)) <= 1).assertTrue();
      console.log('Stack_ZIndex_01_height is', Stack_ZIndex_01_height);
      console.log('Stack_ZIndex_01_width is', Stack_ZIndex_01_width);
      console.log('Stack_ZIndex_011.bottom - Stack_ZIndex_011.top is', Stack_ZIndex_011.bottom - Stack_ZIndex_011.top);
      expect(Math.floor(Math.abs(Stack_ZIndex_011.bottom - Stack_ZIndex_011.top - Stack_ZIndex_01_height * 0.7)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_012.bottom - Stack_ZIndex_012.top is', Stack_ZIndex_012.bottom - Stack_ZIndex_012.top);
      expect(Math.floor(Math.abs(Stack_ZIndex_012.bottom - Stack_ZIndex_012.top - Stack_ZIndex_01_height * 0.5)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_011.right - Stack_ZIndex_011.left is', Stack_ZIndex_011.right - Stack_ZIndex_011.left);
      expect(Math.floor(Math.abs(Stack_ZIndex_011.right - Stack_ZIndex_011.left - Stack_ZIndex_01_width * 0.7)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_012.right - Stack_ZIndex_012.left is', Stack_ZIndex_012.right - Stack_ZIndex_012.left);
      expect(Math.floor(Math.abs(Stack_ZIndex_012.right - Stack_ZIndex_012.left - Stack_ZIndex_01_width * 0.5)) <= 1)
        .assertTrue();
      console.info('[testStackZIndexWithAlignmentCenter] END');
      done();
    });
    
    /**
     * @tc.number   testStackZIndexWithAlignmentEnd
     * @tc.name     testStackZIndexWithAlignmentEnd
     * @tc.desc     testStackZIndexWithAlignmentEnd
     * @tc.level    Level.LEVEL0
     */
    it('testStackZIndexWithAlignmentEnd', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testStackZIndexWithAlignmentEnd] START');
      AppStorage.get<MessageManager<number|Alignment>>("messageManager")?.notify({
        name: 'addAlignContent', value: Alignment.End
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Stack_ZIndex_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.End');
      let Stack_ZIndex_011: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_011');
      let Stack_ZIndex_012: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_012');
      let Stack_ZIndex_01: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_01');
      let Stack_ZIndex_01_width = Stack_ZIndex_01.right - Stack_ZIndex_01.left;
      let Stack_ZIndex_01_height = Stack_ZIndex_01.bottom - Stack_ZIndex_01.top;
      let theTop: number = Stack_ZIndex_012.top;
      let theLeft: number = Stack_ZIndex_012.left;
      // let num = imageComparisonAssert(theLeft, theTop);
      // await CommonFunc.sleep(1000);
      // console.log('[testStackZIndexWithAlignmentEnd] num is', num);
      // expect(num).assertEqual(true);
      console.log('Stack_ZIndex_01.right is', Stack_ZIndex_01.right);
      expect(Math.abs((Stack_ZIndex_01.right) - (Stack_ZIndex_011.right)) <= 1).assertTrue();
      expect(Math.abs((Stack_ZIndex_01.right) - (Stack_ZIndex_012.right)) <= 1).assertTrue();
      console.log('Stack_ZIndex_011.top - Stack_ZIndex_01.top is', Stack_ZIndex_011.top - Stack_ZIndex_01.top);
      expect(Math.abs(Math.round(Stack_ZIndex_011.top - Stack_ZIndex_01.top) -
      Math.round(Stack_ZIndex_01.bottom - Stack_ZIndex_011.bottom)) <= 1).assertTrue();
      console.log('Stack_ZIndex_012.top - Stack_ZIndex_01.top is', Stack_ZIndex_012.top - Stack_ZIndex_01.top);
      expect(Math.abs(Math.round(Stack_ZIndex_012.top - Stack_ZIndex_01.top) -
      Math.round(Stack_ZIndex_01.bottom - Stack_ZIndex_012.bottom)) <= 1).assertTrue();
      console.log('Stack_ZIndex_01_height is', Stack_ZIndex_01_height);
      console.log('Stack_ZIndex_01_width is', Stack_ZIndex_01_width);
      console.log('Stack_ZIndex_011.bottom - Stack_ZIndex_011.top is', Stack_ZIndex_011.bottom - Stack_ZIndex_011.top);
      expect(Math.floor(Math.abs(Stack_ZIndex_011.bottom - Stack_ZIndex_011.top - Stack_ZIndex_01_height * 0.7)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_012.bottom - Stack_ZIndex_012.top is', Stack_ZIndex_012.bottom - Stack_ZIndex_012.top);
      expect(Math.floor(Math.abs(Stack_ZIndex_012.bottom - Stack_ZIndex_012.top - Stack_ZIndex_01_height * 0.5)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_011.right - Stack_ZIndex_011.left is', Stack_ZIndex_011.right - Stack_ZIndex_011.left);
      expect(Math.floor(Math.abs(Stack_ZIndex_011.right - Stack_ZIndex_011.left - Stack_ZIndex_01_width * 0.7)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_012.right - Stack_ZIndex_012.left is', Stack_ZIndex_012.right - Stack_ZIndex_012.left);
      expect(Math.floor(Math.abs(Stack_ZIndex_012.right - Stack_ZIndex_012.left - Stack_ZIndex_01_width * 0.5)) <= 1)
        .assertTrue();
      console.info('[testStackZIndexWithAlignmentEnd] END');
      done();
    });
    
    /**
     * @tc.number   testStackZIndexWithAlignmentBottomStart
     * @tc.name     testStackZIndexWithAlignmentBottomStart
     * @tc.desc     testStackZIndexWithAlignmentBottomStart
     * @tc.level    Level.LEVEL0
     */
    it('testStackZIndexWithAlignmentBottomStart', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testStackZIndexWithAlignmentBottomStart] START');
      AppStorage.get<MessageManager<number|Alignment>>("messageManager")?.notify({
        name: 'addAlignContent', value: Alignment.BottomStart
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Stack_ZIndex_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomStart');
      let Stack_ZIndex_011: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_011');
      let Stack_ZIndex_012: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_012');
      let Stack_ZIndex_01: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_01');
      let Stack_ZIndex_01_width = Stack_ZIndex_01.right - Stack_ZIndex_01.left;
      let Stack_ZIndex_01_height = Stack_ZIndex_01.bottom - Stack_ZIndex_01.top;
      let theTop: number = Stack_ZIndex_012.top;
      // let num = imageComparisonAssert(0, theTop);
      // await CommonFunc.sleep(1000);
      // console.log('[testStackZIndexWithAlignmentBottomStart] num is', num);
      // expect(num).assertEqual(true);
      console.log('Stack_ZIndex_01.left is', Stack_ZIndex_01.left);
      expect(Math.abs(Stack_ZIndex_01.left - Stack_ZIndex_011.left) <= 1).assertTrue();
      expect(Math.abs(Stack_ZIndex_01.left - Stack_ZIndex_012.left) <= 1).assertTrue();
      console.log('Stack_ZIndex_01.bottom is', Stack_ZIndex_01.bottom);
      expect(Math.abs(Stack_ZIndex_01.bottom - Stack_ZIndex_011.bottom) <= 1).assertTrue();
      expect(Math.abs(Stack_ZIndex_01.bottom - Stack_ZIndex_012.bottom) <= 1).assertTrue();
      console.log('Stack_ZIndex_01_height is', Stack_ZIndex_01_height);
      console.log('Stack_ZIndex_01_width is', Stack_ZIndex_01_width);
      console.log('Stack_ZIndex_011.bottom - Stack_ZIndex_011.top is', Stack_ZIndex_011.bottom - Stack_ZIndex_011.top);
      expect(Math.floor(Math.abs(Stack_ZIndex_011.bottom - Stack_ZIndex_011.top - Stack_ZIndex_01_height * 0.7)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_012.bottom - Stack_ZIndex_012.top is', Stack_ZIndex_012.bottom - Stack_ZIndex_012.top);
      expect(Math.floor(Math.abs(Stack_ZIndex_012.bottom - Stack_ZIndex_012.top - Stack_ZIndex_01_height * 0.5)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_011.right - Stack_ZIndex_011.left is', Stack_ZIndex_011.right - Stack_ZIndex_011.left);
      expect(Math.floor(Math.abs(Stack_ZIndex_011.right - Stack_ZIndex_011.left - Stack_ZIndex_01_width * 0.7)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_012.right - Stack_ZIndex_012.left is', Stack_ZIndex_012.right - Stack_ZIndex_012.left);
      expect(Math.floor(Math.abs(Stack_ZIndex_012.right - Stack_ZIndex_012.left - Stack_ZIndex_01_width * 0.5)) <= 1)
        .assertTrue();
      console.info('[testStackZIndexWithAlignmentBottomStart] END');
      done();
    });
    
    /**
     * @tc.number   testStackZIndexWithAlignmentBottom
     * @tc.name     testStackZIndexWithAlignmentBottom
     * @tc.desc     testStackZIndexWithAlignmentBottom
     * @tc.level    Level.LEVEL0
     */
    it('testStackZIndexWithAlignmentBottom', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testStackZIndexWithAlignmentBottom] START');
      AppStorage.get<MessageManager<number|Alignment>>("messageManager")?.notify({
        name: 'addAlignContent', value: Alignment.Bottom
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Stack_ZIndex_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom');
      let Stack_ZIndex_011: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_011');
      let Stack_ZIndex_012: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_012');
      let Stack_ZIndex_01: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_01');
      let Stack_ZIndex_01_width = Stack_ZIndex_01.right - Stack_ZIndex_01.left;
      let Stack_ZIndex_01_height = Stack_ZIndex_01.bottom - Stack_ZIndex_01.top;
      let theTop: number = Stack_ZIndex_012.top;
      let theLeft: number = Stack_ZIndex_012.left;
      // let num = imageComparisonAssert(theLeft, theTop);
      // await CommonFunc.sleep(3000);
      // console.log('[testStackZIndexWithAlignmentBottom] num is', num);
      // expect(num).assertEqual(true);
      console.log('Stack_ZIndex_01.bottom is', Stack_ZIndex_01.bottom);
      expect(Math.abs((Stack_ZIndex_01.bottom) - (Stack_ZIndex_011.bottom)) <= 1).assertTrue();
      expect(Math.abs((Stack_ZIndex_01.bottom) - (Stack_ZIndex_012.bottom)) <= 1).assertTrue();
      console.log('Stack_ZIndex_011.left - Stack_ZIndex_01.left is', Stack_ZIndex_011.left - Stack_ZIndex_01.left);
      expect(Math.abs(Math.round(Stack_ZIndex_011.left - Stack_ZIndex_01.left) -
      Math.round(Stack_ZIndex_01.right - Stack_ZIndex_011.right)) <= 1).assertTrue();
      console.log('Stack_ZIndex_012.left - Stack_ZIndex_01.left is', Stack_ZIndex_012.left - Stack_ZIndex_01.left);
      expect(Math.abs(Math.round(Stack_ZIndex_012.left - Stack_ZIndex_01.left) -
      Math.round(Stack_ZIndex_01.right - Stack_ZIndex_012.right)) <= 1).assertTrue();
      console.log('Stack_ZIndex_01_height is', Stack_ZIndex_01_height);
      console.log('Stack_ZIndex_01_width is', Stack_ZIndex_01_width);
      console.log('Stack_ZIndex_011.bottom - Stack_ZIndex_011.top is', Stack_ZIndex_011.bottom - Stack_ZIndex_011.top);
      expect(Math.floor(Math.abs(Stack_ZIndex_011.bottom - Stack_ZIndex_011.top - Stack_ZIndex_01_height * 0.7)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_012.bottom - Stack_ZIndex_012.top is', Stack_ZIndex_012.bottom - Stack_ZIndex_012.top);
      expect(Math.floor(Math.abs(Stack_ZIndex_012.bottom - Stack_ZIndex_012.top - Stack_ZIndex_01_height * 0.5)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_011.right - Stack_ZIndex_011.left is', Stack_ZIndex_011.right - Stack_ZIndex_011.left);
      expect(Math.floor(Math.abs(Stack_ZIndex_011.right - Stack_ZIndex_011.left - Stack_ZIndex_01_width * 0.7)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_012.right - Stack_ZIndex_012.left is', Stack_ZIndex_012.right - Stack_ZIndex_012.left);
      expect(Math.floor(Math.abs(Stack_ZIndex_012.right - Stack_ZIndex_012.left - Stack_ZIndex_01_width * 0.5)) <= 1)
        .assertTrue();
      console.info('[testStackZIndexWithAlignmentBottom] END');
      done();
    });
    
    /**
     * @tc.number  testStackZIndexWithAlignmentBottomEnd
     * @tc.name     testStackZIndexWithAlignmentBottomEnd
     * @tc.desc     testStackZIndexWithAlignmentBottomEnd
     * @tc.level    Level.LEVEL0
     */
    it('testStackZIndexWithAlignmentBottomEnd', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testStackZIndexWithAlignmentBottomEnd] START');
      AppStorage.get<MessageManager<number|Alignment>>("messageManager")?.notify({
        name: 'addAlignContent', value: Alignment.BottomEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Stack_ZIndex_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomEnd');
      let Stack_ZIndex_011: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_011');
      let Stack_ZIndex_012: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_012');
      let Stack_ZIndex_01: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_01');
      let Stack_ZIndex_01_width = Stack_ZIndex_01.right - Stack_ZIndex_01.left;
      let Stack_ZIndex_01_height = Stack_ZIndex_01.bottom - Stack_ZIndex_01.top;
      let theTop: number = Stack_ZIndex_012.top;
      let theLeft: number = Stack_ZIndex_012.left;
      // let num = imageComparisonAssert(theLeft, theTop);
      // await CommonFunc.sleep(3000);
      // console.log('[testStackZIndexWithAlignmentBottomEnd] num is', num);
      // expect(num).assertEqual(true);
      console.log('Stack_ZIndex_01.bottom is', Stack_ZIndex_01.bottom);
      expect(Math.abs(Stack_ZIndex_01.bottom - Stack_ZIndex_011.bottom) <= 1).assertTrue();
      expect(Math.abs(Stack_ZIndex_01.bottom - Stack_ZIndex_012.bottom) <= 1).assertTrue();
      console.log('Stack_ZIndex_01.right is', Stack_ZIndex_01.right);
      expect(Math.abs(Stack_ZIndex_01.right - Stack_ZIndex_011.right) <= 1).assertTrue();
      expect(Math.abs(Stack_ZIndex_01.right - Stack_ZIndex_012.right) <= 1).assertTrue();
      console.log('Stack_ZIndex_01_height is', Stack_ZIndex_01_height);
      console.log('Stack_ZIndex_01_width is', Stack_ZIndex_01_width);
      console.log('Stack_ZIndex_011.bottom - Stack_ZIndex_011.top is', Stack_ZIndex_011.bottom - Stack_ZIndex_011.top);
      expect(Math.floor(Math.abs(Stack_ZIndex_011.bottom - Stack_ZIndex_011.top - Stack_ZIndex_01_height * 0.7)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_012.bottom - Stack_ZIndex_012.top is', Stack_ZIndex_012.bottom - Stack_ZIndex_012.top);
      expect(Math.floor(Math.abs(Stack_ZIndex_012.bottom - Stack_ZIndex_012.top - Stack_ZIndex_01_height * 0.5)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_011.right - Stack_ZIndex_011.left is', Stack_ZIndex_011.right - Stack_ZIndex_011.left);
      expect(Math.floor(Math.abs(Stack_ZIndex_011.right - Stack_ZIndex_011.left - Stack_ZIndex_01_width * 0.7)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_012.right - Stack_ZIndex_012.left is', Stack_ZIndex_012.right - Stack_ZIndex_012.left);
      expect(Math.floor(Math.abs(Stack_ZIndex_012.right - Stack_ZIndex_012.left - Stack_ZIndex_01_width * 0.5)) <= 1)
        .assertTrue();
      console.info('[testStackZIndexWithAlignmentBottomEnd] END');
      done();
    });
  })
}

