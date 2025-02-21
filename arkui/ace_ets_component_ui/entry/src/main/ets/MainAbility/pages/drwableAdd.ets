/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import {DrawableDescriptor, LayeredDrawableDescriptor } from '@ohos.arkui.drawableDescriptor'
import Curves from '@ohos.curves'


@Entry
@Component
struct Index2 {
  private resManager = getContext().resourceManager

  build() {
      Column() {
        Image(this.resManager.getDrawableDescriptor($r('app.media.icon').id) as LayeredDrawableDescriptor)
        Image((this.resManager.getDrawableDescriptor($r('app.media.app_icon').id) as LayeredDrawableDescriptor)
          .getForeground().getPixelMap())
        Image($r('app.media.icon'))
          .width('200px').height('200px')
          .clip(new Path({commands:LayeredDrawableDescriptor.getMaskClipPath()}))

        Button("getBackground()").margin({top:20})
          .onClick(() => {
             let drawable = (this.resManager.getDrawableDescriptor($r('app.media.icon')
              .id) as LayeredDrawableDescriptor).getBackground();
          })
        Button("getMask()").margin({top:20})
          .onClick(() => {
            let drawable = (this.resManager.getDrawableDescriptor($r('app.media.icon')
              .id) as LayeredDrawableDescriptor).getMask();
          })
        Button("getMashClipPath").margin({top:20})
          .onClick(() => {
            let drawable = (this.resManager.getDrawableDescriptor($r('app.media.icon')
              .id) as LayeredDrawableDescriptor).getMask();
          })

        Button("interpolatingSpring").margin({top:20}).key('drawleAdd')
          .onClick(() => {
            Curves.interpolatingSpring(100, 1, 228, 30) // 创建一个时长由弹簧参数决定的弹簧插值曲线
          })


      }.height('100%')
  }
}