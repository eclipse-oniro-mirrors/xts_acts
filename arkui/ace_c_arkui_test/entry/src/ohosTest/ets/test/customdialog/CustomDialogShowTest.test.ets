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

export default function customDialogShowTest() {

  describe('CustomDialogShowTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCustomDialogShow001
     * @tc.number SUB_ARKUI_CAPI_CUSTOMDIALOG_SHOW_0100
     * @tc.desc   testing show for customDialog with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogShow001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogShow001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomDialogShow002
     * @tc.number SUB_ARKUI_CAPI_CUSTOMDIALOG_SHOW_0200
     * @tc.desc   testing show for customDialog with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogShow002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogShow002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomDialogShow003
     * @tc.number SUB_ARKUI_CAPI_CUSTOMDIALOG_SHOW_0300
     * @tc.desc   testing show for customDialog with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogShow003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogShow003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomDialogShow004
     * @tc.number SUB_ARKUI_CAPI_CUSTOMDIALOG_SHOW_0400
     * @tc.desc   testing show for customDialog with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogShow004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogShow004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomDialogShow005
     * @tc.number SUB_ARKUI_CAPI_CUSTOMDIALOG_SHOW_0500
     * @tc.desc   testing show for customDialog with callback function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogShow005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogShow005()).assertEqual(0)
      done()
    })

  })
}