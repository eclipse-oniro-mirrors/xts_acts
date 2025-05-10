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
import { Driver, ON } from '@kit.TestKit';
import { Point } from '@ohos.UiTest';
import nativeFunc from 'libnativefunc.so'

async function panGesture(id: string, x1: number, y1: number, x2: number, y2: number) {
  let driver = Driver.create();
  let refresh = await driver.findComponent(ON.id(id));
  let rect = await refresh.getBounds();
  const p1: Point = {
    x: Math.round(rect.left + vp2px(x1)),
    y: Math.round(rect.top + vp2px(y1))
  };
  const p2: Point = {
    x: Math.round(rect.left + vp2px(x2)),
    y: Math.round(rect.top + vp2px(y2))
  };
  await driver.fling(p1, p2, 5, 200)
}

export default function requirementPanGestureTest() {

  describe('RequirementPanGestureTest', () => {

    let PAGE_TAG = 'RequirementPanGestureTest';

        /*
     * @tc.number     : SUB_ARKUI_CAPI_REQUIREMENT_PAN_GESTURE_0001
     * @tc.name       : testRequirementPanGesture001
     * @tc.desc       : Test retrieving and verifying gesture information for various gestures
     * @tc.size       : MediumTest
     * @tc.type       : Render
     * @tc.level      : Level1
     */
    it('testRequirementPanGesture001', 0, async (done: Function) => {
      await Utils.pushPage(`requirement/${PAGE_TAG}`);
      await panGesture("swiper1", 20, 20, 10, 10)
      expect(Utils.getComponentInfoByKey('swiper1').$attrs.backgroundColor).assertEqual('#FF000000')
      done();
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_REQUIREMENT_PAN_GESTURE_0002
     * @tc.name       : testRequirementPanGesture002
     * @tc.desc       : Test retrieving and verifying gesture information for various gestures
     * @tc.size       : MediumTest
     * @tc.type       : Render
     * @tc.level      : Level1
     */
    it('testRequirementPanGesture002', 0, async (done: Function) => {
      await Utils.pushPage(`requirement/${PAGE_TAG}`);
      await panGesture("swiper2", 20, 20, 20, 10)
      expect(Utils.getComponentInfoByKey('swiper2').$attrs.backgroundColor).assertEqual('#FF000000')
      done();
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_REQUIREMENT_PAN_GESTURE_0003
     * @tc.name       : testRequirementPanGesture003
     * @tc.desc       : Test retrieving and verifying gesture information for various gestures
     * @tc.size       : MediumTest
     * @tc.type       : Render
     * @tc.level      : Level1
     */
    it('testRequirementPanGesture003', 0, async (done: Function) => {
      await Utils.pushPage(`requirement/${PAGE_TAG}`);
      await panGesture("swiper3", 20, 20, 30, 10)
      expect(Utils.getComponentInfoByKey('swiper3').$attrs.backgroundColor).assertEqual('#FF000000')
      done();
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_REQUIREMENT_PAN_GESTURE_0004
     * @tc.name       : testRequirementPanGesture004
     * @tc.desc       : Test retrieving and verifying gesture information for various gestures
     * @tc.size       : MediumTest
     * @tc.type       : Render
     * @tc.level      : Level1
     */
    it('testRequirementPanGesture004', 0, async (done: Function) => {
      await Utils.pushPage(`requirement/${PAGE_TAG}`);
      await panGesture("swiper4", 20, 20, 30, 20)
      expect(Utils.getComponentInfoByKey('swiper4').$attrs.backgroundColor).assertEqual('#FF000000')
      done();
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_REQUIREMENT_PAN_GESTURE_0005
     * @tc.name       : testRequirementPanGesture005
     * @tc.desc       : Test retrieving and verifying gesture information for various gestures
     * @tc.size       : MediumTest
     * @tc.type       : Render
     * @tc.level      : Level1
     */
    it('testRequirementPanGesture005', 0, async (done: Function) => {
      await Utils.pushPage(`requirement/${PAGE_TAG}`);
      await Utils.flingComponent("swiper5", true, true)
      expect(Utils.getComponentInfoByKey('swiper5').$attrs.backgroundColor).assertEqual('#00000000')
      done();
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_REQUIREMENT_PAN_GESTURE_0006
     * @tc.name       : testRequirementPanGesture006
     * @tc.desc       : Test retrieving and verifying gesture information for various gestures
     * @tc.size       : MediumTest
     * @tc.type       : Render
     * @tc.level      : Level1
     */
    it('testRequirementPanGesture006', 0, async (done: Function) => {
      await Utils.pushPage(`requirement/${PAGE_TAG}`);
      await panGesture("swiper6", 20, 20, 30, 30)
      expect(Utils.getComponentInfoByKey('swiper6').$attrs.backgroundColor).assertEqual('#FF000000')
      done();
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_REQUIREMENT_PAN_GESTURE_0007
     * @tc.name       : testRequirementPanGesture007
     * @tc.desc       : Test retrieving and verifying gesture information for various gestures
     * @tc.size       : MediumTest
     * @tc.type       : Render
     * @tc.level      : Level1
     */
    it('testRequirementPanGesture007', 0, async (done: Function) => {
      await Utils.pushPage(`requirement/${PAGE_TAG}`);
      await panGesture("swiper7", 20, 20, 20, 30)
      expect(Utils.getComponentInfoByKey('swiper7').$attrs.backgroundColor).assertEqual('#FF000000')
      done();
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_REQUIREMENT_PAN_GESTURE_0008
     * @tc.name       : testRequirementPanGesture008
     * @tc.desc       : Test retrieving and verifying gesture information for various gestures
     * @tc.size       : MediumTest
     * @tc.type       : Render
     * @tc.level      : Level1
     */
    it('testRequirementPanGesture008', 0, async (done: Function) => {
      await Utils.pushPage(`requirement/${PAGE_TAG}`);
      await panGesture("swiper8", 20, 20, 10, 30)
      expect(Utils.getComponentInfoByKey('swiper8').$attrs.backgroundColor).assertEqual('#FF000000')
      done();
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_REQUIREMENT_PAN_GESTURE_0009
     * @tc.name       : testRequirementPanGesture009
     * @tc.desc       : Test retrieving and verifying gesture information for various gestures
     * @tc.size       : MediumTest
     * @tc.type       : Render
     * @tc.level      : Level1
     */
    it('testRequirementPanGesture009', 0, async (done: Function) => {
      await Utils.pushPage(`requirement/${PAGE_TAG}`);
      await panGesture("swiper9", 20, 20, 10, 20)
      expect(Utils.getComponentInfoByKey('swiper9').$attrs.backgroundColor).assertEqual('#FF000000')
      done();
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_REQUIREMENT_PAN_GESTURE_0010
     * @tc.name       : testRequirementPanGesture010
     * @tc.desc       : Test retrieving and verifying gesture information for various gestures
     * @tc.size       : MediumTest
     * @tc.type       : Render
     * @tc.level      : Level1
     */
    it('testRequirementPanGesture010', 0, async (done: Function) => {
      await Utils.pushPage(`requirement/${PAGE_TAG}`);
      await Utils.flingComponent("swiper10", true, false)
      expect(Utils.getComponentInfoByKey('swiper10').$attrs.backgroundColor).assertEqual('#00000000')
      done();
    })

  })
}
