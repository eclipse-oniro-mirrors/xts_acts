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
import { Entry,NavPathStack,Scroll,Component,XComponent,Image,ImageSize, XComponentType,
  XComponentParameters,$r,ResourceStr,Builder,List,ListItem,Resource,NavigationTitleMode,
  NavigationMode,Column,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,Position,
  EffectType,EffectComponent,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,
  Week,FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, CalendarPicker,
  EdgeEffect,Curve,SwiperDisplayMode,ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,
  TextAlign,AlphabetIndexer} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,Provide
} from '@ohos.arkui.stateManagement';
import XComponentContext from './interface/XcomponentContext'
import componentSnapshot from '@ohos.arkui.componentSnapshot'
import image from '@ohos.multimedia.image'
import { BusinessError } from '@ohos.base'
import CommonFunc from '../../common/Common'
@Entry
@Component
struct SurfaceComponent {
  private xComponentContext:XComponentContext | undefined = undefined;
  @State isSecure_:boolean = false;
  @State pixmap: image.PixelMap | undefined = undefined
  build() {
    Scroll(){
      Column({space:10} as ColumnOptions){
        Text('xComponent 表面类型')
        Button(`${this.isSecure_?'关闭':'开启'}隐私图层`)
        .id('enableSecureTest_button1')
		.onClick((event: ClickEvent) => {
          console.info('enableSecureTest_static_0010 onClick',!this.isSecure_);
          this.isSecure_ = !this.isSecure_;
        })

        Column({space:10} as ColumnOptions){
          XComponent({
            id : 'xcomponentId',
            type : XComponentType.SURFACE,
            nativeXComponentHandler: ((value0: long): void => {})
          } as XComponentParameters)
            .onLoad((): void => {
              this.xComponentContext = new XComponentContext();
              if (this.xComponentContext) {
                this.xComponentContext?.drawPattern();
              }
            })
            .onDestroy((): void =>{
              console.log('onDestroy');
            })
            .id('xcomponent')
            .enableSecure(this.isSecure_)
            .backgroundColor(Color.Red)
            .width('80%')
            .height('30%')
        }

        Button('xcomponent区域截图')
          .id('enableSecureTest_button2')
          .onClick((event: ClickEvent) => {
            this.getUIContext().getComponentSnapshot().get('xcomponent',(error : BusinessError|null,pixmap:image.PixelMap|undefined) => {
            if (error) {
              console.log('xcomponent区域截图error:' + JSON.stringify(error))
              return;
            }
            this.pixmap = pixmap
          })
        })
      }
      .width('100%')
      .backgroundImageSize(ImageSize.Cover)
      .backgroundColor(Color.White)
    }
  }
}