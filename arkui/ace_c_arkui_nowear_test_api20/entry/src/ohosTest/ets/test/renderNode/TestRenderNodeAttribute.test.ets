/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function TestRenderNodeAttribute(){

  describe('TestRenderNodeAttribute', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   TestBackgroundColor_0010
     * @tc.number TestBackgroundColor_0010
     * @tc.desc   Test BackgroundColor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestBackgroundColor_0010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestBackgroundColor()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   TestBorderColor_0100
     * @tc.number TestBorderColor_0100
     * @tc.desc   Test BorderColor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestBorderColor_0100', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestBorderColor()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   TestBorderRadius_0100
     * @tc.number TestBorderRadius_0100
     * @tc.desc   Test BorderRadius
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestBorderRadius_0100', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestBorderRadius()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   TestBorderStyle_0100
     * @tc.number TestBorderStyle_0100
     * @tc.desc   Test BorderStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestBorderStyle_0100', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestBorderStyle()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   TestBorderWidth_0100
     * @tc.number TestBorderWidth_0100
     * @tc.desc   Test BorderWidth
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestBorderWidth_0100', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestBorderWidth()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   TestBounds_001
     * @tc.number TestBounds_001
     * @tc.desc   Test Bounds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestBounds_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestBounds()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   TestClipToBounds_001
     * @tc.number TestClipToBounds_001
     * @tc.desc   Test ClipToBounds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestClipToBounds_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestClipToBounds()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   TestClipToFrame_001
     * @tc.number TestClipToFrame_001
     * @tc.desc   Test ClipToFrame
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestClipToFrame_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestClipToFrame()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   TestOpacity_001
     * @tc.number TestOpacity_001
     * @tc.desc   Test Opacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestOpacity_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestOpacity()).assertEqual(0)
      done();
    })
    
    /**
     * @tc.name   TestPivot_001
     * @tc.number TestPivot_001
     * @tc.desc   Test Pivot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestPivot_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestPivot()).assertEqual(0)
      done();
    })
    
    /**
     * @tc.name   TestPosition_001
     * @tc.number TestPosition_001
     * @tc.desc   Test Position
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestPosition_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestPosition()).assertEqual(0)
      done();
    })
    
    /**
     * @tc.name   TestRotation_001
     * @tc.number TestRotation_001
     * @tc.desc   Test Rotation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestRotation_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestRotation()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   TestScale_001
     * @tc.number TestScale_001
     * @tc.desc   Test Scale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestScale_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestScale()).assertEqual(0)
      done();
    })
    
    /**
     * @tc.name   TestSetDrawRegion_001
     * @tc.number TestSetDrawRegion_001
     * @tc.desc   Test SetDrawRegion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestSetDrawRegion_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestSetDrawRegion()).assertEqual(0)
      done();
    })
    
    /**
     * @tc.name   TestSetMarkNodeGroup_001
     * @tc.number TestSetMarkNodeGroup_001
     * @tc.desc   TestSetMarkNodeGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestSetMarkNodeGroup_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestSetMarkNodeGroup()).assertEqual(0)
      done();
    })
    
    /**
     * @tc.name   TestShadowAlpha_001
     * @tc.number TestShadowAlpha_001
     * @tc.desc   Test ShadowAlpha
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestShadowAlpha_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestShadowAlpha()).assertEqual(0)
      done();
    })
    
    /**
     * @tc.name   TestShadowColor_001
     * @tc.number TestShadowColor_001
     * @tc.desc   Test ShadowColor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestShadowColor_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestShadowColor()).assertEqual(0)
      done();
    })
    
    /**
     * @tc.name   TestShadowElevation_001
     * @tc.number TestShadowElevation_001
     * @tc.desc   Test ShadowElevation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestShadowElevation_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestShadowElevation()).assertEqual(0)
      done();
    })
    
    /**
     * @tc.name   TestShadowOffset_001
     * @tc.number TestShadowOffset_001
     * @tc.desc   Test ShadowOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestShadowOffset_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestShadowOffset()).assertEqual(0)
      done();
    })
    
    /**
     * @tc.name   TestShadowRadius_001
     * @tc.number TestShadowRadius_001
     * @tc.desc   Test ShadowRadius
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestShadowRadius_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestShadowRadius()).assertEqual(0)
      done();
    })
    
    /**
     * @tc.name   TestSize_001
     * @tc.number TestSize_001
     * @tc.desc   Test Size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestSize_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestSize()).assertEqual(0)
      done();
    })
    
    /**
     * @tc.name   TestTransform_001
     * @tc.number TestTransform_001
     * @tc.desc   Test Transform
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestTransform_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestTransform()).assertEqual(0)
      done();
    })
    
    /**
     * @tc.name   TestTranslation_001
     * @tc.number TestTranslation_001
     * @tc.desc   Test Translation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestTranslation_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestTranslation()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   TestAddRenderNode_001
     * @tc.number TestAddRenderNode_001
     * @tc.desc   Test AddRenderNode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestAddRenderNode_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestAddRenderNode001()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   TestAddRenderNode_002
     * @tc.number TestAddRenderNode_002
     * @tc.desc   Test AddRenderNode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestAddRenderNode_002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestAddRenderNode002()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   TestAddRenderNode_003
     * @tc.number TestAddRenderNode_003
     * @tc.desc   Test AddRenderNode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestAddRenderNode_003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestAddRenderNode003()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   TestRemoveRenderNode_001
     * @tc.number TestRemoveRenderNode_001
     * @tc.desc   Test RemoveRenderNode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestRemoveRenderNode_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestRemoveRenderNode001()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   TestRemoveRenderNode_002
     * @tc.number TestRemoveRenderNode_002
     * @tc.desc   Test RemoveRenderNode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestRemoveRenderNode_002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestRemoveRenderNode002()).assertEqual(0)
      done();
    })
  
    /**
     * @tc.name   TestClearRenderNodeChildren_001
     * @tc.number TestClearRenderNodeChildren_001
     * @tc.desc   Test ClearRenderNodeChildren
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestClearRenderNodeChildren_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestClearRenderNodeChildren001()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   TestClearRenderNodeChildren_002
     * @tc.number TestClearRenderNodeChildren_002
     * @tc.desc   Test ClearRenderNodeChildren
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestClearRenderNodeChildren_002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestClearRenderNodeChildren002()).assertEqual(0)
      done();
    })
  
    /**
     * @tc.name   TestInvalidate_001
     * @tc.number TestInvalidate_001
     * @tc.desc   Test Invalidate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestInvalidate_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestInvalidate()).assertEqual(0)
      done();
    })
  })
}