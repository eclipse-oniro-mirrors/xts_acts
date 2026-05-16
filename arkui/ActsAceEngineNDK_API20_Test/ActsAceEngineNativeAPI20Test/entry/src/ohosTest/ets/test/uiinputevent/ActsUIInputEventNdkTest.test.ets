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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import uiinputeventndk from 'libuiinputeventndk.so'
import Utils from '../common/Utils';
import { Point, MouseButton } from '@kit.TestKit';

const OS_ACCOUNT_ERR_OK = 0;

export default function ActsUIInputEventNdkTest() {
  describe('ActsUIInputEventNdkTest', () => {
    const x1: number = Math.floor(globalThis.winWidth / 2 + globalThis.winLeft);
    const y1: number = Math.floor(globalThis.winHeight / 2 + globalThis.winTop);
    const x2: number = Math.floor(globalThis.winWidth / 4 + globalThis.winLeft);
    const y2: number = Math.floor(globalThis.winHeight / 4 + globalThis.winTop);
    const moveFrom: Point = { x: x1, y: y1 };
    const moveTo: Point = { x: x2, y: y2 };
    const speed: number = 2500;
    beforeEach(async (done: Function) => {
      Utils.pushPageNoClear('UIInputEvent/UIInputEvent', done);
    })

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0101
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0101
     * @tc.desc   test ArkUI_UIInputEvent_Type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0101 start====");
          await Utils.driver.triggerKey(2017);
          let result = uiinputeventndk.UIInputEventType0101();
          console.info("====>testArkUI_UIInputEvent_Type_0101 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done()
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0101 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      })

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0102
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0102
     * @tc.desc   test ArkUI_UIInputEvent_Type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0102 start====");
          await Utils.driver.triggerKey(2017);
          let result = uiinputeventndk.UIInputEventType0102();
          console.info("====>testArkUI_UIInputEvent_Type_0102 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done()
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0102 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      })

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0103
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0103
     * @tc.desc   test ArkUI_UIInputEvent_Type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0103 start====");
          await Utils.driver.mouseClick(moveFrom, MouseButton.MOUSE_BUTTON_LEFT);
          let result = uiinputeventndk.UIInputEventType0103();
          console.info("====>testArkUI_UIInputEvent_Type_0103 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done()
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0103 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      })

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0104
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0104
     * @tc.desc   test ArkUI_UIInputEvent_Type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0104 start====");
          await Utils.driver.swipeBetween(moveFrom, moveTo);
          let result = uiinputeventndk.UIInputEventType0104();
          console.info("====>testArkUI_UIInputEvent_Type_0104 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done()
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0104 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      })

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0106
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0106
     * @tc.desc   test ArkUI_UIInputEvent_Type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0106 start====");
          await Utils.driver.swipe(x1, y1, x2, y2);
          let result = uiinputeventndk.UIInputEventType0106();
          console.info("====>testArkUI_UIInputEvent_Type_0106 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done();
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0106 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0107
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0107
     * @tc.desc   test ArkUI_UIInputEvent_Type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0107 start====");
          await Utils.driver.swipe(x1, y1, x2, y2);
          let result = uiinputeventndk.UIInputEventType0107();
          console.info("====>testArkUI_UIInputEvent_Type_0107 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done();
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0107 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0108
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0108
     * @tc.desc   test ArkUI_UIInputEvent_Type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0108 start====");
          await Utils.driver.mouseClick(moveTo, MouseButton.MOUSE_BUTTON_MIDDLE);
          let result = uiinputeventndk.UIInputEventType0108();
          console.info("====>testArkUI_UIInputEvent_Type_0108 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done()
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0108 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      })

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0109
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0109
     * @tc.desc   test ArkUI_UIInputEvent_Type with middle mouse click at (300, 200).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0109 start====");
          await Utils.driver.mouseClick(moveFrom, MouseButton.MOUSE_BUTTON_MIDDLE);
          let result = uiinputeventndk.UIInputEventType0109();
          console.info("====>testArkUI_UIInputEvent_Type_0109 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done();
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0109 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0110
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0110
     * @tc.desc   test ArkUI_UIInputEvent_Type with right mouse click at (200, 300).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0110 start====");
          await Utils.driver.mouseClick(moveFrom, MouseButton.MOUSE_BUTTON_RIGHT);
          let result = uiinputeventndk.UIInputEventType0110();
          console.info("====>testArkUI_UIInputEvent_Type_0110 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done();
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0110 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0111
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0111
     * @tc.desc   test ArkUI_UIInputEvent_Type with left mouse click at (400, 350).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0111 start====");

          await Utils.driver.mouseClick(moveFrom, MouseButton.MOUSE_BUTTON_LEFT);
          let result = uiinputeventndk.UIInputEventType0111();
          console.info("====>testArkUI_UIInputEvent_Type_0111 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done();
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0111 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0113
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0113
     * @tc.desc   test ArkUI_UIInputEvent_Type with middle mouse click at (150, 250) and extended delay.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0113 start====");
          await Utils.driver.mouseClick(moveFrom, MouseButton.MOUSE_BUTTON_MIDDLE, 3000);
          let result = uiinputeventndk.UIInputEventType0113();
          console.info("====>testArkUI_UIInputEvent_Type_0113 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done();
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0113 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0114
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0114
     * @tc.desc   test ArkUI_UIInputEvent_Type with middle mouse click at (150, 250) and extended delay.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0114 start====");
          await Utils.driver.mouseClick(moveFrom, MouseButton.MOUSE_BUTTON_LEFT, 3000);
          let result = uiinputeventndk.UIInputEventType0114();
          console.info("====>testArkUI_UIInputEvent_Type_0114 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done();
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0114 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });
    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0115
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0115
     * @tc.desc   test ArkUI_UIInputEvent_Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0115 start====");
          await Utils.driver.mouseClick(moveFrom, MouseButton.MOUSE_BUTTON_LEFT, 3000);
          let result = uiinputeventndk.UIInputEventType0115();
          console.info("====>testArkUI_UIInputEvent_Type_0115 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done();
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0115 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0116
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0116
     * @tc.desc   test ArkUI_UIInputEvent_Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0116 start====");
          await Utils.driver.mouseClick(moveTo, MouseButton.MOUSE_BUTTON_LEFT, 3000);
          let result = uiinputeventndk.UIInputEventType0116();
          console.info("====>testArkUI_UIInputEvent_Type_0116 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done();
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0116 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0119
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0119
     * @tc.desc   test ArkUI_UIInputEvent_Type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0119 start====");
          await Utils.driver.swipe(x1, y1, x2, y2, speed);
          let result = uiinputeventndk.UIInputEventType0119();
          console.info("====>testArkUI_UIInputEvent_Type_0119 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done()
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0119 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      })

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0122
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0122
     * @tc.desc   test ArkUI_UIInputEvent_Type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0122 start====");
          await Utils.driver.mouseScroll(moveTo, true, 5);
          let result = uiinputeventndk.UIInputEventType0122();
          console.info("====>testArkUI_UIInputEvent_Type_0122 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done()
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0122 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      })

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0123
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0123
     * @tc.desc   test ArkUI_UIInputEvent_Type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0123 start====");
          await Utils.driver.mouseScroll(moveTo, true, 5);
          let result = uiinputeventndk.UIInputEventType0123();
          console.info("====>testArkUI_UIInputEvent_Type_0123 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done()
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0123 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      })

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0124
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0124
     * @tc.desc   test ArkUI_UIInputEvent_Type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0124 start====");
          await Utils.driver.mouseScroll(moveTo, true, 5);
          let result = uiinputeventndk.UIInputEventType0124();
          console.info("====>testArkUI_UIInputEvent_Type_0124 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done()
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0124 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      })

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0125
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0125
     * @tc.desc   test ArkUI_UIInputEvent_Type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0125 start====");
          await Utils.driver.mouseScroll(moveTo, true, 5);
          let result = uiinputeventndk.UIInputEventType0125();
          console.info("====>testArkUI_UIInputEvent_Type_0125 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done()
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0125 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      })

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0128
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0128
     * @tc.desc   test ArkUI_UIInputEvent_Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0128 start====");
          await Utils.driver.mouseClick(moveTo, MouseButton.MOUSE_BUTTON_LEFT, 3000);
          let result = uiinputeventndk.UIInputEventType0128();
          console.info("====>testArkUI_UIInputEvent_Type_0128 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done();
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0128 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0129
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0129
     * @tc.desc   test ArkUI_UIInputEvent_Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0129 start====");
          await Utils.driver.mouseClick(moveTo, MouseButton.MOUSE_BUTTON_LEFT, 3000);
          let result = uiinputeventndk.UIInputEventType0129();
          console.info("====>testArkUI_UIInputEvent_Type_0129 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done();
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0129 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0130
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0130
     * @tc.desc   test ArkUI_UIInputEvent_Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0130 start====");
          await Utils.driver.mouseClick(moveTo, MouseButton.MOUSE_BUTTON_LEFT, 3000);
          let result = uiinputeventndk.UIInputEventType0130();
          console.info("====>testArkUI_UIInputEvent_Type_0130 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done();
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0130 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0131
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0131
     * @tc.desc   test ArkUI_UIInputEvent_Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0131 start====");
          await Utils.driver.swipe(x1, y1, x2, y2);
          let result = uiinputeventndk.UIInputEventType0131();
          console.info("====>testArkUI_UIInputEvent_Type_0131 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done();
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0131 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0132
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0132
     * @tc.desc   test ArkUI_UIInputEvent_Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0132 start====");
          await Utils.driver.swipe(x1, y1, x2, y2);
          let result = uiinputeventndk.UIInputEventType0132();
          console.info("====>testArkUI_UIInputEvent_Type_0132 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done();
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0132 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0133
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0133
     * @tc.desc   test ArkUI_UIInputEvent_Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0133 start====");
          await Utils.driver.swipe(x1, y1, x2, y2);
          let result = uiinputeventndk.UIInputEventType0133();
          console.info("====>testArkUI_UIInputEvent_Type_0133 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done();
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0133 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0134
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0134
     * @tc.desc   test ArkUI_UIInputEvent_Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0134 start====");
          await Utils.driver.swipe(x1, y1, x2, y2);
          let result = uiinputeventndk.UIInputEventType0134();
          console.info("====>testArkUI_UIInputEvent_Type_0134 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done();
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0134 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0135
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0135
     * @tc.desc   test ArkUI_UIInputEvent_Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0135 start====");
          await Utils.driver.swipe(x1, y1, x2, y2);
          let result = uiinputeventndk.UIInputEventType0135();
          console.info("====>testArkUI_UIInputEvent_Type_0135 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done();
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0135 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0136
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0136
     * @tc.desc   test ArkUI_UIInputEvent_Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0136 start====");
          await Utils.driver.swipe(x1, y1, x2, y2);
          let result = uiinputeventndk.UIInputEventType0136();
          console.info("====>testArkUI_UIInputEvent_Type_0136 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done();
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0136 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0137
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0137
     * @tc.desc   test ArkUI_UIInputEvent_Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0137 start====");
          await Utils.driver.swipe(x1, y1, x2, y2);
          let result = uiinputeventndk.UIInputEventType0137();
          console.info("====>testArkUI_UIInputEvent_Type_0137 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done();
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0137 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0138
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0138
     * @tc.desc   test ArkUI_UIInputEvent_Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0138 start====");
          await Utils.driver.swipe(x1, y1, x2, y2);
          let result = uiinputeventndk.UIInputEventType0138();
          console.info("====>testArkUI_UIInputEvent_Type_0138 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done();
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0138 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0139
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0139
     * @tc.desc   test ArkUI_UIInputEvent_Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0139 start====");
          await Utils.driver.swipe(x1, y1, x2, y2);
          let result = uiinputeventndk.UIInputEventType0139();
          console.info("====>testArkUI_UIInputEvent_Type_0139 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done();
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0139 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0140
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0140
     * @tc.desc   test ArkUI_UIInputEvent_Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0140 start====");
          await Utils.driver.triggerKey(2000)
          await Utils.driver.triggerKey(2001)
          await Utils.driver.triggerKey(2002)
          let result = uiinputeventndk.UIInputEventType0140();
          console.info("====>testArkUI_UIInputEvent_Type_0140 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done();
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0140 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0142
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0142
     * @tc.desc   test ArkUI_UIInputEvent_Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0142 start====");
          await Utils.driver.triggerKey(2000)
          await Utils.driver.triggerKey(2001)
          await Utils.driver.triggerKey(2002)
          let result = uiinputeventndk.UIInputEventType0142();
          console.info("====>testArkUI_UIInputEvent_Type_0142 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done();
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0142 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0143
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0143
     * @tc.desc   test ArkUI_UIInputEvent_Type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0143 start====");
          await Utils.driver.triggerCombineKeys(2045, 2019);
          let result = uiinputeventndk.UIInputEventType0143();
          console.info("====>testArkUI_UIInputEvent_Type_0143 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done()
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0143 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      })

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0144
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0144
     * @tc.desc   test ArkUI_UIInputEvent_Type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0144 start====");
          await Utils.driver.mouseClick(moveTo, MouseButton.MOUSE_BUTTON_LEFT, 2001);
          let result = uiinputeventndk.UIInputEventType0144();
          console.info("====>testArkUI_UIInputEvent_Type_0144 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done()
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0144 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0146
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0146
     * @tc.desc   test ArkUI_UIInputEvent_Type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0146 start====");
          await Utils.driver.mouseClick(moveTo, MouseButton.MOUSE_BUTTON_LEFT);
          let result = uiinputeventndk.UIInputEventType0146();
          console.info("====>testArkUI_UIInputEvent_Type_0146 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done()
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0146 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0147
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0147
     * @tc.desc   test ArkUI_UIInputEvent_Type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0147 start====");
          await Utils.driver.mouseClick(moveTo, MouseButton.MOUSE_BUTTON_LEFT);
          let result = uiinputeventndk.UIInputEventType0147();
          console.info("====>testArkUI_UIInputEvent_Type_0147 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done()
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0147 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0148
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0148
     * @tc.desc   test ArkUI_UIInputEvent_Type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0148 start====");
          await Utils.driver.mouseClick(moveTo, MouseButton.MOUSE_BUTTON_LEFT);
          let result = uiinputeventndk.UIInputEventType0148();
          console.info("====>testArkUI_UIInputEvent_Type_0148 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done()
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0148 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0149
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0149
     * @tc.desc   test ArkUI_UIInputEvent_Type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0149 start====");
          await Utils.driver.mouseClick(moveTo, MouseButton.MOUSE_BUTTON_LEFT);
          let result = uiinputeventndk.UIInputEventType0149();
          console.info("====>testArkUI_UIInputEvent_Type_0149 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done()
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0149 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0151
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0151
     * @tc.desc   test ArkUI_UIInputEvent_Type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0151 start====");
          await Utils.driver.mouseClick(moveTo, MouseButton.MOUSE_BUTTON_LEFT);
          let result = uiinputeventndk.UIInputEventType0151();
          console.info("====>testArkUI_UIInputEvent_Type_0151 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done()
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0151 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0152
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0152
     * @tc.desc   test ArkUI_UIInputEvent_Type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0152 start====");
          await Utils.driver.mouseClick(moveTo, MouseButton.MOUSE_BUTTON_LEFT);
          let result = uiinputeventndk.UIInputEventType0152();
          console.info("====>testArkUI_UIInputEvent_Type_0152 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done()
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0152 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0154
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0154
     * @tc.desc   test ArkUI_UIInputEvent_Type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0154 start====");
          await Utils.driver.mouseClick(moveTo, MouseButton.MOUSE_BUTTON_LEFT);
          let result = uiinputeventndk.UIInputEventType0154();
          console.info("====>testArkUI_UIInputEvent_Type_0154 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done()
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0154 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0155
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0155
     * @tc.desc   test ArkUI_UIInputEvent_Type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0155 start====");
          await Utils.driver.mouseClick(moveTo, MouseButton.MOUSE_BUTTON_LEFT);
          let result = uiinputeventndk.UIInputEventType0155();
          console.info("====>testArkUI_UIInputEvent_Type_0155 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done()
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0155 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0157
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0157
     * @tc.desc   test ArkUI_UIInputEvent_Type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0157 start====");
          await Utils.driver.mouseClick(moveTo, MouseButton.MOUSE_BUTTON_LEFT);
          let result = uiinputeventndk.UIInputEventType0157();
          console.info("====>testArkUI_UIInputEvent_Type_0157 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done()
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0157 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0158
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0158
     * @tc.desc   test ArkUI_UIInputEvent_Type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0158 start====");
          await Utils.driver.mouseClick(moveTo, MouseButton.MOUSE_BUTTON_LEFT);
          let result = uiinputeventndk.UIInputEventType0158();
          console.info("====>testArkUI_UIInputEvent_Type_0158 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done()
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0158 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0160
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0160
     * @tc.desc   test ArkUI_UIInputEvent_Type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0160 start====");
          await Utils.driver.mouseClick(moveTo, MouseButton.MOUSE_BUTTON_LEFT);
          let result = uiinputeventndk.UIInputEventType0160();
          console.info("====>testArkUI_UIInputEvent_Type_0160 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done()
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0160 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0161
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0161
     * @tc.desc   test ArkUI_UIInputEvent_Type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0161 start====");
          await Utils.driver.mouseClick(moveTo, MouseButton.MOUSE_BUTTON_LEFT);
          let result = uiinputeventndk.UIInputEventType0161();
          console.info("====>testArkUI_UIInputEvent_Type_0161 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done()
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0161 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0164
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0164
     * @tc.desc   test ArkUI_UIInputEvent_Type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0164 start====");
          await Utils.driver.mouseClick(moveTo, MouseButton.MOUSE_BUTTON_LEFT);
          let result = uiinputeventndk.UIInputEventType0164();
          console.info("====>testArkUI_UIInputEvent_Type_0164 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done()
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0164 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0166
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0166
     * @tc.desc   test ArkUI_UIInputEvent_Type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0166 start====");
          await Utils.driver.mouseClick(moveTo, MouseButton.MOUSE_BUTTON_LEFT);
          let result = uiinputeventndk.UIInputEventType0166();
          console.info("====>testArkUI_UIInputEvent_Type_0166 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done()
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0166 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0167
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0167
     * @tc.desc   test ArkUI_UIInputEvent_Type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0167 start====");
          await Utils.driver.mouseClick(moveTo, MouseButton.MOUSE_BUTTON_LEFT);
          let result = uiinputeventndk.UIInputEventType0167();
          console.info("====>testArkUI_UIInputEvent_Type_0167 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done()
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0167 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0168
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0168
     * @tc.desc   test ArkUI_UIInputEvent_Type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0168 start====");
          let result = uiinputeventndk.UIInputEventType0168();
          console.info("====>testArkUI_UIInputEvent_Type_0168 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done()
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0168 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0169
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0169
     * @tc.desc   test ArkUI_UIInputEvent_Type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0169 start====");
          await Utils.driver.mouseClick(moveTo, MouseButton.MOUSE_BUTTON_LEFT);
          let result = uiinputeventndk.UIInputEventType0169();
          console.info("====>testArkUI_UIInputEvent_Type_0169 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done()
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0169 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testArkUI_UIInputEvent_Type_0170
     * @tc.number SUB_ArkUI_UIInputEvent_Type_0170
     * @tc.desc   test ArkUI_UIInputEvent_Type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI_UIInputEvent_Type_0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkUI_UIInputEvent_Type_0170 start====");
          await Utils.driver.mouseClick(moveTo, MouseButton.MOUSE_BUTTON_LEFT);
          let result = uiinputeventndk.UIInputEventType0170();
          console.info("====>testArkUI_UIInputEvent_Type_0170 result: " + result);
          expect(result).assertEqual(OS_ACCOUNT_ERR_OK);
          done()
        } catch (err) {
          console.error("====>testArkUI_UIInputEvent_Type_0170 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });
  })
}