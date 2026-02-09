'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it, Level,beforeAll } from '../../../../hypium';
import Utils from '../common/Utils';
import {LibUtil} from '../../../ets/pages/LibUtil'
import { UtilsTest } from '../Util.test'
import { Driver } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
let libUtil:LibUtil = new LibUtil();

export default function customDialogRegisterOnWillDismissTest() {

  describe('CustomDialogRegisterOnWillDismissTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCustomDialogRegisterOnWillDismiss001
     * @tc.name     testCustomDialogRegisterOnWillDismiss001
     * @tc.desc     testCustomDialogRegisterOnWillDismiss001
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogRegisterOnWillDismiss001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.pushPage(`customdialog/CustomDialogRegisterOnWillDismissTest`)
      await Utils.clickComponent('buttonRegisterOnWillDismiss')
      await Utils.sleep(2000)
      let driver: Driver = Driver.create();
      await driver.pressBack()
      await Utils.sleep(2000)
      expect(inspector.getInspectorByKey('columnRegisterOnWillDismiss')).assertEqual("")
      done()
    })

    
    
/**
     * @tc.number   testCustomDialogRegisterOnWillDismiss002
     * @tc.name     testCustomDialogRegisterOnWillDismiss002
     * @tc.desc     testCustomDialogRegisterOnWillDismiss002
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogRegisterOnWillDismiss002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogRegisterOnWillDismiss002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomDialogRegisterOnWillDismiss003
     * @tc.name     testCustomDialogRegisterOnWillDismiss003
     * @tc.desc     testCustomDialogRegisterOnWillDismiss003
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogRegisterOnWillDismiss003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogRegisterOnWillDismiss003()).assertEqual(0)
      done()
    })
  })
}