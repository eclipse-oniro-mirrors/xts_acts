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

import { beforeEach, describe, expect, it } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function customDialogSetContentAlignmentTest() {

  describe('CustomDialogSetContentAlignmentTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMDIALOG_SETCONTENTALIGNMENT_0100
     * @tc.name       : testCustomDialogSetContentAlignment001
     * @tc.desc       : testing setContentAlignment for customDialog with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomDialogSetContentAlignment001', 0, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetContentAlignment001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMDIALOG_SETCONTENTALIGNMENT_0200
     * @tc.name       : testCustomDialogSetContentAlignment002
     * @tc.desc       : testing setContentAlignment for customDialog with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomDialogSetContentAlignment002', 0, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetContentAlignment002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMDIALOG_SETCONTENTALIGNMENT_0300
     * @tc.name       : testCustomDialogSetContentAlignment003
     * @tc.desc       : testing setContentAlignment for customDialog with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomDialogSetContentAlignment003', 0, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetContentAlignment003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMDIALOG_SETCONTENTALIGNMENT_0400
     * @tc.name       : testCustomDialogSetContentAlignment004
     * @tc.desc       : testing setContentAlignment for customDialog with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomDialogSetContentAlignment004', 0, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetContentAlignment004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMDIALOG_SETCONTENTALIGNMENT_0500
     * @tc.name       : testCustomDialogSetContentAlignment005
     * @tc.desc       : testing setContentAlignment for customDialog with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomDialogSetContentAlignment005', 0, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetContentAlignment005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMDIALOG_SETCONTENTALIGNMENT_0600
     * @tc.name       : testCustomDialogSetContentAlignment006
     * @tc.desc       : testing setContentAlignment for customDialog with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomDialogSetContentAlignment006', 0, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetContentAlignment006()).assertEqual(0)
      done()
    })

  })
}

