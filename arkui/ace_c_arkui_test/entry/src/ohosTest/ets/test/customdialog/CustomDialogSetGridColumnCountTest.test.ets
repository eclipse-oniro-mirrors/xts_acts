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

export default function customDialogSetGridColumnCountTest() {

  describe('CustomDialogSetGridColumnCountTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMDIALOG_SETGRIDCOLUMNCOUNT_0100
     * @tc.name       : testCustomDialogSetGridColumnCount001
     * @tc.desc       : testing setGridColumnCount for customDialog with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomDialogSetGridColumnCount001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetGridColumnCount001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMDIALOG_SETGRIDCOLUMNCOUNT_0200
     * @tc.name       : testCustomDialogSetGridColumnCount002
     * @tc.desc       : testing setGridColumnCount for customDialog with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomDialogSetGridColumnCount002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetGridColumnCount002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMDIALOG_SETGRIDCOLUMNCOUNT_0300
     * @tc.name       : testCustomDialogSetGridColumnCount003
     * @tc.desc       : testing setGridColumnCount for customDialog with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomDialogSetGridColumnCount003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetGridColumnCount003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMDIALOG_SETGRIDCOLUMNCOUNT_0400
     * @tc.name       : testCustomDialogSetGridColumnCount004
     * @tc.desc       : testing setGridColumnCount for customDialog with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomDialogSetGridColumnCount004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetGridColumnCount004()).assertEqual(0)
      done()
    })

  })
}