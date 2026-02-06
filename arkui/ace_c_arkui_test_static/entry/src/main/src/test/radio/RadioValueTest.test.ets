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

export default function radioValueTest() {

  describe('RadioValueTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testRadioValue001
     * @tc.name     testRadioValue001
     * @tc.desc     testRadioValue001
     * @tc.level    Level.LEVEL1
     */
    it('testRadioValue001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRadioValue001()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testRadioValue002
     * @tc.name     testRadioValue002
     * @tc.desc     testRadioValue002
     * @tc.level    Level.LEVEL1
     */
    it('testRadioValue002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRadioValue002()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testRadioValue003
     * @tc.name     testRadioValue003
     * @tc.desc     testRadioValue003
     * @tc.level    Level.LEVEL1
     */
    it('testRadioValue003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRadioValue003()).assertEqual(0)
      done();
    })

  })
}
