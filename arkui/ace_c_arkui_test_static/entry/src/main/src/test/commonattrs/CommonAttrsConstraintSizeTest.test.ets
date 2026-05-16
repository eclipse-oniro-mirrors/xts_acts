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

export default function commonAttrsConstraintSizeTest() {

  describe('CommonAttrsConstraintSizeTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsConstraintSize001
     * @tc.name     testCommonAttrsConstraintSize001
     * @tc.desc     testCommonAttrsConstraintSize001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsConstraintSize001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsConstraintSize001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsConstraintSize002
     * @tc.name     testCommonAttrsConstraintSize002
     * @tc.desc     testCommonAttrsConstraintSize002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsConstraintSize002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsConstraintSize002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsConstraintSize003
     * @tc.name     testCommonAttrsConstraintSize003
     * @tc.desc     testCommonAttrsConstraintSize003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsConstraintSize003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsConstraintSize003()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testCommonAttrsConstraintSize004
     * @tc.name     testCommonAttrsConstraintSize004
     * @tc.desc     testCommonAttrsConstraintSize004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsConstraintSize004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsConstraintSize004()).assertEqual(0)
      done()
    })
  })
}
