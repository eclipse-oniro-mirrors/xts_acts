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
import { Entry,Builder,Component,Scroller,Scroll,List,ColorFilter,CopyOptions,ImageInterpolation,ImageRenderMode,ImageFit,ImageRepeat,Video,ImageAttribute,Image,BarPosition,ButtonAttribute,Resource,$r,FlexAlign,Divider,Tabs,TabContent,TabsController,TextPicker,TextAreaController,PlaybackSpeed,$rawfile,Column,Margin,ColumnOptions,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,Week,FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, CalendarPicker,EdgeEffect,Curve,SwiperDisplayMode,ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,TextAlign,AlphabetIndexer} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef
} from '@ohos.arkui.stateManagement';
import { ImageModifier } from "@ohos.arkui.modifier";
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';

class CustomModifier extends ImageModifier {
  applyImageAttribute(instance: ImageAttribute): void {
    // super.applyNormalAttribute?.(instance);
  }

  onChange1() {
    this.syncLoad(true)
  }
}

@Entry
@Component
struct ImageExample {
  @State customModifier: ImageModifier = new CustomModifier()
    .copyOption(CopyOptions.None)
    .colorFilter(new ColorFilter([0.5]))
    .syncLoad(true)
    .sourceSize({ width: AppStorage.get<UIContext>('uiContext')!.px2vp(200), height: AppStorage.get<UIContext>('uiContext')!.px2vp(100) })
    .interpolation(ImageInterpolation.None)
    .renderMode(ImageRenderMode.Original)
    .autoResize(true)
    .objectRepeat(ImageRepeat.NoRepeat)
    .objectFit(ImageFit.None)
    .fillColor("#FF182431")
    .fitOriginalSize(true)
    .matchTextDirection(true)
    .alt("aaa")
    .draggable(false)

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Button("change value").onClick((e: ClickEvent) => {
        (this.customModifier as CustomModifier).onChange1();
      }).key("changeButton")

      Column() {
        Image($r('app.media.blr_2'))
          .attributeModifier(this.customModifier as CustomModifier)
          .key('image')
      }
    }
    .margin({ top: 5 } as Margin)
  }
}