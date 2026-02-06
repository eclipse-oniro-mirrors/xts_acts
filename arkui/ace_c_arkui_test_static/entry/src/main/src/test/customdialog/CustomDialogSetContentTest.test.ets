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

export default function customDialogSetContentTest() {

  describe('CustomDialogSetContentTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCustomDialogSetContent001
     * @tc.name     testCustomDialogSetContent001
     * @tc.desc     testCustomDialogSetContent001
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogSetContent001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogSetContent001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomDialogSetContent002
     * @tc.name     testCustomDialogSetContent002
     * @tc.desc     testCustomDialogSetContent002
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogSetContent002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogSetContent002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomDialogSetContent003
     * @tc.name     testCustomDialogSetContent003
     * @tc.desc     testCustomDialogSetContent003
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogSetContent003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogSetContent003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomDialogSetContent004
     * @tc.name     testCustomDialogSetContent004
     * @tc.desc     testCustomDialogSetContent004
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogSetContent004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogSetContent004()).assertEqual(0)
      done()
    })

  })
}