'use static';
/**
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
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level
} from '../../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { UIContext, Router } from "@ohos.arkui.UIContext";
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import { Message, GlobalMessage } from '../../../../ets/MainAbility/common/MessageManager';
import RectValue from '../../../../ets/MainAbility/common/Rect';
import { UtilsTest, startAbility } from '../../Util.test';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;
const waitUiReadyMs = 1000;

export default function SwiperMinSize() {
  describe('SwiperMinSize', () => {
    beforeAll(() => {
      console.info("SwiperMinSize beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.swiper.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("SwiperMinSize beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/swiperUI/SwiperMinSize',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router;
        router.clear();
        let pages = router.getState() as router.RouterState;
        console.info("get SwiperMinSize state pages: " + JSON.stringify(pages));
        if (!("SwiperMinSize" == pages.name)) {
          console.info("get SwiperMinSize state pages.name: " + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SwiperMinSize page result: ");
        }
      } catch (err) {
        console.error("push SwiperMinSize page error: " + err);
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   SwiperMinSize_static_001
     * @tc.name     SwiperMinSize_static_001
     * @tc.desc     SwiperMinSize_static_001
     * @tc.level    Level.LEVEL0
     */
it('SwiperMinSize_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[SwiperMinSize_static_001] START');
      await CommonFunc.sleep(200);

      let swiperText1 = CommonFunc.getComponentRect('swiperText1');
      await CommonFunc.sleep(1000);
      const uiContext = new UIContext();
      expect(Math.round(swiperText1.right - swiperText1.left)).assertEqual(Math.round(UIContext.resolveUIContext()!.vp2px(160)));

      console.info('[SwiperMinSize_static_001] END');
      done();
    });


    
    /**
     * @tc.number   SwiperMinSize_static_101
     * @tc.name     SwiperMinSize_static_101
     * @tc.desc     SwiperMinSize_static_101
     * @tc.level    Level.LEVEL0
     */
it('SwiperMinSize_static_101', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[SwiperMinSize_static_101] START');
      await CommonFunc.sleep(200);

      let swiperText1 = CommonFunc.getComponentRect('swiperText1');
      await CommonFunc.sleep(1000);
      const uiContext = new UIContext();
      expect(Math.round(swiperText1.right - swiperText1.left)).assertEqual(Math.round(UIContext.resolveUIContext()!.vp2px(160)));

      console.info('[SwiperMinSize_static_101] END');
      done();
    });


    
    /**
     * @tc.number   SwiperMinSize_static_002
     * @tc.name     SwiperMinSize_static_002
     * @tc.desc     SwiperMinSize_static_002
     * @tc.level    Level.LEVEL0
     */
it('SwiperMinSize_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[SwiperMinSize_static_002] START');
      await CommonFunc.sleep(200);
      const globalMessage = AppStorage.get<GlobalMessage>('SwiperMinSize');
      globalMessage?.message.notify({
        name: 'minSize', value: 20
      });
      globalMessage?.message.notify({
        name: 'itemSpace', value: 0
      });
      await CommonFunc.sleep(200);

      let swiperText1 = CommonFunc.getComponentRect('swiperText1');
      await CommonFunc.sleep(1000);
      const uiContext = new UIContext();
      expect(Math.round(swiperText1.right - swiperText1.left)).assertEqual(Math.round(UIContext.resolveUIContext()!.vp2px(40)));

      console.info('[SwiperMinSize_static_002] END');
      done();
    });


    
    /**
     * @tc.number   SwiperMinSize_static_102
     * @tc.name     SwiperMinSize_static_102
     * @tc.desc     SwiperMinSize_static_102
     * @tc.level    Level.LEVEL0
     */
it('SwiperMinSize_static_102', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[SwiperMinSize_static_102] START');
      await CommonFunc.sleep(200);
      const globalMessage = AppStorage.get<GlobalMessage>('SwiperMinSize');
      globalMessage?.message.notify({
        name: 'minSize', value: 20
      });
      globalMessage?.message.notify({
        name: 'itemSpace', value: 0
      });
      await CommonFunc.sleep(200);

      let swiperText1 = CommonFunc.getComponentRect('swiperText1');
      await CommonFunc.sleep(1000);
      const uiContext = new UIContext();
      expect(Math.round(swiperText1.right - swiperText1.left)).assertEqual(Math.round(UIContext.resolveUIContext()!.vp2px(40)));

      console.info('[SwiperMinSize_static_102] END');
      done();
    });


    
    /**
     * @tc.number   SwiperMinSize_static_202
     * @tc.name     SwiperMinSize_static_202
     * @tc.desc     SwiperMinSize_static_202
     * @tc.level    Level.LEVEL0
     */
it('SwiperMinSize_static_202', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[SwiperMinSize_static_202] START');
      await CommonFunc.sleep(200);
      const globalMessage = AppStorage.get<GlobalMessage>('SwiperMinSize');
      globalMessage?.message.notify({
        name: 'minSize', value: 20
      });
      globalMessage?.message.notify({
        name: 'itemSpace', value: 0
      });
      await CommonFunc.sleep(200);

      let swiperText1 = CommonFunc.getComponentRect('swiperText1');
      await CommonFunc.sleep(1000);
      const uiContext = new UIContext();
      expect(Math.round(swiperText1.right - swiperText1.left)).assertEqual(Math.round(UIContext.resolveUIContext()!.vp2px(40)));

      console.info('[SwiperMinSize_static_202] END');
      done();
    });


    
    /**
     * @tc.number   SwiperMinSize_static_302
     * @tc.name     SwiperMinSize_static_302
     * @tc.desc     SwiperMinSize_static_302
     * @tc.level    Level.LEVEL0
     */
it('SwiperMinSize_static_302', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[SwiperMinSize_static_302] START');
      await CommonFunc.sleep(200);
      const globalMessage = AppStorage.get<GlobalMessage>('SwiperMinSize');
      globalMessage?.message.notify({
        name: 'minSize', value: 20
      });
      globalMessage?.message.notify({
        name: 'itemSpace', value: 0
      });
      await CommonFunc.sleep(200);

      let swiperText1 = CommonFunc.getComponentRect('swiperText1');
      await CommonFunc.sleep(1000);
      const uiContext = new UIContext();
      expect(Math.round(swiperText1.right - swiperText1.left)).assertEqual(Math.round(UIContext.resolveUIContext()!.vp2px(40)));

      console.info('[SwiperMinSize_static_302] END');
      done();
    });


    
    /**
     * @tc.number   SwiperMinSize_static_402
     * @tc.name     SwiperMinSize_static_402
     * @tc.desc     SwiperMinSize_static_402
     * @tc.level    Level.LEVEL0
     */
it('SwiperMinSize_static_402', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[SwiperMinSize_static_402] START');
      await CommonFunc.sleep(200);
      const globalMessage = AppStorage.get<GlobalMessage>('SwiperMinSize');
      globalMessage?.message.notify({
        name: 'minSize', value: 20
      });
      globalMessage?.message.notify({
        name: 'itemSpace', value: 0
      });
      await CommonFunc.sleep(200);

      let swiperText1 = CommonFunc.getComponentRect('swiperText1');
      await CommonFunc.sleep(1000);
      const uiContext = new UIContext();
      expect(Math.round(swiperText1.right - swiperText1.left)).assertEqual(Math.round(UIContext.resolveUIContext()!.vp2px(40)));

      console.info('[SwiperMinSize_static_402] END');
      done();
    });


    
    /**
     * @tc.number   SwiperMinSize_static_003
     * @tc.name     SwiperMinSize_static_003
     * @tc.desc     SwiperMinSize_static_003
     * @tc.level    Level.LEVEL0
     */
it('SwiperMinSize_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[SwiperMinSize_static_003] START');
      await CommonFunc.sleep(200);
      const globalMessage = AppStorage.get<GlobalMessage>('SwiperMinSize');
      globalMessage?.message.notify({
        name: 'swiperTextWidth', value: 300
      });
      globalMessage?.message.notify({
        name: 'minSize', value: 20
      });
      globalMessage?.message.notify({
        name: 'itemSpace', value: 0
      });
      await CommonFunc.sleep(200);

      let swiperText1 = CommonFunc.getComponentRect('swiperText1');
      await CommonFunc.sleep(1000);
      const uiContext = new UIContext();
      expect(Math.round(swiperText1.right - swiperText1.left)).assertEqual(Math.round(UIContext.resolveUIContext()!.vp2px(40)));

      console.info('[SwiperMinSize_static_003] END');
      done();
    });


    
    /**
     * @tc.number   SwiperMinSize_static_004
     * @tc.name     SwiperMinSize_static_004
     * @tc.desc     SwiperMinSize_static_004
     * @tc.level    Level.LEVEL0
     */
it('SwiperMinSize_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[SwiperMinSize_static_004] START');
      await CommonFunc.sleep(200);
      const globalMessage = AppStorage.get<GlobalMessage>('SwiperMinSize');
      globalMessage?.message.notify({
        name: 'swiperWidth', value: 200
      });
      globalMessage?.message.notify({
        name: 'minSize', value: 20
      });
      globalMessage?.message.notify({
        name: 'itemSpace', value: 0
      });
      await CommonFunc.sleep(200);

      let swiperText1 = CommonFunc.getComponentRect('swiperText1');
      await CommonFunc.sleep(1000);
      const uiContext = new UIContext();
      expect(Math.round(swiperText1.right - swiperText1.left)).assertEqual(Math.round(UIContext.resolveUIContext()!.vp2px(40)));

      console.info('[SwiperMinSize_static_004] END');
      done();
    });


    
    /**
     * @tc.number   SwiperMinSize_static_005
     * @tc.name     SwiperMinSize_static_005
     * @tc.desc     SwiperMinSize_static_005
     * @tc.level    Level.LEVEL0
     */
it('SwiperMinSize_static_005', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[SwiperMinSize_static_005] START');
      await CommonFunc.sleep(200);
      const globalMessage = AppStorage.get<GlobalMessage>('SwiperMinSize');
      globalMessage?.message.notify({
        name: 'minSize', value: 20
      });
      globalMessage?.message.notify({
        name: 'swiperPadding', value: 10
      });
      globalMessage?.message.notify({
        name: 'swiperMargin', value: 10
      });
      await CommonFunc.sleep(200);

      let swiper = CommonFunc.getComponentRect('swiperMinSize2');
      let swiperText1 = CommonFunc.getComponentRect('swiperText1');
      await CommonFunc.sleep(1000);
      const uiContext = new UIContext();
      expect(Math.abs(Math.round(swiperText1.top - swiper.top) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();

      console.info('[SwiperMinSize_static_005] END');
      done();
    });


    
    /**
     * @tc.number   SwiperMinSize_static_006
     * @tc.name     SwiperMinSize_static_006
     * @tc.desc     SwiperMinSize_static_006
     * @tc.level    Level.LEVEL0
     */
it('SwiperMinSize_static_006', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[SwiperMinSize_static_006] START');
      await CommonFunc.sleep(200);
      const globalMessage = AppStorage.get<GlobalMessage>('SwiperMinSize');
      globalMessage?.message.notify({
        name: 'minSize', value: 20
      });
      globalMessage?.message.notify({
        name: 'swiperPadding', value: 0
      });
      globalMessage?.message.notify({
        name: 'swiperMargin', value: 0
      });
      globalMessage?.message.notify({
        name: 'itemSpace', value: 10
      });
      await CommonFunc.sleep(200);

      let swiperText1 = CommonFunc.getComponentRect('swiperText1');
      let swiperText2 = CommonFunc.getComponentRect('swiperText2');
      await CommonFunc.sleep(1000);
      const uiContext = new UIContext();
      expect(Math.abs(Math.round(swiperText2.left - swiperText1.right) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();

      console.info('[SwiperMinSize_static_006] END');
      done();
    });


    
    /**
     * @tc.number   SwiperMinSize_static_007
     * @tc.name     SwiperMinSize_static_007
     * @tc.desc     SwiperMinSize_static_007
     * @tc.level    Level.LEVEL0
     */
it('SwiperMinSize_static_007', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[SwiperMinSize_static_007] START');
      await CommonFunc.sleep(200);
      const globalMessage = AppStorage.get<GlobalMessage>('SwiperMinSize');
      globalMessage?.message.notify({
        name: 'minSize', value: 20
      });
      globalMessage?.message.notify({
        name: 'itemSpace', value: 10
      });
      globalMessage?.message.notify({
        name: 'nextMargin', value: 10
      });
      await CommonFunc.sleep(200);

      let swiperText1 = CommonFunc.getComponentRect('swiperText1');
      let swiperText2 = CommonFunc.getComponentRect('swiperText2');
      await CommonFunc.sleep(1000);
      const uiContext = new UIContext();
      expect(Math.abs(Math.round(swiperText2.left - swiperText1.right) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();

      console.info('[SwiperMinSize_static_007] END');
      done();
    });
  })
}
