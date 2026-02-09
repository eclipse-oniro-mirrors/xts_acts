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

export default function customDialogSetMaskTest() {

  describe('CustomDialogSetMaskTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCustomDialogSetMask001
     * @tc.number SUB_ARKUI_CAPI_CUSTOMDIALOG_SETMASK_0100
     * @tc.desc   testing setMask for customDialog with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogSetMask001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetMask001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomDialogSetMask002
     * @tc.number SUB_ARKUI_CAPI_CUSTOMDIALOG_SETMASK_0200
     * @tc.desc   testing setMask for customDialog with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogSetMask002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetMask002()).assertEqual(0)
      done()
    })
    
    /**
     * @tc.name   testCustomDialogSetMask003
     * @tc.number SUB_ARKUI_CAPI_CUSTOMDIALOG_SETMASK_0300
     * @tc.desc   testing setMask for customDialog with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogSetMask003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetMask003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomDialogSetMask004
     * @tc.number SUB_ARKUI_CAPI_CUSTOMDIALOG_SETMASK_0400
     * @tc.desc   testing setMask for customDialog with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogSetMask004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetMask004()).assertEqual(0)
      done()
    })

  })
}