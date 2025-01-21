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

class MyImageComponentModifier implements AttributeModifier<ImageAttribute> {
  colorFilterValueType:string="colorFilterValueType001"
  altValue: string | Resource = "/test/assert/icon.png"
  autoResizeValue : boolean = true
  copyOptionsValue : CopyOptions = CopyOptions.None
  draggableValue : boolean = false;
  fillColorValue : ResourceColor = '#007DFF';
  fitOriginalSizeValue : boolean = false;
  interpolationValue : ImageInterpolation = ImageInterpolation.None
  matchTextDirectionValue : boolean = false
  objectFitValue : ImageFit = ImageFit.Cover
  objectRepeatValue : ImageRepeat = ImageRepeat.NoRepeat
  renderModeValue : ImageRenderMode = ImageRenderMode.Original
  sourceSizeValueType: string="sourceSizeValueType001"
  syncLoadValue : boolean = false
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.alt(this.altValue)
    instance.autoResize(this.autoResizeValue)
    if(this.colorFilterValueType==="colorFilterValueType001") {
        instance.colorFilter([1, 0, 0, 0, 0,
          0, 1, 0, 0, 0,
          0, 0, 1, 0, 0,
          0, 0, 0, 1, 0])
    }
    instance.copyOption(this.copyOptionsValue)
    instance.draggable(this.draggableValue)
    instance.fillColor(this.fillColorValue)
    instance.fitOriginalSize(this.fitOriginalSizeValue)
    instance.interpolation(this.interpolationValue)
    instance.matchTextDirection(this.matchTextDirectionValue)
    instance.objectFit(this.objectFitValue)
    instance.objectRepeat(this.objectRepeatValue)
    instance.renderMode(this.renderModeValue)
    if(this.sourceSizeValueType==="sourceSizeValueType001") {
        instance.sourceSize({width:100,height:100})
    }
    instance.syncLoad(this.syncLoadValue)
  }
}


@Entry
@Component
struct ImageExample {
  @State message : string = 'image'
  @State mod1 : MyImageComponentModifier = new MyImageComponentModifier()

  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("Image page state change called:" + JSON.stringify(eventData));
      if (eventData.data.altValue != null) {
        this.mod1.altValue = eventData.data.altValue;
      } else if (eventData.data.autoResizeValue != null) {
        this.mod1.autoResizeValue = eventData.data.autoResizeValue;
      } else if (eventData.data.colorFilterValue != null) {
        this.mod1.colorFilterValueType = eventData.data.colorFilterValue;
      } else if (eventData.data.copyOptionsValue != null) {
        this.mod1.copyOptionsValue = eventData.data.copyOptionsValue;
      } else if (eventData.data.draggableValue != null) {
        this.mod1.draggableValue = eventData.data.draggableValue;
      } else if (eventData.data.fillColorValue != null) {
        this.mod1.fillColorValue = eventData.data.fillColorValue;
      }  else if (eventData.data.fitOriginalSizeValue != null) {
        this.mod1.fitOriginalSizeValue = eventData.data.fitOriginalSizeValue;
      } else if (eventData.data.interpolationValue != null) {
        this.mod1.interpolationValue = eventData.data.interpolationValue;
      } else if (eventData.data.matchTextDirectionValue != null) {
        this.mod1.matchTextDirectionValue = eventData.data.matchTextDirectionValue;
      }  else if (eventData.data.objectFitValue != null) {
        this.mod1.objectFitValue = eventData.data.objectFitValue;
      } else if (eventData.data.objectRepeatValue != null) {
        this.mod1.objectRepeatValue = eventData.data.objectRepeatValue;
      } else if (eventData.data.renderModeValue != null) {
        this.mod1.renderModeValue = eventData.data.renderModeValue;
      } else if (eventData.data.sourceSizeValue != null) {
        this.mod1.sourceSizeValueType = eventData.data.sourceSizeValue;
      } else if (eventData.data.syncLoadValue != null) {
        this.mod1.syncLoadValue = eventData.data.syncLoadValue;
      }
    }
  }

  onPageShow() {
    console.info('image page1 show called');
    var stateChangeEvent = {
      eventId: 6801,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
    var stateChangeEvent2 = {
      eventId: 6802,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent2, this.stateChangCallBack);
    var stateChangeEvent3 = {
      eventId: 6803,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent3, this.stateChangCallBack);
    var stateChangeEvent4 = {
      eventId: 6804,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent4, this.stateChangCallBack);
    var stateChangeEvent5 = {
      eventId: 6805,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent5, this.stateChangCallBack);
    var stateChangeEvent6 = {
      eventId: 6806,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent6, this.stateChangCallBack);
    var stateChangeEvent7 = {
      eventId: 6807,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent7, this.stateChangCallBack);
    var stateChangeEvent8 = {
      eventId: 6808,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent8, this.stateChangCallBack);
    var stateChangeEvent9 = {
      eventId: 6809,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent9, this.stateChangCallBack);
    var stateChangeEvent10 = {
      eventId: 6810,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent10, this.stateChangCallBack);
    var stateChangeEvent11 = {
      eventId: 6811,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent11, this.stateChangCallBack);
    var stateChangeEvent12 = {
      eventId: 6812,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent12, this.stateChangCallBack);
    var stateChangeEvent13 = {
      eventId: 6813,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent13, this.stateChangCallBack);
    var stateChangeEvent14 = {
      eventId: 6814,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent14, this.stateChangCallBack);
    var stateChangeEvent15 = {
      eventId: 6815,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent15, this.stateChangCallBack);
    var stateChangeEvent16 = {
      eventId: 6816,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent16, this.stateChangCallBack);
    var stateChangeEvent17 = {
      eventId: 6817,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent17, this.stateChangCallBack);
    var stateChangeEvent18 = {
      eventId: 6818,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent18, this.stateChangCallBack);
    var stateChangeEvent19 = {
      eventId: 6819,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent19, this.stateChangCallBack);
    var stateChangeEvent20 = {
      eventId: 6820,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent20, this.stateChangCallBack);
    var stateChangeEvent21 = {
      eventId: 6821,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent21, this.stateChangCallBack);
    var stateChangeEvent22 = {
      eventId: 6822,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent22, this.stateChangCallBack);
    var stateChangeEvent23 = {
      eventId: 6823,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent23, this.stateChangCallBack);
  }

  build() {
    Column() {
      Text(this.message).fontSize(9).fontColor(0xCCCCCC)
       Row() {
         Image($r('app.media.beautiful'))
           .size({ width:110, height:110 })
           .margin({top: 50})
           .key('keyImage')           
           .attributeModifier(this.mod1)
       }.width("100%").justifyContent(FlexAlign.Center)
     }
   }
}