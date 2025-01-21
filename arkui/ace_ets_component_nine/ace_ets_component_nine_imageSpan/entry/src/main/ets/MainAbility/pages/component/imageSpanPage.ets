// @ts-nocheck
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
import events_emitter from '@ohos.events.emitter';

class MyImageSpanComponentModifier implements AttributeModifier<ImageSpanAttribute> {
  verticalAlignValue: ImageSpanAlignment = ImageSpanAlignment.BOTTOM
  objectFitValue: ImageFit = ImageFit.Cover
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.verticalAlign(this.verticalAlignValue)
    instance.objectFit(this.objectFitValue)
  }
}

@Entry
@Component
struct ImageExample {
  @State message : string = 'imageSpan'
  @State mod1 : MyImageSpanComponentModifier = new MyImageSpanComponentModifier()

  @State verticalAlignValue: ImageSpanAlignment = ImageSpanAlignment.BOTTOM
  @State objectFitValue: ImageFit = ImageFit.Cover

  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("ImageSpan page state change called:" + JSON.stringify(eventData));
      if (eventData.data.verticalAlignValue != null) {
        this.mod1.verticalAlignValue = eventData.data.verticalAlignValue;
        //old test
        this.verticalAlignValue = eventData.data.verticalAlignValue;
      } else if (eventData.data.objectFitValue != null) {
        this.mod1.objectFitValue = eventData.data.objectFitValue;
        //old test
        this.objectFitValue = eventData.data.objectFitValue;
      }
    }
  }

  onPageShow() {
    console.info('image page1 show called');
    var stateChangeEvent = {
      eventId: 10101,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
    var stateChangeEvent2 = {
      eventId: 10102,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent2, this.stateChangCallBack);
  }

  build() {
    Column() {
      Text('ImageSpan')
        .fontSize(26)
        .width('90%')
        .margin({ top: 20 })
      Text('VerticalAlign')
        .fontSize(18)
        .width('90%')
        .margin({ top: 20, bottom: 20 })
      Text() {
        ImageSpan($r('app.media.icon'))
          .width('200px')
          .height('200px')
        .attributeModifier(this.mod1)
        .key('keyImageSpan')   
        Span(' I am LineThrough-span').fontColor(Color.Red)
      }
    }
   }
}