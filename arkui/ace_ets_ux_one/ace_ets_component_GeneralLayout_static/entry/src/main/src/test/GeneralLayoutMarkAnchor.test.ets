'use static';
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
import router from '@ohos.router';
import { beforeEach, describe, expect, it, Level, beforeAll } from '../../../hypium/index';
import { i18n } from '@kit.LocalizationKit';
import display from '@ohos.display';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { UtilsTest, startAbility } from './Util.test'
import inspector from '@ohos.arkui.inspector'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from '../../ets/MainAbility/common/Utils';

const uiContext = AppStorage.get<UIContext>("uiContext");

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

    beforeAll(() => {
      console.info("GeneralLayoutMarkAnchorTest beforeEach start");
      
      await UtilsTest.startAbility("com.example.GeneralLayout.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/IndexMark',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get IndexMark state success " + JSON.stringify(pages));
        if (!("IndexMark" == pages.name)) {
          console.info("get IndexMark state success " + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await UtilsTest.msSleep(2000)
          // console.info("push IndexMark page success " + JSON.stringify(result));
        }

      } catch (err) {
        console.error("push IndexMark page error: " + err);
      }
    });

    
    
    
    /**
     * @tc.number   ArkUIHDS_General_Layout_static_1000
     * @tc.name     ArkUIHDS_General_Layout_static_1000
     * @tc.desc     ArkUIHDS_General_Layout_static_1000
     * @tc.level    Level.LEVEL1
     */
it('ArkUIHDS_General_Layout_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUIHDS_General_Layout_static_1000 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('0100_TextM');
      console.info('0100_TextM START  :' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      let rectInfo = Utils.getComponentRect('0100_TextM')
      original_rect_top = rectInfo.top;
      original_rect_right = rectInfo.right;
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('0100_TextM');
      console.info('0100_TextM START  :' + JSON.stringify(strJson1));
      let obj1 = JSON.parseJsonElement(strJson1);
      let rectInfo1 = Utils.getComponentRect('0100_TextM')
      mirror_rect_left = rectInfo1.left;
      mirror_rect_top = rectInfo1.top;
      mirror_rect_right = rectInfo1.right;
      let strJson2 = inspector.getInspectorByKey('top_mark');
      let obj2 = JSON.parseJsonElement(strJson2);
      let rectInfo2 = Utils.getComponentRect('top_mark')
      let top: number = rectInfo2.top;
      let left: number = rectInfo2.left;
      let strJson3 = inspector.getInspectorByKey('bottom_mark');
      let obj3 = JSON.parseJsonElement(strJson3);
      let rectInfo3 = Utils.getComponentRect('bottom_mark')
      let right: number = rectInfo3.left;
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
      console.info('ArkUIHDS_General_Layout_static_1000 END');
      done();
    });

    
    
    
    /**
     * @tc.number   ArkUIHDS_General_Layout_static_1100
     * @tc.name     ArkUIHDS_General_Layout_static_1100
     * @tc.desc     ArkUIHDS_General_Layout_static_1100
     * @tc.level    Level.LEVEL1
     */
it('ArkUIHDS_General_Layout_static_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUIHDS_General_Layout_static_1100 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('0200_ButtonM');
      console.info('0200_ButtonM START  :' + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      let rectInfo = Utils.getComponentRect('0200_ButtonM');
      original_rect_top = rectInfo.top;
      original_rect_right = rectInfo.right;
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('0200_ButtonM');
      console.info('0200_ButtonM START  :' + JSON.stringify(strJson1));
      let obj1 = JSON.parseJsonElement(strJson1);
      let rectInfo1 = Utils.getComponentRect('0200_ButtonM');
      mirror_rect_left = rectInfo1.left;
      mirror_rect_top = rectInfo1.top;
      mirror_rect_right = rectInfo1.right;
      let strJson2 = inspector.getInspectorByKey('top_mark');
      let obj2 = JSON.parseJsonElement(strJson2);
      let rectInfo2 = Utils.getComponentRect('top_mark');
      let top: number = rectInfo2.top;
      let left: number = rectInfo2.left;
      let strJson3 = inspector.getInspectorByKey('bottom_mark');
      let obj3 = JSON.parseJsonElement(strJson3);
      let rectInfo3 = Utils.getComponentRect('bottom_mark');
      let right: number = rectInfo3.left;
      left = Number.parseInt(left.toFixed(0));
      right = Math.floor(right);
      let width = right - left;
      const uiContext = AppStorage.get<UIContext>("uiContext");
      expect(mirror_rect_left - left).assertLargerOrEqual(width - (original_rect_right - left) - 1);
      expect(mirror_rect_left - left).assertLessOrEqual(width - (original_rect_right - left) + 1);
      expect(original_rect_top - top - 30).assertLargerOrEqual(uiContext!.vp2px(120) - 1);
      expect(original_rect_top - top - 30).assertLessOrEqual(uiContext!.vp2px(120) + 1);
      expect(mirror_rect_top - top - 30).assertLargerOrEqual(uiContext!.vp2px(120) - 1);
      expect(mirror_rect_top - top - 30).assertLessOrEqual(uiContext!.vp2px(120) + 1);
      expect(((mirror_rect_left - left) + (mirror_rect_right - left)) / 2 - width / 2)
        .assertLargerOrEqual(uiContext!.vp2px(100) - 1);
      expect(((mirror_rect_left - left) + (mirror_rect_right - left)) / 2 - width / 2)
        .assertLessOrEqual(uiContext!.vp2px(100) + 1);
      console.info('ArkUIHDS_General_Layout_static_1100 END');
      done();
    });

    
    
    
    /**
     * @tc.number   ArkUIHDS_General_Layout_static_1200
     * @tc.name     ArkUIHDS_General_Layout_static_1200
     * @tc.desc     ArkUIHDS_General_Layout_static_1200
     * @tc.level    Level.LEVEL1
     */
it('ArkUIHDS_General_Layout_static_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUIHDS_General_Layout_static_1200 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('0300_ImageM');
      console.info('0300_ImageM START  :' + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      let rectInfo = Utils.getComponentRect('0300_ImageM');
      original_rect_top = rectInfo.top;
      original_rect_right = rectInfo.right;
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('0300_ImageM');
      console.info('0300_ImageM START  :' + JSON.stringify(strJson1));
      let obj1 = JSON.parseJsonElement(strJson1);
      let rectInfo1 = Utils.getComponentRect('0300_ImageM');
      mirror_rect_left = rectInfo1.left;
      mirror_rect_top = rectInfo1.top;
      mirror_rect_right = rectInfo1.right;
      let strJson2 = inspector.getInspectorByKey('top_mark');
      let obj2 = JSON.parseJsonElement(strJson2);
      let rectInfo2 = Utils.getComponentRect('top_mark');
      let top: number = rectInfo2.top;
      let left: number = rectInfo2.left;
      let strJson3 = inspector.getInspectorByKey('bottom_mark');
      let obj3 = JSON.parseJsonElement(strJson3);
      let rectInfo3 = Utils.getComponentRect('bottom_mark');
      let right: number = rectInfo3.left;
      left = Number.parseInt(left.toFixed(0));
      right = Math.floor(right);
      let width = right - left;
      const uiContext = AppStorage.get<UIContext>("uiContext");
      expect(mirror_rect_left - left).assertLargerOrEqual(width - (original_rect_right - left) - 1);
      expect(mirror_rect_left - left).assertLessOrEqual(width - (original_rect_right - left) + 1);
      expect(original_rect_top - top - 60).assertLargerOrEqual(uiContext!.fp2px(200) - 1);
      expect(original_rect_top - top - 60).assertLessOrEqual(uiContext!.fp2px(200) + 1);
      expect(mirror_rect_top - top - 60).assertLargerOrEqual(uiContext!.fp2px(200) - 1);
      expect(mirror_rect_top - top - 60).assertLessOrEqual(uiContext!.fp2px(200) + 1);
      expect(((mirror_rect_left - left) + (mirror_rect_right - left)) / 2 - width / 2)
        .assertLargerOrEqual(uiContext!.fp2px(100) - 1);
      expect(((mirror_rect_left - left) + (mirror_rect_right - left)) / 2 - width / 2)
        .assertLessOrEqual(uiContext!.fp2px(100) + 1);
      console.info('ArkUIHDS_General_Layout_static_1200 END');
      done();
    });

    
    
    
    /**
     * @tc.number   ArkUIHDS_General_Layout_static_1300
     * @tc.name     ArkUIHDS_General_Layout_static_1300
     * @tc.desc     ArkUIHDS_General_Layout_static_1300
     * @tc.level    Level.LEVEL1
     */
it('ArkUIHDS_General_Layout_static_1300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUIHDS_General_Layout_static_1300 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('0400_TextM');
      console.info('0400_TextM START  :' + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      let rectInfo = Utils.getComponentRect('0400_TextM');
      original_rect_top = rectInfo.top;
      original_rect_right = rectInfo.right;
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('0400_TextM');
      console.info('0400_TextM START  :' + JSON.stringify(strJson1));
      let obj1 = JSON.parseJsonElement(strJson1);
      let rectInfo1 = Utils.getComponentRect('0400_TextM');
      mirror_rect_left = rectInfo1.left;
      mirror_rect_top = rectInfo1.top;
      mirror_rect_right = rectInfo1.right;
      let strJson2 = inspector.getInspectorByKey('top_mark');
      let obj2 = JSON.parseJsonElement(strJson2);
      let rectInfo2 = Utils.getComponentRect('top_mark');
      let top: number = rectInfo2.top;
      let left: number = rectInfo2.left;
      let strJson3 = inspector.getInspectorByKey('bottom_mark');
      let obj3 = JSON.parseJsonElement(strJson3);
      let rectInfo3 = Utils.getComponentRect('bottom_mark');
      let right: number = rectInfo3.left;
      left = Number.parseInt(left.toFixed(0));
      right = Math.floor(right);
      mirror_rect_left = Number.parseInt(mirror_rect_left.toFixed(0));
      mirror_rect_right = Math.floor(mirror_rect_right);
      original_rect_top = Math.floor(original_rect_top);
      original_rect_right = Math.floor(original_rect_right);
      mirror_rect_top = Math.floor(mirror_rect_top);
      const uiContext = AppStorage.get<UIContext>("uiContext");
      let lpx400 = Math.floor(uiContext!.lpx2px(400));
      let lpx100 = Number.parseInt(uiContext!.lpx2px(100).toFixed(0));
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
      console.info('ArkUIHDS_General_Layout_static_1300 END');
      done();
    });

    
    
    
    /**
     * @tc.number   ArkUIHDS_General_Layout_static_1400
     * @tc.name     ArkUIHDS_General_Layout_static_1400
     * @tc.desc     ArkUIHDS_General_Layout_static_1400
     * @tc.level    Level.LEVEL1
     */
it('ArkUIHDS_General_Layout_static_1400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUIHDS_General_Layout_static_1400 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('0500_ButtonM');
      console.info('0500_ButtonM START  :' + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      let rectInfo = Utils.getComponentRect('0500_ButtonM');
      original_rect_top = rectInfo.top;
      original_rect_right = rectInfo.right;
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('0500_ButtonM');
      console.info('0500_ButtonM START  :' + JSON.stringify(strJson1));
      let obj1 = JSON.parseJsonElement(strJson1);
      let rectInfo1 = Utils.getComponentRect('0500_ButtonM');
      mirror_rect_left = rectInfo1.left;
      mirror_rect_top = rectInfo1.top;
      mirror_rect_right = rectInfo1.right;
      let strJson2 = inspector.getInspectorByKey('top_mark');
      let obj2 = JSON.parseJsonElement(strJson2);
      let rectInfo2 = Utils.getComponentRect('top_mark');
      let top: number = rectInfo2.top;
      let left: number = rectInfo2.left;
      let strJson3 = inspector.getInspectorByKey('bottom_mark');
      let obj3 = JSON.parseJsonElement(strJson3);
      let rectInfo3 = Utils.getComponentRect('bottom_mark');
      let right: number = rectInfo3.left;
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
      console.info('ArkUIHDS_General_Layout_static_1400 END');
      done();
    });

    
    
    
    /**
     * @tc.number   ArkUIHDS_General_Layout_static_1500
     * @tc.name     ArkUIHDS_General_Layout_static_1500
     * @tc.desc     ArkUIHDS_General_Layout_static_1500
     * @tc.level    Level.LEVEL1
     */
it('ArkUIHDS_General_Layout_static_1500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUIHDS_General_Layout_static_1500 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('0600_ImageM');
      console.info('0600_ImageM START  :' + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      let rectInfo = Utils.getComponentRect('0600_ImageM');
      original_rect_top = rectInfo.top;
      original_rect_right = rectInfo.right;
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('0600_ImageM');
      console.info('0600_ImageM START  :' + JSON.stringify(strJson1));
      let obj1 = JSON.parseJsonElement(strJson1);
      let rectInfo1 = Utils.getComponentRect('0600_ImageM');
      mirror_rect_left = rectInfo1.left;
      mirror_rect_top = rectInfo1.top;
      mirror_rect_right = rectInfo1.right;
      mirror_rect_bottom = rectInfo1.bottom;
      let strJson2 = inspector.getInspectorByKey('top_mark');
      let obj2 = JSON.parseJsonElement(strJson2);
      let rectInfo2 = Utils.getComponentRect('top_mark');
      let top: number = rectInfo2.top;
      let left: number = rectInfo2.left;
      let strJson3 = inspector.getInspectorByKey('bottom_mark');
      let obj3 = JSON.parseJsonElement(strJson3);
      let rectInfo3 = Utils.getComponentRect('bottom_mark');
      let right: number = rectInfo3.left;
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
      console.info('ArkUIHDS_General_Layout_static_1500 END');
      done();
    });

    
    
    
    /**
     * @tc.number   ArkUIHDS_General_Layout_static_1600
     * @tc.name     ArkUIHDS_General_Layout_static_1600
     * @tc.desc     ArkUIHDS_General_Layout_static_1600
     * @tc.level    Level.LEVEL1
     */
it('ArkUIHDS_General_Layout_static_1600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUIHDS_General_Layout_static_1600 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('0700_ImageM');
      console.info('0700_ImageM START  :' + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      let rectInfo = Utils.getComponentRect('0700_ImageM');
      original_rect_left = rectInfo.left;
      original_rect_top = rectInfo.top;
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('0700_ImageM');
      console.info('0700_ImageM START  :' + JSON.stringify(strJson1));
      let obj1 = JSON.parseJsonElement(strJson1);
      let rectInfo1 = Utils.getComponentRect('0700_ImageM');
      mirror_rect_left = rectInfo1.left;
      mirror_rect_top = rectInfo1.top;
      let strJson2 = inspector.getInspectorByKey('top_mark');
      let obj2 = JSON.parseJsonElement(strJson2);
      let rectInfo2 = Utils.getComponentRect('top_mark');
      let top: number = rectInfo2.top;
      let left: number = rectInfo2.left;
      left = Number.parseInt(left.toFixed(0));
      expect(mirror_rect_left - left).assertLargerOrEqual(original_rect_left - left - 1);
      expect(mirror_rect_left - left).assertLessOrEqual(original_rect_left - left + 1);
      expect(original_rect_top - top - 180).assertLargerOrEqual(-1);
      expect(original_rect_top - top - 180).assertLessOrEqual(1);
      expect(mirror_rect_top - top - 180).assertLargerOrEqual(-1);
      expect(mirror_rect_top - top - 180).assertLessOrEqual(1);
      console.info('ArkUIHDS_General_Layout_static_1600 END');
      done();
    });

    
    
    
    /**
     * @tc.number   ArkUIHDS_General_Layout_static_1700
     * @tc.name     ArkUIHDS_General_Layout_static_1700
     * @tc.desc     ArkUIHDS_General_Layout_static_1700
     * @tc.level    Level.LEVEL1
     */
it('ArkUIHDS_General_Layout_static_1700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUIHDS_General_Layout_static_1700 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('0800_ButtonM');
      console.info('0800_ButtonM START  :' + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      let rectInfo = Utils.getComponentRect('0800_ButtonM');
      original_rect_left = rectInfo.left;
      original_rect_top = rectInfo.top;
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('0800_ButtonM');
      console.info('0800_ButtonM START  :' + JSON.stringify(strJson1));
      let obj1 = JSON.parseJsonElement(strJson1);
      let rectInfo1 = Utils.getComponentRect('0800_ButtonM');
      mirror_rect_left = rectInfo1.left;
      mirror_rect_top = rectInfo1.top;
      let strJson2 = inspector.getInspectorByKey('top_mark');
      let obj2 = JSON.parseJsonElement(strJson2);
      let rectInfo2 = Utils.getComponentRect('top_mark');
      let top: number = rectInfo2.top;
      let left: number = rectInfo2.left;
      left = Number.parseInt(left.toFixed(0));
      expect(mirror_rect_left - left).assertLargerOrEqual(original_rect_left - left - 1);
      expect(mirror_rect_left - left).assertLessOrEqual(original_rect_left - left + 1);
      expect(original_rect_top - top - 210).assertLargerOrEqual(-1);
      expect(original_rect_top - top - 210).assertLessOrEqual(1);
      expect(mirror_rect_top - top - 210).assertLargerOrEqual(-1);
      expect(mirror_rect_top - top - 210).assertLessOrEqual(1);
      console.info('ArkUIHDS_General_Layout_static_1700 END');
      done();
    });

    
    
    
    /**
     * @tc.number   ArkUIHDS_General_Layout_static_1800
     * @tc.name     ArkUIHDS_General_Layout_static_1800
     * @tc.desc     ArkUIHDS_General_Layout_static_1800
     * @tc.level    Level.LEVEL1
     */
it('ArkUIHDS_General_Layout_static_1800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUIHDS_General_Layout_static_1800 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('0900_TextM');
      console.info('0900_TextM START  :' + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      let rectInfo = Utils.getComponentRect('0900_TextM');
      original_rect_left = rectInfo.left;
      original_rect_top = rectInfo.top;
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('0900_TextM');
      console.info('0900_TextM START  :' + JSON.stringify(strJson1));
      let obj1 = JSON.parseJsonElement(strJson1);
      let rectInfo1 = Utils.getComponentRect('0900_TextM');
      mirror_rect_left = rectInfo1.left;
      mirror_rect_top = rectInfo1.top;
      let strJson2 = inspector.getInspectorByKey('top_mark');
      let obj2 = JSON.parseJsonElement(strJson2);
      let rectInfo2 = Utils.getComponentRect('top_mark');
      let top: number = rectInfo2.top;
      let left: number = rectInfo2.left;
      left = Number.parseInt(left.toFixed(0));
      expect(mirror_rect_left - left).assertLargerOrEqual(original_rect_left - left - 1);
      expect(mirror_rect_left - left).assertLessOrEqual(original_rect_left - left + 1);
      expect(original_rect_top - top - 240).assertLargerOrEqual(-1);
      expect(original_rect_top - top - 240).assertLessOrEqual(1);
      expect(mirror_rect_top - top - 240).assertLargerOrEqual(-1);
      expect(mirror_rect_top - top - 240).assertLessOrEqual(1);
      console.info('ArkUIHDS_General_Layout_static_1800 END');
      done();
    });

  })
}