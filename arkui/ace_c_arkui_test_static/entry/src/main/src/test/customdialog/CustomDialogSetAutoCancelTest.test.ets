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
import inspector from '@ohos.arkui.inspector';
let libUtil:LibUtil = new LibUtil();

export default function customDialogSetAutoCancelTest() {

  describe('CustomDialogSetAutoCancelTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCustomDialogSetAutoCancel001
     * @tc.name     testCustomDialogSetAutoCancel001
     * @tc.desc     testCustomDialogSetAutoCancel001
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogSetAutoCancel001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.pushPage(`customdialog/CustomDialogSetAutoCancelTest`)
      await Utils.clickComponent('buttonSetAutoCancel')
      await Utils.sleep(2000)
      await Utils.clickComponent('buttonSetAutoCancel')
      await Utils.sleep(2000)
      expect(inspector.getInspectorByKey('columnSetAutoCancel')).assertEqual("")
      done()
    })

    
    
/**
     * @tc.number   testCustomDialogSetAutoCancel002
     * @tc.name     testCustomDialogSetAutoCancel002
     * @tc.desc     testCustomDialogSetAutoCancel002
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogSetAutoCancel002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogSetAutoCancel002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomDialogSetAutoCancel003
     * @tc.name     testCustomDialogSetAutoCancel003
     * @tc.desc     testCustomDialogSetAutoCancel003
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogSetAutoCancel003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogSetAutoCancel003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomDialogSetAutoCancel004
     * @tc.name     testCustomDialogSetAutoCancel004
     * @tc.desc     testCustomDialogSetAutoCancel004
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogSetAutoCancel004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogSetAutoCancel004()).assertEqual(0)
      done()
    })

  })
}

