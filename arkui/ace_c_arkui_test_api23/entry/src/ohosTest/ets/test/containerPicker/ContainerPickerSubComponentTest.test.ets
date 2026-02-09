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

const ARKUI_ERROR_CODE_NO_ERROR = 0;
const ARKUI_ERROR_CODE_ERROR = 1;

export default function ContainerPickerSubComponent(){

  describe('ContainerPickerSubComponent', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.number      SUB_ARKUI_CAPI_SubComponent_0100
     * @tc.name        TestContainerPickerSubComponent001
     * @tc.desc        testing ContainerPicker SubComponent
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('TestContainerPickerSubComponent001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestContainerPickerSubComponent001()).assertEqual(0)
      done();
    });

    /**
     * @tc.number      SUB_ARKUI_CAPI_SubComponent_0200
     * @tc.name        TestContainerPickerSubComponent002
     * @tc.desc        testing ContainerPicker SubComponent
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('TestContainerPickerSubComponent002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestContainerPickerSubComponent002()).assertEqual(0)
      done();
    });

    /**
     * @tc.number      SUB_ARKUI_CAPI_SubComponent_0300
     * @tc.name        TestContainerPickerSubComponent003
     * @tc.desc        testing ContainerPicker SubComponent
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('TestContainerPickerSubComponent003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestContainerPickerSubComponent003()).assertEqual(0)
      done();
    });

    /**
     * @tc.number      SUB_ARKUI_CAPI_SubComponent_0400
     * @tc.name        TestContainerPickerSubComponent004
     * @tc.desc        testing ContainerPicker SubComponent
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('TestContainerPickerSubComponent004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestContainerPickerSubComponent004()).assertEqual(0)
      done();
    });

    /**
     * @tc.number      TestContainerPickerSubComponent005
     * @tc.name        TestContainerPickerSubComponent005
     * @tc.desc        testing ContainerPicker ARKUI_NODE_PICKER = 1018
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('TestContainerPickerSubComponent005', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestContainerPickerSubComponent005 start====");
        let result: number = nativeFunc.TestContainerPickerSubComponent005()
        console.info(`====>TestContainerPickerSubComponent005 result====${result}`);
        expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
        done();
      } catch (err) {
        console.error("====>TestContainerPickerSubComponent005 catch err: " + err);
        expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
      }
    })
  })
}