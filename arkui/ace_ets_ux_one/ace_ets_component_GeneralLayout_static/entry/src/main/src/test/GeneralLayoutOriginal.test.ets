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

export default function GeneralLayoutOriginalTest() {
  describe('GeneralLayoutOriginalTest', () => {

    let screenWidth = display.getDefaultDisplaySync().width;
    let original_rect_left: number;
    let original_rect_top: number;
    let original_rect_bottom: number;
    let original_rect_right: number;

    beforeAll(() => {
      console.info("GeneralLayoutOffsetTest beforeEach start");
      
      await UtilsTest.startAbility("com.example.GeneralLayout.static", "EntryAbility")
      
    });

    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/IndexOrig',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get IndexOrig state success " + JSON.stringify(pages));
        if (!("IndexOrig" == pages.name)) {
          console.info("get IndexOrig state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await UtilsTest.msSleep(2000)
        }
      } catch (err) {
        console.error("push IndexOrig page error: " + err);
      }
    });

    
    
    
    /**
     * @tc.number   ArkUIHDS_General_Layout_2800
     * @tc.name     ArkUIHDS_General_Layout_2800
     * @tc.desc     ArkUIHDS_General_Layout_2800
     * @tc.level    Level.LEVEL1
     */
it('ArkUIHDS_General_Layout_2800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUIHDS_General_Layout_2800 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Original_0100');
      let obj = JSON.parseJsonElement(strJson);
      let rectInfo = Utils.getComponentRect('Original_0100')
      original_rect_left = rectInfo.left;
      original_rect_top = rectInfo.top;
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('top_orig');

      let obj1 = JSON.parseJsonElement(strJson1);
      let rectInfo1 = Utils.getComponentRect('top_orig')

      let top = rectInfo1.top;
      let left = rectInfo1.left;
      const uiContext = AppStorage.get<UIContext>("uiContext");
      expect(original_rect_left - left).assertLargerOrEqual(99);
      expect(original_rect_left - left).assertLessOrEqual(101);
      expect(original_rect_top - top).assertLargerOrEqual(uiContext!.vp2px(100) - 1);
      expect(original_rect_top - top).assertLessOrEqual(uiContext!.vp2px(100) + 1);
      console.info('ArkUIHDS_General_Layout_2800 END');
      done();
    });

    
    
    
    /**
     * @tc.number   ArkUIHDS_General_Layout_2900
     * @tc.name     ArkUIHDS_General_Layout_2900
     * @tc.desc     ArkUIHDS_General_Layout_2900
     * @tc.level    Level.LEVEL1
     */
it('ArkUIHDS_General_Layout_2900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUIHDS_General_Layout_2900 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Original_0200');
      let obj = JSON.parseJsonElement(strJson);
      let rectInfo = Utils.getComponentRect('Original_0200')
      original_rect_right = rectInfo.right;
      original_rect_bottom = rectInfo.bottom;
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('bottom_orig');
      let obj1 = JSON.parseJsonElement(strJson1);
      let rectInfo1 = Utils.getComponentRect('bottom_orig')
      let bottom = rectInfo1.top;
      let right= rectInfo1.left;
      let strJson2 = inspector.getInspectorByKey('top_orig');
      let obj2 = JSON.parseJsonElement(strJson2);
      let rectInfo2 = Utils.getComponentRect('top_orig')
      let left= rectInfo2.left;
      let width = right - left;
      const uiContext = AppStorage.get<UIContext>("uiContext");
      let lpx100 = Number.parseInt(uiContext!.lpx2px(100).toFixed(0));
      bottom = Math.floor(bottom);
      original_rect_bottom = Math.floor(original_rect_bottom);
      expect(width - (original_rect_right - left)).assertLargerOrEqual(uiContext!.fp2px(100) - 1);
      expect(width - (original_rect_right - left)).assertLessOrEqual(uiContext!.fp2px(100) + 1);
      expect(bottom - original_rect_bottom).assertLargerOrEqual(lpx100 - 1);
      expect(bottom - original_rect_bottom).assertLessOrEqual(lpx100 + 1);
      console.info('ArkUIHDS_General_Layout_2900 END');
      done();
    });

    
    
    
    /**
     * @tc.number   ArkUIHDS_General_Layout_3000
     * @tc.name     ArkUIHDS_General_Layout_3000
     * @tc.desc     ArkUIHDS_General_Layout_3000
     * @tc.level    Level.LEVEL1
     */
it('ArkUIHDS_General_Layout_3000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUIHDS_General_Layout_3000 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Original_0300');
      let obj = JSON.parseJsonElement(strJson);
      let rectInfo = Utils.getComponentRect('Original_0300')
      original_rect_left = rectInfo.left;
      original_rect_top = rectInfo.top;
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('top_orig');
      let obj1 = JSON.parseJsonElement(strJson1);
      let rectInfo1 = Utils.getComponentRect('top_orig')

      let top = rectInfo1.top;
      let left = rectInfo1.left;
      const uiContext = AppStorage.get<UIContext>("uiContext");
      expect(original_rect_left - left).assertLargerOrEqual(uiContext!.vp2px(100) - 1);
      expect(original_rect_left - left).assertLessOrEqual(uiContext!.vp2px(100) + 1);
      expect(original_rect_top - top).assertLargerOrEqual(uiContext!.vp2px(100) - 1);
      expect(original_rect_top - top).assertLessOrEqual(uiContext!.vp2px(100) + 1);
      console.info('ArkUIHDS_General_Layout_3000 END');
      done();
    });

    
    
    
    /**
     * @tc.number   ArkUIHDS_General_Layout_3100
     * @tc.name     ArkUIHDS_General_Layout_3100
     * @tc.desc     ArkUIHDS_General_Layout_3100
     * @tc.level    Level.LEVEL1
     */
it('ArkUIHDS_General_Layout_3100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUIHDS_General_Layout_3100 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Original_0400');
      let obj = JSON.parseJsonElement(strJson);
      let rectInfo = Utils.getComponentRect('Original_0400')
      original_rect_left = rectInfo.left;
      original_rect_top = rectInfo.top;
      original_rect_right = rectInfo.right;
      await CommonFunc.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('top_orig');
      let obj2 = JSON.parseJsonElement(strJson2);
      let rectInfo2 = Utils.getComponentRect('top_orig')
      let top = rectInfo2.top;
      let left = rectInfo2.left;
      let strJson3 = inspector.getInspectorByKey('bottom_orig');
      let obj3 = JSON.parseJsonElement(strJson3);
      let rectInfo3 = Utils.getComponentRect('bottom_orig')
      let right = rectInfo3.left;
      left = Number.parseInt(left.toFixed(0));
      right = Math.floor(right);
      let width = right - left;
      const uiContext = AppStorage.get<UIContext>("uiContext");
      let original_size = ((original_rect_left - left) + (original_rect_right - left)) / 2;
      let original_rect = Number.parseInt(original_size.toFixed(0));
      expect((width / 2) - original_rect).assertLargerOrEqual(99);
      expect((width / 2) - original_rect).assertLessOrEqual(101);
      expect(original_rect_top - top).assertLargerOrEqual(uiContext!.vp2px(100) - 1);
      expect(original_rect_top - top).assertLessOrEqual(uiContext!.vp2px(100) + 1);
      console.info('ArkUIHDS_General_Layout_3100 END');
      done();
    });

    
    
    
    /**
     * @tc.number   ArkUIHDS_General_Layout_3200
     * @tc.name     ArkUIHDS_General_Layout_3200
     * @tc.desc     ArkUIHDS_General_Layout_3200
     * @tc.level    Level.LEVEL1
     */
it('ArkUIHDS_General_Layout_3200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUIHDS_General_Layout_3200 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Original_0500');
      let obj = JSON.parseJsonElement(strJson);
      let rectInfo = Utils.getComponentRect('Original_0500')
      original_rect_left = rectInfo.left;
      original_rect_top = rectInfo.top;
      original_rect_right = rectInfo.right;
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('top_orig');
      let obj1 = JSON.parseJsonElement(strJson1);
      let rectInfo1 = Utils.getComponentRect('top_orig')
      let top = rectInfo1.top;
      let left = rectInfo1.left;
      let strJson2 = inspector.getInspectorByKey('bottom_orig');
      let obj2 = JSON.parseJsonElement(strJson2);
      let rectInfo2 = Utils.getComponentRect('bottom_orig')

      let right = rectInfo2.left;
      left = Number.parseInt(left.toFixed(0));
      right = Math.floor(right);
      let width = right - left;
      const uiContext = AppStorage.get<UIContext>("uiContext");
      let lpx100 = Number.parseInt(uiContext!.lpx2px(100).toFixed(0));
      top = Math.floor(top);
      original_rect_top = Math.floor(original_rect_top);
      expect(((original_rect_left + original_rect_right) / 2 - left) - (width / 2))
        .assertLargerOrEqual(uiContext!.fp2px(100) - 1);
      expect(((original_rect_left + original_rect_right) / 2 - left) - (width / 2))
        .assertLessOrEqual(uiContext!.fp2px(100) + 1);
      expect(original_rect_top - top - 30).assertLargerOrEqual(lpx100 - 1);
      expect(original_rect_top - top - 30).assertLessOrEqual(lpx100 + 1);
      console.info('ArkUIHDS_General_Layout_3200 END');
      done();
    });

    
    
    
    /**
     * @tc.number   ArkUIHDS_General_Layout_3300
     * @tc.name     ArkUIHDS_General_Layout_3300
     * @tc.desc     ArkUIHDS_General_Layout_3300
     * @tc.level    Level.LEVEL1
     */
it('ArkUIHDS_General_Layout_3300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUIHDS_General_Layout_3300 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Original_0600');
      let obj = JSON.parseJsonElement(strJson);
      let rectInfo = Utils.getComponentRect('Original_0600')
      original_rect_left = rectInfo.left;
      original_rect_top = rectInfo.top;
      original_rect_right = rectInfo.right;
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('top_orig');
      let obj1 = JSON.parseJsonElement(strJson1);
      let rectInfo1 = Utils.getComponentRect('top_orig')
      let top: number = rectInfo1.top;
      let left: number =rectInfo1.left;
      let strJson2 = inspector.getInspectorByKey('bottom_orig');
      let obj2 = JSON.parseJsonElement(strJson2);
      let rectInfo2 = Utils.getComponentRect('bottom_orig')
      let right: number = rectInfo2.left;
      left = Number.parseInt(left.toFixed(0));
      right = Math.floor(right);
      let width = right - left;
      const uiContext = AppStorage.get<UIContext>("uiContext");
      let original_rect = Number.parseInt(((original_rect_left + original_rect_right) / 2 - left).toFixed(0));
      expect(original_rect - (width / 2)).assertLargerOrEqual(99);
      expect(original_rect - (width / 2)).assertLessOrEqual(101);
      expect(original_rect_top - top - 60).assertLargerOrEqual(uiContext!.vp2px(100) - 1);
      expect(original_rect_top - top - 60).assertLessOrEqual(uiContext!.vp2px(100) + 1);
      console.info('ArkUIHDS_General_Layout_3300 END');
      done();
    });

    
    
    
    /**
     * @tc.number   ArkUIHDS_General_Layout_3400
     * @tc.name     ArkUIHDS_General_Layout_3400
     * @tc.desc     ArkUIHDS_General_Layout_3400
     * @tc.level    Level.LEVEL1
     */
it('ArkUIHDS_General_Layout_3400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUIHDS_General_Layout_3400 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Original_0700');
      let obj = JSON.parseJsonElement(strJson);
      let rectInfo = Utils.getComponentRect('Original_0700')
      original_rect_left = rectInfo.left;
      original_rect_top = rectInfo.top;
      original_rect_right = rectInfo.right;
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('top_orig');
      let obj1 = JSON.parseJsonElement(strJson1);
      let rectInfo1 = Utils.getComponentRect('top_orig')
      let top: number = rectInfo1.top;
      let left: number = rectInfo1.left;
      let strJson2 = inspector.getInspectorByKey('bottom_orig');
      let obj2 = JSON.parseJsonElement(strJson2);
      let rectInfo2 = Utils.getComponentRect('bottom_orig')
      let right: number = rectInfo2.left;
      left = Number.parseInt(left.toFixed(0));
      right = Math.floor(right);
      let width = right - left;
      const uiContext = AppStorage.get<UIContext>("uiContext");
      let lpx100 = Number.parseInt(uiContext!.lpx2px(100).toFixed(0));
      top = Math.floor(top);
      original_rect_top = Math.floor(original_rect_top);
      expect(((width / 2) - ((original_rect_left + original_rect_right) / 2 - left)))
        .assertLargerOrEqual(uiContext!.fp2px(100) - 1);
      expect(((width / 2) - ((original_rect_left + original_rect_right) / 2 - left)))
        .assertLessOrEqual(uiContext!.fp2px(100) + 1);
      expect(original_rect_top - top - 90).assertLargerOrEqual(lpx100 - 1);
      expect(original_rect_top - top - 90).assertLessOrEqual(lpx100 + 1);
      console.info('ArkUIHDS_General_Layout_3400 END');
      done();
    });

    
    
    
    /**
     * @tc.number   ArkUIHDS_General_Layout_3500
     * @tc.name     ArkUIHDS_General_Layout_3500
     * @tc.desc     ArkUIHDS_General_Layout_3500
     * @tc.level    Level.LEVEL1
     */
it('ArkUIHDS_General_Layout_3500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUIHDS_General_Layout_3500 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Original_0800');
      let obj = JSON.parseJsonElement(strJson);
      let rectInfo = Utils.getComponentRect('Original_0800')
      original_rect_left = rectInfo.left;
      original_rect_top = rectInfo.top;
      original_rect_right = rectInfo.right;
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('top_orig');

      let obj1 = JSON.parseJsonElement(strJson1);
      let rectInfo1 = Utils.getComponentRect('top_orig')

      let top: number = rectInfo1.top;
      let left: number = rectInfo1.left;
      let strJson2 = inspector.getInspectorByKey('bottom_orig');
      let obj2 = JSON.parseJsonElement(strJson2);
      let rectInfo2 = Utils.getComponentRect('bottom_orig')
      let right: number = rectInfo2.left;
      left = Number.parseInt(left.toFixed(0));
      right = Math.floor(right);
      let width = right - left;
      const uiContext = AppStorage.get<UIContext>("uiContext");
      i18n.System.setAppPreferredLanguage("zh-Hans");
      expect(((original_rect_left + original_rect_right) / 2 - left) - (width / 2))
        .assertLargerOrEqual(uiContext!.vp2px(100) - 1);
      expect(((original_rect_left + original_rect_right) / 2 - left) - (width / 2))
        .assertLessOrEqual(uiContext!.vp2px(100) + 1);
      expect(original_rect_top - top - 120).assertLargerOrEqual(uiContext!.vp2px(100) - 1);
      expect(original_rect_top - top - 120).assertLessOrEqual(uiContext!.vp2px(100) + 1);
      console.info('ArkUIHDS_General_Layout_3500 END');
      done();
    });

  })
}