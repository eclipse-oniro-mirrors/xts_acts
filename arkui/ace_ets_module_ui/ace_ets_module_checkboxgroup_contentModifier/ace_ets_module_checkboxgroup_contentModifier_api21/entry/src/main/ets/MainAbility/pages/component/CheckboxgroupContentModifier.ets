/**
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
import events_emitter from '@ohos.events.emitter';
class MyCheckboxGroupStyle implements ContentModifier<CheckBoxGroupConfiguration> {
  public selectedColor: Color = Color.Black;
  public checkBoxGroupName: string = 'CheckboxGroup';

  constructor(selectedColor: Color) {
    this.selectedColor = selectedColor;
  }

  applyContent(): WrappedBuilder<[CheckBoxGroupConfiguration]> {
    return wrapBuilder(buildCheckboxgroup);
  }
}

@Builder
function buildCheckboxgroup(config: CheckBoxGroupConfiguration) {
  Column({ space: 10 }) {
    Text(`selectedColor:${(config.contentModifier as MyCheckboxGroupStyle).selectedColor}`).id('CheckboxgroupContentModifier01')
    Text(`checkBoxGroupName:${config.name}`).id('CheckboxgroupContentModifier02')
    Shape() {
      Path()
        .key('pentagon')
        .width(100)
        .height(100)
        .commands('M100 0 L0 100 L50 200 L150 200 L200 100 Z')
        .fillOpacity(0)
        .strokeWidth(3)
        .onClick(() => {
          if (config.status === SelectStatus.All ||  config.status === SelectStatus.Part) {
            config.triggerChange(false);
          } else {
            config.triggerChange(true);
          }
        })
        .opacity(config.enabled ? 1 : 0.1)
      Path()
        .key('triangle1')
        .width(10)
        .height(10)
        .commands('M50 0 L100 100 L0 100 Z')
        .visibility(config.status === SelectStatus.All ? Visibility.Visible : Visibility.Hidden)
        .fill(Color.Red)
        .stroke((config.contentModifier as MyCheckboxGroupStyle).selectedColor)
        .margin({ left: 10, top: 10 })
        .opacity(config.enabled ? 1 : 0.1)
      Path()
        .key('triangle2')
        .width(10)
        .height(10)
        .commands('M50 0 L100 100 L0 100 Z')
        .visibility(config.status === SelectStatus.Part ? Visibility.Visible : Visibility.Hidden)
        .fill(Color.Yellow)
        .stroke((config.contentModifier as MyCheckboxGroupStyle).selectedColor)
        .margin({ left: 10, top: 10 })
        .opacity(config.enabled ? 1 : 0.1)
    }
    .width(300)
    .height(200)
    .viewPort({
      x: 0,
      y: 0,
      width: 310,
      height: 310
    })
    .id('checkboxgroup_shape')
    .strokeLineJoin(LineJoinStyle.Miter)
    .strokeMiterLimit(5)
    .margin({ left: 50 })
    .onClick(() => {
          // 点击后，触发复选框点击状态变化
          if (config.status == 0 || config.status == 1) {
            console.info('1 CheckboxgroupContentModifier config.name :' + config.name);
            config.triggerChange(false);
          } else {
            console.info('2 CheckboxgroupContentModifier config.name :' + config.name);
            config.triggerChange(true);
          }
        })
  }
}

@Entry
@Component
struct Index {
  @State checkboxEnabled: boolean = true;
  @State myCheckboxGroupStyle: MyCheckboxGroupStyle | null | undefined = new MyCheckboxGroupStyle(Color.Red)
  @State colorValue: Color = Color.Red;
  @State select1: boolean = false;
  @State select2: boolean = false;
  @State groupName: CheckboxGroupOptions = { group: 'checkboxGroup' };
  private stateChangCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info('CheckboxgroupContentModifier page state change called:' + JSON.stringify(eventData));
      if (eventData.data?.groupName != null) {
        this.groupName = eventData.data?.groupName;
        this.myCheckboxGroupStyle = new MyCheckboxGroupStyle(this.colorValue)
      }
      if (eventData.data?.colorValue != null) {
        this.colorValue = eventData.data?.colorValue;
        this.myCheckboxGroupStyle = new MyCheckboxGroupStyle(this.colorValue)
      }
      if (eventData.data?.CheckboxGroupStyle == 'undefined') {
        this.myCheckboxGroupStyle = undefined
      }
      if (eventData.data?.CheckboxGroupStyle == 'null') {
        this.myCheckboxGroupStyle = null
      }
      if (eventData.data?.selectState != null) {
        if (eventData.data?.selectState == 1) {
          this.select1 = true;
          this.select2 = true;
        } else if (eventData.data?.selectState == 2) {
          this.select1 = false;
          this.select2 = true;
        } else if (eventData.data?.selectState == 3) {
          this.select1 = true;
          this.select2 = false;
        } else {
          this.select1 = false;
          this.select2 = false;
        }
      }
    }
  }

  onPageShow() {
    console.info('Badge page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 66,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
    let stateChangeEventOne: events_emitter.InnerEvent = {
      eventId: 67,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventOne, this.stateChangCallBack);
    let stateChangeEventTwo: events_emitter.InnerEvent = {
      eventId: 68,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventTwo, this.stateChangCallBack);
    let stateChangeEventThree: events_emitter.InnerEvent = {
      eventId: 69,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventThree, this.stateChangCallBack);
    let stateChangeEventFour: events_emitter.InnerEvent = {
      eventId: 70,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventFour, this.stateChangCallBack);
  }

  build() {
    Column({ space: 100 }) {
      CheckboxGroup(this.groupName)
        .key('CheckboxGroup')
        .contentModifier(this.myCheckboxGroupStyle)
        .onChange((itemName: CheckboxGroupResult) => {
          console.info(' CheckboxGroup onChange: ' + JSON.stringify(itemName));
        })
        .enabled(this.checkboxEnabled)

      Row() {
        Toggle({ type: ToggleType.Switch, isOn: true }).onChange((value: boolean) => {
          if (value) {
            this.checkboxEnabled = true;
          } else {
            this.checkboxEnabled = false;
          }
        })
      }.position({ x: 50, y: 130 })
      Row() {
        Checkbox({ name: '复选框1', group: 'checkboxGroup' })
          .select(this.select1)
          .onChange((value: boolean) => {
            console.info('复选框1 change to ' + value);
          })
        Text('复选框1').fontSize(20)
      }
        .position({ x: 50, y: 230 })
      Row() {
        Checkbox({ name: '复选框2', group: 'checkboxGroup' })
          .select(this.select2)
          .onChange((value: boolean) => {
            console.info('复选框2 change to ' + value);
          })
        Text('复选框2').fontSize(20)
      }
      .position({ x: 50, y: 260 })
    }.margin({ top: 30 })
  }
}