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

import { expect, describe, it, afterEach, Level, beforeAll } from '../../../../hypium';
import Utils from '../common/Utils';
import { LibUtil } from '../../../ets/pages/LibUtil'
import { UtilsTest } from '../Util.test'

let libUtil: LibUtil = new LibUtil();

export default function textInputWordBreakTest() {

  describe('textInputWordBreakTest', () => {
    beforeAll((): void => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api16.static", "EntryAbility")
    });
    afterEach(async (): Promise<void> => {
      await Utils.sleep(100);
    })

    
    /**
     * @tc.number   testTextInputWordBreak001
     * @tc.name     testTextInputWordBreak001
     * @tc.desc     testTextInputWordBreak001
     * @tc.level    Level.LEVEL1
     */
    it('testTextInputWordBreak001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testTextInputWordBreak001()).assertEqual(0)
      done();
    });
    
    /**
     * @tc.number   testTextInputWordBreak002
     * @tc.name     testTextInputWordBreak002
     * @tc.desc     testTextInputWordBreak002
     * @tc.level    Level.LEVEL1
     */
    it('testTextInputWordBreak002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testTextInputWordBreak002()).assertEqual(0)
      done();
    });
    
    /**
     * @tc.number   testTextInputWordBreak003
     * @tc.name     testTextInputWordBreak003
     * @tc.desc     testTextInputWordBreak003
     * @tc.level    Level.LEVEL1
     */
    it('testTextInputWordBreak003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testTextInputWordBreak003()).assertEqual(0)
      done();
    });
    
    /**
     * @tc.number   testTextInputWordBreak004
     * @tc.name     testTextInputWordBreak004
     * @tc.desc     testTextInputWordBreak004
     * @tc.level    Level.LEVEL1
     */
    it('testTextInputWordBreak004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testTextInputWordBreak004()).assertEqual(0)
      done();
    });
    
    /**
     * @tc.number   testTextInputWordBreak005
     * @tc.name     testTextInputWordBreak005
     * @tc.desc     testTextInputWordBreak005
     * @tc.level    Level.LEVEL1
     */
    it('testTextInputWordBreak005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testTextInputWordBreak005()).assertEqual(0)
      done();
    });
    
    /**
     * @tc.number   testTextInputWordBreak006
     * @tc.name     testTextInputWordBreak006
     * @tc.desc     testTextInputWordBreak006
     * @tc.level    Level.LEVEL1
     */
    it('testTextInputWordBreak006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testTextInputWordBreak006()).assertEqual(0)
      done();
    });
  })
}
