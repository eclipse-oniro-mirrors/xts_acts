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
import nativeFunc from 'libnativefunc.so'

export default function scrollScrollToTest() {

  describe('ScrollScrollToTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLTO_0100
     * @tc.name       : testScrollScrollTo001
     * @tc.desc       : testing scroll to for scroll with linear value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollScrollTo001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollToLinearTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('ScrollTo').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLTO_0200
     * @tc.name       : testScrollScrollTo002
     * @tc.desc       : testing scroll to for scroll with ease value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollScrollTo002', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollToEaseTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('ScrollTo').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLTO_0300
     * @tc.name       : testScrollScrollTo003
     * @tc.desc       : testing scroll to for scroll with ease in value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollScrollTo003', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollToEaseInTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('ScrollTo').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLTO_0400
     * @tc.name       : testScrollScrollTo004
     * @tc.desc       : testing scroll to for scroll with ease out value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollScrollTo004', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollToEaseOutTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('ScrollTo').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLTO_0500
     * @tc.name       : testScrollScrollTo005
     * @tc.desc       : testing scroll to for scroll with ease in out value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollScrollTo005', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollToEaseInOutTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('ScrollTo').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLTO_0600
     * @tc.name       : testScrollScrollTo006
     * @tc.desc       : testing scroll to for scroll with fast out slow in value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollScrollTo006', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollToFastOutSlowInTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('ScrollTo').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLTO_0700
     * @tc.name       : testScrollScrollTo007
     * @tc.desc       : testing scroll to for scroll with linear out slow in value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollScrollTo007', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollToLinearOutSlowInTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('ScrollTo').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLTO_0800
     * @tc.name       : testScrollScrollTo008
     * @tc.desc       : testing scroll to for scroll with fast out linear in value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollScrollTo008', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollToFastOutLinearInTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('ScrollTo').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLTO_0900
     * @tc.name       : testScrollScrollTo009
     * @tc.desc       : testing scroll to for scroll with extreme deceleration value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollScrollTo009', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollToExtremeDecelerationTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('ScrollTo').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLTO_1000
     * @tc.name       : testScrollScrollTo010
     * @tc.desc       : testing scroll to for scroll with sharp value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollScrollTo010', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollToSharpTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('ScrollTo').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLTO_1100
     * @tc.name       : testScrollScrollTo011
     * @tc.desc       : testing scroll to for scroll with rhythm value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollScrollTo011', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollToRhythmTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('ScrollTo').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLTO_1200
     * @tc.name       : testScrollScrollTo012
     * @tc.desc       : testing scroll to for scroll with smooth value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollScrollTo012', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollToSmoothTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('ScrollTo').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLTO_1300
     * @tc.name       : testScrollScrollTo013
     * @tc.desc       : testing scroll to for scroll with friction value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollScrollTo013', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollToFrictionTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('ScrollTo').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLTO_1400
     * @tc.name       : testScrollScrollTo014
     * @tc.desc       : testing canoverscroll to for scroll with 1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollScrollTo014', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollToCanOverScrollTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      await Utils.sleep(3000)
      expect(Utils.getComponentInfoByKey('CanOverScroll').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLTO_1500
     * @tc.name       : testScrollScrollTo015
     * @tc.desc       : testing canoverscroll to for scroll with 0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollScrollTo015', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollToCanOverScrollOffTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      await Utils.sleep(3000)
      expect(Utils.getComponentInfoByKey('CanOverScrollOff').$attrs.backgroundColor).assertEqual('#FFFF0000')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLTO_1600
     * @tc.name       : testScrollScrollTo016
     * @tc.desc       : testing ScrollTo
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollScrollTo016', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollTo001Test';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      await Utils.clickComponent('ScrollTo001');
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('ScrollTo001').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLTO_1700
     * @tc.name       : testScrollScrollTo017
     * @tc.desc       : testing ScrollTo
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollScrollTo017', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollTo002Test';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      await Utils.clickComponent('ScrollTo002');
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('ScrollTo002').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLTO_1800
     * @tc.name       : testScrollScrollTo018
     * @tc.desc       : testing ScrollTo
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollScrollTo018', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollTo003Test';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      await Utils.clickComponent('ScrollTo003');
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('ScrollTo003').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLTO_1900
     * @tc.name       : testScrollScrollTo019
     * @tc.desc       : testing ScrollTo
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollScrollTo019', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollTo004Test';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      await Utils.clickComponent('ScrollTo004');
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('ScrollTo004').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLTO_2000
     * @tc.name       : testScrollScrollTo020
     * @tc.desc       : testing ScrollTo
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollScrollTo020', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollTo005Test';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      await Utils.clickComponent('ScrollTo005');
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('ScrollTo005').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLTO_2100
     * @tc.name       : testScrollScrollTo021
     * @tc.desc       : testing ScrollTo
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollScrollTo021', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollTo006Test';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      await Utils.clickComponent('ScrollTo006');
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('ScrollTo006').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLTO_2200
     * @tc.name       : testScrollScrollTo022
     * @tc.desc       : testing ScrollTo
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollScrollTo022', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollScrollTo007Test';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      await Utils.clickComponent('ScrollTo007');
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('ScrollTo007').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });
  })
}
