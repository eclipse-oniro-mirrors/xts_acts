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

const CAN_NOT_BUILD_STAGE = -1;
const DISPLAY_MANAGER_ERROR_NO_PERMISSION = 201;
const DISPLAY_MANAGER_ERROR_INVALID_PARAM = 401;
const DISPLAY_MANAGER_ERROR_DEVICE_NOT_SUPPORTED = 801;
const DISPLAY_MANAGER_ERROR_SYSTEM_ABNORMAL = 1400003;

export default function DisplayTest() {
  describe('DisplayTest', () => {
    /**
     * @tc.number  : SUB_WINDOW_MANAGER_OH_NATIVEDISPLAYMANAGER_CAPTURESCREENPIXELMAP_0100
     * @tc.name    : testCaptureScreenPixelmapInvalidParamOrDeviceNotSupported
     * @tc.desc    : Test get CaptureScreenPixelmapInvalidParamOrDeviceNotSupported's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
     * @tc.number  : SUB_WINDOW_MANAGER_OH_NATIVEDISPLAYMANAGER_CAPTURESCREENPIXELMAP_0200
     * @tc.name    : testCaptureScreenPixelmapNoPermission
     * @tc.desc    : Test get CaptureScreenPixelmapNoPermission's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
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
  })
}