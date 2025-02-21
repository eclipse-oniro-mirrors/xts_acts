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

class MyPatternLockComponentModifier implements AttributeModifier<PatternLockAttribute> {
   activeColorValue: ResourceColor = '#FFB0C4DE'
   autoResetValue: boolean = false
   circleRadiusValue: number | string = '6.00vp'
   pathColorValue: ResourceColor = '#FF182431'
   pathStrokeWidthValue: string | number = '12.00vp'
   regularColorValue: ResourceColor = '#FF182431'
   selectedColorValue: ResourceColor = '#FF182431'
   sideLengthValue: number | string = '288vp'
  applyNormalAttribute(instance: PatternLockAttribute): void {
    instance.activeColor(this.activeColorValue)
    instance.autoReset(this.autoResetValue)
    instance.circleRadius(this.circleRadiusValue)
    instance.pathColor(this.pathColorValue)
    instance.pathStrokeWidth(this.pathStrokeWidthValue)
    instance.regularColor(this.regularColorValue)
    instance.selectedColor(this.selectedColorValue)
    instance.sideLength(this.sideLengthValue)
  }
}

@Entry
@Component
struct PatternLockExample {
  @State message: string = 'patternLock'
  @State mod1: MyPatternLockComponentModifier = new MyPatternLockComponentModifier()
  @State activeColorValue : ResourceColor = '#FFB0C4DE'
  @State autoResetValue: boolean = false;
  @State circleRadiusValue: number | string = '6.00vp'
  @State pathColorValue: ResourceColor = '#FF182431'
  @State pathStrokeWidthValue: string | number = '12.00vp'
  @State regularColorValue: ResourceColor = '#FF182431'
  @State selectedColorValue: ResourceColor = '#FF182431'
  @State sideLengthValue: number | string = '288.00vp'

  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("PatternLock page state change called:" + JSON.stringify(eventData));
      if (eventData.data.activeColorValue != null) {
        this.mod1.activeColorValue = eventData.data.activeColorValue;
        //old test
        this.activeColorValue = eventData.data.activeColorValue;
      } else if (eventData.data.autoResetValue != null) {
        this.mod1.autoResetValue = eventData.data.autoResetValue;
        //old test
        this.autoResetValue = eventData.data.autoResetValue;
      } else if (eventData.data.circleRadiusValue != null) {
        this.mod1.circleRadiusValue = eventData.data.circleRadiusValue;
        //old test
        this.circleRadiusValue = eventData.data.circleRadiusValue;
      } else if (eventData.data.pathColorValue != null) {
        this.mod1.pathColorValue = eventData.data.pathColorValue;
        //old test
        this.pathColorValue = eventData.data.pathColorValue;
      } else if (eventData.data.pathStrokeWidthValue != null) {
        this.mod1.pathStrokeWidthValue = eventData.data.pathStrokeWidthValue;
        //old test
        this.pathStrokeWidthValue = eventData.data.pathStrokeWidthValue;
      } else if (eventData.data.regularColorValue != null) {
        this.mod1.regularColorValue = eventData.data.regularColorValue;
        //old test
        this.regularColorValue = eventData.data.regularColorValue;
      } else if (eventData.data.selectedColorValue != null) {
        this.mod1.selectedColorValue = eventData.data.selectedColorValue;
        //old test
        this.selectedColorValue = eventData.data.selectedColorValue;
      } else if (eventData.data.sideLengthValue != null) {
        this.mod1.sideLengthValue = eventData.data.sideLengthValue;
        //old test
        this.sideLengthValue = eventData.data.sideLengthValue;
      }
        console.log("testPatternLock stateChangCallBack end" )
      }
    }

  onPageShow() {
    console.info('patternLock page1 show called');
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
  }
  
  build() {
    Column() {
      Text(this.message).textAlign(TextAlign.Center).margin(20).fontSize(20)
      PatternLock()
      .key("keyPatternLock")
      .attributeModifier(this.mod1)
    }.width('100%').height('100%')
  }
}