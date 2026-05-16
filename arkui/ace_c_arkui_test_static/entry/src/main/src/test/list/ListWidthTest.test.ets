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

export default function listWidthTest() {

  describe('ListWidthTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testListWidth001
     * @tc.name     testListWidth001
     * @tc.desc     testListWidth001
     * @tc.level    Level.LEVEL1
     */
    it('testListWidth001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListWidth001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListWidth002
     * @tc.name     testListWidth002
     * @tc.desc     testListWidth002
     * @tc.level    Level.LEVEL1
     */
    it('testListWidth002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListWidth002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListWidth003
     * @tc.name     testListWidth003
     * @tc.desc     testListWidth003
     * @tc.level    Level.LEVEL1
     */
    it('testListWidth003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListWidth003()).assertEqual(0)
      done()
    })
  })
}
