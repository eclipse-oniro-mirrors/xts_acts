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

export default function GeneralLayoutPositionTest() {
  describe('GeneralLayoutPositionTest', () => {

    let screenWidth = display.getDefaultDisplaySync().width;
    let screenHeight = display.getDefaultDisplaySync().height;
    let original_rect_left: number;
    let original_rect_top: number;
    let original_rect_bottom: number;
    let original_rect_right: number;
    let mirror_rect_left: number;
    let mirror_rect_top: number;
    let mirror_rect_bottom: number;
    let mirror_rect_right: number;

    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'TestAbility/pages/Index',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Index state success " + JSON.stringify(pages));
        if (!("Index" == pages.name)) {
          console.info("get Index state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push Index page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Index page error: " + err);
      }
      done();
    });

    /*
     *@tc.number     : ArkUIHDS_General_Layout_0100
     *@tc.name       : ArkUIHDS_General_Layout_0100
     *@tc.desc       : test LengthMetrics type of position
     *@tc.size       : MediumTest
     *@tc.type       : Function
     *@tc.level      : Level 1
     */
    it('ArkUIHDS_General_Layout_0100', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_0100 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('0100_ButtonA');
      original_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0];
      original_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1];
      original_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[0];
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('0100_ButtonA');
      mirror_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[1] + ']')[0];
      mirror_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[1];
      let strJson2 = getInspectorByKey('top');
      let top: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[1];
      let left: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[0];
      let strJson3 = getInspectorByKey('bottom');
      let right: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson3).$rect + ']')[0] + ']')[0];
      let width = right - left;
      expect(original_rect_right - left).assertLargerOrEqual(width - vp2px(100) - 1);
      expect(original_rect_right - left).assertLessOrEqual(width - vp2px(100) + 1);
      expect(mirror_rect_right - left).assertLargerOrEqual(width - (original_rect_left - left) - 1);
      expect(mirror_rect_right - left).assertLessOrEqual(width - (original_rect_left - left) + 1);
      expect(original_rect_top - top).assertLargerOrEqual(vp2px(100) - 1);
      expect(original_rect_top - top).assertLessOrEqual(vp2px(100) + 1);
      expect(mirror_rect_top - top).assertLargerOrEqual(vp2px(100) - 1);
      expect(mirror_rect_top - top).assertLessOrEqual(vp2px(100) + 1);
      console.info('ArkUIHDS_General_Layout_0100 END');
      done();
    });

    /*
     *@tc.number     : ArkUIHDS_General_Layout_0200
     *@tc.name       : ArkUIHDS_General_Layout_0200
     *@tc.desc       : test LengthMetrics type of position
     *@tc.size       : MediumTest
     *@tc.type       : Function
     *@tc.level      : Level 1
     */
    it('ArkUIHDS_General_Layout_0200', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_0200 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('0200_TextA');
      original_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0];
      original_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1];
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('0200_TextA');
      mirror_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[1] + ']')[0];
      mirror_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[1];
      let strJson2 = getInspectorByKey('top');
      let top: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[1];
      let left: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[0];
      let strJson3 = getInspectorByKey('bottom');
      let right: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson3).$rect + ']')[0] + ']')[0];
      let width = right - left;
      expect(original_rect_left - left).assertLargerOrEqual(99);
      expect(original_rect_left - left).assertLessOrEqual(101);
      expect(mirror_rect_right - left).assertLargerOrEqual(width - (original_rect_left - left) - 1);
      expect(mirror_rect_right - left).assertLessOrEqual(width - (original_rect_left - left) + 1);
      expect(original_rect_top - top).assertLargerOrEqual(99);
      expect(original_rect_top - top).assertLessOrEqual(101);
      expect(mirror_rect_top - top).assertLargerOrEqual(99);
      expect(mirror_rect_top - top).assertLessOrEqual(101);
      console.info('ArkUIHDS_General_Layout_0200 END');
      done();
    });

    /*
     *@tc.number     : ArkUIHDS_General_Layout_0300
     *@tc.name       : ArkUIHDS_General_Layout_0300
     *@tc.desc       : test LengthMetrics type of position
     *@tc.size       : MediumTest
     *@tc.type       : Function
     *@tc.level      : Level 1
     */
    it('ArkUIHDS_General_Layout_0300', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_0300 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('0300_ImageA');
      original_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0];
      original_rect_bottom = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[1];
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('0300_ImageA');
      mirror_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[1] + ']')[0];
      mirror_rect_bottom = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[1] + ']')[1];
      let strJson2 = getInspectorByKey('top');
      let left: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[0];
      let strJson3 = getInspectorByKey('bottom');
      let right: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson3).$rect + ']')[0] + ']')[0];
      let bottom: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson3).$rect + ']')[0] + ']')[1];
      let width = right - left;
      expect(original_rect_left - left).assertLargerOrEqual(fp2px(300) - 1);
      expect(original_rect_left - left).assertLessOrEqual(fp2px(300) + 1);
      expect(mirror_rect_right - left).assertLargerOrEqual(width - (original_rect_left - left) - 1);
      expect(mirror_rect_right - left).assertLessOrEqual(width - (original_rect_left - left) + 1);
      expect(bottom - original_rect_bottom).assertLargerOrEqual(fp2px(300) - 1);
      expect(bottom - original_rect_bottom).assertLessOrEqual(fp2px(300) + 1);
      expect(bottom - mirror_rect_bottom).assertLargerOrEqual(fp2px(300) - 1);
      expect(bottom - mirror_rect_bottom).assertLessOrEqual(fp2px(300) + 1);
      console.info('ArkUIHDS_General_Layout_0300 END');
      done();
    });

    /*
     *@tc.number     : ArkUIHDS_General_Layout_0400
     *@tc.name       : ArkUIHDS_General_Layout_0400
     *@tc.desc       : test LengthMetrics type of position
     *@tc.size       : MediumTest
     *@tc.type       : Function
     *@tc.level      : Level 1
     */
    it('ArkUIHDS_General_Layout_0400', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_0400 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('0400_TextB');
      original_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0];
      original_rect_bottom = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[1];
      original_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[0];
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('0400_TextB');
      mirror_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[1] + ']')[0];
      mirror_rect_bottom = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[1] + ']')[1];
      let strJson2 = getInspectorByKey('top');
      let left: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[0];
      let strJson3 = getInspectorByKey('bottom');
      let right: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson3).$rect + ']')[0] + ']')[0];
      let bottom: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson3).$rect + ']')[0] + ']')[1];
      let lpx400 = Number.parseInt(lpx2px(400).toFixed(0));
      let lpx400a = Math.ceil(lpx2px(400));
      bottom = Math.floor(bottom);
      left = Number.parseInt(left.toFixed(0));
      right = Math.floor(right);
      mirror_rect_bottom = Math.floor(mirror_rect_bottom);
      mirror_rect_right = Math.floor(mirror_rect_right);
      original_rect_bottom = Math.floor(original_rect_bottom);
      original_rect_right = Math.floor(original_rect_right);
      original_rect_left = Number.parseInt(original_rect_left.toFixed(0));
      let width = right - left;
      expect(Number.parseInt((width - (original_rect_right - left)).toFixed(0))).assertLargerOrEqual(lpx400 - 1);
      expect(Number.parseInt((width - (original_rect_right - left)).toFixed(0))).assertLessOrEqual(lpx400 + 1);
      expect(mirror_rect_right - left).assertLargerOrEqual(width - (original_rect_left - left) - 1);
      expect(mirror_rect_right - left).assertLessOrEqual(width - (original_rect_left - left) + 1);
      expect(Number.parseInt((bottom - original_rect_bottom).toFixed(0))).assertLargerOrEqual(lpx400 - 1);
      expect(Number.parseInt((bottom - original_rect_bottom).toFixed(0))).assertLessOrEqual(lpx400 + 1);
      expect(Number.parseInt((bottom - mirror_rect_bottom).toFixed(0))).assertLargerOrEqual(lpx400 - 1);
      expect(Number.parseInt((bottom - mirror_rect_bottom).toFixed(0))).assertLessOrEqual(lpx400 + 1);
      console.info('ArkUIHDS_General_Layout_0400 END');
      done();
    });

    /*
     *@tc.number     : ArkUIHDS_General_Layout_0500
     *@tc.name       : ArkUIHDS_General_Layout_0500
     *@tc.desc       : test LengthMetrics type of position
     *@tc.size       : MediumTest
     *@tc.type       : Function
     *@tc.level      : Level 1
     */
    it('ArkUIHDS_General_Layout_0500', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_0500 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('0500_ButtonB');
      original_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0];
      original_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1];
      original_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[0];
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('0500_ButtonB');
      mirror_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[1] + ']')[0];
      mirror_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[1];
      let strJson2 = getInspectorByKey('top');
      let top: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[1];
      let left: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[0];
      let strJson3 = getInspectorByKey('bottom');
      let right: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson3).$rect + ']')[0] + ']')[0];
      let width = right - left;
      expect(original_rect_left - left).assertEqual(0);
      expect(mirror_rect_right - left).assertLargerOrEqual(width - (original_rect_left - left) - 1);
      expect(mirror_rect_right - left).assertLessOrEqual(width - (original_rect_left - left) + 1);
      expect(original_rect_top - top).assertEqual(0);
      expect(mirror_rect_top - top).assertEqual(0);
      console.info('ArkUIHDS_General_Layout_0500 END');
      done();
    });

    /*
     *@tc.number     : ArkUIHDS_General_Layout_0600
     *@tc.name       : ArkUIHDS_General_Layout_0600
     *@tc.desc       : test LengthMetrics type of position
     *@tc.size       : MediumTest
     *@tc.type       : Function
     *@tc.level      : Level 1
     */
    it('ArkUIHDS_General_Layout_0600', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_0600 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('0600_ImageB');
      original_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0];
      original_rect_bottom = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[1];
      original_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[0];
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('0600_ImageB');
      mirror_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[1] + ']')[0];
      mirror_rect_bottom = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[1] + ']')[1];
      let strJson2 = getInspectorByKey('top');
      let top: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[1];
      let left: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[0];
      let strJson3 = getInspectorByKey('bottom');
      let right: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson3).$rect + ']')[0] + ']')[0];
      let bottom: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson3).$rect + ']')[0] + ']')[1];
      let width = right - left;
      original_rect_bottom = Math.floor(original_rect_bottom);
      mirror_rect_bottom = Math.floor(mirror_rect_bottom);
      bottom = Math.floor(bottom);
      expect(Math.floor(width - (original_rect_right - left))).assertLargerOrEqual(Math.floor(width / 2) - 1);
      expect(Math.floor(width - (original_rect_right - left))).assertLessOrEqual(Math.floor(width / 2) + 1);
      expect(Math.floor(mirror_rect_right - left))
        .assertLargerOrEqual(Math.floor(width - (original_rect_left - left) - 1));
      expect(Math.floor(mirror_rect_right - left))
        .assertLessOrEqual(Math.floor(width - (original_rect_left - left) + 1));
      expect(original_rect_bottom).assertLargerOrEqual(Math.floor((top + bottom) / 2) - 1);
      expect(original_rect_bottom).assertLessOrEqual(Math.floor((top + bottom) / 2) + 1);
      expect(mirror_rect_bottom).assertLargerOrEqual(Math.floor((top + bottom) / 2) - 1);
      expect(mirror_rect_bottom).assertLessOrEqual(Math.floor((top + bottom) / 2) + 1);
      console.info('ArkUIHDS_General_Layout_0600 END');
      done();
    });

    /*
     *@tc.number     : ArkUIHDS_General_Layout_0700
     *@tc.name       : ArkUIHDS_General_Layout_0700
     *@tc.desc       : test LengthMetrics type of position
     *@tc.size       : MediumTest
     *@tc.type       : Function
     *@tc.level      : Level 1
     */
    it('ArkUIHDS_General_Layout_0700', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_0700 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('0700_TextC');
      original_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0];
      original_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1];
      original_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[0];
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('0700_TextC');
      mirror_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[0];
      mirror_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[1];
      mirror_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[1] + ']')[0];
      let strJson2 = getInspectorByKey('top');
      let top: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[1];
      let left: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[0];
      let strJson3 = getInspectorByKey('bottom');
      let bottom_rect_left: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson3).$rect + ']')[0] + ']')[0];
      // position is invalid.
      expect(original_rect_left - mirror_rect_left).assertEqual(0);
      expect(Math.floor(Math.abs((mirror_rect_left - left) - (bottom_rect_left - mirror_rect_right))) <= 1).assertTrue();
      expect(original_rect_top - top).assertEqual(0);
      expect(mirror_rect_top - top).assertEqual(0);
      console.info('ArkUIHDS_General_Layout_0700 END');
      done();
    });

    /*
     *@tc.number     : ArkUIHDS_General_Layout_0800
     *@tc.name       : ArkUIHDS_General_Layout_0800
     *@tc.desc       : test LengthMetrics type of position
     *@tc.size       : MediumTest
     *@tc.type       : Function
     *@tc.level      : Level 1
     */
    it('ArkUIHDS_General_Layout_0800', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_0800 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('0800_ButtonC');
      original_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0];
      original_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1];
      original_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[0];
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('0800_ButtonC');
      mirror_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[0];
      mirror_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[1];
      mirror_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[1] + ']')[0];
      let strJson2 = getInspectorByKey('top');
      let top: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[1];
      let left: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[0];
      let strJson3 = getInspectorByKey('bottom');
      let bottom_rect_left: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson3).$rect + ']')[0] + ']')[0];
      let strJson4 = getInspectorByKey('0700_TextC');
      let button07_rect_bottom: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson4).$rect + ']')[1] + ']')[1];
      // position is invalid.
      expect(original_rect_left - mirror_rect_left).assertEqual(0);
      expect(Math.floor(Math.abs((mirror_rect_left - left) - (bottom_rect_left - mirror_rect_right))) <= 1).assertTrue();
      expect(original_rect_top - mirror_rect_top).assertEqual(0);
      expect(Math.floor(Math.abs((mirror_rect_top - button07_rect_bottom))) <= 1).assertTrue();
      console.info('ArkUIHDS_General_Layout_0800 END');
      done();
    });

    /*
     *@tc.number     : ArkUIHDS_General_Layout_0900
     *@tc.name       : ArkUIHDS_General_Layout_0900
     *@tc.desc       : test LengthMetrics type of position
     *@tc.size       : MediumTest
     *@tc.type       : Function
     *@tc.level      : Level 1
     */
    it('ArkUIHDS_General_Layout_0900', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_0900 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('0900_ImageC');
      original_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0];
      original_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1];
      original_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[0];
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('0900_ImageC');
      mirror_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[1] + ']')[0];
      mirror_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[1];
      let strJson2 = getInspectorByKey('top');
      let top: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[1];
      let left: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[0];
      let strJson3 = getInspectorByKey('bottom');
      let right: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson3).$rect + ']')[0] + ']')[0];
      let width = right - left;
      expect(original_rect_left - left).assertEqual(0);
      expect(mirror_rect_right - left).assertLargerOrEqual(width - 1);
      expect(mirror_rect_right - left).assertLessOrEqual(width + 1);
      expect(original_rect_top - top).assertEqual(0);
      expect(mirror_rect_top - top).assertEqual(0);
      console.info('ArkUIHDS_General_Layout_0900 END');
      done();
    });

  })
}