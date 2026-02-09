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

export default function checkboxMarkTest() {

  describe('CheckboxMarkTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCheckboxMark001
     * @tc.name     testCheckboxMark001
     * @tc.desc     testCheckboxMark001
     * @tc.level    Level.LEVEL1
     */
    it('testCheckboxMark001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCheckboxMark001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCheckboxMark002
     * @tc.name     testCheckboxMark002
     * @tc.desc     testCheckboxMark002
     * @tc.level    Level.LEVEL1
     */
    it('testCheckboxMark002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCheckboxMark002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCheckboxMark003
     * @tc.name     testCheckboxMark003
     * @tc.desc     testCheckboxMark003
     * @tc.level    Level.LEVEL1
     */
    it('testCheckboxMark003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCheckboxMark003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCheckboxMark004
     * @tc.name     testCheckboxMark004
     * @tc.desc     testCheckboxMark004
     * @tc.level    Level.LEVEL1
     */
    it('testCheckboxMark004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCheckboxMark004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCheckboxMark005
     * @tc.name     testCheckboxMark005
     * @tc.desc     testCheckboxMark005
     * @tc.level    Level.LEVEL1
     */
    it('testCheckboxMark005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCheckboxMark005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCheckboxMark006
     * @tc.name     testCheckboxMark006
     * @tc.desc     testCheckboxMark006
     * @tc.level    Level.LEVEL1
     */
    it('testCheckboxMark006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCheckboxMark006()).assertEqual(0)
      done()
    })

  })
}
