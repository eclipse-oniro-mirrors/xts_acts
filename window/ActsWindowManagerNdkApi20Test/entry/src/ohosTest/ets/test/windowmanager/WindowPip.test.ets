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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_CREATEPIPCONFIG_0100
     * @tc.name    : testCreatePipConfigOk
     * @tc.desc    : Test get CreatePipConfigOk's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_CREATEPIPCONFIG_0200
     * @tc.name    : testCreatePipConfigIncorrectParam
     * @tc.desc    : Test get CreatePipConfigIncorrectParam's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPMAINWINDOWID_0100
     * @tc.name    : testSetPipMainWindowIdOkOrDeviceNotSupported
     * @tc.desc    : Test get SetPipMainWindowIdOkOrDeviceNotSupported's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPMAINWINDOWID_0200
     * @tc.name    : testSetPipMainWindowIdIncorrectParam
     * @tc.desc    : Test get SetPipMainWindowIdIncorrectParam's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPTEMPLATETYPE_0100
     * @tc.name    : testSetPipTemplateTypeOkOrDeviceNotSupported
     * @tc.desc    : Test get SetPipTemplateTypeOkOrDeviceNotSupported's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPTEMPLATETYPE_0200
     * @tc.name    : testSetPipTemplateTypeIncorrectParam
     * @tc.desc    : Test get SetPipTemplateTypeIncorrectParam's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPRECT_0100
     * @tc.name    : testSetPipRectOkOrDeviceNotSupported
     * @tc.desc    : Test get SetPipRectOkOrDeviceNotSupported's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPRECT_0200
     * @tc.name    : testSetPipRectIncorrectParam
     * @tc.desc    : Test get SetPipRectIncorrectParam's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPCONTROLGROUP_0100
     * @tc.name    : testSetPipControlGroupOkOrDeviceNotSupported
     * @tc.desc    : Test get SetPipControlGroupOkOrDeviceNotSupported's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPCONTROLGROUP_0200
     * @tc.name    : testSetPipControlGroupIncorrectParam
     * @tc.desc    : Test get SetPipControlGroupIncorrectParam's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPNAPIENV_0100
     * @tc.name    : testSetPipNapiEnvOkOrDeviceNotSupported
     * @tc.desc    : Test get SetPipNapiEnvOkOrDeviceNotSupported's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPNAPIENV_0200
     * @tc.name    : testSetPipNapiEnvIncorrectParam
     * @tc.desc    : Test get SetPipNapiEnvIncorrectParam's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_CREATEPIP_0100
     * @tc.name    : testCreatePipOkOrDeviceNotSupported
     * @tc.desc    : Test get CreatePipOkOrDeviceNotSupported's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_STARTPIP_0100
     * @tc.name    : testStartPipPipCreateFailed
     * @tc.desc    : Test get StartPipPipCreateFailed's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_STARTPIP_0200
     * @tc.name    : testStartPipIncorrectParam
     * @tc.desc    : Test get StartPipIncorrectParam's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_STOPPIP_0100
     * @tc.name    : testStopPipIncorrectParam
     * @tc.desc    : Test get StopPipIncorrectParam's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UPDATEPIPCONTENTSIZE_0100
     * @tc.name    : testUpdatePipContentSizeIncorrectParam
     * @tc.desc    : Test get UpdatePipContentSizeIncorrectParam's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UPDATEPIPCONTROLSTATUS_0100
     * @tc.name    : testUpdatePipControlStatusIncorrectParam
     * @tc.desc    : Test get UpdatePipControlStatusIncorrectParam's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPCONTROLENABLED_0100
     * @tc.name    : testSetPipControlEnabledIncorrectParam
     * @tc.desc    : Test get SetPipControlEnabledIncorrectParam's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPINITIALSURFACERECT_0100
     * @tc.name    : testSetPipInitialSurfaceRectParameterOverride
     * @tc.desc    : Test get SetPipInitialSurfaceRectParameterOverride's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPINITIALSURFACERECT_0200
     * @tc.name    : testSetPipInitialSurfaceRectOk
     * @tc.desc    : Test get SetPipInitialSurfaceRectOk's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_SETPIPINITIALSURFACERECT_0300
     * @tc.name    : testSetPipInitialSurfaceRectIncorrectParam
     * @tc.desc    : Test get SetPipInitialSurfaceRectIncorrectParam's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNSETPIPINITIALSURFACERECT_0100
     * @tc.name    : testUnsetPipInitialSurfaceRectParameterOverride
     * @tc.desc    : Test get UnsetPipInitialSurfaceRectParameterOverride's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNSETPIPINITIALSURFACERECT_0200
     * @tc.name    : testUnsetPipInitialSurfaceRectOk
     * @tc.desc    : Test get UnsetPipInitialSurfaceRectOk's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNSETPIPINITIALSURFACERECT_0300
     * @tc.name    : testUnsetPipInitialSurfaceRectIncorrectParam
     * @tc.desc    : Test get UnsetPipInitialSurfaceRectIncorrectParam's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_REGISTERSTARTPIPCALLBACK_0100
     * @tc.name    : testRegisterStartPipCallbackOkOrDeviceNotSupported
     * @tc.desc    : Test get RegisterStartPipCallbackOkOrDeviceNotSupported's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_REGISTERSTARTPIPCALLBACK_0200
     * @tc.name    : testRegisterStartPipCallbackIncorrectParam
     * @tc.desc    : Test get RegisterStartPipCallbackIncorrectParam's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERSTARTPIPCALLBACK_0100
     * @tc.name    : testUnregisterStartPipCallbackOkOrDeviceNotSupported
     * @tc.desc    : Test get UnregisterStartPipCallbackOkOrDeviceNotSupported's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERSTARTPIPCALLBACK_0200
     * @tc.name    : testUnregisterStartPipCallbackIncorrectParam
     * @tc.desc    : Test get UnregisterStartPipCallbackIncorrectParam's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERALLSTARTPIPCALLBACKS_0100
     * @tc.name    : testUnregisterAllStartPipCallbacksOkOrDeviceNotSupported
     * @tc.desc    : Test get UnregisterAllStartPipCallbacksOkOrDeviceNotSupported's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERALLSTARTPIPCALLBACKS_0200
     * @tc.name    : testUnregisterAllStartPipCallbacksIncorrectParam
     * @tc.desc    : Test get UnregisterAllStartPipCallbacksIncorrectParam's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_REGISTERLIFECYCLELISTENER_0100
     * @tc.name    : testRegisterLifecycleListenerOkOrDeviceNotSupported
     * @tc.desc    : Test get RegisterLifecycleListenerOkOrDeviceNotSupported's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_REGISTERLIFECYCLELISTENER_0200
     * @tc.name    : testRegisterLifecycleListenerIncorrectParam
     * @tc.desc    : Test get RegisterLifecycleListenerIncorrectParam's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERLIFECYCLELISTENER_0100
     * @tc.name    : testUnregisterLifecycleListenerOkOrDeviceNotSupported
     * @tc.desc    : Test get UnregisterLifecycleListenerOkOrDeviceNotSupported's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERLIFECYCLELISTENER_0200
     * @tc.name    : testUnregisterLifecycleListenerIncorrectParam
     * @tc.desc    : Test get UnregisterLifecycleListenerIncorrectParam's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERALLLIFECYCLELISTENERS_0100
     * @tc.name    : testUnregisterAllLifecycleListenersOkOrDeviceNotSupported
     * @tc.desc    : Test get UnregisterAllLifecycleListenersOkOrDeviceNotSupported's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERALLLIFECYCLELISTENERS_0200
     * @tc.name    : testUnregisterAllLifecycleListenersIncorrectParam
     * @tc.desc    : Test get UnregisterAllLifecycleListenersIncorrectParam's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_REGISTERCONTROLEVENTLISTENER_0100
     * @tc.name    : testRegisterControlEventListenerOkOrDeviceNotSupported
     * @tc.desc    : Test get RegisterControlEventListenerOkOrDeviceNotSupported's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_REGISTERCONTROLEVENTLISTENER_0200
     * @tc.name    : testRegisterControlEventListenerIncorrectParam
     * @tc.desc    : Test get RegisterControlEventListenerIncorrectParam's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERCONTROLEVENTLISTENER_0100
     * @tc.name    : testUnregisterControlEventListenerOkOrDeviceNotSupported
     * @tc.desc    : Test get UnregisterControlEventListenerOkOrDeviceNotSupported's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERCONTROLEVENTLISTENER_0200
     * @tc.name    : testUnregisterControlEventListenerIncorrectParam
     * @tc.desc    : Test get UnregisterControlEventListenerIncorrectParam's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERALLCONTROLEVENTLISTENERS_0100
     * @tc.name    : testUnregisterAllControlEventListenersOkOrDeviceNotSupported
     * @tc.desc    : Test get UnregisterAllControlEventListenersOkOrDeviceNotSupported's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERALLCONTROLEVENTLISTENERS_0200
     * @tc.name    : testUnregisterAllControlEventListenersIncorrectParam
     * @tc.desc    : Test get UnregisterAllControlEventListenersIncorrectParam's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_REGISTERRESIZELISTENER_0100
     * @tc.name    : testRegisterResizeListenerOkOrDeviceNotSupported
     * @tc.desc    : Test get RegisterResizeListenerOkOrDeviceNotSupported's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_REGISTERRESIZELISTENER_0200
     * @tc.name    : testRegisterResizeListenerIncorrectParam
     * @tc.desc    : Test get RegisterResizeListenerIncorrectParam's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERRESIZELISTENER_0100
     * @tc.name    : testUnregisterResizeListenerOkOrDeviceNotSupported
     * @tc.desc    : Test get UnregisterResizeListenerOkOrDeviceNotSupported's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERRESIZELISTENER_0200
     * @tc.name    : testUnregisterResizeListenerIncorrectParam
     * @tc.desc    : Test get UnregisterResizeListenerIncorrectParam's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERALLRESIZELISTENERS_0100
     * @tc.name    : testUnregisterAllResizeListenersOkOrDeviceNotSupported
     * @tc.desc    : Test get UnregisterAllResizeListenersOkOrDeviceNotSupported's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_PICTUREINPICTURE_UNREGISTERALLRESIZELISTENERS_0200
     * @tc.name    : testUnregisterAllResizeListenersIncorrectParam
     * @tc.desc    : Test get UnregisterAllResizeListenersIncorrectParam's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_WINDOW_MANAGER_ERRORCODE_PIP_CREATE_FAILED_0100
     * @tc.name    : testWindowManagerErrorCodeCreateFailed
     * @tc.desc    : Test get WindowManagerErrorCodeCreateFailed's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_WINDOW_MANAGER_ERRORCODE_PIP_STATE_ABNORMAL_0100
     * @tc.name    : testWindowManagerErrorCodePipStateAbnormal
     * @tc.desc    : Test get WindowManagerErrorCodePipStateAbnormal's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM_0100
     * @tc.name    : testWindowManagerErrorCodeIncorrectParam
     * @tc.desc    : Test get WindowManagerErrorCodeIncorrectParam's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
  })
}