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

    beforeAll(() => {
      console.info("GeneralLayoutPositionTest beforeEach start");
      
      await UtilsTest.startAbility("com.example.GeneralLayout.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/index/Index',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Index state success " + JSON.stringify(pages));
        if (!("Index" == pages.name)) {
          console.info("get Index state success " + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          // console.info("push Index page success " + JSON.stringify(result));
        }
        await UtilsTest.msSleep(2000)
      } catch (err) {
        console.error("push Index page error: " + err);
      }
    });

    
    
    
    /**
     * @tc.number   ArkUIHDS_General_Layout_static_0100
     * @tc.name     ArkUIHDS_General_Layout_static_0100
     * @tc.desc     ArkUIHDS_General_Layout_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUIHDS_General_Layout_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUIHDS_General_Layout_static_0100 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('0100_ButtonA');
      let obj = JSON.parseJsonElement(strJson);
      let rectInfo = Utils.getComponentRect('0100_ButtonA')
      original_rect_left = rectInfo.left;
      original_rect_top = rectInfo.top;
      original_rect_right = rectInfo.right;
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('0100_ButtonA');
      let obj1 = JSON.parseJsonElement(strJson1);
      let rectInfo1 = Utils.getComponentRect('0100_ButtonA')
      mirror_rect_right = rectInfo1.right;
      mirror_rect_top = rectInfo1.top;
      let strJson2 = inspector.getInspectorByKey('top');
      let obj2 = JSON.parseJsonElement(strJson2);
      let rectInfo2 = Utils.getComponentRect('top')
      let top: number = rectInfo2.top;
      let left: number = rectInfo2.left;
      let strJson3 = inspector.getInspectorByKey('bottom');
      let obj3 = JSON.parseJsonElement(strJson3);
      let rectInfo3 = Utils.getComponentRect('bottom')
      let right: number = rectInfo3.left;
      let width = right - left;
      const uiContext = AppStorage.get<UIContext>("uiContext");
      expect(original_rect_right - left).assertLargerOrEqual(width - uiContext!.vp2px(100) - 1);
      expect(original_rect_right - left).assertLessOrEqual(width - uiContext!.vp2px(100) + 1);
      expect(mirror_rect_right - left).assertLargerOrEqual(width - (original_rect_left - left) - 1);
      expect(mirror_rect_right - left).assertLessOrEqual(width - (original_rect_left - left) + 1);
      expect(original_rect_top - top).assertLargerOrEqual(uiContext!.vp2px(100) - 1);
      expect(original_rect_top - top).assertLessOrEqual(uiContext!.vp2px(100) + 1);
      expect(mirror_rect_top - top).assertLargerOrEqual(uiContext!.vp2px(100) - 1);
      expect(mirror_rect_top - top).assertLessOrEqual(uiContext!.vp2px(100) + 1);
      console.info('ArkUIHDS_General_Layout_static_0100 END');
      done();
    });

    
    
    
    /**
     * @tc.number   ArkUIHDS_General_Layout_static_0200
     * @tc.name     ArkUIHDS_General_Layout_static_0200
     * @tc.desc     ArkUIHDS_General_Layout_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUIHDS_General_Layout_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUIHDS_General_Layout_static_0200 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('0200_TextA');
      let obj = JSON.parseJsonElement(strJson);
      let rectInfo = Utils.getComponentRect('0200_TextA')
      original_rect_left = rectInfo.left;
      original_rect_top = rectInfo.top;
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('0200_TextA');
      let obj1 = JSON.parseJsonElement(strJson1);
      let rectInfo1 = Utils.getComponentRect('0200_TextA')
      mirror_rect_right = rectInfo1.right;
      mirror_rect_top = rectInfo1.top;
      let strJson2 = inspector.getInspectorByKey('top');
      let obj2 = JSON.parseJsonElement(strJson2);
      let rectInfo2 = Utils.getComponentRect('top')
      let top: number = rectInfo2.top;
      let left: number = rectInfo2.left;
      let strJson3 = inspector.getInspectorByKey('bottom');
      let obj3 = JSON.parseJsonElement(strJson3);
      let rectInfo3 = Utils.getComponentRect('bottom')
      let right: number = rectInfo3.left;
      let width = right - left;
      expect(original_rect_left - left).assertLargerOrEqual(99);
      expect(original_rect_left - left).assertLessOrEqual(101);
      expect(mirror_rect_right - left).assertLargerOrEqual(width - (original_rect_left - left) - 1);
      expect(mirror_rect_right - left).assertLessOrEqual(width - (original_rect_left - left) + 1);
      expect(original_rect_top - top).assertLargerOrEqual(99);
      expect(original_rect_top - top).assertLessOrEqual(101);
      expect(mirror_rect_top - top).assertLargerOrEqual(99);
      expect(mirror_rect_top - top).assertLessOrEqual(101);
      console.info('ArkUIHDS_General_Layout_static_0200 END');
      done();
    });

    
    
    
    /**
     * @tc.number   ArkUIHDS_General_Layout_static_0300
     * @tc.name     ArkUIHDS_General_Layout_static_0300
     * @tc.desc     ArkUIHDS_General_Layout_static_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUIHDS_General_Layout_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUIHDS_General_Layout_static_0300 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('0300_ImageA');
      let obj = JSON.parseJsonElement(strJson);
      let rectInfo = Utils.getComponentRect('0300_ImageA')
      original_rect_left = rectInfo.left;
      original_rect_bottom = rectInfo.bottom;
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('0300_ImageA');
      let obj1 = JSON.parseJsonElement(strJson1);
      let rectInfo1 = Utils.getComponentRect('0300_ImageA')
      mirror_rect_right = rectInfo1.right;
      mirror_rect_bottom = rectInfo1.bottom;
      let strJson2 = inspector.getInspectorByKey('top');
      let obj2 = JSON.parseJsonElement(strJson2);
      let rectInfo2 = Utils.getComponentRect('top')
      let left: number = rectInfo2.left;
      let strJson3 = inspector.getInspectorByKey('bottom');
      let obj3 = JSON.parseJsonElement(strJson3);
      let rectInfo3 = Utils.getComponentRect('bottom')
      let right: number = rectInfo3.left;
      let bottom: number = rectInfo3.top;
      let width = right - left;
      const uiContext = AppStorage.get<UIContext>("uiContext");
      expect(original_rect_left - left).assertLargerOrEqual(uiContext!.fp2px(300) - 1);
      expect(original_rect_left - left).assertLessOrEqual(uiContext!.fp2px(300) + 1);
      expect(mirror_rect_right - left).assertLargerOrEqual(width - (original_rect_left - left) - 1);
      expect(mirror_rect_right - left).assertLessOrEqual(width - (original_rect_left - left) + 1);
      expect(bottom - original_rect_bottom).assertLargerOrEqual(uiContext!.fp2px(300) - 1);
      expect(bottom - original_rect_bottom).assertLessOrEqual(uiContext!.fp2px(300) + 1);
      expect(bottom - mirror_rect_bottom).assertLargerOrEqual(uiContext!.fp2px(300) - 1);
      expect(bottom - mirror_rect_bottom).assertLessOrEqual(uiContext!.fp2px(300) + 1);
      console.info('ArkUIHDS_General_Layout_static_0300 END');
      done();
    });

    
    
    
    /**
     * @tc.number   ArkUIHDS_General_Layout_static_0400
     * @tc.name     ArkUIHDS_General_Layout_static_0400
     * @tc.desc     ArkUIHDS_General_Layout_static_0400
     * @tc.level    Level.LEVEL1
     */
it('ArkUIHDS_General_Layout_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUIHDS_General_Layout_static_0400 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('0400_TextB');
      let obj = JSON.parseJsonElement(strJson);
      let rectInfo = Utils.getComponentRect('0400_TextB')
      original_rect_left = rectInfo.left;
      original_rect_bottom = rectInfo.bottom;
      original_rect_right = rectInfo.right;
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('0400_TextB');
      let obj1 = JSON.parseJsonElement(strJson1);
      let rectInfo1 = Utils.getComponentRect('0400_TextB')
      mirror_rect_right = rectInfo1.right;
      mirror_rect_bottom = rectInfo1.bottom;
      let strJson2 = inspector.getInspectorByKey('top');
      let obj2 = JSON.parseJsonElement(strJson2);
      let rectInfo2 = Utils.getComponentRect('top')
      let left: number = rectInfo2.left;
      let strJson3 = inspector.getInspectorByKey('bottom');
      let obj3 = JSON.parseJsonElement(strJson3);
      let rectInfo3 = Utils.getComponentRect('bottom')
      let right: number = rectInfo3.left;
      let bottom: number = rectInfo3.top;
      const uiContext = AppStorage.get<UIContext>("uiContext");
      let lpx400 = Number.parseInt(uiContext!.lpx2px(400).toFixed(0));
      let lpx400a = Math.ceil(uiContext!.lpx2px(400));
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
      console.info('ArkUIHDS_General_Layout_static_0400 END');
      done();
    });

    
    
    
    /**
     * @tc.number   ArkUIHDS_General_Layout_static_0500
     * @tc.name     ArkUIHDS_General_Layout_static_0500
     * @tc.desc     ArkUIHDS_General_Layout_static_0500
     * @tc.level    Level.LEVEL1
     */
it('ArkUIHDS_General_Layout_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUIHDS_General_Layout_static_0500 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('0500_ButtonB');
      let obj = JSON.parseJsonElement(strJson);
      let rectInfo = Utils.getComponentRect('0500_ButtonB')
      original_rect_left = rectInfo.left;
      original_rect_top = rectInfo.top;
      original_rect_right = rectInfo.right;
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('0500_ButtonB');
      let obj1 = JSON.parseJsonElement(strJson1);
      let rectInfo1 = Utils.getComponentRect('0500_ButtonB')
      mirror_rect_right = rectInfo1.right;
      mirror_rect_top = rectInfo1.top;
      let strJson2 = inspector.getInspectorByKey('top');
      let obj2 = JSON.parseJsonElement(strJson2);
      let rectInfo2 = Utils.getComponentRect('top')
      let top: number = rectInfo2.top;
      let left: number = rectInfo2.left;
      let strJson3 = inspector.getInspectorByKey('bottom');
      let obj3 = JSON.parseJsonElement(strJson3);
      let rectInfo3 = Utils.getComponentRect('bottom')
      let right: number = rectInfo3.left;
      let width = right - left;
      expect(original_rect_left - left).assertEqual(0);
      expect(mirror_rect_right - left).assertLargerOrEqual(width - (original_rect_left - left) - 1);
      expect(mirror_rect_right - left).assertLessOrEqual(width - (original_rect_left - left) + 1);
      expect(original_rect_top - top).assertEqual(0);
      expect(mirror_rect_top - top).assertEqual(0);
      console.info('ArkUIHDS_General_Layout_static_0500 END');
      done();
    });

    
    
    
    /**
     * @tc.number   ArkUIHDS_General_Layout_static_0600
     * @tc.name     ArkUIHDS_General_Layout_static_0600
     * @tc.desc     ArkUIHDS_General_Layout_static_0600
     * @tc.level    Level.LEVEL1
     */
it('ArkUIHDS_General_Layout_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUIHDS_General_Layout_static_0600 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('0600_ImageB');
      let obj = JSON.parseJsonElement(strJson);
      let rectInfo = Utils.getComponentRect('0600_ImageB')
      original_rect_left = rectInfo.left;
      original_rect_bottom = rectInfo.bottom;
      original_rect_right = rectInfo.right;
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('0600_ImageB');
      let obj1 = JSON.parseJsonElement(strJson1);
      let rectInfo1 = Utils.getComponentRect('0600_ImageB')
      mirror_rect_right = rectInfo1.right;
      mirror_rect_bottom = rectInfo1.bottom;
      let strJson2 = inspector.getInspectorByKey('top');
      let obj2 = JSON.parseJsonElement(strJson2);
      let rectInfo2 = Utils.getComponentRect('top')
      let top: number = rectInfo2.top;
      let left: number = rectInfo2.left;
      let strJson3 = inspector.getInspectorByKey('bottom');
      let obj3 = JSON.parseJsonElement(strJson3);
      let rectInfo3 = Utils.getComponentRect('bottom')
      let right: number = rectInfo3.left;
      let bottom: number = rectInfo3.top;
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
      console.info('ArkUIHDS_General_Layout_static_0600 END');
      done();
    });

    
    
    
    /**
     * @tc.number   ArkUIHDS_General_Layout_static_0700
     * @tc.name     ArkUIHDS_General_Layout_static_0700
     * @tc.desc     ArkUIHDS_General_Layout_static_0700
     * @tc.level    Level.LEVEL1
     */
it('ArkUIHDS_General_Layout_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUIHDS_General_Layout_static_0700 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('0700_TextC');
      let obj = JSON.parseJsonElement(strJson);
      let rectInfo = Utils.getComponentRect('0700_TextC')
      original_rect_left = rectInfo.left;
      original_rect_top = rectInfo.top;
      original_rect_right = rectInfo.right;
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('0700_TextC');
      let obj1 = JSON.parseJsonElement(strJson1);
      let rectInfo1 = Utils.getComponentRect('0700_TextC')
      mirror_rect_left = rectInfo1.left;
      mirror_rect_top = rectInfo1.top;
      mirror_rect_right = rectInfo1.right;
      let strJson2 = inspector.getInspectorByKey('top');
      let obj2 = JSON.parseJsonElement(strJson2);
      let rectInfo2 = Utils.getComponentRect('top')
      let top: number = rectInfo2.top;
      let left: number = rectInfo2.left;
      let strJson3 = inspector.getInspectorByKey('bottom');
      let obj3 = JSON.parseJsonElement(strJson3);
      let rectInfo3 = Utils.getComponentRect('bottom')
      let bottom_rect_left: number = rectInfo3.left;
      // position is invalid.
      expect(original_rect_left - mirror_rect_left).assertEqual(0);
      // 异常值
      // expect(Math.floor(Math.abs((mirror_rect_left - left) - (bottom_rect_left - mirror_rect_right))) <=
      // 1).assertTrue();
      expect(original_rect_top - top).assertEqual(0);
      expect(mirror_rect_top - top).assertEqual(0);
      console.info('ArkUIHDS_General_Layout_static_0700 END');
      done();
    });

    
    
    
    /**
     * @tc.number   ArkUIHDS_General_Layout_static_0800
     * @tc.name     ArkUIHDS_General_Layout_static_0800
     * @tc.desc     ArkUIHDS_General_Layout_static_0800
     * @tc.level    Level.LEVEL1
     */
it('ArkUIHDS_General_Layout_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUIHDS_General_Layout_static_0800 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('0800_ButtonC');
      let obj = JSON.parseJsonElement(strJson);
      let rectInfo = Utils.getComponentRect('0800_ButtonC')
      original_rect_left = rectInfo.left;
      original_rect_top = rectInfo.top;
      original_rect_right = rectInfo.right;
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('0800_ButtonC');
      let obj1 = JSON.parseJsonElement(strJson1);
      let rectInfo1 = Utils.getComponentRect('0800_ButtonC')
      mirror_rect_left = rectInfo1.left;
      mirror_rect_top = rectInfo1.top;
      mirror_rect_right = rectInfo1.right;
      let strJson2 = inspector.getInspectorByKey('top');
      let obj2 = JSON.parseJsonElement(strJson2);
      let rectInfo2 = Utils.getComponentRect('top')
      let top: number = rectInfo2.top;
      let left: number = rectInfo2.left;
      let strJson3 = inspector.getInspectorByKey('bottom');
      let obj3 = JSON.parseJsonElement(strJson3);
      let rectInfo3 = Utils.getComponentRect('bottom')
      let bottom_rect_left: number = rectInfo3.left;
      let strJson4 = inspector.getInspectorByKey('0700_TextC');
      let obj4 = JSON.parseJsonElement(strJson4);
      let rectInfo4 = Utils.getComponentRect('0700_TextC')
      let button07_rect_bottom: number = rectInfo4.top;
      // position is invalid.
      expect(original_rect_left - mirror_rect_left).assertEqual(0);
      // 异常值
      // expect(Math.floor(Math.abs((mirror_rect_left - left) - (bottom_rect_left - mirror_rect_right))) <=
      // 1).assertTrue();
      expect(original_rect_top - mirror_rect_top).assertEqual(0);
      expect(Math.floor(Math.abs((mirror_rect_top - button07_rect_bottom))) <= 1).assertTrue();
      console.info('ArkUIHDS_General_Layout_static_0800 END' + (mirror_rect_left - left) + 'dddd' + (bottom_rect_left - mirror_rect_right));
      done();
    });

    
    
    
    /**
     * @tc.number   ArkUIHDS_General_Layout_static_0900
     * @tc.name     ArkUIHDS_General_Layout_static_0900
     * @tc.desc     ArkUIHDS_General_Layout_static_0900
     * @tc.level    Level.LEVEL1
     */
it('ArkUIHDS_General_Layout_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUIHDS_General_Layout_static_0900 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('0900_ImageC');
      let obj = JSON.parseJsonElement(strJson);
      let rectInfo = Utils.getComponentRect('0900_ImageC')
      original_rect_left = rectInfo.left;
      original_rect_top = rectInfo.top;
      original_rect_right = rectInfo.right;
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('0900_ImageC');
      let obj1 = JSON.parseJsonElement(strJson1);
      let rectInfo1 = Utils.getComponentRect('0900_ImageC')
      mirror_rect_right = rectInfo1.right;
      mirror_rect_top = rectInfo1.top;
      let strJson2 = inspector.getInspectorByKey('top');
      let obj2 = JSON.parseJsonElement(strJson2);
      let rectInfo2 = Utils.getComponentRect('top')
      let top: number = rectInfo2.top;
      let left: number = rectInfo2.left;
      let strJson3 = inspector.getInspectorByKey('bottom');
      let obj3 = JSON.parseJsonElement(strJson3);
      let rectInfo3 = Utils.getComponentRect('bottom')
      let right: number = rectInfo3.left;
      let width = right - left;
      expect(original_rect_left - left).assertEqual(0);
      expect(mirror_rect_right - left).assertLargerOrEqual(width - 1);
      expect(mirror_rect_right - left).assertLessOrEqual(width + 1);
      expect(original_rect_top - top).assertEqual(0);
      expect(mirror_rect_top - top).assertEqual(0);
      console.info('ArkUIHDS_General_Layout_static_0900 END');
      done();
    });
  })
}