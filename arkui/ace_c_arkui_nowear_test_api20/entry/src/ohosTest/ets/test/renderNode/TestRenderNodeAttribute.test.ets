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

    /*
     * @tc.number     : TestBackgroundColor_0010
     * @tc.name       : TestBackgroundColor_0010
     * @tc.desc       : Test BackgroundColor
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestBackgroundColor_0010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestBackgroundColor()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : TestBorderColor_0100
     * @tc.name       : TestBorderColor_0100
     * @tc.desc       : Test BorderColor
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestBorderColor_0100', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestBorderColor()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : TestBorderRadius_0100
     * @tc.name       : TestBorderRadius_0100
     * @tc.desc       : Test BorderRadius
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestBorderRadius_0100', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestBorderRadius()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : TestBorderStyle_0100
     * @tc.name       : TestBorderStyle_0100
     * @tc.desc       : Test BorderStyle
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestBorderStyle_0100', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestBorderStyle()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : TestBorderWidth_0100
     * @tc.name       : TestBorderWidth_0100
     * @tc.desc       : Test BorderWidth
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestBorderWidth_0100', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestBorderWidth()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : TestBounds_001
     * @tc.name       : TestBounds_001
     * @tc.desc       : Test Bounds
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestBounds_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestBounds()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : TestClipToBounds_001
     * @tc.name       : TestClipToBounds_001
     * @tc.desc       : Test ClipToBounds
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestClipToBounds_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestClipToBounds()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : TestClipToFrame_001
     * @tc.name       : TestClipToFrame_001
     * @tc.desc       : Test ClipToFrame
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestClipToFrame_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestClipToFrame()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : TestOpacity_001
     * @tc.name       : TestOpacity_001
     * @tc.desc       : Test Opacity
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestOpacity_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestOpacity()).assertEqual(0)
      done();
    })
    
    /*
     * @tc.number     : TestPivot_001
     * @tc.name       : TestPivot_001
     * @tc.desc       : Test Pivot
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestPivot_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestPivot()).assertEqual(0)
      done();
    })
    
    /*
     * @tc.number     : TestPosition_001
     * @tc.name       : TestPosition_001
     * @tc.desc       : Test Position
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestPosition_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestPosition()).assertEqual(0)
      done();
    })
    
    /*
     * @tc.number     : TestRotation_001
     * @tc.name       : TestRotation_001
     * @tc.desc       : Test Rotation
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestRotation_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestRotation()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : TestScale_001
     * @tc.name       : TestScale_001
     * @tc.desc       : Test Scale
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestScale_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestScale()).assertEqual(0)
      done();
    })
    
    /*
     * @tc.number     : TestSetDrawRegion_001
     * @tc.name       : TestSetDrawRegion_001
     * @tc.desc       : Test SetDrawRegion
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestSetDrawRegion_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestSetDrawRegion()).assertEqual(0)
      done();
    })
    
    /*
     * @tc.number     : TestSetMarkNodeGroup_001
     * @tc.name       : TestSetMarkNodeGroup_001
     * @tc.desc       : TestSetMarkNodeGroup
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestSetMarkNodeGroup_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestSetMarkNodeGroup()).assertEqual(0)
      done();
    })
    
    /*
     * @tc.number     : TestShadowAlpha_001
     * @tc.name       : TestShadowAlpha_001
     * @tc.desc       : Test ShadowAlpha
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestShadowAlpha_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestShadowAlpha()).assertEqual(0)
      done();
    })
    
    /*
     * @tc.number     : TestShadowColor_001
     * @tc.name       : TestShadowColor_001
     * @tc.desc       : Test ShadowColor
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestShadowColor_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestShadowColor()).assertEqual(0)
      done();
    })
    
    /*
     * @tc.number     : TestShadowElevation_001
     * @tc.name       : TestShadowElevation_001
     * @tc.desc       : Test ShadowElevation
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestShadowElevation_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestShadowElevation()).assertEqual(0)
      done();
    })
    
    /*
     * @tc.number     : TestShadowOffset_001
     * @tc.name       : TestShadowOffset_001
     * @tc.desc       : Test ShadowOffset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestShadowOffset_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestShadowOffset()).assertEqual(0)
      done();
    })
    
    /*
     * @tc.number     : TestShadowRadius_001
     * @tc.name       : TestShadowRadius_001
     * @tc.desc       : Test ShadowRadius
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestShadowRadius_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestShadowRadius()).assertEqual(0)
      done();
    })
    
    /*
     * @tc.number     : TestSize_001
     * @tc.name       : TestSize_001
     * @tc.desc       : Test Size
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestSize_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestSize()).assertEqual(0)
      done();
    })
    
    /*
     * @tc.number     : TestTransform_001
     * @tc.name       : TestTransform_001
     * @tc.desc       : Test Transform
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestTransform_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestTransform()).assertEqual(0)
      done();
    })
    
    /*
     * @tc.number     : TestTranslation_001
     * @tc.name       : TestTranslation_001
     * @tc.desc       : Test Translation
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestTranslation_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestTranslation()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : TestAddRenderNode_001
     * @tc.name       : TestAddRenderNode_001
     * @tc.desc       : Test AddRenderNode
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestAddRenderNode_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestAddRenderNode001()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : TestAddRenderNode_002
     * @tc.name       : TestAddRenderNode_002
     * @tc.desc       : Test AddRenderNode
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestAddRenderNode_002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestAddRenderNode002()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : TestAddRenderNode_003
     * @tc.name       : TestAddRenderNode_003
     * @tc.desc       : Test AddRenderNode
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestAddRenderNode_003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestAddRenderNode003()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : TestRemoveRenderNode_001
     * @tc.name       : TestRemoveRenderNode_001
     * @tc.desc       : Test RemoveRenderNode
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestRemoveRenderNode_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestRemoveRenderNode001()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : TestRemoveRenderNode_002
     * @tc.name       : TestRemoveRenderNode_002
     * @tc.desc       : Test RemoveRenderNode
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestRemoveRenderNode_002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestRemoveRenderNode002()).assertEqual(0)
      done();
    })
  
    /*
     * @tc.number     : TestClearRenderNodeChildren_001
     * @tc.name       : TestClearRenderNodeChildren_001
     * @tc.desc       : Test ClearRenderNodeChildren
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestClearRenderNodeChildren_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestClearRenderNodeChildren001()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : TestClearRenderNodeChildren_002
     * @tc.name       : TestClearRenderNodeChildren_002
     * @tc.desc       : Test ClearRenderNodeChildren
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestClearRenderNodeChildren_002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestClearRenderNodeChildren002()).assertEqual(0)
      done();
    })
  
    /*
     * @tc.number     : TestInvalidate_001
     * @tc.name       : TestInvalidate_001
     * @tc.desc       : Test Invalidate
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestInvalidate_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestInvalidate()).assertEqual(0)
      done();
    })
  })
}