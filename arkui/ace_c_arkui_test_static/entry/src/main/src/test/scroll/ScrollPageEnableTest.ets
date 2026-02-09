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

export default function scrollPageEnableTest() {

  describe('ScrollPageEnableTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    /*
     * @tc.number   testScrollPageEnable001
     * @tc.name     testScrollPageEnable001
     * @tc.desc     testScrollPageEnable001
     * @tc.level    Level.LEVEL1
     */
it('testScrollPageEnable001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollPageEnable001()).assertEqual(0)
      done();
    });

    
    /*
     * @tc.number   testScrollPageEnable002
     * @tc.name     testScrollPageEnable002
     * @tc.desc     testScrollPageEnable002
     * @tc.level    Level.LEVEL1
     */
it('testScrollPageEnable002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollPageEnable002()).assertEqual(0)
      done();
    });

    
    /*
     * @tc.number   testScrollPageEnable003
     * @tc.name     testScrollPageEnable003
     * @tc.desc     testScrollPageEnable003
     * @tc.level    Level.LEVEL1
     */
it('testScrollPageEnable003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollPageEnable003()).assertEqual(0)
      done();
    });

    
    /*
     * @tc.number   testScrollPageEnable004
     * @tc.name     testScrollPageEnable004
     * @tc.desc     testScrollPageEnable004
     * @tc.level    Level.LEVEL1
     */
it('testScrollPageEnable004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollPageEnable004()).assertEqual(0)
      done();
    });

    
    /*
     * @tc.number   testScrollPageEnable005
     * @tc.name     testScrollPageEnable005
     * @tc.desc     testScrollPageEnable005
     * @tc.level    Level.LEVEL1
     */
it('testScrollPageEnable005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollPageEnable005()).assertEqual(0)
      done();
    });
  })
}
