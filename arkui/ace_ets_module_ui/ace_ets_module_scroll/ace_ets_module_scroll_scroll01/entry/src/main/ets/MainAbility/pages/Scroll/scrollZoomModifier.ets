/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { ScrollModifier } from '@ohos.arkui.modifier';

class MyScrollModifier extends ScrollModifier {
  applyNormalAttribute(instance: ScrollAttribute): void {
    super.applyNormalAttribute?.(instance);
  }
}

@Entry
@Component
struct ScrollZoomModifierExample {
  @State didZoom: string = 'zoom'
  @State zoomStart: string = 'start'
  @State zoomStop: string = 'stop'
  @State modifier: ScrollModifier = new MyScrollModifier()
    .scrollable(ScrollDirection.FREE)
    .maxZoomScale(3)
    .minZoomScale(1)
    .zoomScale(1)
    .enableBouncesZoom(true)
    .onZoomStart(()=>{
      this.zoomStart = 'onZoomStart'
      console.log('Scroll onZoomStart');
    })
    .onZoomStop(()=>{
      this.zoomStop = 'onZoomStop'
      console.log('Scroll onZoomStop');
    })
    .onDidZoom((scale: number)=>{
      this.didZoom = 'onDidZoom: ' + scale
      console.log(`Scroll onDidZoom:${scale}`);
    })

  build() {
    Column() {
      Text(this.didZoom)
        .margin({top:10})
        .id('modifier_didZoom')
      Row(){
        Text(this.zoomStart)
          .id('zoom_start_modifier')
          .margin({right:10})
        Text(this.zoomStop)
          .id('zoom_stop_modifier')
      }
      Scroll() {
        Image($r('app.media.icon'))
          .id('img_zoom_modifier')
          .width('100%')
          .height('100%')
      }
      .id('scroll_zoom_modifier')
      .attributeModifier(this.modifier)
      .width('80%')
      .height('50%')
      .borderWidth(1)
    }.width('100%')
    .height('100%')
  }
}