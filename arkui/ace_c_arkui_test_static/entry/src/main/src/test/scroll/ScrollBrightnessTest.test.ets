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

export default function scrollBrightnessTest() {

  describe('ScrollBrightnessTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testScrollBrightness001
     * @tc.name     testScrollBrightness001
     * @tc.desc     testScrollBrightness001
     * @tc.level    Level.LEVEL1
     */
    it('testScrollBrightness001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollBrightness001()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testScrollBrightness002
     * @tc.name     testScrollBrightness002
     * @tc.desc     testScrollBrightness002
     * @tc.level    Level.LEVEL1
     */
    it('testScrollBrightness002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollBrightness002()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testScrollBrightness003
     * @tc.name     testScrollBrightness003
     * @tc.desc     testScrollBrightness003
     * @tc.level    Level.LEVEL1
     */
    it('testScrollBrightness003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollBrightness003()).assertEqual(0)
      done();
    });
  })
}
