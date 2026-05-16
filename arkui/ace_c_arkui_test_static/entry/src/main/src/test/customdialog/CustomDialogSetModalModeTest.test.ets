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
let libUtil:LibUtil = new LibUtil();

export default function customDialogSetModalModeTest() {

  describe('CustomDialogSetModalModeTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCustomDialogSetModalMode001
     * @tc.name     testCustomDialogSetModalMode001
     * @tc.desc     testCustomDialogSetModalMode001
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogSetModalMode001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogSetModalMode001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomDialogSetModalMode002
     * @tc.name     testCustomDialogSetModalMode002
     * @tc.desc     testCustomDialogSetModalMode002
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogSetModalMode002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogSetModalMode002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomDialogSetModalMode003
     * @tc.name     testCustomDialogSetModalMode003
     * @tc.desc     testCustomDialogSetModalMode003
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogSetModalMode003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogSetModalMode003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomDialogSetModalMode004
     * @tc.name     testCustomDialogSetModalMode004
     * @tc.desc     testCustomDialogSetModalMode004
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogSetModalMode004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogSetModalMode004()).assertEqual(0)
      done()
    })

  })
}