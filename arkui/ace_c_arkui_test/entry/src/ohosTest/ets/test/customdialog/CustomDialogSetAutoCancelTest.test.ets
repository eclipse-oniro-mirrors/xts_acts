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

export default function customDialogSetAutoCancelTest() {

  describe('CustomDialogSetAutoCancelTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCustomDialogSetAutoCancel001
     * @tc.number SUB_ARKUI_CAPI_CUSTOMDIALOG_SETAUTOCANCEL_0100
     * @tc.desc   testing setAutoCancel for customDialog with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogSetAutoCancel001', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`customdialog/CustomDialogSetAutoCancelTest`)
      await Utils.clickComponent('buttonSetAutoCancel')
      await Utils.sleep(2000)
      await Utils.clickComponent('buttonSetAutoCancel')
      await Utils.sleep(2000)
      expect(getInspectorByKey('columnSetAutoCancel')).assertEqual("")
      done()
    })

    /**
     * @tc.name   testCustomDialogSetAutoCancel002
     * @tc.number SUB_ARKUI_CAPI_CUSTOMDIALOG_SETAUTOCANCEL_0200
     * @tc.desc   testing setAutoCancel for customDialog with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogSetAutoCancel002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetAutoCancel002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomDialogSetAutoCancel003
     * @tc.number SUB_ARKUI_CAPI_CUSTOMDIALOG_SETAUTOCANCEL_0300
     * @tc.desc   testing setAutoCancel for customDialog with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogSetAutoCancel003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetAutoCancel003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomDialogSetAutoCancel004
     * @tc.number SUB_ARKUI_CAPI_CUSTOMDIALOG_SETAUTOCANCEL_0400
     * @tc.desc   testing setAutoCancel for customDialog with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogSetAutoCancel004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetAutoCancel004()).assertEqual(0)
      done()
    })

  })
}

