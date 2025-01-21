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

class MyImageAnimatorImagesComponentModifier implements AttributeModifier<ImageAnimatorAttribute> {
  stateValue: AnimationStatus = AnimationStatus.Running;
  reverseValue: boolean = true;
  durationValue: number = 3000;
  iterationsValue: number = -1;
  fillmodeValue: FillMode = FillMode.None;
  fixedSizeValue: boolean = true;
  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    instance.images([
      {
        src: '/pages/assert/c1.png',
        width: "400px",
        height: "400px"
      },
      {
        src: '/pages/assert/c2.png',
        width: "400px",
        height: "400px"
      }
    ])
    instance.state(this.stateValue)
    instance.reverse(this.reverseValue)
    instance.duration(this.durationValue)
    instance.iterations(this.iterationsValue)
    instance.fillMode(this.fillmodeValue)
    instance.fixedSize(this.fixedSizeValue)
  }
}

@Entry
@Component
struct ImageAnimatorExample {
  @State mod1: MyImageAnimatorImagesComponentModifier = new MyImageAnimatorImagesComponentModifier();
 
  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("ImageAnimatorPage state change called:" + JSON.stringify(eventData));
      if (eventData.data.fillmodeValue != null) {
        this.mod1.fillmodeValue = eventData.data.fillmodeValue;
      } else if (eventData.data.stateValue != null) {
        this.mod1.stateValue = eventData.data.stateValue;
      } else if (eventData.data.durationValue != null) {
        this.mod1.durationValue = eventData.data.durationValue;
      } else if (eventData.data.reverseValue != null) {
        this.mod1.reverseValue = eventData.data.reverseValue;
      } else if (eventData.data.iterationsValue != null) {
        this.mod1.iterationsValue = eventData.data.iterationsValue;
      } else if (eventData.data.fixedSizeValue != null) {
        this.mod1.fixedSizeValue = eventData.data.fixedSizeValue;
      }
    }
  }

  onPageShow() {
    console.info('ImageAnimator page show called');
    let stateChangeEvent = {
      eventId: 101,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
    let stateChangeEvent2 = {
      eventId: 102,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent2, this.stateChangCallBack);
    let stateChangeEvent3 = {
      eventId: 103,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent3, this.stateChangCallBack);
    let stateChangeEvent4 = {
      eventId: 104,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent4, this.stateChangCallBack);
    let stateChangeEvent5 = {
      eventId: 105,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent5, this.stateChangCallBack);
    let stateChangeEvent6 = {
      eventId: 106,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent6, this.stateChangCallBack);
  }

  build() {
    Scroll() {
      Column() {
        Text('ImageAnimator images [modifier]')
        ImageAnimator()
          .key('keyImageAnimator_images')
          .attributeModifier(this.mod1)
          .width(170)
          .height(120)

      }.width('100%').justifyContent(FlexAlign.Center)
    }.scrollable(ScrollDirection.Vertical)
  }
}
