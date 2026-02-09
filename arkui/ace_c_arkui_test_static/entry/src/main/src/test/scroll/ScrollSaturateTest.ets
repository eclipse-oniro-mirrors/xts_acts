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

export default function scrollSaturateTest() {

  describe('ScrollSaturateTest', () => {

    beforeAll(async () => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    /*
     * @tc.number   testScrollSaturate001
     * @tc.name     testScrollSaturate001
     * @tc.desc     testScrollSaturate001
     * @tc.level    Level.LEVEL1
     */
it('testScrollSaturate001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollSaturate001()).assertEqual(0)
      done();
    });

    
    /*
     * @tc.number   testScrollSaturate002
     * @tc.name     testScrollSaturate002
     * @tc.desc     testScrollSaturate002
     * @tc.level    Level.LEVEL1
     */
it('testScrollSaturate002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollSaturate002()).assertEqual(0)
      done();
    });

    
    /*
     * @tc.number   testScrollSaturate003
     * @tc.name     testScrollSaturate003
     * @tc.desc     testScrollSaturate003
     * @tc.level    Level.LEVEL1
     */
it('testScrollSaturate003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollSaturate003()).assertEqual(0)
      done();
    });

    
    /*
     * @tc.number   testScrollSaturate004
     * @tc.name     testScrollSaturate004
     * @tc.desc     testScrollSaturate004
     * @tc.level    Level.LEVEL1
     */
it('testScrollSaturate004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollSaturate004()).assertEqual(0)
      done();
    });

    
    /*
     * @tc.number   testScrollSaturate005
     * @tc.name     testScrollSaturate005
     * @tc.desc     testScrollSaturate005
     * @tc.level    Level.LEVEL1
     */
it('testScrollSaturate005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollSaturate005()).assertEqual(0)
      done();
    });

    
    /*
     * @tc.number   testScrollSaturate006
     * @tc.name     testScrollSaturate006
     * @tc.desc     testScrollSaturate006
     * @tc.level    Level.LEVEL1
     */
it('testScrollSaturate006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollSaturate006()).assertEqual(0)
      done();
    });
  })
}
