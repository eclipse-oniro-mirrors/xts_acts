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

import { expect, describe, it, beforeEach, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function ContainerPickerEnableHapticFeedback(){

  describe('ContainerPickerEnableHapticFeedback', () => {
    beforeEach(async (done: Function) => {
      done();
    })

    /**
     * @tc.number      SUB_ARKUI_CAPI_PICKER_ENABLE_HAPTIC_FEEDBACK_0100
     * @tc.name        TestContainerPickerEnableHapticFeedback001
     * @tc.desc        testing ContainerPicker EnableHapticFeedback
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('TestContainerPickerEnableHapticFeedback001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestContainerPickerEnableHapticFeedback001()).assertEqual(0)
      done();
    });

    /**
     * @tc.number      SUB_ARKUI_CAPI_PICKER_ENABLE_HAPTIC_FEEDBACK_0200
     * @tc.name        TestContainerPickerEnableHapticFeedback002
     * @tc.desc        testing ContainerPicker EnableHapticFeedback
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('TestContainerPickerEnableHapticFeedback002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestContainerPickerEnableHapticFeedback002()).assertEqual(0)
      done();
    });

    /**
     * @tc.number      SUB_ARKUI_CAPI_PICKER_ENABLE_HAPTIC_FEEDBACK_0300
     * @tc.name        TestContainerPickerEnableHapticFeedback003
     * @tc.desc        testing ContainerPicker EnableHapticFeedback
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('TestContainerPickerEnableHapticFeedback003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestContainerPickerEnableHapticFeedback003()).assertEqual(0)
      done();
    });

    /**
     * @tc.number      SUB_ARKUI_CAPI_PICKER_ENABLE_HAPTIC_FEEDBACK_0400
     * @tc.name        TestContainerPickerEnableHapticFeedback004
     * @tc.desc        testing ContainerPicker EnableHapticFeedback
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('TestContainerPickerEnableHapticFeedback004', Level.LEVEL0, async (done: Function) => {
      expect(nativeFunc.TestContainerPickerEnableHapticFeedback004()).assertEqual(0)
      done();
    });


  })
}