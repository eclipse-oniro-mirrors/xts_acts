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

export default function scrollClipTest() {

  describe('ScrollClipTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    /*
     * @tc.number   testScrollClip001
     * @tc.name     testScrollClip001
     * @tc.desc     testScrollClip001
     * @tc.level    Level.LEVEL1
     */
it('testScrollClip001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollClip001()).assertEqual(0)
      done();
    });

    
    /*
     * @tc.number   testScrollClip002
     * @tc.name     testScrollClip002
     * @tc.desc     testScrollClip002
     * @tc.level    Level.LEVEL1
     */
it('testScrollClip002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollClip002()).assertEqual(0)
      done();
    });

    
    /*
     * @tc.number   testScrollClip003
     * @tc.name     testScrollClip003
     * @tc.desc     testScrollClip003
     * @tc.level    Level.LEVEL1
     */
it('testScrollClip003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollClip003()).assertEqual(0)
      done();
    });
  })
}
