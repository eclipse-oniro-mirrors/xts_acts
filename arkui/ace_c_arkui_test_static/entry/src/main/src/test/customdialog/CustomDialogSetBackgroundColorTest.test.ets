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

export default function customDialogSetBackgroundColorTest() {

  describe('CustomDialogSetBackgroundColorTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCustomDialogSetBackgroundColor001
     * @tc.name     testCustomDialogSetBackgroundColor001
     * @tc.desc     testCustomDialogSetBackgroundColor001
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogSetBackgroundColor001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogSetBackgroundColor001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomDialogSetBackgroundColor002
     * @tc.name     testCustomDialogSetBackgroundColor002
     * @tc.desc     testCustomDialogSetBackgroundColor002
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogSetBackgroundColor002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogSetBackgroundColor002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomDialogSetBackgroundColor003
     * @tc.name     testCustomDialogSetBackgroundColor003
     * @tc.desc     testCustomDialogSetBackgroundColor003
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogSetBackgroundColor003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogSetBackgroundColor003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomDialogSetBackgroundColor004
     * @tc.name     testCustomDialogSetBackgroundColor004
     * @tc.desc     testCustomDialogSetBackgroundColor004
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogSetBackgroundColor004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogSetBackgroundColor004()).assertEqual(0)
      done()
    })

  })
}