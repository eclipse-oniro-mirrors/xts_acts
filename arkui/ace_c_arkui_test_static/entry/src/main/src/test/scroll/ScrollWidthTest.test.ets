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

export default function scrollWidthTest() {

  describe('ScrollWidthTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testScrollWidth001
     * @tc.name     testScrollWidth001
     * @tc.desc     testScrollWidth001
     * @tc.level    Level.LEVEL1
     */
    it('testScrollWidth001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollWidth001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testScrollWidth002
     * @tc.name     testScrollWidth002
     * @tc.desc     testScrollWidth002
     * @tc.level    Level.LEVEL1
     */
    it('testScrollWidth002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollWidth002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testScrollWidth003
     * @tc.name     testScrollWidth003
     * @tc.desc     testScrollWidth003
     * @tc.level    Level.LEVEL1
     */
    it('testScrollWidth003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollWidth003()).assertEqual(0)
      done()
    })

  })
}
