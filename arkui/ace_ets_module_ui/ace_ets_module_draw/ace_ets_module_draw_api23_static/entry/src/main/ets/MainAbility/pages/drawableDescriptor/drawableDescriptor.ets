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

'use static'

import {
  Column,
  ColumnOptions,
  Button,
  Text,
  Entry,
  Component,
  Image,
  $r,
  ClickEvent,
  FlexAlign
} from '@ohos.arkui.component';
import { DrawableDescriptor, LayeredDrawableDescriptor } from '@ohos.arkui.drawableDescriptor';
import drawing from '@ohos.graphics.drawing';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { image } from '@kit.ImageKit';

@Entry
@Component
struct drawableDescriptor {
  // Test DrawableDescriptor - getPixelMap
  @Builder
  buildImage1() {
    Image($r('sys.media.ohos_ic_public_voice'))
      .width(100)
      .height(100)
      .id('imageGetPixelMap')
  }

  // Test LayeredDrawableDescriptor - getForeground
  @Builder
  buildImage2() {
    Image($r('sys.media.ohos_ic_public_voice'))
      .width(100)
      .height(100)
      .id('imageGetForeground')
  }

  // Test LayeredDrawableDescriptor - getBackground
  @Builder
  buildImage3() {
    Image($r('sys.media.ohos_ic_public_voice'))
      .width(100)
      .height(100)
      .id('imageGetBackground')
  }

  // Test LayeredDrawableDescriptor - getMask
  @Builder
  buildImage4() {
    Image($r('sys.media.ohos_ic_public_voice'))
      .width(100)
      .height(100)
      .id('imageGetMask')
  }

  // Test LayeredDrawableDescriptor - getMaskClipPath
  @Builder
  buildImage5() {
    Image($r('sys.media.ohos_ic_public_voice'))
      .width(100)
      .height(100)
      .id('imageGetMaskClipPath')
  }

  // Test LayeredDrawableDescriptor - setBlendMode
  @Builder
  buildImage6() {
    Image($r('sys.media.ohos_ic_public_voice'))
      .width(100)
      .height(100)
      .id('imageSetBlendMode')
  }

  build() {
    Column({ space: 1 } as ColumnOptions) {
      Button('像素图')
        .id('btnGetPixelMap')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '14%' })
        .fontSize(9)
        .onClick(() => {
          // Per API, get via resourceManager.getDrawableDescriptor()
          let resManager = this.getUIContext().getHostContext()?.resourceManager;
          let drawableDescriptor: DrawableDescriptor | undefined =
            resManager?.getDrawableDescriptor($r('sys.media.ohos_ic_public_voice').id) as DrawableDescriptor;
          if (drawableDescriptor) {
            let pixelMap: image.PixelMap | undefined = drawableDescriptor.getPixelMap();
            if (pixelMap) {
              // getImageInfo() returns Promise, use .then()
              pixelMap.getImageInfo().then((imageInfo) => {
                AppStorage.setOrCreate<number>('drawableDescriptorImageWidth', imageInfo.size.width);
                AppStorage.setOrCreate<number>('drawableDescriptorImageHeight', imageInfo.size.height);
                AppStorage.setOrCreate<boolean>('drawableDescriptorGetPixelMap', true);
              }).catch((error) => {
                console.error('[ARKUI_NEW] getImageInfo error: ' + error);
                AppStorage.setOrCreate<boolean>('drawableDescriptorGetPixelMap', false);
              });
            } else {
              AppStorage.setOrCreate<boolean>('drawableDescriptorGetPixelMap', false);
            }
          }
        })

      Button('前景')
        .id('btnGetForeground')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '14%' })
        .fontSize(9)
        .onClick(() => {
          try {
            // Per API, get via resourceManager.getDrawableDescriptor()
            let resManager = this.getUIContext().getHostContext()?.resourceManager;
            let drawableDescriptor: DrawableDescriptor | undefined =
              resManager?.getDrawableDescriptor($r('sys.media.ohos_ic_public_voice').id) as DrawableDescriptor;
            if (drawableDescriptor && drawableDescriptor instanceof LayeredDrawableDescriptor) {
              let foreground: DrawableDescriptor | undefined = drawableDescriptor.getForeground();
              AppStorage.setOrCreate<boolean>('layeredDrawableDescriptorGetForeground', foreground !== undefined);
            } else {
              AppStorage.setOrCreate<boolean>('layeredDrawableDescriptorGetForeground', false);
            }
          } catch (error) {
            console.error('getForeground error: ' + error);
            AppStorage.setOrCreate<boolean>('layeredDrawableDescriptorGetForeground', false);
          }
        })

      Button('背景')
        .id('btnGetBackground')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '14%' })
        .fontSize(9)
        .onClick(() => {
          try {
            // Per API, get via resourceManager.getDrawableDescriptor()
            let resManager = this.getUIContext().getHostContext()?.resourceManager;
            let drawableDescriptor: DrawableDescriptor | undefined =
              resManager?.getDrawableDescriptor($r('sys.media.ohos_ic_public_voice').id) as DrawableDescriptor;
            if (drawableDescriptor && drawableDescriptor instanceof LayeredDrawableDescriptor) {
              let background: DrawableDescriptor | undefined = drawableDescriptor.getBackground();
              AppStorage.setOrCreate<boolean>('layeredDrawableDescriptorGetBackground', background !== undefined);
            } else {
              AppStorage.setOrCreate<boolean>('layeredDrawableDescriptorGetBackground', false);
            }
          } catch (error) {
            console.error('[ARKUI_NEW] getBackground error: ' + error);
            AppStorage.setOrCreate<boolean>('layeredDrawableDescriptorGetBackground', false);
          }
        })

      Button('Test LayeredDrawableDescriptor - getMask')
        .id('btnGetMask')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '14%' })
        .fontSize(9)
        .onClick(() => {
          try {
            // Per API, get via resourceManager.getDrawableDescriptor()
            let resManager = this.getUIContext().getHostContext()?.resourceManager;
            let drawableDescriptor: DrawableDescriptor | undefined =
              resManager?.getDrawableDescriptor($r('sys.media.ohos_ic_public_voice').id) as DrawableDescriptor;
            if (drawableDescriptor && drawableDescriptor instanceof LayeredDrawableDescriptor) {
              let mask: DrawableDescriptor | undefined = drawableDescriptor.getMask();
              AppStorage.setOrCreate<boolean>('layeredDrawableDescriptorGetMask', mask !== undefined);
            } else {
              AppStorage.setOrCreate<boolean>('layeredDrawableDescriptorGetMask', false);
            }
          } catch (error) {
            console.error('[ARKUI_NEW] getMask error: ' + error);
            AppStorage.setOrCreate<boolean>('layeredDrawableDescriptorGetMask', false);
          }
        })

      Button('剪径')
        .id('btnGetMaskClipPath')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '14%' })
        .fontSize(9)
        .onClick(() => {
          try {
            // Per API, getMaskClipPath is static
            let maskClipPath: string = LayeredDrawableDescriptor.getMaskClipPath();
            AppStorage.setOrCreate<string>('layeredDrawableDescriptorGetMaskClipPath', maskClipPath);
            AppStorage.setOrCreate<boolean>('layeredDrawableDescriptorGetMaskClipPathSuccess',
              maskClipPath !== undefined && maskClipPath.length > 0);
          } catch (error) {
            console.error('getMaskClipPath error: ' + error);
            AppStorage.setOrCreate<boolean>('layeredDrawableDescriptorGetMaskClipPathSuccess', false);
          }
        })

      Button('混合')
        .id('btnSetBlendMode')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '14%' })
        .fontSize(9)
        .onClick(() => {
          try {
            // Per API, create LayeredDrawableDescriptor via constructor
            // Get DrawableDescriptor as param first
            let resManager = this.getUIContext().getHostContext()?.resourceManager;
            let foregroundDraw: DrawableDescriptor | undefined =
              resManager?.getDrawableDescriptor($r('sys.media.ohos_ic_public_voice').id) as DrawableDescriptor;
            if (foregroundDraw) {
              // Create LayeredDrawableDescriptor via constructor
              let layeredDrawableDescriptor = new LayeredDrawableDescriptor(foregroundDraw);
              layeredDrawableDescriptor.setBlendMode(drawing.BlendMode.SRC_OVER);
              AppStorage.setOrCreate<boolean>('layeredDrawableDescriptorSetBlendMode', true);
            } else {
              AppStorage.setOrCreate<boolean>('layeredDrawableDescriptorSetBlendMode', false);
            }
          } catch (error) {
            console.error('[ARKUI_NEW] setBlendMode error: ' + error);
            AppStorage.setOrCreate<boolean>('layeredDrawableDescriptorSetBlendMode', false);
          }
        })
    }
    .width('100%')
    .height('100%')
    .padding({ left: '3%', right: '3%', top: '1%', bottom: '1%' })
    .justifyContent(FlexAlign.SpaceEvenly)
  }
}
