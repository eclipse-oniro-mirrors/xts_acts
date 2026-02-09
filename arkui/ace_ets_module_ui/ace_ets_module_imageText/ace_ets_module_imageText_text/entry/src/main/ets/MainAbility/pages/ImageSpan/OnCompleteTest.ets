/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
@Entry
@Component
struct Index {
  @State src: ResourceStr = $r('app.media.icon');
  @State loadingStatus:number = 1
  @State contentWidth:number = 1
  @State contentHeight:number = 1
  @State contentOffsetX:number = 1
  @State contentOffsetY:number = 1
  build(){
    Column(){
      Text('' + this.loadingStatus).id('DloadingStatus')
      Text('' + this.contentWidth).id('DcontentWidth')
      Text('' + this.contentHeight).id('DcontentHeight')
      Text('' + this.contentOffsetX).id('DcontentOffsetX')
      Text('' + this.contentOffsetY).id('DcontentOffsetY')
      Text(){
        ImageSpan(this.src).objectFit(ImageFit.Fill)
          .width(100).height(100)
          .onError((err)=>{
            console.log('onError:' + err.message)
          })
          .onComplete((event)=>{
            console.log('onComplete:event.loadingStatus ' + event.loadingStatus )
            console.log('onComplete:event.contentWidth ' + event.contentWidth )
            console.log('onComplete:event.contentHeight ' + event.contentHeight )
            console.log('onComplete:event.contentOffsetX ' + event.contentOffsetX )
            console.log('onComplete:event.contentOffsetY ' + event.contentOffsetY )
            this.loadingStatus =  event.loadingStatus
            this.contentWidth =  event.contentWidth
            this.contentHeight =  event.contentHeight
            this.contentOffsetX =  event.contentOffsetX
            this.contentOffsetY =  event.contentOffsetY
          })
      }
    }.width('100%').height('100%')
  }
}
