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

const PARAMETER_OVERRIDE = -2;
const CAN_NOT_BUILD_STAGE = -1;
const OK = 0;
const ABOUT_TO_START = 1;
const STARTED = 2;
const ABOUT_TO_STOP = 3;
const STOPPED = 4;
const ABOUT_TO_RESTORE = 5;
const ERROR = 6;
const WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED = 801;
const WINDOW_MANAGER_ERRORCODE_INVALID_PARAM = 401;
const WINDOW_MANAGER_ERRORCODE_PIP_DESTROY_FAILED = 130011;
const WINDOW_MANAGER_ERRORCODE_PIP_STATE_ABNORMAL = 1300012;
const WINDOW_MANAGER_ERRORCODE_PIP_CREATE_FAILED = 1300013;
const WINDOW_MANAGER_ERRORCODE_PIP_INTERNAL_ERROR = 1300014;
const WINDOW_MANAGER_ERRORCODE_PIP_REPEATED_OPERATION = 1300015;
const WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM = 1300016;

export default function WindowPipTest() {
  describe('WindowPipTest', () => {
    beforeAll(async (done: Function) => {
      await Utils.pushPageNoClear("Window/Window", done)
    })
    /**
     * @tc.name   testCreatePipConfigOk
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_CREATEPIPCONFIG_0100
     * @tc.desc   Test get CreatePipConfigOk's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreatePipConfigOk', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_CREATEPIPCONFIG_0100 start<====`);
        let Result: number = windowndkapi20.CreatePipConfigOk();
        expect(OK).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_CREATEPIPCONFIG_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCreatePipConfigIncorrectParam
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_CREATEPIPCONFIG_0200
     * @tc.desc   Test get CreatePipConfigIncorrectParam's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreatePipConfigIncorrectParam', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_CREATEPIPCONFIG_0200 start<====`);
        let Result: number = windowndkapi20.CreatePipConfigIncorrectParam();
        expect(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_CREATEPIPCONFIG_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testSetPipMainWindowIdOkOrDeviceNotSupported
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPMAINWINDOWID_0100
     * @tc.desc   Test get SetPipMainWindowIdOkOrDeviceNotSupported's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetPipMainWindowIdOkOrDeviceNotSupported', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPMAINWINDOWID_0100 start<====`);
        let Result: number = windowndkapi20.SetPipMainWindowIdOkOrDeviceNotSupported();
        expect(true).assertEqual([OK, WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED].includes(Result));
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPMAINWINDOWID_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testSetPipMainWindowIdIncorrectParam
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPMAINWINDOWID_0200
     * @tc.desc   Test get SetPipMainWindowIdIncorrectParam's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetPipMainWindowIdIncorrectParam', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPMAINWINDOWID_0200 start<====`);
        let Result: number = windowndkapi20.SetPipMainWindowIdIncorrectParam();
        expect(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPMAINWINDOWID_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testSetPipTemplateTypeOkOrDeviceNotSupported
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPTEMPLATETYPE_0100
     * @tc.desc   Test get SetPipTemplateTypeOkOrDeviceNotSupported's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetPipTemplateTypeOkOrDeviceNotSupported', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPTEMPLATETYPE_0100 start<====`);
        let Result: number = windowndkapi20.SetPipTemplateTypeOkOrDeviceNotSupported();
        expect(true).assertEqual([OK, WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED].includes(Result));
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPTEMPLATETYPE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testSetPipTemplateTypeIncorrectParam
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPTEMPLATETYPE_0200
     * @tc.desc   Test get SetPipTemplateTypeIncorrectParam's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetPipTemplateTypeIncorrectParam', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPTEMPLATETYPE_0200 start<====`);
        let Result: number = windowndkapi20.SetPipTemplateTypeIncorrectParam();
        expect(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPTEMPLATETYPE_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testSetPipRectOkOrDeviceNotSupported
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPRECT_0100
     * @tc.desc   Test get SetPipRectOkOrDeviceNotSupported's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetPipRectOkOrDeviceNotSupported', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPRECT_0100 start<====`);
        let Result: number = windowndkapi20.SetPipRectOkOrDeviceNotSupported();
        expect(true).assertEqual([OK, WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED].includes(Result));
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPRECT_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testSetPipRectIncorrectParam
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPRECT_0200
     * @tc.desc   Test get SetPipRectIncorrectParam's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetPipRectIncorrectParam', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPRECT_0200 start<====`);
        let Result: number = windowndkapi20.SetPipRectIncorrectParam();
        expect(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPRECT_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testSetPipControlGroupOkOrDeviceNotSupported
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPCONTROLGROUP_0100
     * @tc.desc   Test get SetPipControlGroupOkOrDeviceNotSupported's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetPipControlGroupOkOrDeviceNotSupported', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPCONTROLGROUP_0100 start<====`);
        let Result: number = windowndkapi20.SetPipControlGroupOkOrDeviceNotSupported();
        expect(true).assertEqual([OK, WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED].includes(Result));
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPCONTROLGROUP_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testSetPipControlGroupIncorrectParam
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPCONTROLGROUP_0200
     * @tc.desc   Test get SetPipControlGroupIncorrectParam's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetPipControlGroupIncorrectParam', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPCONTROLGROUP_0200 start<====`);
        let Result: number = windowndkapi20.SetPipControlGroupIncorrectParam();
        expect(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPCONTROLGROUP_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testSetPipNapiEnvOkOrDeviceNotSupported
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPNAPIENV_0100
     * @tc.desc   Test get SetPipNapiEnvOkOrDeviceNotSupported's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetPipNapiEnvOkOrDeviceNotSupported', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPNAPIENV_0100 start<====`);
        let Result: number = windowndkapi20.SetPipNapiEnvOkOrDeviceNotSupported();
        expect(true).assertEqual([OK, WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED].includes(Result));
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPNAPIENV_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testSetPipNapiEnvIncorrectParam
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPNAPIENV_0200
     * @tc.desc   Test get SetPipNapiEnvIncorrectParam's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetPipNapiEnvIncorrectParam', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPNAPIENV_0200 start<====`);
        let Result: number = windowndkapi20.SetPipNapiEnvIncorrectParam();
        expect(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPNAPIENV_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCreatePipOkOrDeviceNotSupported
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_CREATEPIP_0100
     * @tc.desc   Test get CreatePipOkOrDeviceNotSupported's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreatePipOkOrDeviceNotSupported', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_CREATEPIP_0100 start<====`);
        let Result: number = windowndkapi20.CreatePipOkOrDeviceNotSupported();
        expect(true).assertEqual([OK, WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED].includes(Result));
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_CREATEPIP_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testStartPipPipCreateFailed
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_STARTPIP_0100
     * @tc.desc   Test get StartPipPipCreateFailed's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStartPipPipCreateFailed', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_STARTPIP_0100 start<====`);
        let Result: number = windowndkapi20.StartPipPipCreateFailed();
        expect(true).assertEqual([WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED,
                                  WINDOW_MANAGER_ERRORCODE_PIP_CREATE_FAILED].includes(Result));
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_STARTPIP_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testStartPipIncorrectParam
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_STARTPIP_0200
     * @tc.desc   Test get StartPipIncorrectParam's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStartPipIncorrectParam', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_STARTPIP_0200 start<====`);
        let Result: number = windowndkapi20.StartPipIncorrectParam();
        expect(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_STARTPIP_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testStopPipIncorrectParam
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_STOPPIP_0100
     * @tc.desc   Test get StopPipIncorrectParam's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStopPipIncorrectParam', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_STOPPIP_0100 start<====`);
        let Result: number = windowndkapi20.StopPipIncorrectParam();
        expect(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_STOPPIP_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testUpdatePipContentSizeIncorrectParam
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UPDATEPIPCONTENTSIZE_0100
     * @tc.desc   Test get UpdatePipContentSizeIncorrectParam's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUpdatePipContentSizeIncorrectParam', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UPDATEPIPCONTENTSIZE_0100 start<====`);
        let Result: number = windowndkapi20.UpdatePipContentSizeIncorrectParam();
        expect(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UPDATEPIPCONTENTSIZE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testUpdatePipControlStatusIncorrectParam
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UPDATEPIPCONTROLSTATUS_0100
     * @tc.desc   Test get UpdatePipControlStatusIncorrectParam's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUpdatePipControlStatusIncorrectParam', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UPDATEPIPCONTROLSTATUS_0100 start<====`);
        let Result: number = windowndkapi20.UpdatePipControlStatusIncorrectParam();
        expect(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UPDATEPIPCONTROLSTATUS_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testSetPipControlEnabledIncorrectParam
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPCONTROLENABLED_0100
     * @tc.desc   Test get SetPipControlEnabledIncorrectParam's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetPipControlEnabledIncorrectParam', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPCONTROLENABLED_0100 start<====`);
        let Result: number = windowndkapi20.SetPipControlEnabledIncorrectParam();
        expect(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPCONTROLENABLED_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testSetPipInitialSurfaceRectParameterOverride
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPINITIALSURFACERECT_0100
     * @tc.desc   Test get SetPipInitialSurfaceRectParameterOverride's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetPipInitialSurfaceRectParameterOverride', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPINITIALSURFACERECT_0100 start<====`);
        let Result: number = windowndkapi20.SetPipInitialSurfaceRectParameterOverride();
        expect(PARAMETER_OVERRIDE).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPINITIALSURFACERECT_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testSetPipInitialSurfaceRectOk
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPINITIALSURFACERECT_0200
     * @tc.desc   Test get SetPipInitialSurfaceRectOk's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetPipInitialSurfaceRectOk', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPINITIALSURFACERECT_0200 start<====`);
        let Result: number = windowndkapi20.SetPipInitialSurfaceRectOk();
        expect(OK).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPINITIALSURFACERECT_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testSetPipInitialSurfaceRectIncorrectParam
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPINITIALSURFACERECT_0300
     * @tc.desc   Test get SetPipInitialSurfaceRectIncorrectParam's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetPipInitialSurfaceRectIncorrectParam', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPINITIALSURFACERECT_0300 start<====`);
        let Result: number = windowndkapi20.SetPipInitialSurfaceRectIncorrectParam();
        expect(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPINITIALSURFACERECT_0300 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testUnsetPipInitialSurfaceRectParameterOverride
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNSETPIPINITIALSURFACERECT_0100
     * @tc.desc   Test get UnsetPipInitialSurfaceRectParameterOverride's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnsetPipInitialSurfaceRectParameterOverride', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNSETPIPINITIALSURFACERECT_0100 start<====`);
        let Result: number = windowndkapi20.UnsetPipInitialSurfaceRectParameterOverride();
        expect(PARAMETER_OVERRIDE).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNSETPIPINITIALSURFACERECT_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testUnsetPipInitialSurfaceRectOk
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNSETPIPINITIALSURFACERECT_0200
     * @tc.desc   Test get UnsetPipInitialSurfaceRectOk's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnsetPipInitialSurfaceRectOk', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNSETPIPINITIALSURFACERECT_0200 start<====`);
        let Result: number = windowndkapi20.UnsetPipInitialSurfaceRectOk();
        expect(OK).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNSETPIPINITIALSURFACERECT_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testUnsetPipInitialSurfaceRectIncorrectParam
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNSETPIPINITIALSURFACERECT_0300
     * @tc.desc   Test get UnsetPipInitialSurfaceRectIncorrectParam's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnsetPipInitialSurfaceRectIncorrectParam', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNSETPIPINITIALSURFACERECT_0300 start<====`);
        let Result: number = windowndkapi20.UnsetPipInitialSurfaceRectIncorrectParam();
        expect(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNSETPIPINITIALSURFACERECT_0300 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testRegisterStartPipCallbackOkOrDeviceNotSupported
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_REGISTERSTARTPIPCALLBACK_0100
     * @tc.desc   Test get RegisterStartPipCallbackOkOrDeviceNotSupported's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterStartPipCallbackOkOrDeviceNotSupported', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_REGISTERSTARTPIPCALLBACK_0100 start<====`);
        let Result: number = windowndkapi20.RegisterStartPipCallbackOkOrDeviceNotSupported();
        expect(true).assertEqual([OK, WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED].includes(Result));
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_REGISTERSTARTPIPCALLBACK_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testRegisterStartPipCallbackIncorrectParam
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_REGISTERSTARTPIPCALLBACK_0200
     * @tc.desc   Test get RegisterStartPipCallbackIncorrectParam's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterStartPipCallbackIncorrectParam', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_REGISTERSTARTPIPCALLBACK_0200 start<====`);
        let Result: number = windowndkapi20.RegisterStartPipCallbackIncorrectParam();
        expect(true).assertEqual([WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM,
                                  WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED].includes(Result));
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_REGISTERSTARTPIPCALLBACK_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testUnregisterStartPipCallbackOkOrDeviceNotSupported
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERSTARTPIPCALLBACK_0100
     * @tc.desc   Test get UnregisterStartPipCallbackOkOrDeviceNotSupported's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnregisterStartPipCallbackOkOrDeviceNotSupported', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERSTARTPIPCALLBACK_0100 start<====`);
        let Result: number = windowndkapi20.UnregisterStartPipCallbackOkOrDeviceNotSupported();
        expect(true).assertEqual([OK, WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED].includes(Result));
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERSTARTPIPCALLBACK_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testUnregisterStartPipCallbackIncorrectParam
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERSTARTPIPCALLBACK_0200
     * @tc.desc   Test get UnregisterStartPipCallbackIncorrectParam's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnregisterStartPipCallbackIncorrectParam', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERSTARTPIPCALLBACK_0200 start<====`);
        let Result: number = windowndkapi20.UnregisterStartPipCallbackIncorrectParam();
        expect(true).assertEqual([WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM,
                                  WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED].includes(Result));
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERSTARTPIPCALLBACK_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testUnregisterAllStartPipCallbacksOkOrDeviceNotSupported
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERALLSTARTPIPCALLBACKS_0100
     * @tc.desc   Test get UnregisterAllStartPipCallbacksOkOrDeviceNotSupported's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnregisterAllStartPipCallbacksOkOrDeviceNotSupported', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERALLSTARTPIPCALLBACKS_0100 start<====`);
        let Result: number = windowndkapi20.UnregisterAllStartPipCallbacksOkOrDeviceNotSupported();
        expect(true).assertEqual([OK, WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED].includes(Result));
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERALLSTARTPIPCALLBACKS_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testUnregisterAllStartPipCallbacksIncorrectParam
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERALLSTARTPIPCALLBACKS_0200
     * @tc.desc   Test get UnregisterAllStartPipCallbacksIncorrectParam's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnregisterAllStartPipCallbacksIncorrectParam', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERALLSTARTPIPCALLBACKS_0200 start<====`);
        let Result: number = windowndkapi20.UnregisterAllStartPipCallbacksIncorrectParam();
        expect(true).assertEqual([WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM,
                                  WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED].includes(Result));
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERALLSTARTPIPCALLBACKS_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testRegisterLifecycleListenerOkOrDeviceNotSupported
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_REGISTERLIFECYCLELISTENER_0100
     * @tc.desc   Test get RegisterLifecycleListenerOkOrDeviceNotSupported's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterLifecycleListenerOkOrDeviceNotSupported', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_REGISTERLIFECYCLELISTENER_0100 start<====`);
        let Result: number = windowndkapi20.RegisterLifecycleListenerOkOrDeviceNotSupported();
        expect(true).assertEqual([OK, WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED].includes(Result));
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_REGISTERLIFECYCLELISTENER_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testRegisterLifecycleListenerIncorrectParam
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_REGISTERLIFECYCLELISTENER_0200
     * @tc.desc   Test get RegisterLifecycleListenerIncorrectParam's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterLifecycleListenerIncorrectParam', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_REGISTERLIFECYCLELISTENER_0200 start<====`);
        let Result: number = windowndkapi20.RegisterLifecycleListenerIncorrectParam();
        expect(true).assertEqual([WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM,
                                  WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED].includes(Result));
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_REGISTERLIFECYCLELISTENER_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testUnregisterLifecycleListenerOkOrDeviceNotSupported
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERLIFECYCLELISTENER_0100
     * @tc.desc   Test get UnregisterLifecycleListenerOkOrDeviceNotSupported's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnregisterLifecycleListenerOkOrDeviceNotSupported', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERLIFECYCLELISTENER_0100 start<====`);
        let Result: number = windowndkapi20.UnregisterLifecycleListenerOkOrDeviceNotSupported();
        expect(true).assertEqual([OK, WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED].includes(Result));
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERLIFECYCLELISTENER_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testUnregisterLifecycleListenerIncorrectParam
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERLIFECYCLELISTENER_0200
     * @tc.desc   Test get UnregisterLifecycleListenerIncorrectParam's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnregisterLifecycleListenerIncorrectParam', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERLIFECYCLELISTENER_0200 start<====`);
        let Result: number = windowndkapi20.UnregisterLifecycleListenerIncorrectParam();
        expect(true).assertEqual([WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM,
                                  WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED].includes(Result));
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERLIFECYCLELISTENER_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testUnregisterAllLifecycleListenersOkOrDeviceNotSupported
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERALLLIFECYCLELISTENERS_0100
     * @tc.desc   Test get UnregisterAllLifecycleListenersOkOrDeviceNotSupported's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnregisterAllLifecycleListenersOkOrDeviceNotSupported', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERALLLIFECYCLELISTENERS_0100 start<====`);
        let Result: number = windowndkapi20.UnregisterAllLifecycleListenersOkOrDeviceNotSupported();
        expect(true).assertEqual([OK, WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED].includes(Result));
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERALLLIFECYCLELISTENERS_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testUnregisterAllLifecycleListenersIncorrectParam
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERALLLIFECYCLELISTENERS_0200
     * @tc.desc   Test get UnregisterAllLifecycleListenersIncorrectParam's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnregisterAllLifecycleListenersIncorrectParam', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERALLLIFECYCLELISTENERS_0200 start<====`);
        let Result: number = windowndkapi20.UnregisterAllLifecycleListenersIncorrectParam();
        expect(true).assertEqual([WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM,
                                  WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED].includes(Result));
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERALLLIFECYCLELISTENERS_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testRegisterControlEventListenerOkOrDeviceNotSupported
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_REGISTERCONTROLEVENTLISTENER_0100
     * @tc.desc   Test get RegisterControlEventListenerOkOrDeviceNotSupported's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterControlEventListenerOkOrDeviceNotSupported', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_REGISTERCONTROLEVENTLISTENER_0100 start<====`);
        let Result: number = windowndkapi20.RegisterControlEventListenerOkOrDeviceNotSupported();
        expect(true).assertEqual([OK, WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED].includes(Result));
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_REGISTERCONTROLEVENTLISTENER_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testRegisterControlEventListenerIncorrectParam
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_REGISTERCONTROLEVENTLISTENER_0200
     * @tc.desc   Test get RegisterControlEventListenerIncorrectParam's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterControlEventListenerIncorrectParam', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_REGISTERCONTROLEVENTLISTENER_0200 start<====`);
        let Result: number = windowndkapi20.RegisterControlEventListenerIncorrectParam();
        expect(true).assertEqual([WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM,
                                  WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED].includes(Result));
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_REGISTERCONTROLEVENTLISTENER_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testUnregisterControlEventListenerOkOrDeviceNotSupported
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERCONTROLEVENTLISTENER_0100
     * @tc.desc   Test get UnregisterControlEventListenerOkOrDeviceNotSupported's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnregisterControlEventListenerOkOrDeviceNotSupported', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERCONTROLEVENTLISTENER_0100 start<====`);
        let Result: number = windowndkapi20.UnregisterControlEventListenerOkOrDeviceNotSupported();
        expect(true).assertEqual([OK, WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED].includes(Result));
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERCONTROLEVENTLISTENER_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testUnregisterControlEventListenerIncorrectParam
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERCONTROLEVENTLISTENER_0200
     * @tc.desc   Test get UnregisterControlEventListenerIncorrectParam's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnregisterControlEventListenerIncorrectParam', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERCONTROLEVENTLISTENER_0200 start<====`);
        let Result: number = windowndkapi20.UnregisterControlEventListenerIncorrectParam();
        expect(true).assertEqual([WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM,
                                  WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED].includes(Result));
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERCONTROLEVENTLISTENER_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testUnregisterAllControlEventListenersOkOrDeviceNotSupported
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERALLCONTROLEVENTLISTENERS_0100
     * @tc.desc   Test get UnregisterAllControlEventListenersOkOrDeviceNotSupported's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnregisterAllControlEventListenersOkOrDeviceNotSupported', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERALLCONTROLEVENTLISTENERS_0100 start<====`);
        let Result: number = windowndkapi20.UnregisterAllControlEventListenersOkOrDeviceNotSupported();
        expect(true).assertEqual([OK, WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED].includes(Result));
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERALLCONTROLEVENTLISTENERS_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testUnregisterAllControlEventListenersIncorrectParam
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERALLCONTROLEVENTLISTENERS_0200
     * @tc.desc   Test get UnregisterAllControlEventListenersIncorrectParam's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnregisterAllControlEventListenersIncorrectParam', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERALLCONTROLEVENTLISTENERS_0200 start<====`);
        let Result: number = windowndkapi20.UnregisterAllControlEventListenersIncorrectParam();
        expect(true).assertEqual([WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM,
                                  WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED].includes(Result));
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERALLCONTROLEVENTLISTENERS_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testRegisterResizeListenerOkOrDeviceNotSupported
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_REGISTERRESIZELISTENER_0100
     * @tc.desc   Test get RegisterResizeListenerOkOrDeviceNotSupported's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterResizeListenerOkOrDeviceNotSupported', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_REGISTERRESIZELISTENER_0100 start<====`);
        let Result: number = windowndkapi20.RegisterResizeListenerOkOrDeviceNotSupported();
        expect(true).assertEqual([OK, WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED].includes(Result));
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_REGISTERRESIZELISTENER_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testRegisterResizeListenerIncorrectParam
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_REGISTERRESIZELISTENER_0200
     * @tc.desc   Test get RegisterResizeListenerIncorrectParam's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterResizeListenerIncorrectParam', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_REGISTERRESIZELISTENER_0200 start<====`);
        let Result: number = windowndkapi20.RegisterResizeListenerIncorrectParam();
        expect(true).assertEqual([WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM,
                                  WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED].includes(Result));
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_REGISTERRESIZELISTENER_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testUnregisterResizeListenerOkOrDeviceNotSupported
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERRESIZELISTENER_0100
     * @tc.desc   Test get UnregisterResizeListenerOkOrDeviceNotSupported's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnregisterResizeListenerOkOrDeviceNotSupported', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERRESIZELISTENER_0100 start<====`);
        let Result: number = windowndkapi20.UnregisterResizeListenerOkOrDeviceNotSupported();
        expect(true).assertEqual([OK, WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED].includes(Result));
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERRESIZELISTENER_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testUnregisterResizeListenerIncorrectParam
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERRESIZELISTENER_0200
     * @tc.desc   Test get UnregisterResizeListenerIncorrectParam's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnregisterResizeListenerIncorrectParam', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERRESIZELISTENER_0200 start<====`);
        let Result: number = windowndkapi20.UnregisterResizeListenerIncorrectParam();
        expect(true).assertEqual([WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM,
                                  WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED].includes(Result));
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERRESIZELISTENER_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testUnregisterAllResizeListenersOkOrDeviceNotSupported
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERALLRESIZELISTENERS_0100
     * @tc.desc   Test get UnregisterAllResizeListenersOkOrDeviceNotSupported's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnregisterAllResizeListenersOkOrDeviceNotSupported', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERALLRESIZELISTENERS_0100 start<====`);
        let Result: number = windowndkapi20.UnregisterAllResizeListenersOkOrDeviceNotSupported();
        expect(true).assertEqual([OK, WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED].includes(Result));
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERALLRESIZELISTENERS_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testUnregisterAllResizeListenersIncorrectParam
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERALLRESIZELISTENERS_0200
     * @tc.desc   Test get UnregisterAllResizeListenersIncorrectParam's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnregisterAllResizeListenersIncorrectParam', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERALLRESIZELISTENERS_0200 start<====`);
        let Result: number = windowndkapi20.UnregisterAllResizeListenersIncorrectParam();
        expect(true).assertEqual([WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM,
                                  WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED].includes(Result));
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERALLRESIZELISTENERS_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testWindowManagerErrorCodeCreateFailed
     * @tc.number SUB_WINDOW_MANAGER_WINDOW_MANAGER_ERRORCODE_PIP_CREATE_FAILED_0100
     * @tc.desc   Test get WindowManagerErrorCodeCreateFailed's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWindowManagerErrorCodeCreateFailed', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_WINDOW_MANAGER_ERRORCODE_PIP_CREATE_FAILED_0100 start<====`);
        let Result: number = windowndkapi20.WindowManagerErrorCodeCreateFailed();
        expect(true).assertEqual([WINDOW_MANAGER_ERRORCODE_PIP_CREATE_FAILED,
                                  WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED].includes(Result));
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_WINDOW_MANAGER_ERRORCODE_PIP_CREATE_FAILED_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testWindowManagerErrorCodePipStateAbnormal
     * @tc.number SUB_WINDOW_MANAGER_WINDOW_MANAGER_ERRORCODE_PIP_STATE_ABNORMAL_0100
     * @tc.desc   Test get WindowManagerErrorCodePipStateAbnormal's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWindowManagerErrorCodePipStateAbnormal', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_WINDOW_MANAGER_ERRORCODE_PIP_STATE_ABNORMAL_0100 start<====`);
        let Result: number = windowndkapi20.WindowManagerErrorCodePipStateAbnormal();
        expect(true).assertEqual([WINDOW_MANAGER_ERRORCODE_PIP_STATE_ABNORMAL,
                                  WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED].includes(Result));
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_WINDOW_MANAGER_ERRORCODE_PIP_STATE_ABNORMAL_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testWindowManagerErrorCodeIncorrectParam
     * @tc.number SUB_WINDOW_MANAGER_WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM_0100
     * @tc.desc   Test get WindowManagerErrorCodeIncorrectParam's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWindowManagerErrorCodeIncorrectParam', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM_0100 start<====`);
        let Result: number = windowndkapi20.WindowManagerErrorCodeIncorrectParam();
        expect(true).assertEqual([WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM,
                                  WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED].includes(Result));
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })

    /**
     * @tc.name   testSetPipMainWindowIdBoundaryValue
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SetPipMainWindowId_0100
     * @tc.desc   testSetPipMainWindowIdBoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetPipMainWindowIdBoundaryValue', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testSetPipMainWindowIdBoundaryValue'
      try {
        console.info(`====>${caseName} start<====`);
        let Result: Array<number> = windowndkapi20.testSetPipMainWindowIdBoundaryValue();
        console.info(`====>${caseName} Result: ${JSON.stringify(Result)}`);
        expect(Result[0]).assertEqual(OK);
        expect(Result[1]).assertEqual(OK);
        done()
      } catch (err) {
        console.error(`====>${caseName} catch err: ` + err);
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   testSetPipRectBoundaryValue
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SetPipRect_0100
     * @tc.desc   testSetPipRectBoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetPipRectBoundaryValue', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testSetPipRectBoundaryValue'
      try {
        console.info(`====>${caseName} start<====`);
        let Result: Array<number> = windowndkapi20.testSetPipRectBoundaryValue();
        console.info(`====>${caseName} Result: ${JSON.stringify(Result)}`);
        expect(Result[0]).assertEqual(OK);
        expect(Result[1]).assertEqual(OK);
        expect(Result[2]).assertEqual(OK);
        done()
      } catch (err) {
        console.error(`====>${caseName} catch err: ` + err);
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   testSetPipControlGroupBoundaryValue
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SetPipControlGroup_0100
     * @tc.desc   testSetPipControlGroupBoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetPipControlGroupBoundaryValue', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testSetPipControlGroupBoundaryValue'
      try {
        console.info(`====>${caseName} start<====`);
        let Result: Array<number> = windowndkapi20.testSetPipControlGroupBoundaryValue();
        console.info(`====>${caseName} Result: ${JSON.stringify(Result)}`);
        expect(Result[0]).assertEqual(OK);
        expect(Result[1]).assertEqual(OK);
        expect(Result[2]).assertEqual(OK);
        done()
      } catch (err) {
        console.error(`====>${caseName} catch err: ` + err);
        expect().assertFail()
        done()
      }
    })
    
    /**
     * @tc.name   testDeletePipBoundaryValue
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_DeletePip_0100
     * @tc.desc   testDeletePipBoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDeletePipBoundaryValue', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testDeletePipBoundaryValue'
      try {
        console.info(`====>${caseName} start<====`);
        let Result: Array<number> = windowndkapi20.testDeletePipBoundaryValue();
        console.info(`====>${caseName} Result: ${JSON.stringify(Result)}`);
        expect(Result[0]).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
        expect(Result[1]).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
        done()
      } catch (err) {
        console.error(`====>${caseName} catch err: ` + err);
        expect().assertFail()
        done()
      }
    })
   
    /**
     * @tc.name   testStartPipBoundaryValue
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_StartPip_0100
     * @tc.desc   testStartPipBoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testStartPipBoundaryValue', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testStartPipBoundaryValue'
      try {
        console.info(`====>${caseName} start<====`);
        let Result: Array<number> = windowndkapi20.testStartPipBoundaryValue();
        console.info(`====>${caseName} Result: ${JSON.stringify(Result)}`);
        expect(Result[0]).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
        expect(Result[1]).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
        done()
      } catch (err) {
        console.error(`====>${caseName} catch err: ` + err);
        expect().assertFail()
        done()
      }
    })
    
    /**
     * @tc.name   testStopPipBoundaryValue
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_StopPip_0100
     * @tc.desc   testStopPipBoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testStopPipBoundaryValue', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testStopPipBoundaryValue'
      try {
        console.info(`====>${caseName} start<====`);
        let Result: Array<number> = windowndkapi20.testStopPipBoundaryValue();
        console.info(`====>${caseName} Result: ${JSON.stringify(Result)}`);
        expect(Result[0]).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
        expect(Result[1]).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
        done()
      } catch (err) {
        console.error(`====>${caseName} catch err: ` + err);
        expect().assertFail()
        done()
      }
    })
    
    /**
     * @tc.name   testUpdatePipContentSizeBoundaryValue
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UpdatePipContentSize_0100
     * @tc.desc   testUpdatePipContentSizeBoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUpdatePipContentSizeBoundaryValue', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testUpdatePipContentSizeBoundaryValue'
      try {
        console.info(`====>${caseName} start<====`);
        let Result: Array<number> = windowndkapi20.testUpdatePipContentSizeBoundaryValue();
        console.info(`====>${caseName} Result: ${JSON.stringify(Result)}`);
        expect(Result[0]).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
        expect(Result[1]).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
        done()
      } catch (err) {
        console.error(`====>${caseName} catch err: ` + err);
        expect().assertFail()
        done()
      }
    })
    
    /**
     * @tc.name   testUpdatePipControlStatusBoundaryValue
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UpdatePipControlStatus_0100
     * @tc.desc   testUpdatePipControlStatusBoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUpdatePipControlStatusBoundaryValue', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testUpdatePipControlStatusBoundaryValue'
      try {
        console.info(`====>${caseName} start<====`);
        let Result: Array<number> = windowndkapi20.testUpdatePipControlStatusBoundaryValue();
        console.info(`====>${caseName} Result: ${JSON.stringify(Result)}`);
        expect(Result[0]).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
        expect(Result[1]).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
        done()
      } catch (err) {
        console.error(`====>${caseName} catch err: ` + err);
        expect().assertFail()
        done()
      }
    })
    
    /**
     * @tc.name   testSetPipControlEnabledBoundaryValue
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SetPipControlEnabled_0100
     * @tc.desc   testSetPipControlEnabledBoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetPipControlEnabledBoundaryValue', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testSetPipControlEnabledBoundaryValue'
      try {
        console.info(`====>${caseName} start<====`);
        let Result: Array<number> = windowndkapi20.testSetPipControlEnabledBoundaryValue();
        console.info(`====>${caseName} Result: ${JSON.stringify(Result)}`);
        expect(Result[0]).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
        expect(Result[1]).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
        done()
      } catch (err) {
        console.error(`====>${caseName} catch err: ` + err);
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   testSetPipInitialSurfaceRectBoundaryValue
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SetPipInitialSurfaceRect_0100
     * @tc.desc   testSetPipInitialSurfaceRectBoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetPipInitialSurfaceRectBoundaryValue', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testSetPipInitialSurfaceRectBoundaryValue'
      try {
        console.info(`====>${caseName} start<====`);
        let Result: Array<number> = windowndkapi20.testSetPipInitialSurfaceRectBoundaryValue();
        console.info(`====>${caseName} Result: ${JSON.stringify(Result)}`);
        expect(Result[0]).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
        expect(Result[1]).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
        done()
      } catch (err) {
        console.error(`====>${caseName} catch err: ` + err);
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   testUnsetPipInitialSurfaceRectBoundaryValue
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UnsetPipInitialSurfaceRect_0100
     * @tc.desc   testUnsetPipInitialSurfaceRectBoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUnsetPipInitialSurfaceRectBoundaryValue', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testUnsetPipInitialSurfaceRectBoundaryValue'
      try {
        console.info(`====>${caseName} start<====`);
        let Result: Array<number> = windowndkapi20.testUnsetPipInitialSurfaceRectBoundaryValue();
        console.info(`====>${caseName} Result: ${JSON.stringify(Result)}`);
        expect(Result[0]).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
        expect(Result[1]).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
        done()
      } catch (err) {
        console.error(`====>${caseName} catch err: ` + err);
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   testRegisterStartPipCallbackBoundaryValue
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_RegisterStartPipCallback_0100
     * @tc.desc   testRegisterStartPipCallbackBoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRegisterStartPipCallbackBoundaryValue', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testRegisterStartPipCallbackBoundaryValue'
      try {
        console.info(`====>${caseName} start<====`);
        let Result: Array<number> = windowndkapi20.testRegisterStartPipCallbackBoundaryValue();
        console.info(`====>${caseName} Result: ${JSON.stringify(Result)}`);
        expect(Result[0]).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
        expect(Result[1]).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
        done()
      } catch (err) {
        console.error(`====>${caseName} catch err: ` + err);
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   testUnregisterStartPipCallbackBoundaryValue
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UnregisterStartPipCallback_0100
     * @tc.desc   testUnregisterStartPipCallbackBoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUnregisterStartPipCallbackBoundaryValue', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testUnregisterStartPipCallbackBoundaryValue'
      try {
        console.info(`====>${caseName} start<====`);
        let Result: Array<number> = windowndkapi20.testUnregisterStartPipCallbackBoundaryValue();
        console.info(`====>${caseName} Result: ${JSON.stringify(Result)}`);
        expect(Result[0]).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
        expect(Result[1]).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
        done()
      } catch (err) {
        console.error(`====>${caseName} catch err: ` + err);
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   testUnregisterAllStartPipCallbacksBoundaryValue
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UnregisterAllStartPipCallbacks_0100
     * @tc.desc   testUnregisterAllStartPipCallbacksBoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUnregisterAllStartPipCallbacksBoundaryValue', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testUnregisterAllStartPipCallbacksBoundaryValue'
      try {
        console.info(`====>${caseName} start<====`);
        let Result: Array<number> = windowndkapi20.testUnregisterAllStartPipCallbacksBoundaryValue();
        console.info(`====>${caseName} Result: ${JSON.stringify(Result)}`);
        expect(Result[0]).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
        expect(Result[1]).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
        done()
      } catch (err) {
        console.error(`====>${caseName} catch err: ` + err);
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   testRegisterLifecycleListenerBoundaryValue
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_RegisterLifecycleListener_0100
     * @tc.desc   testRegisterLifecycleListenerBoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRegisterLifecycleListenerBoundaryValue', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testRegisterLifecycleListenerBoundaryValue'
      try {
        console.info(`====>${caseName} start<====`);
        let Result: Array<number> = windowndkapi20.testRegisterLifecycleListenerBoundaryValue();
        console.info(`====>${caseName} Result: ${JSON.stringify(Result)}`);
        expect(Result[0]).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
        expect(Result[1]).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
        done()
      } catch (err) {
        console.error(`====>${caseName} catch err: ` + err);
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   testUnregisterLifecycleListenerBoundaryValue
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UnregisterLifecycleListener_0100
     * @tc.desc   testUnregisterLifecycleListenerBoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUnregisterLifecycleListenerBoundaryValue', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testUnregisterLifecycleListenerBoundaryValue'
      try {
        console.info(`====>${caseName} start<====`);
        let Result: Array<number> = windowndkapi20.testUnregisterLifecycleListenerBoundaryValue();
        console.info(`====>${caseName} Result: ${JSON.stringify(Result)}`);
        expect(Result[0]).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
        expect(Result[1]).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
        done()
      } catch (err) {
        console.error(`====>${caseName} catch err: ` + err);
        expect().assertFail()
        done()
      }
    })
    
    /**
     * @tc.name   testUnregisterAllLifecycleListenersBoundaryValue
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UnregisterAllLifecycleListeners_0100
     * @tc.desc   testUnregisterAllLifecycleListenersBoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUnregisterAllLifecycleListenersBoundaryValue', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testUnregisterAllLifecycleListenersBoundaryValue'
      try {
        console.info(`====>${caseName} start<====`);
        let Result: Array<number> = windowndkapi20.testUnregisterAllLifecycleListenersBoundaryValue();
        console.info(`====>${caseName} Result: ${JSON.stringify(Result)}`);
        expect(Result[0]).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
        expect(Result[1]).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
        done()
      } catch (err) {
        console.error(`====>${caseName} catch err: ` + err);
        expect().assertFail()
        done()
      }
    })
    
    /**
     * @tc.name   testRegisterControlEventListenerBoundaryValue
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_RegisterControlEventListener_0100
     * @tc.desc   testRegisterControlEventListenerBoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRegisterControlEventListenerBoundaryValue', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testRegisterControlEventListenerBoundaryValue'
      try {
        console.info(`====>${caseName} start<====`);
        let Result: Array<number> = windowndkapi20.testRegisterControlEventListenerBoundaryValue();
        console.info(`====>${caseName} Result: ${JSON.stringify(Result)}`);
        expect(Result[0]).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
        expect(Result[1]).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
        done()
      } catch (err) {
        console.error(`====>${caseName} catch err: ` + err);
        expect().assertFail()
        done()
      }
    })
    
    /**
     * @tc.name   testUnregisterControlEventListenerBoundaryValue
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UnregisterControlEventListener_0100
     * @tc.desc   testUnregisterControlEventListenerBoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUnregisterControlEventListenerBoundaryValue', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testUnregisterControlEventListenerBoundaryValue'
      try {
        console.info(`====>${caseName} start<====`);
        let Result: Array<number> = windowndkapi20.testUnregisterControlEventListenerBoundaryValue();
        console.info(`====>${caseName} Result: ${JSON.stringify(Result)}`);
        expect(Result[0]).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
        expect(Result[1]).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
        done()
      } catch (err) {
        console.error(`====>${caseName} catch err: ` + err);
        expect().assertFail()
        done()
      }
    })
    
    /**
     * @tc.name   testUnregisterAllControlEventListenersBoundaryValue
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UnregisterAllControlEventListeners_0100
     * @tc.desc   testUnregisterAllControlEventListenersBoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUnregisterAllControlEventListenersBoundaryValue', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testUnregisterAllControlEventListenersBoundaryValue'
      try {
        console.info(`====>${caseName} start<====`);
        let Result: Array<number> = windowndkapi20.testUnregisterAllControlEventListenersBoundaryValue();
        console.info(`====>${caseName} Result: ${JSON.stringify(Result)}`);
        expect(Result[0]).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
        expect(Result[1]).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
        done()
      } catch (err) {
        console.error(`====>${caseName} catch err: ` + err);
        expect().assertFail()
        done()
      }
    })
    
    /**
     * @tc.name   testRegisterResizeListenerBoundaryValue
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_RegisterResizeListener_0100
     * @tc.desc   testRegisterResizeListenerBoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRegisterResizeListenerBoundaryValue', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testRegisterResizeListenerBoundaryValue'
      try {
        console.info(`====>${caseName} start<====`);
        let Result: Array<number> = windowndkapi20.testRegisterResizeListenerBoundaryValue();
        console.info(`====>${caseName} Result: ${JSON.stringify(Result)}`);
        expect(Result[0]).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
        expect(Result[1]).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
        done()
      } catch (err) {
        console.error(`====>${caseName} catch err: ` + err);
        expect().assertFail()
        done()
      }
    })
    
    /**
     * @tc.name   testUnregisterResizeListenerBoundaryValue
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UnregisterResizeListener_0100
     * @tc.desc   testUnregisterResizeListenerBoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUnregisterResizeListenerBoundaryValue', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testUnregisterResizeListenerBoundaryValue'
      try {
        console.info(`====>${caseName} start<====`);
        let Result: Array<number> = windowndkapi20.testUnregisterResizeListenerBoundaryValue();
        console.info(`====>${caseName} Result: ${JSON.stringify(Result)}`);
        expect(Result[0]).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
        expect(Result[1]).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
        done()
      } catch (err) {
        console.error(`====>${caseName} catch err: ` + err);
        expect().assertFail()
        done()
      }
    })
    
    /**
     * @tc.name   testUnregisterAllResizeListenersBoundaryValue
     * @tc.number SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UnregisterAllResizeListeners_0100
     * @tc.desc   testUnregisterAllResizeListenersBoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUnregisterAllResizeListenersBoundaryValue', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testUnregisterAllResizeListenersBoundaryValue'
      try {
        console.info(`====>${caseName} start<====`);
        let Result: Array<number> = windowndkapi20.testUnregisterAllResizeListenersBoundaryValue();
        console.info(`====>${caseName} Result: ${JSON.stringify(Result)}`);
        expect(Result[0]).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
        expect(Result[1]).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
        done()
      } catch (err) {
        console.error(`====>${caseName} catch err: ` + err);
        expect().assertFail()
        done()
      }
    })

  })
}