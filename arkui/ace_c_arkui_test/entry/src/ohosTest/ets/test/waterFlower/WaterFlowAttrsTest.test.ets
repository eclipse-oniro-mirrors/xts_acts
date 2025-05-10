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

import { beforeEach, describe, expect, it } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function waterFlowAttrsTest() {

  describe('WaterFlowAttrsTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_WATERFLOW_LAYOUT_DIRECTION_0100
     * @tc.name       : testLayoutDirection001
     * @tc.desc       : Test the layout direction functionality of the waterFlower component with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLayoutDirection001', 0, async (done: Function) => {
      expect(nativeFunc.testLayoutDirection001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_WATERFLOW_LAYOUT_DIRECTION_0200
     * @tc.name       : testLayoutDirection002
     * @tc.desc       : Test the layout direction functionality of the waterFlower component with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLayoutDirection002', 0, async (done: Function) => {
      expect(nativeFunc.testLayoutDirection002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_WATERFLOW_LAYOUT_DIRECTION_0300
     * @tc.name       : testLayoutDirection003
     * @tc.desc       : Test the layout direction functionality of the waterFlower component with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLayoutDirection003', 0, async (done: Function) => {
      expect(nativeFunc.testLayoutDirection003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_WATERFLOW_LAYOUT_DIRECTION_0400
     * @tc.name       : testLayoutDirection004
     * @tc.desc       : Test the layout direction functionality of the waterFlower component with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLayoutDirection004', 0, async (done: Function) => {
      expect(nativeFunc.testLayoutDirection004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_WATERFLOW_LAYOUT_DIRECTION_0500
     * @tc.name       : testLayoutDirection005
     * @tc.desc       : Test the layout direction functionality of the waterFlower component with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLayoutDirection005', 0, async (done: Function) => {
      expect(nativeFunc.testLayoutDirection005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_WATERFLOW_LAYOUT_DIRECTION_0600
     * @tc.name       : testLayoutDirection006
     * @tc.desc       : Test the layout direction functionality of the waterFlower component with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLayoutDirection006', 0, async (done: Function) => {
      expect(nativeFunc.testLayoutDirection006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_WATERFLOW_LAYOUT_DIRECTION_0700
     * @tc.name       : testLayoutDirection007
     * @tc.desc       : Test the layout direction functionality of the waterFlower component with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLayoutDirection007', 0, async (done: Function) => {
      expect(nativeFunc.testLayoutDirection007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMNS_TEMPLATE_0100
     * @tc.name       : testColumnsTemplate001
     * @tc.desc       : Test the columns template functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testColumnsTemplate001', 0, async (done: Function) => {
      expect(nativeFunc.testColumnsTemplate001()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMNS_TEMPLATE_0200
     * @tc.name       : testColumnsTemplate002
     * @tc.desc       : Test the columns template functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testColumnsTemplate002', 0, async (done: Function) => {
      expect(nativeFunc.testColumnsTemplate002()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMNS_TEMPLATE_0300
     * @tc.name       : testColumnsTemplate003
     * @tc.desc       : Test the columns template functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testColumnsTemplate003', 0, async (done: Function) => {
      expect(nativeFunc.testColumnsTemplate003()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ROWS_TEMPLATE_0100
     * @tc.name       : testRowsTemplate001
     * @tc.desc       : Test the rows template functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRowsTemplate001', 0, async (done: Function) => {
      expect(nativeFunc.testRowsTemplate001()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ROWS_TEMPLATE_0200
     * @tc.name       : testRowsTemplate002
     * @tc.desc       : Test the rows template functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRowsTemplate002', 0, async (done: Function) => {
      expect(nativeFunc.testRowsTemplate002()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ROWS_TEMPLATE_0300
     * @tc.name       : testRowsTemplate003
     * @tc.desc       : Test the rows template functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRowsTemplate003', 0, async (done: Function) => {
      expect(nativeFunc.testRowsTemplate003()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMNS_GAP_0100
     * @tc.name       : testColumnsGap001
     * @tc.desc       : Test the columns gap functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testColumnsGap001', 0, async (done: Function) => {
      expect(nativeFunc.testColumnsGap001()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMNS_GAP_0200
     * @tc.name       : testColumnsGap002
     * @tc.desc       : Test the columns gap functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testColumnsGap002', 0, async (done: Function) => {
      expect(nativeFunc.testColumnsGap002()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMNS_GAP_0300
     * @tc.name       : testColumnsGap003
     * @tc.desc       : Test the columns gap functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testColumnsGap003', 0, async (done: Function) => {
      expect(nativeFunc.testColumnsGap003()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ROWS_GAP_0100
     * @tc.name       : testRowsGap001
     * @tc.desc       : Test the rows gap functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRowsGap001', 0, async (done: Function) => {
      expect(nativeFunc.testRowsGap001()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ROWS_GAP_0200
     * @tc.name       : testRowsGap002
     * @tc.desc       : Test the rows gap functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRowsGap002', 0, async (done: Function) => {
      expect(nativeFunc.testRowsGap002()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ROWS_GAP_0300
     * @tc.name       : testRowsGap003
     * @tc.desc       : Test the rows gap functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRowsGap003', 0, async (done: Function) => {
      expect(nativeFunc.testRowsGap003()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_NESTED_SCROLL_0100
     * @tc.name       : testNestedScroll001
     * @tc.desc       : Test the nested scroll functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNestedScroll001', 0, async (done: Function) => {
      expect(nativeFunc.testNestedScroll001()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_NESTED_SCROLL_0200
     * @tc.name       : testNestedScroll002
     * @tc.desc       : Test the nested scroll functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNestedScroll002', 0, async (done: Function) => {
      expect(nativeFunc.testNestedScroll002()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_NESTED_SCROLL_0300
     * @tc.name       : testNestedScroll003
     * @tc.desc       : Test the nested scroll functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNestedScroll003', 0, async (done: Function) => {
      expect(nativeFunc.testNestedScroll003()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_NESTED_SCROLL_0400
     * @tc.name       : testNestedScroll004
     * @tc.desc       : Test the nested scroll functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNestedScroll004', 0, async (done: Function) => {
      expect(nativeFunc.testNestedScroll004()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_NESTED_SCROLL_0500
     * @tc.name       : testNestedScroll005
     * @tc.desc       : Test the nested scroll functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNestedScroll005', 0, async (done: Function) => {
      expect(nativeFunc.testNestedScroll005()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_NESTED_SCROLL_0600
     * @tc.name       : testNestedScroll006
     * @tc.desc       : Test the nested scroll functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNestedScroll006', 0, async (done: Function) => {
      expect(nativeFunc.testNestedScroll006()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CACHED_COUNT_0100
     * @tc.name       : testCachedCount001
     * @tc.desc       : Test the cached count functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCachedCount001', 0, async (done: Function) => {
      expect(nativeFunc.testCachedCount001()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CACHED_COUNT_0200
     * @tc.name       : testCachedCount002
     * @tc.desc       : Test the cached count functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCachedCount002', 0, async (done: Function) => {
      expect(nativeFunc.testCachedCount002()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CACHED_COUNT_0300
     * @tc.name       : testCachedCount003
     * @tc.desc       : Test the cached count functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCachedCount003', 0, async (done: Function) => {
      expect(nativeFunc.testCachedCount003()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CACHED_COUNT_0400
     * @tc.name       : testCachedCount004
     * @tc.desc       : Test the cached count functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCachedCount004', 0, async (done: Function) => {
      expect(nativeFunc.testCachedCount004()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_BAR_0100
     * @tc.name       : testScrollBar001
     * @tc.desc       : Test the scroll bar functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollBar001', 0, async (done: Function) => {
      expect(nativeFunc.testScrollBar001()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_BAR_0200
     * @tc.name       : testScrollBar002
     * @tc.desc       : Test the scroll bar functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollBar002', 0, async (done: Function) => {
      expect(nativeFunc.testScrollBar002()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_BAR_0300
     * @tc.name       : testScrollBar003
     * @tc.desc       : Test the scroll bar functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollBar003', 0, async (done: Function) => {
      expect(nativeFunc.testScrollBar003()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_BAR_0400
     * @tc.name       : testScrollBar004
     * @tc.desc       : Test the scroll bar functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollBar004', 0, async (done: Function) => {
      expect(nativeFunc.testScrollBar004()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_BAR_0500
     * @tc.name       : testScrollBar005
     * @tc.desc       : Test the scroll bar functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollBar005', 0, async (done: Function) => {
      expect(nativeFunc.testScrollBar005()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_WATER_FLOW_SCROLL_BAR_WIDTH_0100
     * @tc.name       : testWaterFlowScrollBarWidth001
     * @tc.desc       : Test the scroll bar width functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWaterFlowScrollBarWidth001', 0, async (done: Function) => {
      expect(nativeFunc.testWaterFlowScrollBarWidth001()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_WATER_FLOW_SCROLL_BAR_WIDTH_0200
     * @tc.name       : testWaterFlowScrollBarWidth002
     * @tc.desc       : Test the scroll bar width functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWaterFlowScrollBarWidth002', 0, async (done: Function) => {
      expect(nativeFunc.testWaterFlowScrollBarWidth002()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_WATER_FLOW_SCROLL_BAR_WIDTH_0300
     * @tc.name       : testWaterFlowScrollBarWidth003
     * @tc.desc       : Test the scroll bar width functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWaterFlowScrollBarWidth003', 0, async (done: Function) => {
      expect(nativeFunc.testWaterFlowScrollBarWidth003()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_WATER_FLOW_SCROLL_BAR_WIDTH_0400
     * @tc.name       : testWaterFlowScrollBarWidth004
     * @tc.desc       : Test the scroll bar width functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWaterFlowScrollBarWidth004', 0, async (done: Function) => {
      expect(nativeFunc.testWaterFlowScrollBarWidth004()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_BAR_COLOR_0100
     * @tc.name       : testScrollBarColor001
     * @tc.desc       : Test the scroll bar color functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollBarColor001', 0, async (done: Function) => {
      expect(nativeFunc.testScrollBarColor001()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_BAR_COLOR_0200
     * @tc.name       : testScrollBarColor002
     * @tc.desc       : Test the scroll bar color functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollBarColor002', 0, async (done: Function) => {
      expect(nativeFunc.testScrollBarColor002()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_BAR_COLOR_0300
     * @tc.name       : testScrollBarColor003
     * @tc.desc       : Test the scroll bar color functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollBarColor003', 0, async (done: Function) => {
      expect(nativeFunc.testScrollBarColor003()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ITEM_CONSTRAINT_SIZE_0100
     * @tc.name       : testItemConstraintSize001
     * @tc.desc       : Test the item constraint size functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testItemConstraintSize001', 0, async (done: Function) => {
      expect(nativeFunc.testItemConstraintSize001()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ITEM_CONSTRAINT_SIZE_0200
     * @tc.name       : testItemConstraintSize002
     * @tc.desc       : Test the item constraint size functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testItemConstraintSize002', 0, async (done: Function) => {
      expect(nativeFunc.testItemConstraintSize002()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ITEM_CONSTRAINT_SIZE_0300
     * @tc.name       : testItemConstraintSize003
     * @tc.desc       : Test the item constraint size functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testItemConstraintSize003', 0, async (done: Function) => {
      expect(nativeFunc.testItemConstraintSize003()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ITEM_CONSTRAINT_SIZE_0400
     * @tc.name       : testItemConstraintSize004
     * @tc.desc       : Test the item constraint size functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testItemConstraintSize004', 0, async (done: Function) => {
      expect(nativeFunc.testItemConstraintSize004()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ENABLE_SCROLL_INTERACTION_0100
     * @tc.name       : testEnableScrollInteraction001
     * @tc.desc       : Test enabling scroll interaction with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEnableScrollInteraction001', 0, async (done: Function) => {
      expect(nativeFunc.testEnableScrollInteraction001()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ENABLE_SCROLL_INTERACTION_0200
     * @tc.name       : testEnableScrollInteraction002
     * @tc.desc       : Test enabling scroll interaction with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEnableScrollInteraction002', 0, async (done: Function) => {
      expect(nativeFunc.testEnableScrollInteraction002()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ENABLE_SCROLL_INTERACTION_0300
     * @tc.name       : testEnableScrollInteraction003
     * @tc.desc       : Test enabling scroll interaction with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEnableScrollInteraction003', 0, async (done: Function) => {
      expect(nativeFunc.testEnableScrollInteraction003()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_EDGE_EFFECT_0100
     * @tc.name       : testEdgeEffect001
     * @tc.desc       : Test the edge effect functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEdgeEffect001', 0, async (done: Function) => {
      expect(nativeFunc.testEdgeEffect001()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_EDGE_EFFECT_0200
     * @tc.name       : testEdgeEffect002
     * @tc.desc       : Test the edge effect functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEdgeEffect002', 0, async (done: Function) => {
      expect(nativeFunc.testEdgeEffect002()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_EDGE_EFFECT_0300
     * @tc.name       : testEdgeEffect003
     * @tc.desc       : Test the edge effect functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEdgeEffect003', 0, async (done: Function) => {
      expect(nativeFunc.testEdgeEffect003()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_EDGE_EFFECT_0400
     * @tc.name       : testEdgeEffect004
     * @tc.desc       : Test the edge effect functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEdgeEffect004', 0, async (done: Function) => {
      expect(nativeFunc.testEdgeEffect004()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_EDGE_EFFECT_0500
     * @tc.name       : testEdgeEffect005
     * @tc.desc       : Test the edge effect functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEdgeEffect005', 0, async (done: Function) => {
      expect(nativeFunc.testEdgeEffect005()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_OFFSET_0100
     * @tc.name       : testScrollOffset001
     * @tc.desc       : Test the scroll offset functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollOffset001', 0, async (done: Function) => {
      expect(nativeFunc.testScrollOffset001()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_OFFSET_0200
     * @tc.name       : testScrollOffset002
     * @tc.desc       : Test the scroll offset functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollOffset002', 0, async (done: Function) => {
      expect(nativeFunc.testScrollOffset002()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_OFFSET_0300
     * @tc.name       : testScrollOffset003
     * @tc.desc       : Test the scroll offset functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollOffset003', 0, async (done: Function) => {
      expect(nativeFunc.testScrollOffset003()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_OFFSET_0400
     * @tc.name       : testScrollOffset004
     * @tc.desc       : Test the scroll offset functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollOffset004', 0, async (done: Function) => {
      expect(nativeFunc.testScrollOffset004()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_OFFSET_0500
     * @tc.name       : testScrollOffset005
     * @tc.desc       : Test the scroll offset functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollOffset005', 0, async (done: Function) => {
      expect(nativeFunc.testScrollOffset005()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_OFFSET_0600
     * @tc.name       : testScrollOffset006
     * @tc.desc       : Test the scroll offset functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollOffset006', 0, async (done: Function) => {
      expect(nativeFunc.testScrollOffset006()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_OFFSET_0700
     * @tc.name       : testScrollOffset007
     * @tc.desc       : Test the scroll offset functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollOffset007', 0, async (done: Function) => {
      expect(nativeFunc.testScrollOffset007()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_OFFSET_0800
     * @tc.name       : testScrollOffset008
     * @tc.desc       : Test the scroll offset functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollOffset008', 0, async (done: Function) => {
      expect(nativeFunc.testScrollOffset008()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_OFFSET_0900
     * @tc.name       : testScrollOffset009
     * @tc.desc       : Test the scroll offset functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollOffset009', 0, async (done: Function) => {
      expect(nativeFunc.testScrollOffset009()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_OFFSET_1000
     * @tc.name       : testScrollOffset0010
     * @tc.desc       : Test the scroll offset functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollOffset0010', 0, async (done: Function) => {
      expect(nativeFunc.testScrollOffset0010()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_OFFSET_1100
     * @tc.name       : testScrollOffset0011
     * @tc.desc       : Test the scroll offset functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollOffset0011', 0, async (done: Function) => {
      expect(nativeFunc.testScrollOffset0011()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_OFFSET_1200
     * @tc.name       : testScrollOffset0012
     * @tc.desc       : Test the scroll offset functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollOffset0012', 0, async (done: Function) => {
      expect(nativeFunc.testScrollOffset0012()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_OFFSET_1300
     * @tc.name       : testScrollOffset0013
     * @tc.desc       : Test the scroll offset functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollOffset0013', 0, async (done: Function) => {
      expect(nativeFunc.testScrollOffset0013()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_OFFSET_1400
     * @tc.name       : testScrollOffset0014
     * @tc.desc       : Test the scroll offset functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollOffset0014', 0, async (done: Function) => {
      expect(nativeFunc.testScrollOffset0014()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_OFFSET_1500
     * @tc.name       : testScrollOffset0015
     * @tc.desc       : Test the scroll offset functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollOffset0015', 0, async (done: Function) => {
      expect(nativeFunc.testScrollOffset0015()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_OFFSET_1600
     * @tc.name       : testScrollOffset0016
     * @tc.desc       : Test the scroll offset functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollOffset0016', 0, async (done: Function) => {
      expect(nativeFunc.testScrollOffset0016()).assertEqual(0);
      done();
    });

    /*
         * @tc.number     : SUB_ARKUI_CAPI_SCROLL_OFFSET_1700
         * @tc.name       : testScrollOffset0017
         * @tc.desc       : Test the scroll offset functionality with normal values
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
    it('testScrollOffset0017', 0, async (done: Function) => {
      expect(nativeFunc.testScrollOffset0017()).assertEqual(0);
      done();
    });

    /*
         * @tc.number     : SUB_ARKUI_CAPI_SCROLL_OFFSET_1800
         * @tc.name       : testScrollOffset0018
         * @tc.desc       : Test the scroll offset functionality with normal values
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
    it('testScrollOffset0018', 0, async (done: Function) => {
      expect(nativeFunc.testScrollOffset0018()).assertEqual(0);
      done();
    });

    /*
         * @tc.number     : SUB_ARKUI_CAPI_SCROLL_OFFSET_1900
         * @tc.name       : testScrollOffset0019
         * @tc.desc       : Test the scroll offset functionality with normal values
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
    it('testScrollOffset0019', 0, async (done: Function) => {
      expect(nativeFunc.testScrollOffset0019()).assertEqual(0);
      done();
    });

    /*
         * @tc.number     : SUB_ARKUI_CAPI_SCROLL_EDGE_0100
         * @tc.name       : testScrollEdge001
         * @tc.desc       : Test the scroll edge functionality with normal values
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
    it('testScrollEdge001', 0, async (done: Function) => {
      expect(nativeFunc.testScrollEdge001()).assertEqual(0);
      done();
    });

    /*
         * @tc.number     : SUB_ARKUI_CAPI_SCROLL_EDGE_0200
         * @tc.name       : testScrollEdge002
         * @tc.desc       : Test the scroll edge functionality with normal values
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
    it('testScrollEdge002', 0, async (done: Function) => {
      expect(nativeFunc.testScrollEdge002()).assertEqual(0);
      done();
    });

    /*
         * @tc.number     : SUB_ARKUI_CAPI_SCROLL_EDGE_0300
         * @tc.name       : testScrollEdge003
         * @tc.desc       : Test the scroll edge functionality with normal values
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
    it('testScrollEdge003', 0, async (done: Function) => {
      expect(nativeFunc.testScrollEdge003()).assertEqual(0);
      done();
    });

    /*
         * @tc.number     : SUB_ARKUI_CAPI_SCROLL_EDGE_0400
         * @tc.name       : testScrollEdge004
         * @tc.desc       : Test the scroll edge functionality with normal values
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
    it('testScrollEdge004', 0, async (done: Function) => {
      expect(nativeFunc.testScrollEdge004()).assertEqual(0);
      done();
    });

    /*
         * @tc.number     : SUB_ARKUI_CAPI_SCROLL_EDGE_0500
         * @tc.name       : testScrollEdge005
         * @tc.desc       : Test the scroll edge functionality with normal values
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
    it('testScrollEdge005', 0, async (done: Function) => {
      expect(nativeFunc.testScrollEdge005()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_PAGE_0100
     * @tc.name       : testScrollPage001
     * @tc.desc       : Test the scroll page functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollPage001', 0, async (done: Function) => {
      expect(nativeFunc.testScrollPage001()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_PAGE_0200
     * @tc.name       : testScrollPage002
     * @tc.desc       : Test the scroll page functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollPage002', 0, async (done: Function) => {
      expect(nativeFunc.testScrollPage002()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_PAGE_0300
     * @tc.name       : testScrollPage003
     * @tc.desc       : Test the scroll page functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollPage003', 0, async (done: Function) => {
      expect(nativeFunc.testScrollPage003()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_BY_0100
     * @tc.name       : testScrollBy001
     * @tc.desc       : Test the scroll by functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollBy001', 0, async (done: Function) => {
      expect(nativeFunc.testScrollBy001()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_BY_0200
     * @tc.name       : testScrollBy002
     * @tc.desc       : Test the scroll by functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollBy002', 0, async (done: Function) => {
      expect(nativeFunc.testScrollBy002()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_BY_0300
     * @tc.name       : testScrollBy003
     * @tc.desc       : Test the scroll by functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollBy003', 0, async (done: Function) => {
      expect(nativeFunc.testScrollBy003()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_BY_0400
     * @tc.name       : testScrollBy004
     * @tc.desc       : Test the scroll by functionality with normal values
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollBy004', 0, async (done: Function) => {
      expect(nativeFunc.testScrollBy004()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SECTION_OPTION_0100
     * @tc.name       : testSectionOption001
     * @tc.desc       : Verify the functionality of testSectionOption001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSectionOption001', 0, async (done: Function) => {
      expect(nativeFunc.testSectionOption001()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SECTION_OPTION_0101
     * @tc.name       : testSectionOption002
     * @tc.desc       : Verify the functionality of testSectionOption002
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSectionOption002', 0, async (done: Function) => {
      expect(nativeFunc.testSectionOption002()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SECTION_OPTION_0102
     * @tc.name       : testSectionOption003
     * @tc.desc       : Verify the functionality of testSectionOption003
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSectionOption003', 0, async (done: Function) => {
      expect(nativeFunc.testSectionOption003()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SECTION_OPTION_0103
     * @tc.name       : testSectionOption004
     * @tc.desc       : Verify the functionality of testSectionOption004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSectionOption004', 0, async (done: Function) => {
      expect(nativeFunc.testSectionOption004()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SECTION_OPTION_0104
     * @tc.name       : testSectionOption005
     * @tc.desc       : Verify the functionality of testSectionOption005
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSectionOption005', 0, async (done: Function) => {
      expect(nativeFunc.testSectionOption005()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SECTION_OPTION_0105
     * @tc.name       : testSectionOption006
     * @tc.desc       : Verify the functionality of testSectionOption006
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSectionOption006', 0, async (done: Function) => {
      expect(nativeFunc.testSectionOption006()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SECTION_OPTION_0106
     * @tc.name       : testSectionOption007
     * @tc.desc       : Verify the functionality of testSectionOption007
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSectionOption007', 0, async (done: Function) => {
      expect(nativeFunc.testSectionOption007()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SECTION_OPTION_0107
     * @tc.name       : testSectionOption008
     * @tc.desc       : Verify the functionality of testSectionOption008
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSectionOption008', 0, async (done: Function) => {
      expect(nativeFunc.testSectionOption008()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLLBY_0408
     * @tc.name       : testSectionOption009
     * @tc.desc       : Verify the functionality of testSectionOption009
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSectionOption009', 0, async (done: Function) => {
      expect(nativeFunc.testSectionOption009()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLLBY_0409
     * @tc.name       : testSectionOption010
     * @tc.desc       : Verify the functionality of testSectionOption010
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSectionOption010', 0, async (done: Function) => {
      expect(nativeFunc.testSectionOption010()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLLBY_0410
     * @tc.name       : testSectionOption011
     * @tc.desc       : Verify the functionality of testSectionOption011
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSectionOption011', 0, async (done: Function) => {
      expect(nativeFunc.testSectionOption011()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLLBY_0411
     * @tc.name       : testSectionOption012
     * @tc.desc       : Verify the functionality of testSectionOption012
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSectionOption012', 0, async (done: Function) => {
      expect(nativeFunc.testSectionOption012()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_WATER_FLOW_NODE_ADAPTER_0100
     * @tc.name       : testWaterFlowNodeAdapter001
     * @tc.desc       : Verify the functionality of Water Flow Node Adapter
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWaterFlowNodeAdapter001', 0, async (done: Function) => {
      expect(nativeFunc.testWaterFlowNodeAdapter001()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_WATER_FLOW_FOOTER_0100
     * @tc.name       : testWaterFlowFooter001
     * @tc.desc       : Verify the functionality of Water Flow Footer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWaterFlowFooter001', 0, async (done: Function) => {
      expect(nativeFunc.testWaterFlowFooter001()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_WATER_FLOW_SCROLL_FRICTION_0100
     * @tc.name       : testWaterFlowScrollFriction001
     * @tc.desc       : Verify the scroll friction functionality of Water Flow
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWaterFlowScrollFriction001', 0, async (done: Function) => {
      expect(nativeFunc.testWaterFlowScrollFriction001()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_WATER_FLOW_SCROLL_FRICTION_0200
     * @tc.name       : testWaterFlowScrollFriction002
     * @tc.desc       : Verify the scroll friction functionality of Water Flow
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWaterFlowScrollFriction002', 0, async (done: Function) => {
      expect(nativeFunc.testWaterFlowScrollFriction002()).assertEqual(0);
      done();
    });

  })
}