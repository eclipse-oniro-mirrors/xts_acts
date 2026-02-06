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

export default function radioGroupTest() {

  describe('RadioGroupTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testRadioGroup001
     * @tc.name     testRadioGroup001
     * @tc.desc     testRadioGroup001
     * @tc.level    Level.LEVEL1
     */
    it('testRadioGroup001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRadioGroup001()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testRadioGroup002
     * @tc.name     testRadioGroup002
     * @tc.desc     testRadioGroup002
     * @tc.level    Level.LEVEL1
     */
    it('testRadioGroup002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRadioGroup002()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testRadioGroup003
     * @tc.name     testRadioGroup003
     * @tc.desc     testRadioGroup003
     * @tc.level    Level.LEVEL1
     */
    it('testRadioGroup003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRadioGroup003()).assertEqual(0)
      done();
    })

  })
}
