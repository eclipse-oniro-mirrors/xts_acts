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

export default function progressStyleTest() {

  describe('ProgressStyleTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    /*
     * @tc.number   testProgressStyle001
     * @tc.name     testProgressStyle001
     * @tc.desc     testProgressStyle001
     * @tc.level    Level.LEVEL1
     */
it('testProgressStyle001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testProgressStyle001()).assertEqual(0)
      done();
    });

    
    /*
     * @tc.number   testProgressStyle002
     * @tc.name     testProgressStyle002
     * @tc.desc     testProgressStyle002
     * @tc.level    Level.LEVEL1
     */
it('testProgressStyle002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testProgressStyle002()).assertEqual(0)
      done();
    });

    
    /*
     * @tc.number   testProgressStyle003
     * @tc.name     testProgressStyle003
     * @tc.desc     testProgressStyle003
     * @tc.level    Level.LEVEL1
     */
it('testProgressStyle003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testProgressStyle003()).assertEqual(0)
      done();
    });

    
    /*
     * @tc.number   testProgressStyle004
     * @tc.name     testProgressStyle004
     * @tc.desc     testProgressStyle004
     * @tc.level    Level.LEVEL1
     */
it('testProgressStyle004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testProgressStyle004()).assertEqual(0)
      done();
    });

    
    /*
     * @tc.number   testProgressStyle005
     * @tc.name     testProgressStyle005
     * @tc.desc     testProgressStyle005
     * @tc.level    Level.LEVEL1
     */
it('testProgressStyle005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testProgressStyle005()).assertEqual(0)
      done();
    });

    
    /*
     * @tc.number   testProgressStyle006
     * @tc.name     testProgressStyle006
     * @tc.desc     testProgressStyle006
     * @tc.level    Level.LEVEL1
     */
it('testProgressStyle006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testProgressStyle006()).assertEqual(0)
      done();
    });
  })
}
