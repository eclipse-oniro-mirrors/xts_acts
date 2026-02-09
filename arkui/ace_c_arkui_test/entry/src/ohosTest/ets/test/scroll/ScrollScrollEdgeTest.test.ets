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

import { describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';

export default function scrollScrollEdgeTest() {

  describe('ScrollScrollEdgeTest', () => {

    /**
     * @tc.name   testScrollScrollEdge001
     * @tc.number SUB_ARKUI_CAPI_SCROLL_SCROLLEDGE_0100
     * @tc.desc   test ScrollEdge Top
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollScrollEdge001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollEdgeTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      await Utils.clickComponent('ScrollEdgeButton');
      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('ScrollEdge').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /**
     * @tc.name   testScrollScrollEdge002
     * @tc.number SUB_ARKUI_CAPI_SCROLL_SCROLLEDGE_0200
     * @tc.desc   test ScrollEdge Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollScrollEdge002', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollEdgeStartTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      await Utils.clickComponent('ScrollEdgeButton');
      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('ScrollEdge').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /**
     * @tc.name   testScrollScrollEdge003
     * @tc.number SUB_ARKUI_CAPI_SCROLL_SCROLLEDGE_0300
     * @tc.desc   test ScrollEdge Bottom
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollScrollEdge003', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollEdgeBottomTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      await Utils.clickComponent('ScrollEdgeButton');
      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('ScrollEdge').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /**
     * @tc.name   testScrollScrollEdge004
     * @tc.number SUB_ARKUI_CAPI_SCROLL_SCROLLEDGE_0400
     * @tc.desc   test ScrollEdge End
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollScrollEdge004', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollEdgeEndTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      await Utils.clickComponent('ScrollEdgeButton');
      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('ScrollEdge').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /**
     * @tc.name   testScrollScrollEdge005
     * @tc.number SUB_ARKUI_CAPI_SCROLL_SCROLLEDGE_0500
     * @tc.desc   test ScrollEdge abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollScrollEdge005', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollEdge001Test';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      await Utils.clickComponent('ScrollEdge001Button');
      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('ScrollEdge001').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /**
     * @tc.name   testScrollScrollEdge006
     * @tc.number SUB_ARKUI_CAPI_SCROLL_SCROLLEDGE_0600
     * @tc.desc   test ScrollEdge abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollScrollEdge006', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollEdge002Test';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      await Utils.clickComponent('ScrollEdge002Button');
      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('ScrollEdge002').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /**
     * @tc.name   testScrollScrollEdge007
     * @tc.number SUB_ARKUI_CAPI_SCROLL_SCROLLEDGE_0700
     * @tc.desc   test ScrollEdge abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollScrollEdge007', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollEdge003Test';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('ScrollEdge003').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })
  })
}
