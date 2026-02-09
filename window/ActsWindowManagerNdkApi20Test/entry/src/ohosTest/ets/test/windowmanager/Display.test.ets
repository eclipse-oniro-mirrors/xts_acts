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
import windowndkapi20 from 'libwindowndkapi20.so';
import Utils from "../common/Utils";
import { ON } from "@kit.TestKit";

const OK = 0;
const CAN_NOT_BUILD_STAGE = -1;
const DISPLAY_MANAGER_ERROR_NO_PERMISSION = 201;
const DISPLAY_MANAGER_ERROR_INVALID_PARAM = 401;
const DISPLAY_MANAGER_ERROR_DEVICE_NOT_SUPPORTED = 801;
const DISPLAY_MANAGER_ERROR_SYSTEM_ABNORMAL = 1400003;
const DISPLAY_MANAGER_ERROR_ILLEGAL_PARAM = 1400004;

export default function DisplayTest() {
  describe('DisplayTest', () => {
    /**
     * @tc.name   testCaptureScreenPixelmapInvalidParamOrDeviceNotSupported
     * @tc.number SUB_WINDOW_MANAGER_OH_NATIVEDISPLAYMANAGER_CAPTURESCREENPIXELMAP_0100
     * @tc.desc   Test get CaptureScreenPixelmapInvalidParamOrDeviceNotSupported's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCaptureScreenPixelmapInvalidParamOrDeviceNotSupported', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_NATIVEDISPLAYMANAGER_CAPTURESCREENPIXELMAP_0100 start<====`);
        let Result: number = windowndkapi20.CaptureScreenPixelmapInvalidParamOrDeviceNotSupported();
        expect(true).assertEqual([DISPLAY_MANAGER_ERROR_INVALID_PARAM,
                                  DISPLAY_MANAGER_ERROR_DEVICE_NOT_SUPPORTED].includes(Result));
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_NATIVEDISPLAYMANAGER_CAPTURESCREENPIXELMAP_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCaptureScreenPixelmapNoPermission
     * @tc.number SUB_WINDOW_MANAGER_OH_NATIVEDISPLAYMANAGER_CAPTURESCREENPIXELMAP_0200
     * @tc.desc   Test get CaptureScreenPixelmapNoPermission's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCaptureScreenPixelmapNoPermission', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_NATIVEDISPLAYMANAGER_CAPTURESCREENPIXELMAP_0200 start<====`);
        let Result: number = windowndkapi20.CaptureScreenPixelmapNoPermission();
        expect(true).assertEqual([DISPLAY_MANAGER_ERROR_DEVICE_NOT_SUPPORTED,
                                  DISPLAY_MANAGER_ERROR_NO_PERMISSION].includes(Result));
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_NATIVEDISPLAYMANAGER_CAPTURESCREENPIXELMAP_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })

    /**
     * @tc.name   testCaptureScreenPixelmapBoundaryValue
     * @tc.number SUB_WINDOW_MANAGER_OH_NATIVEDISPLAYMANAGER_CAPTURESCREENPIXELMAP_0300
     * @tc.desc   testCaptureScreenPixelmapBoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCaptureScreenPixelmapBoundaryValue', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testCaptureScreenPixelmapBoundaryValue';
      try {
        console.info(`====>${caseName} start<====`);
        let Result: Array<number> = windowndkapi20.testCaptureScreenPixelmapBoundaryValue();
        console.info(`====>${caseName} Result: ${JSON.stringify(Result)}`);
        if (Result[0] == 801&&Result[1] == 801) {
          expect(Result[0]).assertEqual(DISPLAY_MANAGER_ERROR_DEVICE_NOT_SUPPORTED);
          expect(Result[1]).assertEqual(DISPLAY_MANAGER_ERROR_DEVICE_NOT_SUPPORTED);
        } else {
          expect(Result[0]).assertEqual(DISPLAY_MANAGER_ERROR_SYSTEM_ABNORMAL);
          expect(Result[1]).assertEqual(DISPLAY_MANAGER_ERROR_SYSTEM_ABNORMAL);
        }
        done()
      } catch (err) {
        console.error(`====>${caseName} catch err: ` + err);
        expect().assertFail()
        done()
      }
    })
    
    /**
     * @tc.name   testCreateDisplayByIdBoundaryValue
     * @tc.number SUB_WINDOW_MANAGER_OH_NATIVEDISPLAYMANAGER_CreateDisplayById_0100
     * @tc.desc   testCreateDisplayByIdBoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateDisplayByIdBoundaryValue', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testCreateDisplayByIdBoundaryValue'
      try {
        console.info(`====>${caseName} start<====`);
        let Result: Array<number> = windowndkapi20.testCreateDisplayByIdBoundaryValue();
        console.info(`====>${caseName} Result: ${JSON.stringify(Result)}`);
        expect(Result[0]).assertEqual(OK);
        expect(Result[1]).assertEqual(DISPLAY_MANAGER_ERROR_SYSTEM_ABNORMAL);
        expect(Result[2]).assertEqual(DISPLAY_MANAGER_ERROR_SYSTEM_ABNORMAL);
        done()
      } catch (err) {
        console.error(`====>${caseName} catch err: ` + err);
        expect().assertFail()
        done()
      }
    })
  
    /**
     * @tc.name   testUnregisterAvailableAreaChangeListenerBoundaryValue
     * @tc.number SUB_WINDOW_MANAGER_OH_NATIVEDISPLAYMANAGER_UnregisterAvailableAreaChangeListener_0100
     * @tc.desc   testUnregisterAvailableAreaChangeListenerBoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUnregisterAvailableAreaChangeListenerBoundaryValue', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testUnregisterAvailableAreaChangeListenerBoundaryValue'
      try {
        console.info(`====>${caseName} start<====`);
        let Result: Array<number> = windowndkapi20.testUnregisterAvailableAreaChangeListenerBoundaryValue();
        console.info(`====>${caseName} Result: ${JSON.stringify(Result)}`);
        expect(Result[0]).assertEqual(DISPLAY_MANAGER_ERROR_ILLEGAL_PARAM);
        done()
      } catch (err) {
        console.error(`====>${caseName} catch err: ` + err);
        expect().assertFail()
        done()
      }
    })
   
    /**
     * @tc.name   testCreateAvailableAreaBoundaryValue
     * @tc.number SUB_WINDOW_MANAGER_OH_NATIVEDISPLAYMANAGER_CreateAvailableArea_0100
     * @tc.desc   testCreateAvailableAreaBoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateAvailableAreaBoundaryValue', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testCreateAvailableAreaBoundaryValue'
      try {
        console.info(`====>${caseName} start<====`);
        let Result: Array<number> = windowndkapi20.testCreateAvailableAreaBoundaryValue();
        console.info(`====>${caseName} Result: ${JSON.stringify(Result)}`);
        expect(Result[0]).assertEqual(DISPLAY_MANAGER_ERROR_ILLEGAL_PARAM);
        expect(Result[1]).assertEqual(DISPLAY_MANAGER_ERROR_ILLEGAL_PARAM);
        done()
      } catch (err) {
        console.error(`====>${caseName} catch err: ` + err);
        expect().assertFail()
        done()
      }
    })
  
    /**
     * @tc.name   testUnregisterDisplayAddListenerBoundaryValue
     * @tc.number SUB_WINDOW_MANAGER_OH_NATIVEDISPLAYMANAGER_UnregisterDisplayAddListener_0100
     * @tc.desc   testUnregisterDisplayAddListenerBoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUnregisterDisplayAddListenerBoundaryValue', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testUnregisterDisplayAddListenerBoundaryValue'
      try {
        console.info(`====>${caseName} start<====`);
        let Result: Array<number> = windowndkapi20.testUnregisterDisplayAddListenerBoundaryValue();
        console.info(`====>${caseName} Result: ${JSON.stringify(Result)}`);
        expect(Result[0]).assertEqual(DISPLAY_MANAGER_ERROR_ILLEGAL_PARAM);
        done()
      } catch (err) {
        console.error(`====>${caseName} catch err: ` + err);
        expect().assertFail()
        done()
      }
    })
  
    /**
     * @tc.name   testUnregisterDisplayRemoveListenerBoundaryValue
     * @tc.number SUB_WINDOW_MANAGER_OH_NATIVEDISPLAYMANAGER_UnregisterDisplayRemoveListener_0100
     * @tc.desc   testUnregisterDisplayRemoveListenerBoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUnregisterDisplayRemoveListenerBoundaryValue', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testUnregisterDisplayRemoveListenerBoundaryValue'
      try {
        console.info(`====>${caseName} start<====`);
        let Result: Array<number> = windowndkapi20.testUnregisterDisplayRemoveListenerBoundaryValue();
        console.info(`====>${caseName} Result: ${JSON.stringify(Result)}`);
        expect(Result[0]).assertEqual(DISPLAY_MANAGER_ERROR_ILLEGAL_PARAM);
        done()
      } catch (err) {
        console.error(`====>${caseName} catch err: ` + err);
        expect().assertFail()
        done()
      }
    })
  
    /**
     * @tc.name   testGetDisplaySourceModeBoundaryValue
     * @tc.number SUB_WINDOW_MANAGER_OH_NATIVEDISPLAYMANAGER_GetDisplaySourceMode_0100
     * @tc.desc   testGetDisplaySourceModeBoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetDisplaySourceModeBoundaryValue', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testGetDisplaySourceModeBoundaryValue'
      try {
        console.info(`====>${caseName} start<====`);
        let Result: Array<number> = windowndkapi20.testGetDisplaySourceModeBoundaryValue();
        console.info(`====>${caseName} Result: ${JSON.stringify(Result)}`);
        expect(Result[0]).assertEqual(DISPLAY_MANAGER_ERROR_ILLEGAL_PARAM);
        expect(Result[1]).assertEqual(DISPLAY_MANAGER_ERROR_ILLEGAL_PARAM);
        done()
      } catch (err) {
        console.error(`====>${caseName} catch err: ` + err);
        expect().assertFail()
        done()
      }
    })
   
    /**
     * @tc.name   testGetDisplayPositionBoundaryValue
     * @tc.number SUB_WINDOW_MANAGER_OH_NATIVEDISPLAYMANAGER_GetDisplayPosition_0100
     * @tc.desc   testGetDisplayPositionBoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetDisplayPositionBoundaryValue', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testGetDisplayPositionBoundaryValue'
      try {
        console.info(`====>${caseName} start<====`);
        let Result: Array<number> = windowndkapi20.testGetDisplayPositionBoundaryValue();
        console.info(`====>${caseName} Result: ${JSON.stringify(Result)}`);
        expect(Result[0]).assertEqual(DISPLAY_MANAGER_ERROR_ILLEGAL_PARAM);
        expect(Result[1]).assertEqual(DISPLAY_MANAGER_ERROR_ILLEGAL_PARAM);
        done()
      } catch (err) {
        console.error(`====>${caseName} catch err: ` + err);
        expect().assertFail()
        done()
      }
    })

  })
}