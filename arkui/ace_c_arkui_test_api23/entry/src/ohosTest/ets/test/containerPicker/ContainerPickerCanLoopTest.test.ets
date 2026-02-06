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

export default function ContainerPickerCanLoop(){

  describe('ContainerPickerCanLoop', () => {
    beforeEach(async (done: Function) => {
      done();
    })

    /**
     * @tc.number      SUB_ARKUI_CAPI_PICKER_CAN_LOOP_0100
     * @tc.name        TestContainerPickerCanLoop001
     * @tc.desc        testing ContainerPicker CanLoop
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('TestContainerPickerCanLoop001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestContainerPickerCanLoop001()).assertEqual(0)
      done();
    });

    /**
     * @tc.number      SUB_ARKUI_CAPI_PICKER_CAN_LOOP_0200
     * @tc.name        TestContainerPickerCanLoop002
     * @tc.desc        testing ContainerPicker CanLoop
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('TestContainerPickerCanLoop002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestContainerPickerCanLoop002()).assertEqual(0)
      done();
    });

    /**
     * @tc.number      SUB_ARKUI_CAPI_PICKER_CAN_LOOP_0300
     * @tc.name        TestContainerPickerCanLoop003
     * @tc.desc        testing ContainerPicker CanLoop
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('TestContainerPickerCanLoop003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestContainerPickerCanLoop003()).assertEqual(0)
      done();
    });

    /**
     * @tc.number      SUB_ARKUI_CAPI_PICKER_CAN_LOOP_0400
     * @tc.name        TestContainerPickerCanLoop004
     * @tc.desc        testing ContainerPicker CanLoop
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('TestContainerPickerCanLoop004', Level.LEVEL0, async (done: Function) => {
      expect(nativeFunc.TestContainerPickerCanLoop004()).assertEqual(0)
      done();
    });


  })
}