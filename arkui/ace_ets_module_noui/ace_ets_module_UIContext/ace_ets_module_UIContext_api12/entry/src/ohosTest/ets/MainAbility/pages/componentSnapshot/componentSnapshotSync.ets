/*
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
import componentSnapshot from '@ohos.arkui.componentSnapshot';
import image from '@ohos.multimedia.image';
@Entry
@Component
struct componentSnapshotSync{
  @State pixmap:image.PixelMap | undefined = undefined
  @State code:string =''
  @State code1:string =''
  @State code2:string =''
  @State code3:string =''
  @State code4:string =''
  build() {
      Column({space:5}){
      Text(''+this.code).key('ERRORcODE')
      Text(''+this.code1).key('ERRORcODE1')
      Text(''+this.code2).key('ERRORcODE2')
      Text(''+this.code3).key('ERRORcODE3')
      Text(''+this.code4).key('ERRORcODE4')

      Row({space:5}){
        Image(this.pixmap).width('10%').height('10%').border({color:Color.Black,width:2}).objectFit(ImageFit.None)
      }
      Row({space:5}){
        Image($r('app.media.icon')).width('5%').height('5%').id('image1')
        Image($r('app.media.icon')).width('5%').height('5%').id('image2').visibility(Visibility.None)
        Column({space:10}){
          Button('getSync1')
            .id('gPromise')
            .onClick(()=>{
              try {
                let pixelmap = componentSnapshot.getSync('image2',{scale:1,waitUntilRenderFinished:true});
                this.pixmap = pixelmap
              } catch (error) {
                this.code = error.code
              }
            }).height('5%')
          Button('getSync-0.1')
            .id('gPromise1')
            .onClick(()=>{
              try {
                let pixelmap =componentSnapshot.getSync('-0.1',{scale:4,waitUntilRenderFinished:true});
                this.pixmap = pixelmap
              } catch (error) {
                this.code1 = error.code
              }
            }).height('5%')
          Button('getSync-2')
            .id('gPromise2')
            .onClick(()=>{
              try {
                let pixelmap = componentSnapshot.getSync('-2',{scale:4,waitUntilRenderFinished:false});
                this.pixmap = pixelmap
              } catch (error) {
                this.code2 = error.code
              }
            }).height('5%')
          Button('getSyncab')
            .id('gPromise3')
            .onClick(()=>{
              try {
                let pixelmap = componentSnapshot.getSync('ab',{scale:0.5,waitUntilRenderFinished:true});
                this.pixmap = pixelmap
              } catch (error) {
                this.code3 = error.code
              }
            }).height('5%')
          Button('getSyncabtest')
            .id('gPromise4')
            .onClick(()=>{
              try {
                let pixelmap = componentSnapshot.getSync('1',{scale:1,waitUntilRenderFinished:true});
                this.pixmap = pixelmap
              } catch (error) {
                this.code4 = error.code
              }
            }).height('5%')
        }
      }
    }.width('100%').height('100%')
  }
  
}