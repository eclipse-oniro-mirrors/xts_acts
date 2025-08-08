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

export default function customDialogEnableCustomAnimationTest() {

  describe('CustomDialogEnableCustomAnimationTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMDIALOG_ENABLECUSTOMANIMATION_0100
     * @tc.name       : testCustomDialogEnableCustomAnimation001
     * @tc.desc       : testing enableCustomAnimation for customDialog with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomDialogEnableCustomAnimation001', 0, async (done: Function) => {
      expect(nativeFunc.testCustomDialogEnableCustomAnimation001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMDIALOG_ENABLECUSTOMANIMATION_0200
     * @tc.name       : testCustomDialogEnableCustomAnimation002
     * @tc.desc       : testing enableCustomAnimation for customDialog with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomDialogEnableCustomAnimation002', 0, async (done: Function) => {
      expect(nativeFunc.testCustomDialogEnableCustomAnimation002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMDIALOG_ENABLECUSTOMANIMATION_0300
     * @tc.name       : testCustomDialogEnableCustomAnimation003
     * @tc.desc       : testing enableCustomAnimation for customDialog with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomDialogEnableCustomAnimation003', 0, async (done: Function) => {
      expect(nativeFunc.testCustomDialogEnableCustomAnimation003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMDIALOG_ENABLECUSTOMANIMATION_0400
     * @tc.name       : testCustomDialogEnableCustomAnimation004
     * @tc.desc       : testing enableCustomAnimation for customDialog with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomDialogEnableCustomAnimation004', 0, async (done: Function) => {
      expect(nativeFunc.testCustomDialogEnableCustomAnimation004()).assertEqual(0)
      done()
    })

  })
}