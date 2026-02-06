/**
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
import XComponentContext from './interface/XcomponentContext'
import componentSnapshot from '@ohos.arkui.componentSnapshot'
import image from '@ohos.multimedia.image'


@Entry
@Component
struct SurfaceComponent {
  private xComponentContext:XComponentContext | undefined = undefined;
  @State isSecure_:boolean = false;
  @State pixmap:image.PixelMap | undefined = undefined
  // @State img:string = 'undefined';
  build() {
    Scroll(){
      Column({space:10}){
        Text('xComponent 表面类型')
        Button(`${this.isSecure_?'关闭':'开启'}隐私图层`)
        .id('enableSecureTest_button1')
		.onClick((event: ClickEvent) => {
          this.isSecure_ = !this.isSecure_;
        })

        Column({space:10}){
          XComponent({
            id : 'xcomponentId',
            type : XComponentType.SURFACE,
            libraryname:'nativerender'
          })
            .onLoad((xComponentContext) => {
              this.xComponentContext = xComponentContext as XComponentContext;
              if (this.xComponentContext) {
                this.xComponentContext.drawPattern();
              }
            })
            .onDestroy(() =>{
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
          componentSnapshot.get('xcomponent',(error : Error,pixmap:image.PixelMap) => {
            if (error) {
              console.log('error:' + JSON.stringify(error))
              return;
            }
            this.pixmap = pixmap
          })
        })
        Image(this.pixmap)
          .id('enableSecureTest_image')
          .width('80%')
          .height('30%')
          .border({color:Color.Black,width:1
          })
      }
      .width('100%')
      .backgroundImageSize(ImageSize.Cover)
      .backgroundColor(Color.White)
    }
  }
}