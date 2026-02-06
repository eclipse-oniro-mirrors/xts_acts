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

export default function scrollFrictionTest() {

  describe('ScrollFrictionTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    /*
     * @tc.number   testScrollFriction001
     * @tc.name     testScrollFriction001
     * @tc.desc     testScrollFriction001
     * @tc.level    Level.LEVEL1
     */
it('testScrollFriction001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollFriction001()).assertEqual(0)
      done();
    });

    
    /*
     * @tc.number   testScrollFriction002
     * @tc.name     testScrollFriction002
     * @tc.desc     testScrollFriction002
     * @tc.level    Level.LEVEL1
     */
it('testScrollFriction002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollFriction002()).assertEqual(0)
      done();
    });
  })
}
