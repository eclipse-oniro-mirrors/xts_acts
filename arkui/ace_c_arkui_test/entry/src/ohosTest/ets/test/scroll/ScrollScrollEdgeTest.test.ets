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

    /*
    * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLEDGE_0100
    * @tc.name       : testScrollScrollEdge001
    * @tc.desc       : test ScrollEdge Top
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollScrollEdge001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollEdgeTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      await Utils.clickComponent('ScrollEdgeButton');
      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('ScrollEdge').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLEDGE_0200
    * @tc.name       : testScrollScrollEdge002
    * @tc.desc       : test ScrollEdge Start
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollScrollEdge002', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollEdgeStartTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      await Utils.clickComponent('ScrollEdgeButton');
      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('ScrollEdge').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLEDGE_0300
    * @tc.name       : testScrollScrollEdge003
    * @tc.desc       : test ScrollEdge Bottom
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollScrollEdge003', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollEdgeBottomTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      await Utils.clickComponent('ScrollEdgeButton');
      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('ScrollEdge').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLEDGE_0400
    * @tc.name       : testScrollScrollEdge004
    * @tc.desc       : test ScrollEdge End
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollScrollEdge004', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollEdgeEndTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      await Utils.clickComponent('ScrollEdgeButton');
      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('ScrollEdge').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLEDGE_0500
    * @tc.name       : testScrollScrollEdge005
    * @tc.desc       : test ScrollEdge abnormal value
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollScrollEdge005', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollEdge001Test';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      await Utils.clickComponent('ScrollEdge001Button');
      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('ScrollEdge001').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLEDGE_0600
    * @tc.name       : testScrollScrollEdge006
    * @tc.desc       : test ScrollEdge abnormal value
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollScrollEdge006', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollEdge002Test';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      await Utils.clickComponent('ScrollEdge002Button');
      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('ScrollEdge002').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLEDGE_0700
    * @tc.name       : testScrollScrollEdge007
    * @tc.desc       : test ScrollEdge abnormal value
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
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
