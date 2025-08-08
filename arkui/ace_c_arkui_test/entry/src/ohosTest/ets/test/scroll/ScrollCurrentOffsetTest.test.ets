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

import { expect, describe, it, afterEach } from '@ohos/hypium';
import Utils from '../common/Utils';

export default function scrollCurrentOffsetTest() {

  describe('ScrollCurrentOffsetTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_CURRENTOFFSET_0100
     * @tc.name       : testScrollCurrentOffset001
     * @tc.desc       : testing scroll to for scroll with linear value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollCurrentOffset001', 0, async (done: Function) => {
      let PAGE_TAG = 'ScrollCurrentOffsetLinearTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('CurrentOffset').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_CURRENTOFFSET_0200
     * @tc.name       : testScrollCurrentOffset002
     * @tc.desc       : testing scroll to for scroll with ease value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollCurrentOffset002', 0, async (done: Function) => {
      let PAGE_TAG = 'ScrollCurrentOffsetEaseTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('CurrentOffset').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_CURRENTOFFSET_0300
     * @tc.name       : testScrollCurrentOffset003
     * @tc.desc       : testing scroll to for scroll with ease in value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollCurrentOffset003', 0, async (done: Function) => {
      let PAGE_TAG = 'ScrollCurrentOffsetEaseInTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('CurrentOffset').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_CURRENTOFFSET_0400
     * @tc.name       : testScrollCurrentOffset004
     * @tc.desc       : testing scroll to for scroll with ease out value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollCurrentOffset004', 0, async (done: Function) => {
      let PAGE_TAG = 'ScrollCurrentOffsetEaseOutTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('CurrentOffset').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_CURRENTOFFSET_0500
     * @tc.name       : testScrollCurrentOffset005
     * @tc.desc       : testing scroll to for scroll with ease in out value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollCurrentOffset005', 0, async (done: Function) => {
      let PAGE_TAG = 'ScrollCurrentOffsetEaseInOutTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('CurrentOffset').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_CURRENTOFFSET_0600
     * @tc.name       : testScrollCurrentOffset006
     * @tc.desc       : testing scroll to for scroll with fast out slow in value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollCurrentOffset006', 0, async (done: Function) => {
      let PAGE_TAG = 'ScrollCurrentOffsetFastOutSlowInTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('CurrentOffset').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_CURRENTOFFSET_0700
     * @tc.name       : testScrollCurrentOffset007
     * @tc.desc       : testing scroll to for scroll with linear out slow in value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollCurrentOffset007', 0, async (done: Function) => {
      let PAGE_TAG = 'ScrollCurrentOffsetLinearOutSlowInTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('CurrentOffset').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_CURRENTOFFSET_0800
     * @tc.name       : testScrollCurrentOffset008
     * @tc.desc       : testing scroll to for scroll with fast out linear in value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollCurrentOffset008', 0, async (done: Function) => {
      let PAGE_TAG = 'ScrollCurrentOffsetFastOutLinearInTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('CurrentOffset').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_CURRENTOFFSET_0900
     * @tc.name       : testScrollCurrentOffset009
     * @tc.desc       : testing scroll to for scroll with extreme deceleration value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollCurrentOffset009', 0, async (done: Function) => {
      let PAGE_TAG = 'ScrollCurrentOffsetExtremeDecelerationTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('CurrentOffset').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_CURRENTOFFSET_1000
     * @tc.name       : testScrollCurrentOffset010
     * @tc.desc       : testing scroll to for scroll with sharp value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollCurrentOffset010', 0, async (done: Function) => {
      let PAGE_TAG = 'ScrollCurrentOffsetSharpTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('CurrentOffset').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_CURRENTOFFSET_1100
     * @tc.name       : testScrollCurrentOffset011
     * @tc.desc       : testing scroll to for scroll with rhythm value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollCurrentOffset011', 0, async (done: Function) => {
      let PAGE_TAG = 'ScrollCurrentOffsetRhythmTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('CurrentOffset').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_CURRENTOFFSET_1200
     * @tc.name       : testScrollCurrentOffset012
     * @tc.desc       : testing scroll to for scroll with smooth value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollCurrentOffset012', 0, async (done: Function) => {
      let PAGE_TAG = 'ScrollCurrentOffsetSmoothTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('CurrentOffset').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_CURRENTOFFSET_1300
     * @tc.name       : testScrollCurrentOffset013
     * @tc.desc       : testing scroll to for scroll with friction value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollCurrentOffset013', 0, async (done: Function) => {
      let PAGE_TAG = 'ScrollCurrentOffsetFrictionTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('CurrentOffset').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });
  })
}
