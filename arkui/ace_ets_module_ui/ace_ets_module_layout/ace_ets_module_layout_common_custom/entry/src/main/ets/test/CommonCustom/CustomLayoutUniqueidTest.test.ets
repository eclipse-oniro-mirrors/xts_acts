/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';
import window from '@ohos.window';

export default function CustomLayoutUniqueidTest() {
  describe('CustomLayoutUniqueidTest', () => {
    beforeEach(async (done: Function) => {
      console.info("CustomLayoutUniqueidTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonCustom/CustomLayoutUniqueidPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CustomLayoutUniqueidTest state pages: " + JSON.stringify(pages));
        if (!("CustomLayoutUniqueidTest" == pages.name)) {
          console.info("get CustomLayoutUniqueidTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push CustomLayoutUniqueidTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CustomLayoutUniqueidTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   CustomLayoutUniqueidTest_0100
     * @tc.number SUB_ARKUI_API_CustomLayoutUniqueidTest_0100
     * @tc.desc   CommonCustomAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CustomLayoutUniqueidTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[CustomLayoutUniqueidTest_0100] START');
      await CommonFunc.sleep(2000);

      console.log('[CustomLayoutUniqueidTest_0100] onPlaceChildren_UniqueId_0 is:' + AppStorage.get('CustomLayoutUniqueid_onPlaceChildren_UniqueId_0'));
      console.log('[CustomLayoutUniqueidTest_0100] onPlaceChildren_UniqueId_1 is:' + AppStorage.get('CustomLayoutUniqueid_onPlaceChildren_UniqueId_1'));
      console.log('[CustomLayoutUniqueidTest_0100] onMeasureSize_UniqueId_0 is:' + AppStorage.get('CustomLayoutUniqueid_onMeasureSize_UniqueId_0'));
      console.log('[CustomLayoutUniqueidTest_0100] onMeasureSize_UniqueId_1 is:' + AppStorage.get('CustomLayoutUniqueid_onMeasureSize_UniqueId_1'));
      console.log('[CustomLayoutUniqueidTest_0100] onMeasureSize_FrameNode_UniqueId_0 is:' + AppStorage.get('CustomLayoutUniqueid_onMeasureSize_FrameNode_UniqueId_0'));
      console.log('[CustomLayoutUniqueidTest_0100] onMeasureSize_FrameNode_UniqueId_1 is:' + AppStorage.get('CustomLayoutUniqueid_onMeasureSize_FrameNode_UniqueId_1'));
      expect(AppStorage.get('CustomLayoutUniqueid_onPlaceChildren_UniqueId_0')).assertEqual(AppStorage.get('CustomLayoutUniqueid_onMeasureSize_UniqueId_0'));
      expect(AppStorage.get('CustomLayoutUniqueid_onMeasureSize_UniqueId_0')).assertEqual(AppStorage.get('CustomLayoutUniqueid_onMeasureSize_FrameNode_UniqueId_0'));
      expect(AppStorage.get('CustomLayoutUniqueid_onPlaceChildren_UniqueId_1')).assertEqual(AppStorage.get('CustomLayoutUniqueid_onMeasureSize_UniqueId_1'));
      expect(AppStorage.get('CustomLayoutUniqueid_onMeasureSize_UniqueId_1')).assertEqual(AppStorage.get('CustomLayoutUniqueid_onMeasureSize_FrameNode_UniqueId_1'));
      AppStorage.delete('CustomLayoutUniqueid_onPlaceChildren_UniqueId_0');
      AppStorage.delete('CustomLayoutUniqueid_onPlaceChildren_UniqueId_1');
      AppStorage.delete('CustomLayoutUniqueid_onMeasureSize_UniqueId_0');
      AppStorage.delete('CustomLayoutUniqueid_onMeasureSize_UniqueId_1');
      AppStorage.delete('CustomLayoutUniqueid_onMeasureSize_FrameNode_UniqueId_0');
      AppStorage.delete('CustomLayoutUniqueid_onMeasureSize_FrameNode_UniqueId_1');

      console.info('[CustomLayoutUniqueidTest_0100] END');
      done();
    });

    /**
     * @tc.name   CustomLayoutUniqueidTest_0200
     * @tc.number SUB_ARKUI_API_CustomLayoutUniqueidTest_0200
     * @tc.desc   CommonCustomAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CustomLayoutUniqueidTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('CustomLayoutUniqueidTest_0200 START');
      await CommonFunc.sleep(1000);

      let Child_0 = CommonFunc.getComponentRect('CustomLayoutUniqueid_Child_0');
      let Child_1 = CommonFunc.getComponentRect('CustomLayoutUniqueid_Child_1');
      let Child_0_width = Child_0.right - Child_0.left;
      let Child_0_height = Child_0.bottom - Child_0.top;
      let Child_1_width = Child_1.right - Child_1.left;
      let Child_1_height = Child_1.bottom - Child_1.top;

      console.log('[CustomLayoutUniqueidTest_0200] Child_0_width is:' + Child_0_width);
      console.log('[CustomLayoutUniqueidTest_0200] Child_0_height is:' + Child_0_height);
      console.log('[CustomLayoutUniqueidTest_0200] Child_1_width is:' + Child_1_width);
      console.log('[CustomLayoutUniqueidTest_0200] Child_1_height is:' + Child_1_height);
      expect(Math.floor(Math.abs(Child_0_width - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Child_0_height - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Child_1_width - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Child_1_height - vp2px(100))) <= 1).assertTrue();

      console.info('[CustomLayoutUniqueidTest_0200] END');
      done();
    });
  })
}

