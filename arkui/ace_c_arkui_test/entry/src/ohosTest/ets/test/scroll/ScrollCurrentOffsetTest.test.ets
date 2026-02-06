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

import { expect, describe, it, afterEach, Level } from '@ohos/hypium';
import Utils from '../common/Utils';

export default function scrollCurrentOffsetTest() {

  describe('ScrollCurrentOffsetTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.name   testScrollCurrentOffset001
     * @tc.number SUB_ARKUI_CAPI_SCROLL_CURRENTOFFSET_0100
     * @tc.desc   testing scroll to for scroll with linear value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollCurrentOffset001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollCurrentOffsetLinearTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('CurrentOffset').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /**
     * @tc.name   testScrollCurrentOffset002
     * @tc.number SUB_ARKUI_CAPI_SCROLL_CURRENTOFFSET_0200
     * @tc.desc   testing scroll to for scroll with ease value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollCurrentOffset002', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollCurrentOffsetEaseTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('CurrentOffset').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /**
     * @tc.name   testScrollCurrentOffset003
     * @tc.number SUB_ARKUI_CAPI_SCROLL_CURRENTOFFSET_0300
     * @tc.desc   testing scroll to for scroll with ease in value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollCurrentOffset003', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollCurrentOffsetEaseInTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('CurrentOffset').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /**
     * @tc.name   testScrollCurrentOffset004
     * @tc.number SUB_ARKUI_CAPI_SCROLL_CURRENTOFFSET_0400
     * @tc.desc   testing scroll to for scroll with ease out value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollCurrentOffset004', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollCurrentOffsetEaseOutTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('CurrentOffset').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /**
     * @tc.name   testScrollCurrentOffset005
     * @tc.number SUB_ARKUI_CAPI_SCROLL_CURRENTOFFSET_0500
     * @tc.desc   testing scroll to for scroll with ease in out value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollCurrentOffset005', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollCurrentOffsetEaseInOutTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('CurrentOffset').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /**
     * @tc.name   testScrollCurrentOffset006
     * @tc.number SUB_ARKUI_CAPI_SCROLL_CURRENTOFFSET_0600
     * @tc.desc   testing scroll to for scroll with fast out slow in value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollCurrentOffset006', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollCurrentOffsetFastOutSlowInTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('CurrentOffset').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /**
     * @tc.name   testScrollCurrentOffset007
     * @tc.number SUB_ARKUI_CAPI_SCROLL_CURRENTOFFSET_0700
     * @tc.desc   testing scroll to for scroll with linear out slow in value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollCurrentOffset007', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollCurrentOffsetLinearOutSlowInTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('CurrentOffset').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /**
     * @tc.name   testScrollCurrentOffset008
     * @tc.number SUB_ARKUI_CAPI_SCROLL_CURRENTOFFSET_0800
     * @tc.desc   testing scroll to for scroll with fast out linear in value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollCurrentOffset008', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollCurrentOffsetFastOutLinearInTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('CurrentOffset').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /**
     * @tc.name   testScrollCurrentOffset009
     * @tc.number SUB_ARKUI_CAPI_SCROLL_CURRENTOFFSET_0900
     * @tc.desc   testing scroll to for scroll with extreme deceleration value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollCurrentOffset009', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollCurrentOffsetExtremeDecelerationTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('CurrentOffset').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /**
     * @tc.name   testScrollCurrentOffset010
     * @tc.number SUB_ARKUI_CAPI_SCROLL_CURRENTOFFSET_1000
     * @tc.desc   testing scroll to for scroll with sharp value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollCurrentOffset010', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollCurrentOffsetSharpTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('CurrentOffset').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /**
     * @tc.name   testScrollCurrentOffset011
     * @tc.number SUB_ARKUI_CAPI_SCROLL_CURRENTOFFSET_1100
     * @tc.desc   testing scroll to for scroll with rhythm value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollCurrentOffset011', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollCurrentOffsetRhythmTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('CurrentOffset').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /**
     * @tc.name   testScrollCurrentOffset012
     * @tc.number SUB_ARKUI_CAPI_SCROLL_CURRENTOFFSET_1200
     * @tc.desc   testing scroll to for scroll with smooth value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollCurrentOffset012', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollCurrentOffsetSmoothTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('CurrentOffset').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /**
     * @tc.name   testScrollCurrentOffset013
     * @tc.number SUB_ARKUI_CAPI_SCROLL_CURRENTOFFSET_1300
     * @tc.desc   testing scroll to for scroll with friction value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollCurrentOffset013', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollCurrentOffsetFrictionTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('CurrentOffset').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });
  })
}
