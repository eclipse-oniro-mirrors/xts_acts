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

export default function customDialogEnableCustomAnimationTest() {

  describe('CustomDialogEnableCustomAnimationTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCustomDialogEnableCustomAnimation001
     * @tc.name     testCustomDialogEnableCustomAnimation001
     * @tc.desc     testCustomDialogEnableCustomAnimation001
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogEnableCustomAnimation001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogEnableCustomAnimation001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomDialogEnableCustomAnimation002
     * @tc.name     testCustomDialogEnableCustomAnimation002
     * @tc.desc     testCustomDialogEnableCustomAnimation002
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogEnableCustomAnimation002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogEnableCustomAnimation002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomDialogEnableCustomAnimation003
     * @tc.name     testCustomDialogEnableCustomAnimation003
     * @tc.desc     testCustomDialogEnableCustomAnimation003
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogEnableCustomAnimation003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogEnableCustomAnimation003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomDialogEnableCustomAnimation004
     * @tc.name     testCustomDialogEnableCustomAnimation004
     * @tc.desc     testCustomDialogEnableCustomAnimation004
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogEnableCustomAnimation004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogEnableCustomAnimation004()).assertEqual(0)
      done()
    })

  })
}