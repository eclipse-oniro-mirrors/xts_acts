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

import { beforeEach, describe, expect, it, Level, beforeAll } from '../../../../hypium';
import Utils from '../common/Utils';
import {LibUtil} from '../../../ets/pages/LibUtil'
import { UtilsTest } from '../Util.test'
let libUtil:LibUtil = new LibUtil();

export default function checkboxWidthTest() {

  describe('CheckboxWidthTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCheckboxWidth001
     * @tc.name     testCheckboxWidth001
     * @tc.desc     testCheckboxWidth001
     * @tc.level    Level.LEVEL1
     */
    it('testCheckboxWidth001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCheckboxWidth001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCheckboxWidth002
     * @tc.name     testCheckboxWidth002
     * @tc.desc     testCheckboxWidth002
     * @tc.level    Level.LEVEL1
     */
    it('testCheckboxWidth002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCheckboxWidth002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCheckboxWidth003
     * @tc.name     testCheckboxWidth003
     * @tc.desc     testCheckboxWidth003
     * @tc.level    Level.LEVEL1
     */
    it('testCheckboxWidth003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCheckboxWidth003()).assertEqual(0)
      done()
    })

  })
}
