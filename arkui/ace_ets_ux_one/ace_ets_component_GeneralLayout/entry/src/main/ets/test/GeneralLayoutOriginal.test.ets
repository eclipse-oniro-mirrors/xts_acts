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
import router from '@ohos.router';
import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import display from '@ohos.display';
import { i18n } from '@kit.LocalizationKit';
import CommonFunc from '../TestAbility/common/Common';

export default function GeneralLayoutOriginalTest() {
  describe('GeneralLayoutOriginalTest', () => {

    let screenWidth = display.getDefaultDisplaySync().width;
    let original_rect_left: number;
    let original_rect_top: number;
    let original_rect_bottom: number;
    let original_rect_right: number;

    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'TestAbility/pages/IndexOrig',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get IndexOrig state success " + JSON.stringify(pages));
        if (!("IndexOrig" == pages.name)) {
          console.info("get IndexOrig state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push IndexOrig page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push IndexOrig page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   ArkUIHDS_General_Layout_2800
     * @tc.number ArkUIHDS_General_Layout_2800
     * @tc.desc   test original parameters of position
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUIHDS_General_Layout_2800', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_2800 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Original_0100');
      original_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0];
      original_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1];
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('top_orig');
      let top: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[1];
      let left: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[0];
      expect(original_rect_left - left).assertLargerOrEqual(99);
      expect(original_rect_left - left).assertLessOrEqual(101);
      expect(original_rect_top - top).assertLargerOrEqual(vp2px(100) - 1);
      expect(original_rect_top - top).assertLessOrEqual(vp2px(100) + 1);
      console.info('ArkUIHDS_General_Layout_2800 END');
      done();
    });

    /**
     * @tc.name   ArkUIHDS_General_Layout_2900
     * @tc.number ArkUIHDS_General_Layout_2900
     * @tc.desc   test original parameters of position
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUIHDS_General_Layout_2900', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_2900 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Original_0200');
      original_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[0];
      original_rect_bottom = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[1];
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('bottom_orig');
      let bottom: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[1];
      let right: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[0];
      let strJson2 = getInspectorByKey('top_orig');
      let left: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[0];
      let width = right - left;
      let lpx100 = Number.parseInt(lpx2px(100).toFixed(0));
      bottom = Math.floor(bottom);
      original_rect_bottom = Math.floor(original_rect_bottom);
      expect(width - (original_rect_right - left)).assertLargerOrEqual(fp2px(100) - 1);
      expect(width - (original_rect_right - left)).assertLessOrEqual(fp2px(100) + 1);
      expect(bottom - original_rect_bottom).assertLargerOrEqual(lpx100 - 1);
      expect(bottom - original_rect_bottom).assertLessOrEqual(lpx100 + 1);
      console.info('ArkUIHDS_General_Layout_2900 END');
      done();
    });

    /**
     * @tc.name   ArkUIHDS_General_Layout_3000
     * @tc.number ArkUIHDS_General_Layout_3000
     * @tc.desc   test original parameters of position
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUIHDS_General_Layout_3000', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_3000 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Original_0300');
      original_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0];
      original_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1];
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('top_orig');
      let top: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[1];
      let left: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[0];
      expect(original_rect_left - left).assertLargerOrEqual(vp2px(100) - 1);
      expect(original_rect_left - left).assertLessOrEqual(vp2px(100) + 1);
      expect(original_rect_top - top).assertLargerOrEqual(vp2px(100) - 1);
      expect(original_rect_top - top).assertLessOrEqual(vp2px(100) + 1);
      console.info('ArkUIHDS_General_Layout_3000 END');
      done();
    });

    /**
     * @tc.name   ArkUIHDS_General_Layout_3100
     * @tc.number ArkUIHDS_General_Layout_3100
     * @tc.desc   test original parameters of markAnchor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUIHDS_General_Layout_3100', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_3100 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Original_0400');
      original_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0];
      original_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1];
      original_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[0];
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('top_orig');
      let top: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[1];
      let left: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[0];
      let strJson3 = getInspectorByKey('bottom_orig');
      let right: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson3).$rect + ']')[0] + ']')[0];
      left = Number.parseInt(left.toFixed(0));
      right = Math.floor(right);
      let width = right - left;
      let original_size = ((original_rect_left - left) + (original_rect_right - left)) / 2;
      let original_rect = Number.parseInt(original_size.toFixed(0));
      expect((width / 2) - original_rect).assertLargerOrEqual(99);
      expect((width / 2) - original_rect).assertLessOrEqual(101);
      expect(original_rect_top - top).assertLargerOrEqual(vp2px(100) - 1);
      expect(original_rect_top - top).assertLessOrEqual(vp2px(100) + 1);
      console.info('ArkUIHDS_General_Layout_3100 END');
      done();
    });

    /**
     * @tc.name   ArkUIHDS_General_Layout_3200
     * @tc.number ArkUIHDS_General_Layout_3200
     * @tc.desc   test original parameters of markAnchor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUIHDS_General_Layout_3200', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_3200 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Original_0500');
      original_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0];
      original_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1];
      original_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[0];
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('top_orig');
      let top: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[1];
      let left: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[0];
      let strJson2 = getInspectorByKey('bottom_orig');
      let right: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[0];
      left = Number.parseInt(left.toFixed(0));
      right = Math.floor(right);
      let width = right - left;
      let lpx100 = Number.parseInt(lpx2px(100).toFixed(0));
      top = Math.floor(top);
      original_rect_top = Math.floor(original_rect_top);
      expect(((original_rect_left + original_rect_right) / 2 - left) - (width / 2))
        .assertLargerOrEqual(fp2px(100) - 1);
      expect(((original_rect_left + original_rect_right) / 2 - left) - (width / 2))
        .assertLessOrEqual(fp2px(100) + 1);
      expect(original_rect_top - top - 30).assertLargerOrEqual(lpx100 - 1);
      expect(original_rect_top - top - 30).assertLessOrEqual(lpx100 + 1);
      console.info('ArkUIHDS_General_Layout_3200 END');
      done();
    });

    /**
     * @tc.name   ArkUIHDS_General_Layout_3300
     * @tc.number ArkUIHDS_General_Layout_3300
     * @tc.desc   test original parameters of offset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUIHDS_General_Layout_3300', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_3300 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Original_0600');
      original_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0];
      original_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1];
      original_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[0];
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('top_orig');
      let top: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[1];
      let left: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[0];
      let strJson2 = getInspectorByKey('bottom_orig');
      let right: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[0];
      left = Number.parseInt(left.toFixed(0));
      right = Math.floor(right);
      let width = right - left;
      let original_rect = Number.parseInt(((original_rect_left + original_rect_right) / 2 - left).toFixed(0));
      expect(original_rect - (width / 2)).assertLargerOrEqual(99);
      expect(original_rect - (width / 2)).assertLessOrEqual(101);
      expect(original_rect_top - top - 60).assertLargerOrEqual(vp2px(100) - 1);
      expect(original_rect_top - top - 60).assertLessOrEqual(vp2px(100) + 1);
      console.info('ArkUIHDS_General_Layout_3300 END');
      done();
    });

    /**
     * @tc.name   ArkUIHDS_General_Layout_3400
     * @tc.number ArkUIHDS_General_Layout_3400
     * @tc.desc   test original parameters of offset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUIHDS_General_Layout_3400', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_3400 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Original_0700');
      original_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0];
      original_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1];
      original_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[0];
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('top_orig');
      let top: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[1];
      let left: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[0];
      let strJson2 = getInspectorByKey('bottom_orig');
      let right: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[0];
      left = Number.parseInt(left.toFixed(0));
      right = Math.floor(right);
      let width = right - left;
      let lpx100 = Number.parseInt(lpx2px(100).toFixed(0));
      top = Math.floor(top);
      original_rect_top = Math.floor(original_rect_top);
      expect(((width / 2) - ((original_rect_left + original_rect_right) / 2 - left)))
        .assertLargerOrEqual(fp2px(100) - 1);
      expect(((width / 2) - ((original_rect_left + original_rect_right) / 2 - left)))
        .assertLessOrEqual(fp2px(100) + 1);
      expect(original_rect_top - top - 90).assertLargerOrEqual(lpx100 - 1);
      expect(original_rect_top - top - 90).assertLessOrEqual(lpx100 + 1);
      console.info('ArkUIHDS_General_Layout_3400 END');
      done();
    });

    /**
     * @tc.name   ArkUIHDS_General_Layout_3500
     * @tc.number ArkUIHDS_General_Layout_3500
     * @tc.desc   test original parameters of offset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUIHDS_General_Layout_3500', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_3500 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Original_0800');
      original_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0];
      original_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1];
      original_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[0];
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('top_orig');
      let top: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[1];
      let left: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[0];
      let strJson2 = getInspectorByKey('bottom_orig');
      let right: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[0];
      left = Number.parseInt(left.toFixed(0));
      right = Math.floor(right);
      let width = right - left;
      i18n.System.setAppPreferredLanguage("zh-Hans");
      expect(((original_rect_left + original_rect_right) / 2 - left) - (width / 2))
        .assertLargerOrEqual(vp2px(100) - 1);
      expect(((original_rect_left + original_rect_right) / 2 - left) - (width / 2))
        .assertLessOrEqual(vp2px(100) + 1);
      expect(original_rect_top - top - 120).assertLargerOrEqual(vp2px(100) - 1);
      expect(original_rect_top - top - 120).assertLessOrEqual(vp2px(100) + 1);
      console.info('ArkUIHDS_General_Layout_3500 END');
      done();
    });

  })
}