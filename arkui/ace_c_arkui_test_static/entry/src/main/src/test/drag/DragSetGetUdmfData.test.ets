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

export default function DragSetGetUdmfDataTest() {

  describe('DragSetGetUdmfDataTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   DragSetGetUdmfDataTest001
     * @tc.name     DragSetGetUdmfDataTest001
     * @tc.desc     DragSetGetUdmfDataTest001
     * @tc.level    Level.LEVEL1
     */
    it('DragSetGetUdmfDataTest001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.drag_setGetUdmfData_001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   DragSetGetUdmfDataTest002
     * @tc.name     DragSetGetUdmfDataTest002
     * @tc.desc     DragSetGetUdmfDataTest002
     * @tc.level    Level.LEVEL1
     */
    it('DragSetGetUdmfDataTest002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.drag_setGetUdmfData_002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   DragSetGetUdmfDataTest003
     * @tc.name     DragSetGetUdmfDataTest003
     * @tc.desc     DragSetGetUdmfDataTest003
     * @tc.level    Level.LEVEL1
     */
    it('DragSetGetUdmfDataTest003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.drag_setGetUdmfData_003()).assertEqual(0)
      done()
    })

  })
}
