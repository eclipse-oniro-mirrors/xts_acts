/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { expect, describe, it, afterEach, beforeAll ,Level} from '@ohos/hypium'
import { Driver, ON } from '@ohos.UiTest'
import Utils from '../common/Utils'
import nativeRender from 'libnativerender.so'

export default function PanGestureTest(){

  describe('PanGestureTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })


    /**
     * @tc.name   PanGestureTest001
     * @tc.number PanGestureTest001
     * @tc.desc   PanGestureTest001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PanGestureTest001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'PanGestureTest001';
      await Utils.pushPage(`gestureRecognizer/${PAGE_TAG}`);
      let driver = await Driver.create();
      await Utils.sleep(1000);
      let Column = await driver.findComponent(ON.id('ColumnID'));
      await Utils.sleep(500);
      let rect = await Column.getBounds();
      await Utils.sleep(500);
      await driver.swipe(Math.round(rect.left+200),Math.round(rect.top+200),Math.round(rect.left+1),Math.round(rect.top+1),600);
      await Utils.sleep(1000)
      let object1:ESObject = nativeRender.GetPanGestureData();
      console.info("PanGestureSetDistanceMapCode" + object1.PanGestureSetDistanceMapCode);
      expect(object1.PanGestureSetDistanceMapCode == 0).assertTrue();
      expect(object1.TypeUnknownCode == 0).assertTrue();
      expect(object1.TypeUnknownDiss == 5).assertTrue();
      expect(object1.TypeFingerCode == 0).assertTrue();
      expect(object1.TypeFingerDiss == 8).assertTrue();
      expect(object1.TypePenCode == 0).assertTrue();
      expect(object1.TypePenDiss == 10).assertTrue();
      expect(object1.TypeMouseCode == 0).assertTrue();
      expect(object1.TypeMouseDiss == 4).assertTrue();
      expect(object1.TypeTouchPadCode == 0).assertTrue();
      expect(object1.TypeTouchPadDiss == 12).assertTrue();
      expect(object1.TypeJoyStickCode == 401).assertTrue();
      expect(object1.TypeJoyStickDiss == 0).assertTrue();
      done();
    });

    /**
     * @tc.name   PanGestureTest002
     * @tc.number SUB_ARKUI_PAN_GESTURE_CASE_002
     * @tc.desc   testing List lanes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PanGestureTest002', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'PanGestureTest002';
      await Utils.pushPage(`gestureRecognizer/${PAGE_TAG}`);
      let driver = await Driver.create();
      await Utils.sleep(1000);
      let Column = await driver.findComponent(ON.id('ColumnID'));
      await Utils.sleep(500);
      let rect = await Column.getBounds();
      await Utils.sleep(500);
      await driver.swipe(Math.round(rect.left+200),Math.round(rect.top+200),Math.round(rect.left+1),Math.round(rect.top+1),600);
      await Utils.sleep(1000)
      let object1:ESObject = nativeRender.GetPanGestureData();
      console.info("PanGestureSetDistanceMapCode" + object1.PanGestureSetDistanceMapCode);
      expect(object1.PanGestureSetDistanceMapCode == 0).assertTrue();
      expect(object1.TypeUnknownCode == 0).assertTrue();
      expect(object1.TypeUnknownDiss == 5).assertTrue();
      expect(object1.TypeFingerCode == 401).assertTrue();
      expect(object1.TypeFingerDiss == 0).assertTrue();
      expect(object1.TypePenCode == 0).assertTrue();
      expect(object1.TypePenDiss == 10).assertTrue();
      expect(object1.TypeMouseCode == 401).assertTrue();
      expect(object1.TypeMouseDiss == 0).assertTrue();
      expect(object1.TypeTouchPadCode == 401).assertTrue();
      expect(object1.TypeTouchPadDiss == 0).assertTrue();
      expect(object1.TypeJoyStickCode == 401).assertTrue();
      expect(object1.TypeJoyStickDiss == 0).assertTrue();
      done();
    });

    /**
     * @tc.name   PanGestureTest003
     * @tc.number SUB_ARKUI_PAN_GESTURE_CASE_003
     * @tc.desc   testing List lanes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PanGestureTest003', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'PanGestureTest003';
      await Utils.pushPage(`gestureRecognizer/${PAGE_TAG}`);
      let driver = await Driver.create();
      await Utils.sleep(1000);
      let Column = await driver.findComponent(ON.id('ColumnID'));
      await Utils.sleep(500);
      let rect = await Column.getBounds();
      await Utils.sleep(500);
      await driver.swipe(Math.round(rect.left+200),Math.round(rect.top+200),Math.round(rect.left+1),Math.round(rect.top+1),600);
      await Utils.sleep(1000)
      let object1:ESObject = nativeRender.GetPanGestureData();
      console.info("PanGestureSetDistanceMapCode" + object1.PanGestureSetDistanceMapCode);
      expect(object1.PanGestureSetDistanceMapCode == 0).assertTrue();
      expect(object1.TypeUnknownCode == 0).assertTrue();
      expect(object1.TypeUnknownDiss == 10).assertTrue();
      expect(object1.TypeFingerCode == 401).assertTrue();
      expect(object1.TypeFingerDiss == 0).assertTrue();
      expect(object1.TypePenCode == 401).assertTrue();
      expect(object1.TypePenDiss == 0).assertTrue();
      expect(object1.TypeMouseCode == 401).assertTrue();
      expect(object1.TypeMouseDiss == 0).assertTrue();
      expect(object1.TypeTouchPadCode == 401).assertTrue();
      expect(object1.TypeTouchPadDiss == 0).assertTrue();
      expect(object1.TypeJoyStickCode == 401).assertTrue();
      expect(object1.TypeJoyStickDiss == 0).assertTrue();
      done();
    });
    

    /**
     * @tc.name   PanGestureTest004
     * @tc.number PanGestureTest004
     * @tc.desc   PanGestureTest004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PanGestureTest004', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'PanGestureTest004';
      await Utils.pushPage(`gestureRecognizer/${PAGE_TAG}`);
      let driver = await Driver.create();
      await Utils.sleep(1000);
      let Column = await driver.findComponent(ON.id('ColumnID'));
      await Utils.sleep(500);
      let rect = await Column.getBounds();
      await Utils.sleep(500);
      await driver.swipe(Math.round(rect.left+200),Math.round(rect.top+200),Math.round(rect.left+1),Math.round(rect.top+1),600);
      await Utils.sleep(1000)
      let object1:ESObject = nativeRender.GetPanGestureData();
      console.info("PanGestureSetDistanceMapCode" + object1.PanGestureSetDistanceMapCode);
      expect(object1.PanGestureSetDistanceMapCode == 0).assertTrue();
      expect(object1.TypeUnknownCode == 0).assertTrue();
      expect(object1.TypeUnknownDiss == 0).assertTrue();
      expect(object1.TypeFingerCode == 401).assertTrue();
      expect(object1.TypeFingerDiss == 0).assertTrue();
      expect(object1.TypePenCode == 401).assertTrue();
      expect(object1.TypePenDiss == 0).assertTrue();
      expect(object1.TypeMouseCode == 401).assertTrue();
      expect(object1.TypeMouseDiss == 0).assertTrue();
      expect(object1.TypeTouchPadCode == 401).assertTrue();
      expect(object1.TypeTouchPadDiss == 0).assertTrue();
      expect(object1.TypeJoyStickCode == 401).assertTrue();
      expect(object1.TypeJoyStickDiss == 0).assertTrue();
      done();
    });
  })
}