/*
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
// @ts-nocheck
import hilog from '@ohos.hilog';
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct Index {
  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
    console.info("key==>pages res : onPageShow")
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("key==> page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data.value == "true") {
        if (eventData.data.content == "no") {
          this.valueNo = true;
        }
        if (eventData.data.content == "null") {
          this.value = true
          this.isStr = false
          this.isNum = false
          this.isNUll = true
        }
        if (eventData.data.content == "undefined") {
          this.value = true
          this.isStr = false
          this.isNum = false
          this.isNUll = false
        }
        if (eventData.data.content == "ResourceTest") {
          this.Style = SliderStyle.InSet
          this.resFalg = true
        }
      }
      if (eventData.data.value == "false") {
        if (eventData.data.content == "no") {
          this.valueNo = false;
        }
        if (eventData.data.content == "null") {
          this.value = false
          this.isStr = false
          this.isNum = false
          this.isNUll = true
        }
        if (eventData.data.content == "undefined") {
          this.value = false
          this.isStr = false
          this.isNum = false
          this.isNUll = false
        }
        if (eventData.data.content == "ResourceTest") {
          this.Style = SliderStyle.OutSet
          this.resFalg = false
        }
      }
      if (eventData.data.value == "trueStr") {
        this.Style = SliderStyle.InSet
        this.isStr = true
        this.value = true
        this.content = eventData.data.content;
      }
      if (eventData.data.value == "falseStr") {
        this.Style = SliderStyle.OutSet
        this.value = false
        this.isStr = true
        this.content = eventData.data.content;
      }
      if (eventData.data.value == "trueNum") {
        this.isStr = false
        this.isNum = true
        this.value = true
        this.num = Number(eventData.data.content);
      }
      if (eventData.data.value == "falseNum") {
        this.value = false
        this.isStr = false
        this.isNum = true
        this.num = Number(eventData.data.content);
      }
    }

  }

  aboutToAppear() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility index aboutToAppear');
  }

  @State ValueOne: number = 40;
  @State ValueTwo: number = 40;
  @State ValueThi: number = 40;
  @State ValueFour: number = 40;
  @State value: boolean = false;
  @State isStr: boolean = false;
  @State isNum: boolean = false;
  @State isNUll: boolean = false;
  @State valueNo: boolean = false;
  @State resFalg: boolean = false;
  @State content: string = "";
  @State style: SliderStyle = SliderStyle.InSet;
  @State direction: enum = Axis.Vertical;

  build() {
    Row() {
      Column() {
        Slider({
          value: this.ValueOne,
          min: 0,
          max: 100,
          style: this.Style
        })
          .showTips(this.value, this.isStr ? this.content : (this.isNum ? this.num : (this.isNUll ? null : undefined)))
          .onChange((value: number, mode: SliderChangeMode) => {
            this.ValueOne = value
            console.info('value:' + value + 'mode:' + mode.toString())
          })
          .key('Slider')
        Slider({
          value: this.ValueTwo,
          min: 0,
          max: 100,
          style: this.Style
        })
          .showTips(this.valueNo)
          .onChange((value: number, mode: SliderChangeMode) => {
            this.ValueTwo = value
            console.info('value:' + value + 'mode:' + mode.toString())
          })
          .key('SliderNoContent')
        Row() {
          Slider({
            value: this.ValueThi,
            step: 10,
            style: this.Style,
            direction: Axis.Vertical
          })
            .height(300)
            .showSteps(true)
            .showTips(this.resFalg, $r("app.string.sliderTest"))
            .onChange((value: number, mode: SliderChangeMode) => {
              this.ValueThi = value
              console.info('value:' + value + 'mode:' + mode.toString())
            })
            .key('SliderResourceTest')
          Slider({
            value: this.ValueFour,
            step: 10,
            style: this.Style,
            direction: Axis.Vertical
          })
            .height(300)
            .showSteps(true)
            .onChange((value: number, mode: SliderChangeMode) => {
              this.ValueFour = value
              console.info('value:' + value + 'mode:' + mode.toString())
            })
            .key('SliderNoShowTips')
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}