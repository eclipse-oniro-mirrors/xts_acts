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

import { beforeAll, describe, expect, it, Level, Size, TestType } from "@ohos/hypium";
import nativexcomponent from 'libnativexcomponent.so';
import Utils from "../common/Utils";
import { Point } from "@kit.TestKit";

const OH_NATIVEXCOMPONENT_RESULT_SUCCESS = 0;
const OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER = -2;

export default function TouchPointTest() {
  describe('TouchPointTest', () => {
    const x1: number = Math.floor(globalThis.winWidth / 2 + globalThis.winLeft);
    const y1: number = Math.floor(globalThis.winHeight / 2 + globalThis.winTop);
    const x2: number = Math.floor(globalThis.winWidth / 4 + globalThis.winLeft);
    const y2: number = Math.floor(globalThis.winHeight / 4 + globalThis.winTop);
    const moveFrom: Point = { x: x1, y: y1 };
    const moveTo: Point = { x: x2, y: y2 };
    const speed: number = 2500;
    beforeAll(async (done: Function) => {
      await Utils.pushPageNoClear(`NativeXComponent/TouchNativeXComponent`, done);
    })
    /**
     * @tc.name   testGetTouchPointWindowX001
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHPOINTWINDOWX_0100
     * @tc.desc   Test OH_NativeXComponent_GetTouchPointWindowX function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTouchPointWindowX001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHPOINTWINDOWX_0100 start<====`);
        await Utils.driver.swipe(x1, y1, x2, y2, speed);
        let Result: number = nativexcomponent.GetTouchPointWindowX(false);
        expect(OH_NATIVEXCOMPONENT_RESULT_SUCCESS).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHPOINTWINDOWX_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testGetTouchPointWindowX002
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHPOINTWINDOWX_0200
     * @tc.desc   Test OH_NativeXComponent_GetTouchPointWindowX function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTouchPointWindowX002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHPOINTWINDOWX_0200 start<====`);
        await Utils.driver.swipe(x1, y1, x2, y2, speed);
        let Result: number = nativexcomponent.GetTouchPointWindowX(true);
        expect(OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHPOINTWINDOWX_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testGetTouchPointWindowY001
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHPOINTWINDOWY_0100
     * @tc.desc   Test OH_NativeXComponent_GetTouchPointWindowY function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTouchPointWindowY001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHPOINTWINDOWY_0100 start<====`);
        await Utils.driver.swipe(x1, y1, x2, y2, speed);
        let Result: number = nativexcomponent.GetTouchPointWindowY(false);
        expect(OH_NATIVEXCOMPONENT_RESULT_SUCCESS).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHPOINTWINDOWY_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testGetTouchPointWindowY002
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHPOINTWINDOWY_0200
     * @tc.desc   Test OH_NativeXComponent_GetTouchPointWindowY function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTouchPointWindowY002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHPOINTWINDOWY_0200 start<====`);
        await Utils.driver.swipe(x1, y1, x2, y2, speed);
        let Result: number = nativexcomponent.GetTouchPointWindowY(true);
        expect(OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHPOINTWINDOWY_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testGetTouchPointDisplayX001
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHPOINTDISPLAYX_0100
     * @tc.desc   Test SUB_ARKUI_ACE_ENGINE_OH_NativeXComponent_GetTouchPointDisplayX function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTouchPointDisplayX001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHPOINTDISPLAYX_0100 start<====`);
        await Utils.driver.swipe(x1, y1, x2, y2, speed);
        let Result: number = nativexcomponent.GetTouchPointDisplayX(false);
        expect(OH_NATIVEXCOMPONENT_RESULT_SUCCESS).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHPOINTDISPLAYX_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testGetTouchPointDisplayX002
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHPOINTDISPLAYX_0200
     * @tc.desc   Test SUB_ARKUI_ACE_ENGINE_OH_NativeXComponent_GetTouchPointDisplayX function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTouchPointDisplayX002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHPOINTDISPLAYX_0200 start<====`);
        await Utils.driver.swipe(x1, y1, x2, y2, speed);
        let Result: number = nativexcomponent.GetTouchPointDisplayX(true);
        expect(OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHPOINTDISPLAYX_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testGetTouchPointDisplayY001
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHPOINTDISPLAYY_0100
     * @tc.desc   Test SUB_ARKUI_ACE_ENGINE_OH_NativeXComponent_GetTouchPointDisplayY function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTouchPointDisplayY001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHPOINTDISPLAYY_0100 start<====`);
        await Utils.driver.swipe(x1, y1, x2, y2, speed);
        let Result: number = nativexcomponent.GetTouchPointDisplayY(false);
        expect(OH_NATIVEXCOMPONENT_RESULT_SUCCESS).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHPOINTDISPLAYY_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testGetTouchPointDisplayY002
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHPOINTDISPLAYY_0200
     * @tc.desc   Test SUB_ARKUI_ACE_ENGINE_OH_NativeXComponent_GetTouchPointDisplayY function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTouchPointDisplayY002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHPOINTDISPLAYY_0200 start<====`);
        await Utils.driver.swipe(x1, y1, x2, y2, speed);
        let Result: number = nativexcomponent.GetTouchPointDisplayY(true);
        expect(OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHPOINTDISPLAYY_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testGetHistoricalPoints
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETHISTORICALPOINTS_0100
     * @tc.desc   Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetHistoricalPoints', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETHISTORICALPOINTS_0100 start<====`);
        await Utils.driver.swipe(x1, y1, x2, y2, speed);
        let Result: number = nativexcomponent.GetHistoricalPoints();
        expect(OH_NATIVEXCOMPONENT_RESULT_SUCCESS).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETHISTORICALPOINTS_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testHistoricalPointId
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_ID_0100
     * @tc.desc   Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHistoricalPointId', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_ID_0100 start<====`);
        await Utils.driver.swipe(x1, y1, x2, y2, speed);
        let Result: number = nativexcomponent.HistoricalPointId();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_ID_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testHistoricalPointScreenX
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_SCREENX_0100
     * @tc.desc   Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHistoricalPointScreenX', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_SCREENX_0100 start<====`);
        await Utils.driver.swipe(x1, y1, x2, y2, speed);
        let Result: number = nativexcomponent.HistoricalPointScreenX();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_SCREENX_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testHistoricalPointScreenY
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_SCREENY_0100
     * @tc.desc   Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHistoricalPointScreenY', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_SCREENY_0100 start<====`);
        await Utils.driver.swipe(x1, y1, x2, y2, speed);
        let Result: number = nativexcomponent.HistoricalPointScreenY();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_SCREENY_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testHistoricalPointX
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_X_0100
     * @tc.desc   Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHistoricalPointX', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_X_0100 start<====`);
        await Utils.driver.swipe(x1, y1, x2, y2, speed);
        let Result: number = nativexcomponent.HistoricalPointX();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_X_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testHistoricalPointY
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_Y_0100
     * @tc.desc   Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHistoricalPointY', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_Y_0100 start<====`);
        await Utils.driver.swipe(x1, y1, x2, y2, speed);
        let Result: number = nativexcomponent.HistoricalPointY();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_Y_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testHistoricalPointType
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_TYPE_0100
     * @tc.desc   Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHistoricalPointType', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_TYPE_0100 start<====`);
        await Utils.driver.swipe(x1, y1, x2, y2, speed);
        let Result: number = nativexcomponent.HistoricalPointType();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_TYPE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testHistoricalPointSize
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_SIZE_0100
     * @tc.desc   Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHistoricalPointSize', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_SIZE_0100 start<====`);
        await Utils.driver.swipe(x1, y1, x2, y2, speed);
        let Result: number = nativexcomponent.HistoricalPointSize();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_SIZE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testHistoricalPointForce
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_FORCE_0100
     * @tc.desc   Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHistoricalPointForce', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_FORCE_0100 start<====`);
        await Utils.driver.swipe(x1, y1, x2, y2, speed);
        let Result: number = nativexcomponent.HistoricalPointForce();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_FORCE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testHistoricalPointTimeStamp
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_TIMESTAMP_0100
     * @tc.desc   Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHistoricalPointTimeStamp', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_TIMESTAMP_0100 start<====`);
        await Utils.driver.swipe(x1, y1, x2, y2, speed);
        let Result: number = nativexcomponent.HistoricalPointTimeStamp();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_TIMESTAMP_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testHistoricalPointTitlX
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_TITLX_0100
     * @tc.desc   Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHistoricalPointTitlX', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_TITLX_0100 start<====`);
        await Utils.driver.swipe(x1, y1, x2, y2, speed);
        let Result: number = nativexcomponent.HistoricalPointTitlX();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_TITLX_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testHistoricalPointTitlY
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_TITLY_0100
     * @tc.desc   Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHistoricalPointTitlY', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_TITLY_0100 start<====`);
        await Utils.driver.swipe(x1, y1, x2, y2, speed);
        let Result: number = nativexcomponent.HistoricalPointTitlY();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_TITLY_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testHistoricalPointSourceTool
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_SOURCETOOL_0100
     * @tc.desc   Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHistoricalPointSourceTool', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_SOURCETOOL_0100 start<====`);
        await Utils.driver.swipe(x1, y1, x2, y2, speed);
        let Result: number = nativexcomponent.HistoricalPointSourceTool();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_SOURCETOOL_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testGetTouchEventSourceTool001
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHEVENT_SOURCETOOL_UNKNOWN_0100
     * @tc.desc   Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTouchEventSourceTool001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHEVENT_SOURCETOOL_UNKNOWN_0100 start<====`);
        await Utils.driver.swipe(x1, y1, x2, y2, speed);
        let Result: number = nativexcomponent.GetTouchEventSourceTool(0);
        expect(0).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHEVENT_SOURCETOOL_UNKNOWN_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testGetTouchEventSourceTool002
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHEVENT_SOURCETOOL_FINGER_0100
     * @tc.desc   Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTouchEventSourceTool002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHEVENT_SOURCETOOL_FINGER_0100 start<====`);
        await Utils.driver.swipe(x1, y1, x2, y2, speed);
        let Result: number = nativexcomponent.GetTouchEventSourceTool(1);
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHEVENT_SOURCETOOL_FINGER_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testGetTouchEventSourceTool003
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHEVENT_SOURCETOOL_PEN_0100
     * @tc.desc   Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTouchEventSourceTool003', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHEVENT_SOURCETOOL_PEN_0100 start<====`);
        await Utils.driver.penSwipe(moveFrom, moveTo, speed);
        let Result: number = nativexcomponent.GetTouchEventSourceTool(2);
        expect(2).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHEVENT_SOURCETOOL_PEN_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testGetTouchPointToolTypeResult001
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOOL_TYPE_FINGER_0100
     * @tc.desc   Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTouchPointToolTypeResult001', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOOL_TYPE_FINGER_0100 start<====`);
        await Utils.driver.swipe(x1, y1, x2, y2, speed);
        let Result: number = nativexcomponent.GetTouchPointToolTypeResult(1);
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOOL_TYPE_FINGER_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testGetTouchPointToolTypeResult002
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOOL_TYPE_PEN_0100
     * @tc.desc   Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTouchPointToolTypeResult002', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOOL_TYPE_PEN_0100 start<====`);
        await Utils.driver.penSwipe(moveFrom, moveTo, speed);
        let Result: number = nativexcomponent.GetTouchPointToolTypeResult(2);
        expect(2).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOOL_TYPE_PEN_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testTouchPointType
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHPOINT_TYPE_0100
     * @tc.desc   Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTouchPointType', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHPOINT_TYPE_0100 start<====`);
        await Utils.driver.swipe(x1, y1, x2, y2, speed);
        let Result: number = nativexcomponent.TouchPointType();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHPOINT_TYPE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testTouchPointSize
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHPOINT_SIZE_0100
     * @tc.desc   Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTouchPointSize', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHPOINT_SIZE_0100 start<====`);
        await Utils.driver.swipe(x1, y1, x2, y2, speed);
        let Result: number = nativexcomponent.TouchPointSize();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHPOINT_SIZE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testTouchPointForce
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHPOINT_FORCE_0100
     * @tc.desc   Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTouchPointForce', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHPOINT_FORCE_0100 start<====`);
        await Utils.driver.swipe(x1, y1, x2, y2, speed);
        let Result: number = nativexcomponent.TouchPointForce();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHPOINT_FORCE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testTouchPointTimeStamp
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHPOINT_TIMESTAMP_0100
     * @tc.desc   Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTouchPointTimeStamp', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHPOINT_TIMESTAMP_0100 start<====`);
        await Utils.driver.swipe(x1, y1, x2, y2, speed);
        let Result: number = nativexcomponent.TouchPointTimeStamp();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHPOINT_TIMESTAMP_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testTouchPointIsPressed
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHPOINT_ISPRESSED_0100
     * @tc.desc   Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTouchPointIsPressed', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHPOINT_ISPRESSED_0100 start<====`);
        await Utils.driver.swipe(x1, y1, x2, y2, speed);
        let Result: number = nativexcomponent.TouchPointIsPressed();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHPOINT_ISPRESSED_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testTouchEventId
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHEVENT_ID_0100
     * @tc.desc   Test SUB_ARKUI_ACE_ENGINE_GetTouchEventDisplayY function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTouchEventId', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHEVENT_ID_0100 start<====`);
        await Utils.driver.swipe(x1, y1, x2, y2, speed);
        let Result: number = nativexcomponent.TouchEventId();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHEVENT_ID_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testTouchEventSize
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHEVENT_SIZE_0100
     * @tc.desc   Test SUB_ARKUI_ACE_ENGINE_GetTouchEventDisplayY function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTouchEventSize', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHEVENT_SIZE_0100 start<====`);
        await Utils.driver.swipe(x1, y1, x2, y2, speed);
        let Result: number = nativexcomponent.TouchEventSize();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHEVENT_SIZE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testTouchEventForce
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHEVENT_FORCE_0100
     * @tc.desc   Test SUB_ARKUI_ACE_ENGINE_GetTouchEventDisplayY function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTouchEventForce', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHEVENT_FORCE_0100 start<====`);
        await Utils.driver.swipe(x1, y1, x2, y2, speed);
        let Result: number = nativexcomponent.TouchEventForce();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHEVENT_FORCE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testTouchEventDeviceId
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHEVENT_DEVICEID_0100
     * @tc.desc   Test SUB_ARKUI_ACE_ENGINE_GetTouchEventDisplayY function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTouchEventDeviceId', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHEVENT_DEVICEID_0100 start<====`);
        await Utils.driver.swipe(x1, y1, x2, y2, speed);
        let Result: number = nativexcomponent.TouchEventDeviceId();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHEVENT_DEVICEID_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testTouchEventTimeStamp
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHEVENT_TIMESTAMP_0100
     * @tc.desc   Test SUB_ARKUI_ACE_ENGINE_GetTouchEventDisplayY function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTouchEventTimeStamp', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHEVENT_TIMESTAMP_0100 start<====`);
        await Utils.driver.swipe(x1, y1, x2, y2, speed);
        let Result: number = nativexcomponent.TouchEventTimeStamp();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHEVENT_TIMESTAMP_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testGetTouchEventSourceType003
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_SOURCE_TYPE_TOUCHSCREEN_0100
     * @tc.desc   Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTouchEventSourceType003', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_SOURCE_TYPE_TOUCHSCREEN_0100 start<====`);
        await Utils.driver.swipe(x1, y1, x2, y2, speed);
        let Result: number = nativexcomponent.GetTouchEventSourceType(2);
        expect(2).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_SOURCE_TYPE_TOUCHSCREEN_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
  })
}