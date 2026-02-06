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

export default function customDialogSetGridColumnCountTest() {

  describe('CustomDialogSetGridColumnCountTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCustomDialogSetGridColumnCount001
     * @tc.name     testCustomDialogSetGridColumnCount001
     * @tc.desc     testCustomDialogSetGridColumnCount001
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogSetGridColumnCount001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogSetGridColumnCount001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomDialogSetGridColumnCount002
     * @tc.name     testCustomDialogSetGridColumnCount002
     * @tc.desc     testCustomDialogSetGridColumnCount002
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogSetGridColumnCount002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogSetGridColumnCount002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomDialogSetGridColumnCount003
     * @tc.name     testCustomDialogSetGridColumnCount003
     * @tc.desc     testCustomDialogSetGridColumnCount003
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogSetGridColumnCount003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogSetGridColumnCount003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomDialogSetGridColumnCount004
     * @tc.name     testCustomDialogSetGridColumnCount004
     * @tc.desc     testCustomDialogSetGridColumnCount004
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogSetGridColumnCount004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogSetGridColumnCount004()).assertEqual(0)
      done()
    })

  })
}