/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../../MainAbility/common/Common';
import screenshot from '@ohos.screenshot';
import image from '@ohos.multimedia.image';
import window from '@ohos.window';
export default function Stack_ZIndex() {
  describe('Stack_ZIndex_Test', function () {
    async function imageComparisonAssert(left, top) {
      let windowClass = null;
      let theWinTop = 0;
      let isTrue = true
      try {
        let winTop = window.getLastWindow(globalThis.abilityContext);
        winTop.then((data) => {
          windowClass = data;
          console.info('Succeeded in obtaining the top window. Data: ' + JSON.stringify(data));
          let properties = windowClass.getWindowProperties();
          console.info('Succeeded in obtaining the window properties. Data: ' + properties.windowRect.top);
          theWinTop = properties.windowRect.top + top
        }).catch((err) => {
          console.error('Failed to obtain the top window. Cause: ' + err);
        });
      } catch (exception) {
        console.error('Failed to obtain the top window. Cause: ' + JSON.stringify(exception));
      }
      await CommonFunc.sleep(3000);
      let screenshotOptions = {
        "screenRect": {
          "left": left,
          "top": theWinTop,
          "width": 150,
          "height": 150
        },
        "imageSize": {
          "width": 150,
          "height": 150
        },
        "rotation": 0,
        "displayId": 0
      };
      try {
        await screenshot.save(screenshotOptions, (err, pixelMap) => {
          if (err) {
            console.log('Failed to save screenshot. Code: ' + JSON.stringify(err));
            isTrue = false;
            return isTrue;
          }
          console.log('Succeeded in saving sreenshot. Pixel bytes number: ' + pixelMap.getPixelBytesNumber());
          let PixelBytesNumber = pixelMap.getPixelBytesNumber();
          const color = new ArrayBuffer(PixelBytesNumber);
          pixelMap.readPixelsToBuffer(color, (err, res) => {
            if (err) {
              console.log('Failed to read image pixel data.' + err);
              isTrue = false;
            } else {
              var bufferArr = new Uint8Array(color)
              for (var i = 0; i < bufferArr.length; i += 40) {
                if (bufferArr[i] != 255 || bufferArr[i + 1] != 0 || bufferArr[i + 2] != 0) {
                  isTrue = false;
                  break;
                }
              }
            }
          })
          pixelMap.release();
        });
      } catch (exception) {
        console.error('Failed to save screenshot. Code: ' + JSON.stringify(exception));
        isTrue = false;
      };
      await CommonFunc.sleep(5000);
      return isTrue;
    }
    beforeEach(async function (done) {
      console.info("Stack_ZIndex beforeEach start");
      let options = {
        url: "MainAbility/pages/Stack/StackItem_change/stack_zIndex",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Stack_ZIndex state pages:" + JSON.stringify(pages));
        if (!("stack_zIndex" == pages.name)) {
          console.info("get Stack_ZIndex pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Stack_ZIndex page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Stack_ZIndex page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Stack_ZIndex beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("Stack_ZIndex after each called");
    });
    /**
     * @tc.number    SUB_ACE_STACK_ZINDEX_TEST_0400
     * @tc.name      testStackZIndexWithAlignmentStart
     * @tc.desc      The stack component sets alignContent to Alignment.Start and sets the zIndex of
     *               the first subcomponent
     */
    it('testStackZIndexWithAlignmentStart', 0, async function (done) {
      console.info('[testStackZIndexWithAlignmentStart] START');
      globalThis.value.message.notify({ name: 'addAlignContent', value: Alignment.Start });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Stack_ZIndex_01');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Stack');
      expect(obj.$attrs.alignContent).assertEqual('Alignment.Start');
      let Stack_ZIndex_011 = CommonFunc.getComponentRect('Stack_ZIndex_011');
      let Stack_ZIndex_012 = CommonFunc.getComponentRect('Stack_ZIndex_012');
      let Stack_ZIndex_01 = CommonFunc.getComponentRect('Stack_ZIndex_01');
      let theTop = Stack_ZIndex_012.top;
      let num = await imageComparisonAssert(0, theTop);
      await CommonFunc.sleep(1000);
      console.log('num is',+num);
      expect(num).assertEqual(true);
      console.log('Stack_ZIndex_01.left is',+Stack_ZIndex_01.left);
      expect(Math.abs(Stack_ZIndex_01.left - Stack_ZIndex_011.left) <= 1).assertTrue();
      expect(Math.abs(Stack_ZIndex_01.left - Stack_ZIndex_012.left) <= 1).assertTrue();
      console.log('Stack_ZIndex_011.top - Stack_ZIndex_01.top is', +Stack_ZIndex_011.top - Stack_ZIndex_01.top);
      expect(Math.abs(Math.round(Stack_ZIndex_011.top - Stack_ZIndex_01.top) -
        Math.round(Stack_ZIndex_01.bottom - Stack_ZIndex_011.bottom)) <= 1).assertTrue();
      console.log('Stack_ZIndex_012.top - Stack_ZIndex_01.top is', +Stack_ZIndex_012.top - Stack_ZIndex_01.top);
      expect(Math.abs(Math.round(Stack_ZIndex_012.top - Stack_ZIndex_01.top) -
        Math.round(Stack_ZIndex_01.bottom - Stack_ZIndex_012.bottom)) <= 1).assertTrue();
      console.log('Stack_ZIndex_011.bottom - Stack_ZIndex_011.top is', +Stack_ZIndex_011.bottom - Stack_ZIndex_011.top);
      expect(Math.abs((Math.round(Stack_ZIndex_011.bottom - Stack_ZIndex_011.top)) - (Math.round(vp2px(200)))) <= 1).assertTrue();
      console.log('Stack_ZIndex_012.bottom - Stack_ZIndex_012.top is', +Stack_ZIndex_012.bottom - Stack_ZIndex_012.top);
      expect(Math.abs((Math.round(Stack_ZIndex_012.bottom - Stack_ZIndex_012.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      console.log('Stack_ZIndex_011.right - Stack_ZIndex_011.left is', +Stack_ZIndex_011.right - Stack_ZIndex_011.left);
      expect(Math.abs((Math.round(Stack_ZIndex_011.right - Stack_ZIndex_011.left)) - (Math.round(vp2px(200)))) <= 1).assertTrue();
      console.log('Stack_ZIndex_012.right - Stack_ZIndex_012.left is', +Stack_ZIndex_012.right - Stack_ZIndex_012.left);
      expect(Math.abs((Math.round(Stack_ZIndex_012.right - Stack_ZIndex_012.left)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      console.info('[testStackZIndexWithAlignmentStart] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_STACK_ZINDEX_TEST_0500
     * @tc.name      testStackZIndexWithAlignmentCenter
     * @tc.desc      The stack component sets alignContent to Alignment.Center and sets the zIndex of
     *               the first subcomponent
     */
    it('testStackZIndexWithAlignmentCenter', 0, async function (done) {
      console.info('[testStackZIndexWithAlignmentCenter] START');
      globalThis.value.message.notify({ name: 'addAlignContent', value: Alignment.Center });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Stack_ZIndex_01');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Stack');
      expect(obj.$attrs.alignContent).assertEqual('Alignment.Center');
      let Stack_ZIndex_011 = CommonFunc.getComponentRect('Stack_ZIndex_011');
      let Stack_ZIndex_012 = CommonFunc.getComponentRect('Stack_ZIndex_012');
      let Stack_ZIndex_01 = CommonFunc.getComponentRect('Stack_ZIndex_01');
      let theTop = Stack_ZIndex_012.top;
      let theLeft = Stack_ZIndex_012.left;
      let num = await imageComparisonAssert(theLeft, theTop);
      await CommonFunc.sleep(1000);
      console.log('num is',+num);
      expect(num).assertEqual(true);
      console.log('Stack_ZIndex_011.left - Stack_ZIndex_01.left is',+Stack_ZIndex_011.left - Stack_ZIndex_01.left);
      expect(Math.abs(Math.round(Stack_ZIndex_011.left - Stack_ZIndex_01.left) - 
      Math.round(Stack_ZIndex_01.right - Stack_ZIndex_011.right)) <= 1).assertTrue();
      console.log('Stack_ZIndex_012.left - Stack_ZIndex_01.left is', +Stack_ZIndex_012.left - Stack_ZIndex_01.left);
      expect(Math.abs(Math.round(Stack_ZIndex_012.left - Stack_ZIndex_01.left) -
        Math.round(Stack_ZIndex_01.right - Stack_ZIndex_012.right)) <= 1).assertTrue();
      console.log('Stack_ZIndex_011.top - Stack_ZIndex_01.top is', +Stack_ZIndex_011.top - Stack_ZIndex_01.top);
      expect(Math.abs(Math.round(Stack_ZIndex_011.top - Stack_ZIndex_01.top) -
        Math.round(Stack_ZIndex_01.bottom - Stack_ZIndex_011.bottom)) <= 1).assertTrue();
      console.log('Stack_ZIndex_012.top - Stack_ZIndex_01.top is', +Stack_ZIndex_012.top - Stack_ZIndex_01.top);
      expect(Math.abs(Math.round(Stack_ZIndex_012.top - Stack_ZIndex_01.top) -
        Math.round(Stack_ZIndex_01.bottom - Stack_ZIndex_012.bottom)) <= 1).assertTrue();
      console.log('Stack_ZIndex_011.bottom - Stack_ZIndex_011.top is', +Stack_ZIndex_011.bottom - Stack_ZIndex_011.top);
      expect(Math.abs((Math.round(Stack_ZIndex_011.bottom - Stack_ZIndex_011.top)) - (Math.round(vp2px(200)))) <= 1).assertTrue();
      console.log('Stack_ZIndex_012.bottom - Stack_ZIndex_012.top is', +Stack_ZIndex_012.bottom - Stack_ZIndex_012.top);
      expect(Math.abs((Math.round(Stack_ZIndex_012.bottom - Stack_ZIndex_012.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      console.log('Stack_ZIndex_011.right - Stack_ZIndex_011.left is', +Stack_ZIndex_011.right - Stack_ZIndex_011.left);
      expect(Math.abs((Math.round(Stack_ZIndex_011.right - Stack_ZIndex_011.left)) - (Math.round(vp2px(200)))) <= 1).assertTrue();
      console.log('Stack_ZIndex_012.right - Stack_ZIndex_012.left is', +Stack_ZIndex_012.right - Stack_ZIndex_012.left);
      expect(Math.abs((Math.round(Stack_ZIndex_012.right - Stack_ZIndex_012.left)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      console.info('[testStackZIndexWithAlignmentCenter] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_STACK_ZINDEX_TEST_0600
     * @tc.name      testStackZIndexWithAlignmentEnd
     * @tc.desc      The stack component sets alignContent to Alignment.End and sets the zIndex of
     *               the first subcomponent
     */
    it('testStackZIndexWithAlignmentEnd', 0, async function (done) {
      console.info('[testStackZIndexWithAlignmentEnd] START');
      globalThis.value.message.notify({ name: 'addAlignContent', value: Alignment.End });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Stack_ZIndex_01');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Stack');
      expect(obj.$attrs.alignContent).assertEqual('Alignment.End');
      let Stack_ZIndex_011 = CommonFunc.getComponentRect('Stack_ZIndex_011');
      let Stack_ZIndex_012 = CommonFunc.getComponentRect('Stack_ZIndex_012');
      let Stack_ZIndex_01 = CommonFunc.getComponentRect('Stack_ZIndex_01');
      let theTop = Stack_ZIndex_012.top;
      let theLeft = Stack_ZIndex_012.left;
      let num = await imageComparisonAssert(theLeft, theTop);
      await CommonFunc.sleep(1000);
      console.log('num is',+num);
      expect(num).assertEqual(true);
      console.log('Stack_ZIndex_01.right is',+Stack_ZIndex_01.right);
      expect(Math.abs((Stack_ZIndex_01.right) - (Stack_ZIndex_011.right)) <= 1).assertTrue();
      expect(Math.abs((Stack_ZIndex_01.right) - (Stack_ZIndex_012.right)) <= 1).assertTrue();
      console.log('Stack_ZIndex_011.top - Stack_ZIndex_01.top is', +Stack_ZIndex_011.top - Stack_ZIndex_01.top);
      expect(Math.abs(Math.round(Stack_ZIndex_011.top - Stack_ZIndex_01.top) -
        Math.round(Stack_ZIndex_01.bottom - Stack_ZIndex_011.bottom)) <= 1).assertTrue();
      console.log('Stack_ZIndex_012.top - Stack_ZIndex_01.top is', +Stack_ZIndex_012.top - Stack_ZIndex_01.top);
      expect(Math.abs(Math.round(Stack_ZIndex_012.top - Stack_ZIndex_01.top) -
        Math.round(Stack_ZIndex_01.bottom - Stack_ZIndex_012.bottom)) <= 1).assertTrue();
      console.log('Stack_ZIndex_011.bottom - Stack_ZIndex_011.top is', +Stack_ZIndex_011.bottom - Stack_ZIndex_011.top);
      expect(Math.abs((Math.round(Stack_ZIndex_011.bottom - Stack_ZIndex_011.top)) - (Math.round(vp2px(200)))) <= 1).assertTrue();
      console.log('Stack_ZIndex_012.bottom - Stack_ZIndex_012.top is', +Stack_ZIndex_012.bottom - Stack_ZIndex_012.top);
      expect(Math.abs((Math.round(Stack_ZIndex_012.bottom - Stack_ZIndex_012.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      console.log('Stack_ZIndex_011.right - Stack_ZIndex_011.left is', +Stack_ZIndex_011.right - Stack_ZIndex_011.left);
      expect(Math.abs((Math.round(Stack_ZIndex_011.right - Stack_ZIndex_011.left)) - (Math.round(vp2px(200)))) <= 1).assertTrue();
      console.log('Stack_ZIndex_012.right - Stack_ZIndex_012.left is', +Stack_ZIndex_012.right - Stack_ZIndex_012.left);
      expect(Math.abs((Math.round(Stack_ZIndex_012.right - Stack_ZIndex_012.left)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      console.info('[testStackZIndexWithAlignmentEnd] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_STACK_ZINDEX_TEST_0700
     * @tc.name      testStackZIndexWithAlignmentBottomStart
     * @tc.desc      The stack component sets alignContent to Alignment.BottomStart and sets the zIndex of
     *               the first subcomponent
     */
    it('testStackZIndexWithAlignmentBottomStart', 0, async function (done) {
      console.info('[testStackZIndexWithAlignmentBottomStart] START');
      globalThis.value.message.notify({ name: 'addAlignContent', value: Alignment.BottomStart });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Stack_ZIndex_01');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Stack');
      expect(obj.$attrs.alignContent).assertEqual('Alignment.BottomStart');
      let Stack_ZIndex_011 = CommonFunc.getComponentRect('Stack_ZIndex_011');
      let Stack_ZIndex_012 = CommonFunc.getComponentRect('Stack_ZIndex_012');
      let Stack_ZIndex_01 = CommonFunc.getComponentRect('Stack_ZIndex_01');
      let theTop = Stack_ZIndex_012.top;
      let num = await imageComparisonAssert(0, theTop);
      await CommonFunc.sleep(1000);
      console.log('num is',+num);
      expect(num).assertEqual(true);
      console.log('Stack_ZIndex_01.left is',+Stack_ZIndex_01.left);
      expect(Math.abs(Stack_ZIndex_01.left - Stack_ZIndex_011.left) <= 1).assertTrue();
      expect(Math.abs(Stack_ZIndex_01.left - Stack_ZIndex_012.left) <= 1).assertTrue();
      console.log('Stack_ZIndex_01.bottom is', +Stack_ZIndex_01.bottom);
      expect(Math.abs(Stack_ZIndex_01.bottom - Stack_ZIndex_011.bottom) <= 1).assertTrue();
      expect(Math.abs(Stack_ZIndex_01.bottom - Stack_ZIndex_012.bottom) <= 1).assertTrue();
      console.log('Stack_ZIndex_011.bottom - Stack_ZIndex_011.top is', +Stack_ZIndex_011.bottom - Stack_ZIndex_011.top);
      expect(Math.abs((Math.round(Stack_ZIndex_011.bottom - Stack_ZIndex_011.top)) - (Math.round(vp2px(200)))) <= 1).assertTrue();
      console.log('Stack_ZIndex_012.bottom - Stack_ZIndex_012.top is', +Stack_ZIndex_012.bottom - Stack_ZIndex_012.top);
      expect(Math.abs((Math.round(Stack_ZIndex_012.bottom - Stack_ZIndex_012.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      console.log('Stack_ZIndex_011.right - Stack_ZIndex_011.left is', +Stack_ZIndex_011.right - Stack_ZIndex_011.left);
      expect(Math.abs((Math.round(Stack_ZIndex_011.right - Stack_ZIndex_011.left)) - (Math.round(vp2px(200)))) <= 1).assertTrue();
      console.log('Stack_ZIndex_012.right - Stack_ZIndex_012.left is', +Stack_ZIndex_012.right - Stack_ZIndex_012.left);
      expect(Math.abs((Math.round(Stack_ZIndex_012.right - Stack_ZIndex_012.left)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      console.info('[testStackZIndexWithAlignmentBottomStart] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_STACK_ZINDEX_TEST_0800
     * @tc.name      testStackZIndexWithAlignmentBottom
     * @tc.desc      The stack component sets alignContent to Alignment.Bottom and sets the zIndex of
     *               the first subcomponent
     */
    it('testStackZIndexWithAlignmentBottom', 0, async function (done) {
      console.info('[testStackZIndexWithAlignmentBottom] START');
      globalThis.value.message.notify({ name: 'addAlignContent', value: Alignment.Bottom });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Stack_ZIndex_01');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Stack');
      expect(obj.$attrs.alignContent).assertEqual('Alignment.Bottom');
      let Stack_ZIndex_011 = CommonFunc.getComponentRect('Stack_ZIndex_011');
      let Stack_ZIndex_012 = CommonFunc.getComponentRect('Stack_ZIndex_012');
      let Stack_ZIndex_01 = CommonFunc.getComponentRect('Stack_ZIndex_01');
      let theTop = Stack_ZIndex_012.top;
      let theLeft = Stack_ZIndex_012.left;
      let num = await imageComparisonAssert(theLeft, theTop);
      await CommonFunc.sleep(3000);
      console.log('num is',+num);
      expect(num).assertEqual(true);
      console.log('Stack_ZIndex_01.bottom is',+Stack_ZIndex_01.bottom);
      expect(Math.abs((Stack_ZIndex_01.bottom) - (Stack_ZIndex_011.bottom)) <= 1).assertTrue();
      expect(Math.abs((Stack_ZIndex_01.bottom) - (Stack_ZIndex_012.bottom)) <= 1).assertTrue();
      console.log('Stack_ZIndex_011.left - Stack_ZIndex_01.left is', +Stack_ZIndex_011.left - Stack_ZIndex_01.left);
      expect(Math.abs(Math.round(Stack_ZIndex_011.left - Stack_ZIndex_01.left) -
        Math.round(Stack_ZIndex_01.right - Stack_ZIndex_011.right)) <= 1).assertTrue();
      console.log('Stack_ZIndex_012.left - Stack_ZIndex_01.left is', +Stack_ZIndex_012.left - Stack_ZIndex_01.left);
      expect(Math.abs(Math.round(Stack_ZIndex_012.left - Stack_ZIndex_01.left) -
        Math.round(Stack_ZIndex_01.right - Stack_ZIndex_012.right)) <= 1).assertTrue();
      console.log('Stack_ZIndex_011.bottom - Stack_ZIndex_011.top is', +Stack_ZIndex_011.bottom - Stack_ZIndex_011.top);
      expect(Math.abs((Math.round(Stack_ZIndex_011.bottom - Stack_ZIndex_011.top)) - (Math.round(vp2px(200)))) <= 1).assertTrue();
      console.log('Stack_ZIndex_012.bottom - Stack_ZIndex_012.top is', +Stack_ZIndex_012.bottom - Stack_ZIndex_012.top);
      expect(Math.abs((Math.round(Stack_ZIndex_012.bottom - Stack_ZIndex_012.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      console.log('Stack_ZIndex_011.right - Stack_ZIndex_011.left is', +Stack_ZIndex_011.right - Stack_ZIndex_011.left);
      expect(Math.abs((Math.round(Stack_ZIndex_011.right - Stack_ZIndex_011.left)) - (Math.round(vp2px(200)))) <= 1).assertTrue();
      console.log('Stack_ZIndex_012.right - Stack_ZIndex_012.left is', +Stack_ZIndex_012.right - Stack_ZIndex_012.left);
      expect(Math.abs((Math.round(Stack_ZIndex_012.right - Stack_ZIndex_012.left)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      console.info('[testStackZIndexWithAlignmentBottom] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_STACK_ZINDEX_TEST_0900
     * @tc.name      testStackZIndexWithAlignmentBottomEnd
     * @tc.desc      The stack component sets alignContent to Alignment.BottomEnd and sets the zIndex of
     *               the first subcomponent
     */
    it('testStackZIndexWithAlignmentBottomEnd', 0, async function (done) {
      console.info('[testStackZIndexWithAlignmentBottomEnd] START');
      globalThis.value.message.notify({ name: 'addAlignContent', value: Alignment.BottomEnd });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Stack_ZIndex_01');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Stack');
      expect(obj.$attrs.alignContent).assertEqual('Alignment.BottomEnd');
      let Stack_ZIndex_011 = CommonFunc.getComponentRect('Stack_ZIndex_011');
      let Stack_ZIndex_012 = CommonFunc.getComponentRect('Stack_ZIndex_012');
      let Stack_ZIndex_01 = CommonFunc.getComponentRect('Stack_ZIndex_01');
      let theTop = Stack_ZIndex_012.top;
      let theLeft = Stack_ZIndex_012.left;
      let num = await imageComparisonAssert(theLeft, theTop);
      await CommonFunc.sleep(3000);
      console.log('num is',+num);
      expect(num).assertEqual(true);
      console.log('Stack_ZIndex_01.bottom is',+Stack_ZIndex_01.bottom);
      expect(Math.abs(Stack_ZIndex_01.bottom - Stack_ZIndex_011.bottom) <= 1).assertTrue();
      expect(Math.abs(Stack_ZIndex_01.bottom - Stack_ZIndex_012.bottom) <= 1).assertTrue();
      console.log('Stack_ZIndex_01.right is', +Stack_ZIndex_01.right);
      expect(Math.abs(Stack_ZIndex_01.right - Stack_ZIndex_011.right) <= 1).assertTrue();
      expect(Math.abs(Stack_ZIndex_01.right - Stack_ZIndex_012.right) <= 1).assertTrue();
      console.log('Stack_ZIndex_011.bottom - Stack_ZIndex_011.top is', +Stack_ZIndex_011.bottom - Stack_ZIndex_011.top);
      expect(Math.abs((Math.round(Stack_ZIndex_011.bottom - Stack_ZIndex_011.top)) - (Math.round(vp2px(200)))) <= 1).assertTrue();
      console.log('Stack_ZIndex_012.bottom - Stack_ZIndex_012.top is', +Stack_ZIndex_012.bottom - Stack_ZIndex_012.top);
      expect(Math.abs((Math.round(Stack_ZIndex_012.bottom - Stack_ZIndex_012.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      console.log('Stack_ZIndex_011.right - Stack_ZIndex_011.left is', +Stack_ZIndex_011.right - Stack_ZIndex_011.left);
      expect(Math.abs((Math.round(Stack_ZIndex_011.right - Stack_ZIndex_011.left)) - (Math.round(vp2px(200)))) <= 1).assertTrue();
      console.log('Stack_ZIndex_012.right - Stack_ZIndex_012.left is', +Stack_ZIndex_012.right - Stack_ZIndex_012.left);
      expect(Math.abs((Math.round(Stack_ZIndex_012.right - Stack_ZIndex_012.left)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      console.info('[testStackZIndexWithAlignmentBottomEnd] END');
      done();
    });
  })
}
