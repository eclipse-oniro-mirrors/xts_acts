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

export default function ContainerPickerSelectionIndicator(){

  describe('ContainerPickerSelectionIndicator', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.number      SUB_ARKUI_CAPI_PICKER_SELECTION_INDICATOR_0100
     * @tc.name        TestContainerPickerSelectionIndicator001
     * @tc.desc        testing ContainerPicker SelectionIndicator
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('TestContainerPickerSelectionIndicator001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestContainerPickerSelectionIndicator001()).assertEqual(0)
      done();
    });

    /**
     * @tc.number      SUB_ARKUI_CAPI_PICKER_SELECTION_INDICATOR_0200
     * @tc.name        TestContainerPickerSelectionIndicator002
     * @tc.desc        testing ContainerPicker SelectionIndicator
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('TestContainerPickerSelectionIndicator002', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.TestContainerPickerSelectionIndicator002()).assertEqual(0)
      done();
    });

    /**
     * @tc.number      SUB_ARKUI_CAPI_PICKER_SELECTION_INDICATOR_0300
     * @tc.name        TestContainerPickerSelectionIndicator003
     * @tc.desc        testing ContainerPicker SelectionIndicator
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('TestContainerPickerSelectionIndicator003', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.TestContainerPickerSelectionIndicator003()).assertEqual(0)
      done();
    });

    /**
     * @tc.number      SUB_ARKUI_CAPI_PICKER_SELECTION_INDICATOR_0400
     * @tc.name        TestContainerPickerSelectionIndicator004
     * @tc.desc        testing ContainerPicker SelectionIndicator
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('TestContainerPickerSelectionIndicator004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestContainerPickerSelectionIndicator004()).assertEqual(0)
      done();
    });

    /**
     * @tc.number      SUB_ARKUI_CAPI_PICKER_SELECTION_INDICATOR_0500
     * @tc.name        TestContainerPickerSelectionIndicator005
     * @tc.desc        testing ContainerPicker SelectionIndicator
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('TestContainerPickerSelectionIndicator005', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.TestContainerPickerSelectionIndicator005()).assertEqual(0)
      done();
    });

    /**
     * @tc.number      SUB_ARKUI_CAPI_PICKER_SELECTION_INDICATOR_0600
     * @tc.name        TestContainerPickerSelectionIndicator006
     * @tc.desc        testing ContainerPicker SelectionIndicator
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('TestContainerPickerSelectionIndicator006', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.TestContainerPickerSelectionIndicator006()).assertEqual(0)
      done();
    });

    /**
     * @tc.number      SUB_ARKUI_CAPI_PICKER_SELECTION_INDICATOR_0700
     * @tc.name        TestContainerPickerSelectionIndicator007
     * @tc.desc        testing ContainerPicker SelectionIndicator
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('TestContainerPickerSelectionIndicator007', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.TestContainerPickerSelectionIndicator007()).assertEqual(0)
      done();
    });

    /**
     * @tc.number      SUB_ARKUI_CAPI_PICKER_SELECTION_INDICATOR_0800
     * @tc.name        TestContainerPickerSelectionIndicator008
     * @tc.desc        testing ContainerPicker SelectionIndicator
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('TestContainerPickerSelectionIndicator008', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.TestContainerPickerSelectionIndicator008()).assertEqual(0)
      done();
    });

    /**
     * @tc.number      SUB_ARKUI_CAPI_PICKER_SELECTION_INDICATOR_0900
     * @tc.name        TestContainerPickerSelectionIndicator009
     * @tc.desc        testing ContainerPicker SelectionIndicator
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('TestContainerPickerSelectionIndicator009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestContainerPickerSelectionIndicator009()).assertEqual(0)
      done();
    });

    /**
     * @tc.number      SUB_ARKUI_CAPI_PICKER_SELECTION_INDICATOR_1000
     * @tc.name        TestContainerPickerSelectionIndicator010
     * @tc.desc        testing ContainerPicker SelectionIndicator
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('TestContainerPickerSelectionIndicator010', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.TestContainerPickerSelectionIndicator010()).assertEqual(0)
      done();
    });

    /**
     * @tc.number      SUB_ARKUI_CAPI_PICKER_SELECTION_INDICATOR_1100
     * @tc.name        TestContainerPickerSelectionIndicator011
     * @tc.desc        testing ContainerPicker SelectionIndicator
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('TestContainerPickerSelectionIndicator011', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.TestContainerPickerSelectionIndicator011()).assertEqual(0)
      done();
    });

    /**
     * @tc.number      SUB_ARKUI_CAPI_PICKER_SELECTION_INDICATOR_1200
     * @tc.name        TestContainerPickerSelectionIndicator012
     * @tc.desc        testing ContainerPicker SelectionIndicator
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('TestContainerPickerSelectionIndicator012', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.TestContainerPickerSelectionIndicator012()).assertEqual(0)
      done();
    });

    /**
     * @tc.number      SUB_ARKUI_CAPI_PICKER_SELECTION_INDICATOR_1300
     * @tc.name        TestContainerPickerSelectionIndicator013
     * @tc.desc        testing ContainerPicker SelectionIndicator
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('TestContainerPickerSelectionIndicator013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestContainerPickerSelectionIndicator013()).assertEqual(0)
      done();
    });

    /**
     * @tc.number      SUB_ARKUI_CAPI_PICKER_SELECTION_INDICATOR_1400
     * @tc.name        TestContainerPickerSelectionIndicator014
     * @tc.desc        testing ContainerPicker SelectionIndicator
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('TestContainerPickerSelectionIndicator014', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.TestContainerPickerSelectionIndicator014()).assertEqual(0)
      done();
    });

    /**
     * @tc.number      SUB_ARKUI_CAPI_PICKER_SELECTION_INDICATOR_1500
     * @tc.name        TestContainerPickerSelectionIndicator015
     * @tc.desc        testing ContainerPicker SelectionIndicator
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('TestContainerPickerSelectionIndicator015', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.TestContainerPickerSelectionIndicator015()).assertEqual(0)
      done();
    });

    /**
     * @tc.number      SUB_ARKUI_CAPI_PICKER_SELECTION_INDICATOR_1600
     * @tc.name        TestContainerPickerSelectionIndicator016
     * @tc.desc        testing ContainerPicker SelectionIndicator
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('TestContainerPickerSelectionIndicator016', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.TestContainerPickerSelectionIndicator016()).assertEqual(0)
      done();
    });

    /** 
     * @tc.number      SUB_ARKUI_CAPI_PICKER_SELECTION_INDICATOR_1700
     * @tc.name        TestContainerPickerSelectionIndicator017
     * @tc.desc        testing ContainerPicker SelectionIndicator nullptr
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('TestContainerPickerSelectionIndicator017', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.TestContainerPickerSelectionIndicator017()).assertEqual(0)
      done();
    });
  })
}