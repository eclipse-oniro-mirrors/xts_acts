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

export default function customDialogSetContentTest() {

  describe('CustomDialogSetContentTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMDIALOG_SETCONTENT_0100
     * @tc.name       : testCustomDialogSetContent001
     * @tc.desc       : testing setContent for customDialog with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomDialogSetContent001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetContent001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMDIALOG_SETCONTENT_0200
     * @tc.name       : testCustomDialogSetContent002
     * @tc.desc       : testing setContent for customDialog with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomDialogSetContent002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetContent002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMDIALOG_SETCONTENT_0300
     * @tc.name       : testCustomDialogSetContent003
     * @tc.desc       : testing setContent for customDialog with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomDialogSetContent003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetContent003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMDIALOG_SETCONTENT_0400
     * @tc.name       : testCustomDialogSetContent004
     * @tc.desc       : testing setContent for customDialog with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomDialogSetContent004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetContent004()).assertEqual(0)
      done()
    })

  })
}