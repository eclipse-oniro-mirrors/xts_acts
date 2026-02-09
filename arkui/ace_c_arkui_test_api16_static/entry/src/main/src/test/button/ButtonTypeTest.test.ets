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

import { beforeEach, describe, expect, it, Level , beforeAll } from '../../../../hypium';
import Utils from '../common/Utils';
import { UtilsTest } from '../Util.test'
import {LibUtil} from '../../../ets/pages/LibUtil'
let libUtil:LibUtil = new LibUtil();

export default function ButtonTypeTest() {

  describe('ButtonTypeTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api16.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      await Utils.sleep(100);
    });

    
    /**
     * @tc.number   testButtonType006
     * @tc.name     testButtonType006
     * @tc.desc     testButtonType006
     * @tc.level    Level.LEVEL1
     */
    it('testButtonType006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log('libUtil.testButtonType006()' + libUtil.testButtonType006())
      expect(libUtil.testButtonType006()).assertEqual(0)
      console.log('testButtonType006 end')
      done()
    })

    
    /**
     * @tc.number   testButtonType007
     * @tc.name     testButtonType007
     * @tc.desc     testButtonType007
     * @tc.level    Level.LEVEL1
     */
    it('testButtonType007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testButtonType007()).assertEqual(0)
      done()
    })

  })
}