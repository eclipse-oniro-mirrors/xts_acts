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

export default function buttonFontSizeTest() {

  describe('ButtonFontSizeTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testButtonFontSize001
     * @tc.name     testButtonFontSize001
     * @tc.desc     testButtonFontSize001
     * @tc.level    Level.LEVEL1
     */
    it('testButtonFontSize001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testButtonFontSize001()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testButtonFontSize002
     * @tc.name     testButtonFontSize002
     * @tc.desc     testButtonFontSize002
     * @tc.level    Level.LEVEL1
     */
    it('testButtonFontSize002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testButtonFontSize002()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testButtonFontSize003
     * @tc.name     testButtonFontSize003
     * @tc.desc     testButtonFontSize003
     * @tc.level    Level.LEVEL1
     */
    it('testButtonFontSize003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testButtonFontSize003()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testButtonFontSize004
     * @tc.name     testButtonFontSize004
     * @tc.desc     testButtonFontSize004
     * @tc.level    Level.LEVEL1
     */
    it('testButtonFontSize004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testButtonFontSize004()).assertEqual(0)
      done();
    })
  })
}
