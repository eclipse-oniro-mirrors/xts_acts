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
import { i18n } from '@kit.LocalizationKit';
import display from '@ohos.display';
import CommonFunc from '../TestAbility/common/Common';

export default function GeneralLayoutMarkAnchorTest() {
  describe('GeneralLayoutMarkAnchorTest', () => {

    let screenWidth = display.getDefaultDisplaySync().width;
    let original_rect_left: number;
    let original_rect_top: number;
    let original_rect_right: number;
    let mirror_rect_left: number;
    let mirror_rect_top: number;
    let mirror_rect_right: number;
    let mirror_rect_bottom: number;

    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'TestAbility/pages/IndexMark',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get IndexMark state success " + JSON.stringify(pages));
        if (!("IndexMark" == pages.name)) {
          console.info("get IndexMark state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push IndexMark page success " + JSON.stringify(result));
        }

      } catch (err) {
        console.error("push IndexMark page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   ArkUIHDS_General_Layout_1000
     * @tc.number ArkUIHDS_General_Layout_1000
     * @tc.desc   test LengthMetrics type of markAnchor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUIHDS_General_Layout_1000', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_1000 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('0100_TextM');
      console.info('0100_TextM START  :' + JSON.stringify(strJson));
      original_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1];
      original_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[0];
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('0100_TextM');
      console.info('0100_TextM START  :' + JSON.stringify(strJson1));
      mirror_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[0];
      mirror_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[1];
      mirror_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[1] + ']')[0];
      let strJson2 = getInspectorByKey('top_mark');
      let top: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[1];
      let left: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[0];
      let strJson3 = getInspectorByKey('bottom_mark');
      let right: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson3).$rect + ']')[0] + ']')[0];
      left = Number.parseInt(left.toFixed(0));
      right = Math.floor(right);
      let width = right - left;
      expect(mirror_rect_left - left).assertLargerOrEqual(width - (original_rect_right - left) - 1);
      expect(mirror_rect_left - left).assertLessOrEqual(width - (original_rect_right - left) + 1);
      expect(original_rect_top - top).assertLargerOrEqual(99);
      expect(original_rect_top - top).assertLessOrEqual(101);
      expect(mirror_rect_top - top).assertLargerOrEqual(99);
      expect(mirror_rect_top - top).assertLessOrEqual(101);
      expect(((mirror_rect_left - left) + (mirror_rect_right - left)) / 2 - width / 2).assertLargerOrEqual(99);
      expect(((mirror_rect_left - left) + (mirror_rect_right - left)) / 2 - width / 2).assertLessOrEqual(101);
      console.info('ArkUIHDS_General_Layout_1000 END');
      done();
    });

    /**
     * @tc.name   ArkUIHDS_General_Layout_1100
     * @tc.number ArkUIHDS_General_Layout_1100
     * @tc.desc   test LengthMetrics type of markAnchor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUIHDS_General_Layout_1100', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_1100 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('0200_ButtonM');
      console.info('0200_ButtonM START  :' + JSON.stringify(strJson));
      original_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1];
      original_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[0];
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('0200_ButtonM');
      console.info('0200_ButtonM START  :' + JSON.stringify(strJson1));
      mirror_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[0];
      mirror_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[1];
      mirror_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[1] + ']')[0];
      let strJson2 = getInspectorByKey('top_mark');
      let top: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[1];
      let left: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[0];
      let strJson3 = getInspectorByKey('bottom_mark');
      let right: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson3).$rect + ']')[0] + ']')[0];
      left = Number.parseInt(left.toFixed(0));
      right = Math.floor(right);
      let width = right - left;
      expect(mirror_rect_left - left).assertLargerOrEqual(width - (original_rect_right - left) - 1);
      expect(mirror_rect_left - left).assertLessOrEqual(width - (original_rect_right - left) + 1);
      expect(original_rect_top - top - 30).assertLargerOrEqual(vp2px(120) - 1);
      expect(original_rect_top - top - 30).assertLessOrEqual(vp2px(120) + 1);
      expect(mirror_rect_top - top - 30).assertLargerOrEqual(vp2px(120) - 1);
      expect(mirror_rect_top - top - 30).assertLessOrEqual(vp2px(120) + 1);
      expect(((mirror_rect_left - left) + (mirror_rect_right - left)) / 2 - width / 2)
        .assertLargerOrEqual(vp2px(100) - 1);
      expect(((mirror_rect_left - left) + (mirror_rect_right - left)) / 2 - width / 2)
        .assertLessOrEqual(vp2px(100) + 1);
      console.info('ArkUIHDS_General_Layout_1100 END');
      done();
    });

    /**
     * @tc.name   ArkUIHDS_General_Layout_1200
     * @tc.number ArkUIHDS_General_Layout_1200
     * @tc.desc   test LengthMetrics type of markAnchor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUIHDS_General_Layout_1200', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_1200 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('0300_ImageM');
      console.info('0300_ImageM START  :' + JSON.stringify(strJson));
      original_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1];
      original_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[0];
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('0300_ImageM');
      console.info('0300_ImageM START  :' + JSON.stringify(strJson1));
      mirror_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[0];
      mirror_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[1];
      mirror_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[1] + ']')[0];
      let strJson2 = getInspectorByKey('top_mark');
      let top: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[1];
      let left: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[0];
      let strJson3 = getInspectorByKey('bottom_mark');
      let right: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson3).$rect + ']')[0] + ']')[0];
      left = Number.parseInt(left.toFixed(0));
      right = Math.floor(right);
      let width = right - left;
      expect(mirror_rect_left - left).assertLargerOrEqual(width - (original_rect_right - left) - 1);
      expect(mirror_rect_left - left).assertLessOrEqual(width - (original_rect_right - left) + 1);
      expect(original_rect_top - top - 60).assertLargerOrEqual(fp2px(200) - 1);
      expect(original_rect_top - top - 60).assertLessOrEqual(fp2px(200) + 1);
      expect(mirror_rect_top - top - 60).assertLargerOrEqual(fp2px(200) - 1);
      expect(mirror_rect_top - top - 60).assertLessOrEqual(fp2px(200) + 1);
      expect(((mirror_rect_left - left) + (mirror_rect_right - left)) / 2 - width / 2)
        .assertLargerOrEqual(fp2px(100) - 1);
      expect(((mirror_rect_left - left) + (mirror_rect_right - left)) / 2 - width / 2)
        .assertLessOrEqual(fp2px(100) + 1);
      console.info('ArkUIHDS_General_Layout_1200 END');
      done();
    });

    /**
     * @tc.name   ArkUIHDS_General_Layout_1300
     * @tc.number ArkUIHDS_General_Layout_1300
     * @tc.desc   test LengthMetrics type of markAnchor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUIHDS_General_Layout_1300', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_1300 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('0400_TextM');
      console.info('0400_TextM START  :' + JSON.stringify(strJson));
      original_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1];
      original_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[0];
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('0400_TextM');
      console.info('0400_TextM START  :' + JSON.stringify(strJson1));
      mirror_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[0];
      mirror_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[1];
      mirror_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[1] + ']')[0];
      let strJson2 = getInspectorByKey('top_mark');
      let top: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[1];
      let left: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[0];
      let strJson3 = getInspectorByKey('bottom_mark');
      let right: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson3).$rect + ']')[0] + ']')[0];
      left = Number.parseInt(left.toFixed(0));
      right = Math.floor(right);
      mirror_rect_left = Number.parseInt(mirror_rect_left.toFixed(0));
      mirror_rect_right = Math.floor(mirror_rect_right);
      original_rect_top = Math.floor(original_rect_top);
      original_rect_right = Math.floor(original_rect_right);
      mirror_rect_top = Math.floor(mirror_rect_top);
      let lpx400 = Math.floor(lpx2px(400));
      let lpx100 = Number.parseInt(lpx2px(100).toFixed(0));
      let width = right - left;
      expect(mirror_rect_left - left).assertLargerOrEqual(width - (original_rect_right - left) - 1);
      expect(mirror_rect_left - left).assertLessOrEqual(width - (original_rect_right - left) + 1);
      expect(original_rect_top - top - 90).assertLargerOrEqual(lpx400 - 1);
      expect(original_rect_top - top - 90).assertLessOrEqual(lpx400 + 1);
      expect(mirror_rect_top - top - 90).assertLargerOrEqual(lpx400 - 1);
      expect(mirror_rect_top - top - 90).assertLessOrEqual(lpx400 + 1);
      expect(((mirror_rect_left - left) + (mirror_rect_right - left)) / 2 - width / 2)
        .assertLargerOrEqual(lpx100 - 1);
      expect(((mirror_rect_left - left) + (mirror_rect_right - left)) / 2 - width / 2)
        .assertLessOrEqual(lpx100 + 1);
      console.info('ArkUIHDS_General_Layout_1300 END');
      done();
    });

    /**
     * @tc.name   ArkUIHDS_General_Layout_1400
     * @tc.number ArkUIHDS_General_Layout_1400
     * @tc.desc   test LengthMetrics type of markAnchor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUIHDS_General_Layout_1400', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_1400 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('0500_ButtonM');
      console.info('0500_ButtonM START  :' + JSON.stringify(strJson));
      original_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1];
      original_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[0];
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('0500_ButtonM');
      console.info('0500_ButtonM START  :' + JSON.stringify(strJson1));
      mirror_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[0];
      mirror_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[1];
      mirror_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[1] + ']')[0];
      let strJson2 = getInspectorByKey('top_mark');
      let top: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[1];
      let left: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[0];
      let strJson3 = getInspectorByKey('bottom_mark');
      let right: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson3).$rect + ']')[0] + ']')[0];
      left = Number.parseInt(left.toFixed(0));
      right = Math.floor(right);
      let width = right - left;
      expect(mirror_rect_left - left).assertLargerOrEqual(width - (original_rect_right - left) - 1);
      expect(mirror_rect_left - left).assertLessOrEqual(width - (original_rect_right - left) + 1);
      expect(original_rect_top - top - 120).assertLargerOrEqual(-1);
      expect(original_rect_top - top - 120).assertLessOrEqual(1);
      expect(mirror_rect_top - top - 120).assertLargerOrEqual(-1);
      expect(mirror_rect_top - top - 120).assertLessOrEqual(1);
      expect(((mirror_rect_left - left) + (mirror_rect_right - left)) / 2 - width / 2).assertLargerOrEqual(-1);
      expect(((mirror_rect_left - left) + (mirror_rect_right - left)) / 2 - width / 2).assertLessOrEqual(1);
      console.info('ArkUIHDS_General_Layout_1400 END');
      done();
    });

    /**
     * @tc.name   ArkUIHDS_General_Layout_1500
     * @tc.number ArkUIHDS_General_Layout_1500
     * @tc.desc   test LengthMetrics type of markAnchor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUIHDS_General_Layout_1500', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_1500 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('0600_ImageM');
      console.info('0600_ImageM START  :' + JSON.stringify(strJson));
      original_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1];
      original_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[0];
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('0600_ImageM');
      console.info('0600_ImageM START  :' + JSON.stringify(strJson1));
      mirror_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[0];
      mirror_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[1];
      mirror_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[1] + ']')[0];
      mirror_rect_bottom = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[1] + ']')[1];
      let strJson2 = getInspectorByKey('top_mark');
      let top: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[1];
      let left: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[0];
      let strJson3 = getInspectorByKey('bottom_mark');
      let right: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson3).$rect + ']')[0] + ']')[0];
      left = Number.parseInt(left.toFixed(0));
      right = Math.floor(right);
      let width = right - left;
      let mirrorwidth = mirror_rect_right - mirror_rect_left;
      let mirrorheight = mirror_rect_bottom - mirror_rect_top;
      original_rect_top = Math.floor(original_rect_top);
      mirror_rect_top = Math.floor(mirror_rect_top);
      expect((mirror_rect_left - left)).assertLargerOrEqual(width - (original_rect_right - left) - 1);
      expect((mirror_rect_left - left)).assertLessOrEqual(width - (original_rect_right - left) + 1);
      expect(original_rect_top - top - 150).assertLargerOrEqual(mirrorheight / 2 - 1);
      expect(original_rect_top - top - 150).assertLessOrEqual(mirrorheight / 2 + 1);
      expect(mirror_rect_top - top - 150).assertLargerOrEqual(mirrorheight / 2 - 1);
      expect(mirror_rect_top - top - 150).assertLessOrEqual(mirrorheight / 2 + 1);
      expect((mirror_rect_left - left) + (mirror_rect_right - left) - width).assertLargerOrEqual(mirrorwidth - 1);
      expect((mirror_rect_left - left) + (mirror_rect_right - left) - width).assertLessOrEqual(mirrorwidth + 1);
      console.info('ArkUIHDS_General_Layout_1500 END');
      done();
    });

    /**
     * @tc.name   ArkUIHDS_General_Layout_1600
     * @tc.number ArkUIHDS_General_Layout_1600
     * @tc.desc   test LengthMetrics type of markAnchor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUIHDS_General_Layout_1600', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_1600 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('0700_ImageM');
      console.info('0700_ImageM START  :' + JSON.stringify(strJson));
      original_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0];
      original_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1];
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('0700_ImageM');
      console.info('0700_ImageM START  :' + JSON.stringify(strJson1));
      mirror_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[0];
      mirror_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[1];
      let strJson2 = getInspectorByKey('top_mark');
      let top: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[1];
      let left: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[0];
      left = Number.parseInt(left.toFixed(0));
      expect(mirror_rect_left - left).assertLargerOrEqual(original_rect_left - left - 1);
      expect(mirror_rect_left - left).assertLessOrEqual(original_rect_left - left + 1);
      expect(original_rect_top - top - 180).assertLargerOrEqual(-1);
      expect(original_rect_top - top - 180).assertLessOrEqual(1);
      expect(mirror_rect_top - top - 180).assertLargerOrEqual(-1);
      expect(mirror_rect_top - top - 180).assertLessOrEqual(1);
      console.info('ArkUIHDS_General_Layout_1600 END');
      done();
    });

    /**
     * @tc.name   ArkUIHDS_General_Layout_1700
     * @tc.number ArkUIHDS_General_Layout_1700
     * @tc.desc   test LengthMetrics type of markAnchor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUIHDS_General_Layout_1700', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_1700 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('0800_ButtonM');
      console.info('0800_ButtonM START  :' + JSON.stringify(strJson));
      original_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0];
      original_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1];
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('0800_ButtonM');
      console.info('0800_ButtonM START  :' + JSON.stringify(strJson1));
      mirror_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[0];
      mirror_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[1];
      let strJson2 = getInspectorByKey('top_mark');
      let top: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[1];
      let left: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[0];
      left = Number.parseInt(left.toFixed(0));
      expect(mirror_rect_left - left).assertLargerOrEqual(original_rect_left - left - 1);
      expect(mirror_rect_left - left).assertLessOrEqual(original_rect_left - left + 1);
      expect(original_rect_top - top - 210).assertLargerOrEqual(-1);
      expect(original_rect_top - top - 210).assertLessOrEqual(1);
      expect(mirror_rect_top - top - 210).assertLargerOrEqual(-1);
      expect(mirror_rect_top - top - 210).assertLessOrEqual(1);
      console.info('ArkUIHDS_General_Layout_1700 END');
      done();
    });

    /**
     * @tc.name   ArkUIHDS_General_Layout_1800
     * @tc.number ArkUIHDS_General_Layout_1800
     * @tc.desc   test LengthMetrics type of markAnchor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUIHDS_General_Layout_1800', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_1800 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('0900_TextM');
      console.info('0900_TextM START  :' + JSON.stringify(strJson));
      original_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0];
      original_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1];
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('0900_TextM');
      console.info('0900_TextM START  :' + JSON.stringify(strJson1));
      mirror_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[0];
      mirror_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[1];
      let strJson2 = getInspectorByKey('top_mark');
      let top: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[1];
      let left: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[0];
      left = Number.parseInt(left.toFixed(0));
      expect(mirror_rect_left - left).assertLargerOrEqual(original_rect_left - left - 1);
      expect(mirror_rect_left - left).assertLessOrEqual(original_rect_left - left + 1);
      expect(original_rect_top - top - 240).assertLargerOrEqual(-1);
      expect(original_rect_top - top - 240).assertLessOrEqual(1);
      expect(mirror_rect_top - top - 240).assertLargerOrEqual(-1);
      expect(mirror_rect_top - top - 240).assertLessOrEqual(1);
      console.info('ArkUIHDS_General_Layout_1800 END');
      done();
    });

  })
}