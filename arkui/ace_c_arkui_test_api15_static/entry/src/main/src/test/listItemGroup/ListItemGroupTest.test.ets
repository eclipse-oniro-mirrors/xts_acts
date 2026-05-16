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
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import { LibUtil } from '../../../ets/pages/LibUtil'
import { UtilsTest } from '../Util.test'

let libUtil: LibUtil = new LibUtil();

export default function listItemGroupNodeAdapterTest() {

  describe('listItemGroupNodeAdapterTest', () => {
    beforeAll((): void => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api15.static", "EntryAbility")
    });
    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    /**
     * @tc.number   testListItemGroupNodeAdapter001
     * @tc.name     testListItemGroupNodeAdapter001
     * @tc.desc     testListItemGroupNodeAdapter001
     * @tc.level    Level.LEVEL1
     */
    it('testListItemGroupNodeAdapter001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemGroupNodeAdapter001()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testListItemGroupNodeAdapter002
     * @tc.name     testListItemGroupNodeAdapter002
     * @tc.desc     testListItemGroupNodeAdapter002
     * @tc.level    Level.LEVEL1
     */
    it('testListItemGroupNodeAdapter002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemGroupNodeAdapter002()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testListItemGroupNodeAdapter003
     * @tc.name     testListItemGroupNodeAdapter003
     * @tc.desc     testListItemGroupNodeAdapter003
     * @tc.level    Level.LEVEL1
     */
    it('testListItemGroupNodeAdapter003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemGroupNodeAdapter003()).assertEqual(0)
      done()
    })
  })
}