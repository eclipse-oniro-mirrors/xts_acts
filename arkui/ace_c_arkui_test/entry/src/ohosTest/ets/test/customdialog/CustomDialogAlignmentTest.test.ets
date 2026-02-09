/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function customDialogAlignmentTest() {

  describe('CustomDialogAlignmentTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCustomDialogAlignment001
     * @tc.number SUB_ARKUI_CAPI_CUSTOMDIALOG_ALIGNMENT_0100
     * @tc.desc   testing alignment for customDialog with normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogAlignment001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogAlignment001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomDialogAlignment002
     * @tc.number SUB_ARKUI_CAPI_CUSTOMDIALOG_ALIGNMENT_0200
     * @tc.desc   testing alignment for customDialog with normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogAlignment002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogAlignment002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomDialogAlignment003
     * @tc.number SUB_ARKUI_CAPI_CUSTOMDIALOG_ALIGNMENT_0300
     * @tc.desc   testing alignment for customDialog with normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogAlignment003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogAlignment003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomDialogAlignment004
     * @tc.number SUB_ARKUI_CAPI_CUSTOMDIALOG_ALIGNMENT_0400
     * @tc.desc   testing alignment for customDialog with normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogAlignment004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogAlignment004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomDialogAlignment005
     * @tc.number SUB_ARKUI_CAPI_CUSTOMDIALOG_ALIGNMENT_0500
     * @tc.desc   testing alignment for customDialog with normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogAlignment005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogAlignment005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomDialogAlignment006
     * @tc.number SUB_ARKUI_CAPI_CUSTOMDIALOG_ALIGNMENT_0600
     * @tc.desc   testing alignment for customDialog with normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogAlignment006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogAlignment006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomDialogAlignment007
     * @tc.number SUB_ARKUI_CAPI_CUSTOMDIALOG_ALIGNMENT_0700
     * @tc.desc   testing alignment for customDialog with normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogAlignment007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogAlignment007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomDialogAlignment008
     * @tc.number SUB_ARKUI_CAPI_CUSTOMDIALOG_ALIGNMENT_0800
     * @tc.desc   testing alignment for customDialog with normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogAlignment008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogAlignment008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomDialogAlignment009
     * @tc.number SUB_ARKUI_CAPI_CUSTOMDIALOG_ALIGNMENT_0900
     * @tc.desc   testing alignment for customDialog with normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogAlignment009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogAlignment009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomDialogAlignment010
     * @tc.number SUB_ARKUI_CAPI_CUSTOMDIALOG_ALIGNMENT_1000
     * @tc.desc   testing alignment for customDialog with abnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogAlignment010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogAlignment010()).assertEqual(0)
      done()
    })
  })
}
