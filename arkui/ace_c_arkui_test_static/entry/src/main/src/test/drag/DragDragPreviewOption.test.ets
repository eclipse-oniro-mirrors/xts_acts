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
import { LibUtil } from '../../../ets/pages/LibUtil'
import { UtilsTest } from '../Util.test'

let libUtil: LibUtil = new LibUtil();

export default function DragDragPreviewOptionTest() {

  describe('DragDragPreviewOptionTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });


    
    /**
     * @tc.number   DragDragPreviewOptionTest001
     * @tc.name     DragDragPreviewOptionTest001
     * @tc.desc     DragDragPreviewOptionTest001
     * @tc.level    Level.LEVEL1
     */
    it('DragDragPreviewOptionTest001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.drag_DragPreviewOption_Dispose_001()).assertEqual(0)
      done()
    })


    
    /**
     * @tc.number   DragDragPreviewOptionTest002
     * @tc.name     DragDragPreviewOptionTest002
     * @tc.desc     DragDragPreviewOptionTest002
     * @tc.level    Level.LEVEL1
     */
    it('DragDragPreviewOptionTest002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.drag_DragPreviewOption_SetScaleMode_002()).assertEqual(0)
      done()
    })


    
    /**
     * @tc.number   DragDragPreviewOptionTest003
     * @tc.name     DragDragPreviewOptionTest003
     * @tc.desc     DragDragPreviewOptionTest003
     * @tc.level    Level.LEVEL1
     */
    it('DragDragPreviewOptionTest003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.drag_DragPreviewOption_SetDefaultShadowEnabled_003()).assertEqual(0)
      done()
    })


    
    /**
     * @tc.number   DragDragPreviewOptionTest004
     * @tc.name     DragDragPreviewOptionTest004
     * @tc.desc     DragDragPreviewOptionTest004
     * @tc.level    Level.LEVEL1
     */
    it('DragDragPreviewOptionTest004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.drag_DragPreviewOption_SetDefaultRadiusEnabled_004()).assertEqual(0)
      done()
    })


    
    /**
     * @tc.number   DragDragPreviewOptionTest005
     * @tc.name     DragDragPreviewOptionTest005
     * @tc.desc     DragDragPreviewOptionTest005
     * @tc.level    Level.LEVEL1
     */
    it('DragDragPreviewOptionTest005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.drag_DragPreviewOption_SetNumberBadgeEnabled_005()).assertEqual(0)
      done()
    })


    
    /**
     * @tc.number   DragDragPreviewOptionTest006
     * @tc.name     DragDragPreviewOptionTest006
     * @tc.desc     DragDragPreviewOptionTest006
     * @tc.level    Level.LEVEL1
     */
    it('DragDragPreviewOptionTest006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.drag_DragPreviewOption_SetBadgeNumber_006()).assertEqual(0)
      done()
    })


    
    /**
     * @tc.number   DragDragPreviewOptionTest007
     * @tc.name     DragDragPreviewOptionTest007
     * @tc.desc     DragDragPreviewOptionTest007
     * @tc.level    Level.LEVEL1
     */
    it('DragDragPreviewOptionTest007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.drag_DragPreviewOption_SetDefaultAnimationBeforeLiftingEnabled_007()).assertEqual(0)
      done()
    })


    
    /**
     * @tc.number   DragDragPreviewOptionTest008
     * @tc.name     DragDragPreviewOptionTest008
     * @tc.desc     DragDragPreviewOptionTest008
     * @tc.level    Level.LEVEL1
     */
    it('DragDragPreviewOptionTest008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.drag_DragPreviewOption_SetNodeDragPreviewOption_008()).assertEqual(0)
      done()
    })

  })
}
