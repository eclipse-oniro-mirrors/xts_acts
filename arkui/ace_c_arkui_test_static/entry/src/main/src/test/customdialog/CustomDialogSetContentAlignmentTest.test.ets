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

export default function customDialogSetContentAlignmentTest() {

  describe('CustomDialogSetContentAlignmentTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCustomDialogSetContentAlignment001
     * @tc.name     testCustomDialogSetContentAlignment001
     * @tc.desc     testCustomDialogSetContentAlignment001
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogSetContentAlignment001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogSetContentAlignment001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomDialogSetContentAlignment002
     * @tc.name     testCustomDialogSetContentAlignment002
     * @tc.desc     testCustomDialogSetContentAlignment002
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogSetContentAlignment002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogSetContentAlignment002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomDialogSetContentAlignment003
     * @tc.name     testCustomDialogSetContentAlignment003
     * @tc.desc     testCustomDialogSetContentAlignment003
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogSetContentAlignment003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogSetContentAlignment003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomDialogSetContentAlignment004
     * @tc.name     testCustomDialogSetContentAlignment004
     * @tc.desc     testCustomDialogSetContentAlignment004
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogSetContentAlignment004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogSetContentAlignment004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomDialogSetContentAlignment005
     * @tc.name     testCustomDialogSetContentAlignment005
     * @tc.desc     testCustomDialogSetContentAlignment005
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogSetContentAlignment005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogSetContentAlignment005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomDialogSetContentAlignment006
     * @tc.name     testCustomDialogSetContentAlignment006
     * @tc.desc     testCustomDialogSetContentAlignment006
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogSetContentAlignment006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogSetContentAlignment006()).assertEqual(0)
      done()
    })

  })
}

