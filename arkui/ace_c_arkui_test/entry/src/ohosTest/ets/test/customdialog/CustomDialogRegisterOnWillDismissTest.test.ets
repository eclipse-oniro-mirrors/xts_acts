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
import { Driver } from '@ohos.UiTest';

export default function customDialogRegisterOnWillDismissTest() {

  describe('CustomDialogRegisterOnWillDismissTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMDIALOG_REGISTERONWILLDISMISS_0100
     * @tc.name       : testCustomDialogRegisterOnWillDismiss001
     * @tc.desc       : testing registerOnWillDismiss for customDialog with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomDialogRegisterOnWillDismiss001', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`customdialog/CustomDialogRegisterOnWillDismissTest`)
      await Utils.clickComponent('buttonRegisterOnWillDismiss')
      await Utils.sleep(2000)
      let driver: Driver = Driver.create();
      await driver.pressBack()
      await Utils.sleep(2000)
      expect(getInspectorByKey('columnRegisterOnWillDismiss')).assertEqual("")
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMDIALOG_REGISTERONWILLDISMISS_0200
     * @tc.name       : testCustomDialogRegisterOnWillDismiss002
     * @tc.desc       : testing registerOnWillDismiss for customDialog with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomDialogRegisterOnWillDismiss002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogRegisterOnWillDismiss002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMDIALOG_REGISTERONWILLDISMISS_0300
     * @tc.name       : testCustomDialogRegisterOnWillDismiss003
     * @tc.desc       : testing registerOnWillDismiss for customDialog with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomDialogRegisterOnWillDismiss003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogRegisterOnWillDismiss003()).assertEqual(0)
      done()
    })
  })
}