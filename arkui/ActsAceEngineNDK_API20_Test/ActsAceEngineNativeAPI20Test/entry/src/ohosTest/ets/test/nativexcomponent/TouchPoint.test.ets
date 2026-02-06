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
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHPOINTWINDOWX_0100
     * @tc.name    : testGetTouchPointWindowX001
     * @tc.desc    : Test OH_NativeXComponent_GetTouchPointWindowX function works fine.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHPOINTWINDOWX_0200
     * @tc.name    : testGetTouchPointWindowX002
     * @tc.desc    : Test OH_NativeXComponent_GetTouchPointWindowX function works fine.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHPOINTWINDOWY_0100
     * @tc.name    : testGetTouchPointWindowY001
     * @tc.desc    : Test OH_NativeXComponent_GetTouchPointWindowY function works fine.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHPOINTWINDOWY_0200
     * @tc.name    : testGetTouchPointWindowY002
     * @tc.desc    : Test OH_NativeXComponent_GetTouchPointWindowY function works fine.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHPOINTDISPLAYX_0100
     * @tc.name    : testGetTouchPointDisplayX001
     * @tc.desc    : Test SUB_ARKUI_ACE_ENGINE_OH_NativeXComponent_GetTouchPointDisplayX function works fine.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHPOINTDISPLAYX_0200
     * @tc.name    : testGetTouchPointDisplayX002
     * @tc.desc    : Test SUB_ARKUI_ACE_ENGINE_OH_NativeXComponent_GetTouchPointDisplayX function works fine.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHPOINTDISPLAYY_0100
     * @tc.name    : testGetTouchPointDisplayY001
     * @tc.desc    : Test SUB_ARKUI_ACE_ENGINE_OH_NativeXComponent_GetTouchPointDisplayY function works fine.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETTOUCHPOINTDISPLAYY_0200
     * @tc.name    : testGetTouchPointDisplayY002
     * @tc.desc    : Test SUB_ARKUI_ACE_ENGINE_OH_NativeXComponent_GetTouchPointDisplayY function works fine.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_GETHISTORICALPOINTS_0100
     * @tc.name    : testGetHistoricalPoints
     * @tc.desc    : Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_ID_0100
     * @tc.name    : testHistoricalPointId
     * @tc.desc    : Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_SCREENX_0100
     * @tc.name    : testHistoricalPointScreenX
     * @tc.desc    : Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_SCREENY_0100
     * @tc.name    : testHistoricalPointScreenY
     * @tc.desc    : Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_X_0100
     * @tc.name    : testHistoricalPointX
     * @tc.desc    : Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_Y_0100
     * @tc.name    : testHistoricalPointY
     * @tc.desc    : Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_TYPE_0100
     * @tc.name    : testHistoricalPointType
     * @tc.desc    : Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_SIZE_0100
     * @tc.name    : testHistoricalPointSize
     * @tc.desc    : Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_FORCE_0100
     * @tc.name    : testHistoricalPointForce
     * @tc.desc    : Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_TIMESTAMP_0100
     * @tc.name    : testHistoricalPointTimeStamp
     * @tc.desc    : Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_TITLX_0100
     * @tc.name    : testHistoricalPointTitlX
     * @tc.desc    : Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_TITLY_0100
     * @tc.name    : testHistoricalPointTitlY
     * @tc.desc    : Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_HISTORICALPOINT_SOURCETOOL_0100
     * @tc.name    : testHistoricalPointSourceTool
     * @tc.desc    : Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHEVENT_SOURCETOOL_UNKNOWN_0100
     * @tc.name    : testGetTouchEventSourceTool001
     * @tc.desc    : Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHEVENT_SOURCETOOL_FINGER_0100
     * @tc.name    : testGetTouchEventSourceTool002
     * @tc.desc    : Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHEVENT_SOURCETOOL_PEN_0100
     * @tc.name    : testGetTouchEventSourceTool003
     * @tc.desc    : Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOOL_TYPE_FINGER_0100
     * @tc.name    : testGetTouchPointToolTypeResult001
     * @tc.desc    : Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOOL_TYPE_PEN_0100
     * @tc.name    : testGetTouchPointToolTypeResult002
     * @tc.desc    : Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHPOINT_TYPE_0100
     * @tc.name    : testTouchPointType
     * @tc.desc    : Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHPOINT_SIZE_0100
     * @tc.name    : testTouchPointSize
     * @tc.desc    : Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHPOINT_FORCE_0100
     * @tc.name    : testTouchPointForce
     * @tc.desc    : Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHPOINT_TIMESTAMP_0100
     * @tc.name    : testTouchPointTimeStamp
     * @tc.desc    : Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHPOINT_ISPRESSED_0100
     * @tc.name    : testTouchPointIsPressed
     * @tc.desc    : Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHEVENT_ID_0100
     * @tc.name    : testTouchEventId
     * @tc.desc    : Test SUB_ARKUI_ACE_ENGINE_GetTouchEventDisplayY function works fine.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHEVENT_SIZE_0100
     * @tc.name    : testTouchEventSize
     * @tc.desc    : Test SUB_ARKUI_ACE_ENGINE_GetTouchEventDisplayY function works fine.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHEVENT_FORCE_0100
     * @tc.name    : testTouchEventForce
     * @tc.desc    : Test SUB_ARKUI_ACE_ENGINE_GetTouchEventDisplayY function works fine.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHEVENT_DEVICEID_0100
     * @tc.name    : testTouchEventDeviceId
     * @tc.desc    : Test SUB_ARKUI_ACE_ENGINE_GetTouchEventDisplayY function works fine.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_TOUCHEVENT_TIMESTAMP_0100
     * @tc.name    : testTouchEventTimeStamp
     * @tc.desc    : Test SUB_ARKUI_ACE_ENGINE_GetTouchEventDisplayY function works fine.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_SOURCE_TYPE_TOUCHSCREEN_0100
     * @tc.name    : testGetTouchEventSourceType003
     * @tc.desc    : Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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