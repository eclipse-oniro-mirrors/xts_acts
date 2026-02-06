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

export default function DragSetDragEventStrictReportTest() {

  describe('DragSetDragEventStrictReportTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   DragSetDragEventStrictReportTest001
     * @tc.name     DragSetDragEventStrictReportTest001
     * @tc.desc     DragSetDragEventStrictReportTest001
     * @tc.level    Level.LEVEL1
     */
    it('DragSetDragEventStrictReportTest001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.drag_setDragEventStrictReportWidthNode_001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   DragSetDragEventStrictReportTest002
     * @tc.name     DragSetDragEventStrictReportTest002
     * @tc.desc     DragSetDragEventStrictReportTest002
     * @tc.level    Level.LEVEL1
     */
    it('DragSetDragEventStrictReportTest002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.drag_setDragEventStrictReportWidthNode_002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   DragSetDragEventStrictReportTest003
     * @tc.name     DragSetDragEventStrictReportTest003
     * @tc.desc     DragSetDragEventStrictReportTest003
     * @tc.level    Level.LEVEL1
     */
    it('DragSetDragEventStrictReportTest003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.drag_setDragEventStrictReportWidthContext_003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   DragSetDragEventStrictReportTest004
     * @tc.name     DragSetDragEventStrictReportTest004
     * @tc.desc     DragSetDragEventStrictReportTest004
     * @tc.level    Level.LEVEL1
     */
    it('DragSetDragEventStrictReportTest004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.drag_setDragEventStrictReportWidthContext_004()).assertEqual(0)
      done()
    })

  })
}
