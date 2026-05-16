/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static';

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { abilityDelegatorRegistry, Driver, ON, MatchPattern } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

const SLEEP_TIME = 1000;

export default function DrawableDescriptorTest() {
  describe('DrawableDescriptorTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("[ARKUI_NEW] DrawableDescriptorTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.draw.api23.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("[ARKUI_NEW] DrawableDescriptorTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/drawableDescriptor/drawableDescriptor',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("[ARKUI_NEW] DrawableDescriptorTest state pages: " + JSON.stringify(pages));
        if (!('TextLineSpacing' == pages.name)) {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("[ARKUI_NEW] DrawableDescriptorTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      console.info("[ARKUI_NEW] DrawableDescriptorTest afterEach start");
      // Clean up AppStorage data
      if (AppStorage.get<number>('drawableDescriptorImageWidth') != undefined) {
        AppStorage.delete('drawableDescriptorImageWidth');
      }
      if (AppStorage.get<number>('drawableDescriptorImageHeight') != undefined) {
        AppStorage.delete('drawableDescriptorImageHeight');
      }
      if (AppStorage.get<boolean>('drawableDescriptorGetPixelMap') != undefined) {
        AppStorage.delete('drawableDescriptorGetPixelMap');
      }
      if (AppStorage.get<boolean>('layeredDrawableDescriptorGetForeground') != undefined) {
        AppStorage.delete('layeredDrawableDescriptorGetForeground');
      }
      if (AppStorage.get<boolean>('layeredDrawableDescriptorGetBackground') != undefined) {
        AppStorage.delete('layeredDrawableDescriptorGetBackground');
      }
      if (AppStorage.get<boolean>('layeredDrawableDescriptorGetMask') != undefined) {
        AppStorage.delete('layeredDrawableDescriptorGetMask');
      }
      if (AppStorage.get<string>('layeredDrawableDescriptorGetMaskClipPath') != undefined) {
        AppStorage.delete('layeredDrawableDescriptorGetMaskClipPath');
      }
      if (AppStorage.get<boolean>('layeredDrawableDescriptorGetMaskClipPathSuccess') != undefined) {
        AppStorage.delete('layeredDrawableDescriptorGetMaskClipPathSuccess');
      }
      if (AppStorage.get<boolean>('layeredDrawableDescriptorSetBlendMode') != undefined) {
        AppStorage.delete('layeredDrawableDescriptorSetBlendMode');
      }
      await Utils.sleep(SLEEP_TIME);
      console.info("[ARKUI_NEW] DrawableDescriptorTest afterEach end");
    });

    /**
     * @tc.number DrawableDescriptorTest_001
     * @tc.name drawableDescriptorGetPixelMap
     * @tc.desc Test DrawableDescriptor method: getPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('drawableDescriptorGetPixelMap', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('DrawableDescriptorTest execute: drawableDescriptorGetPixelMap START');
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnGetPixelMap'));
        expect(!!button).assertEqual(true);
        await (button?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME);

        // Assert AppStorage value
        let imageWidth = AppStorage.get<number>('drawableDescriptorImageWidth');
        let imageHeight = AppStorage.get<number>('drawableDescriptorImageHeight');
        let getPixelMapResult = AppStorage.get<boolean>('drawableDescriptorGetPixelMap');
        expect(getPixelMapResult !== undefined).assertTrue();
        if (getPixelMapResult !== undefined) {
          expect(getPixelMapResult).assertEqual(true);
        }
        if (imageWidth !== undefined && imageHeight !== undefined) {
          expect(imageWidth > 0).assertTrue();
          expect(imageHeight > 0).assertTrue();
        }

        console.info('DrawableDescriptorTest execute: drawableDescriptorGetPixelMap END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] DrawableDescriptorTest execute: drawableDescriptorGetPixelMap error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number DrawableDescriptorTest_002
     * @tc.name layeredDrawableDescriptorGetForeground
     * @tc.desc Test LayeredDrawableDescriptor method: getForeground
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('layeredDrawableDescriptorGetForeground', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('DrawableDescriptorTest execute: layeredDrawableDescriptorGetForeground START');
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnGetForeground'));
        expect(!!button).assertEqual(true);
        await (button?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME);

        // Assert AppStorage value
        let getForegroundResult = AppStorage.get<boolean>('layeredDrawableDescriptorGetForeground');
        expect(getForegroundResult !== undefined).assertTrue();

        console.info('DrawableDescriptorTest execute: layeredDrawableDescriptorGetForeground END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] DrawableDescriptorTest execute: layeredDrawableDescriptorGetForeground error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number DrawableDescriptorTest_003
     * @tc.name layeredDrawableDescriptorGetBackground
     * @tc.desc Test LayeredDrawableDescriptor method: getBackground
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('layeredDrawableDescriptorGetBackground', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('DrawableDescriptorTest execute: layeredDrawableDescriptorGetBackground START');
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnGetBackground'));
        expect(!!button).assertEqual(true);
        await (button?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME);

        // Assert AppStorage value
        let getBackgroundResult = AppStorage.get<boolean>('layeredDrawableDescriptorGetBackground');
        expect(getBackgroundResult !== undefined).assertTrue();

        console.info('DrawableDescriptorTest execute: layeredDrawableDescriptorGetBackground END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] DrawableDescriptorTest execute: layeredDrawableDescriptorGetBackground error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number DrawableDescriptorTest_004
     * @tc.name layeredDrawableDescriptorGetMask
     * @tc.desc Test LayeredDrawableDescriptor method: getMask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('layeredDrawableDescriptorGetMask', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('DrawableDescriptorTest execute: layeredDrawableDescriptorGetMask START');
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnGetMask'));
        expect(!!button).assertEqual(true);
        await (button?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME);

        // Assert AppStorage value
        let getMaskResult = AppStorage.get<boolean>('layeredDrawableDescriptorGetMask');
        expect(getMaskResult !== undefined).assertTrue();

        console.info('DrawableDescriptorTest execute: layeredDrawableDescriptorGetMask END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] DrawableDescriptorTest execute: layeredDrawableDescriptorGetMask error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number DrawableDescriptorTest_005
     * @tc.name layeredDrawableDescriptorGetMaskClipPath
     * @tc.desc Test LayeredDrawableDescriptor static method: getMaskClipPath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('layeredDrawableDescriptorGetMaskClipPath', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('DrawableDescriptorTest execute: layeredDrawableDescriptorGetMaskClipPath START');
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnGetMaskClipPath'));
        expect(!!button).assertEqual(true);
        await (button?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME);

        // Assert AppStorage value
        let maskClipPath = AppStorage.get<string>('layeredDrawableDescriptorGetMaskClipPath');
        let successResult = AppStorage.get<boolean>('layeredDrawableDescriptorGetMaskClipPathSuccess');
        expect(successResult !== undefined).assertTrue();
        if (successResult !== undefined) {
          expect(successResult).assertEqual(true);
        }
        if (maskClipPath !== undefined) {
          expect(maskClipPath.length > 0).assertTrue();
        }

        console.info('DrawableDescriptorTest execute: layeredDrawableDescriptorGetMaskClipPath END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] DrawableDescriptorTest execute: layeredDrawableDescriptorGetMaskClipPath error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number DrawableDescriptorTest_006
     * @tc.name layeredDrawableDescriptorSetBlendMode
     * @tc.desc Test LayeredDrawableDescriptor method: setBlendMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('layeredDrawableDescriptorSetBlendMode', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('DrawableDescriptorTest execute: layeredDrawableDescriptorSetBlendMode START');
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnSetBlendMode'));
        expect(!!button).assertEqual(true);
        await (button?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME);

        // Assert AppStorage value
        let setBlendModeResult = AppStorage.get<boolean>('layeredDrawableDescriptorSetBlendMode');
        expect(setBlendModeResult !== undefined).assertTrue();
        if (setBlendModeResult !== undefined) {
          expect(setBlendModeResult).assertEqual(true);
        }

        console.info('DrawableDescriptorTest execute: layeredDrawableDescriptorSetBlendMode END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] DrawableDescriptorTest execute: layeredDrawableDescriptorSetBlendMode error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
