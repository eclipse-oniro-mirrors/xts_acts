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
class MyCheckboxStyle_trigger implements ContentModifier<CheckBoxConfiguration> {
  selectedColor: Color = Color.White
  constructor(selectedColor: Color) {
    this.selectedColor = selectedColor;
  }
  applyContent() : WrappedBuilder<[CheckBoxConfiguration]>
  {
    return wrapBuilder(buildCheckbox_trigger)
  }
}

@Builder function buildCheckbox_trigger(config: CheckBoxConfiguration) {
  Column({space:10}) {
    Text(config.name  + (config.selected ? "（ 选中 ）" : "（ 非选中 ）")).margin({right : 70, top : 50})
    Text(config.enabled ? "enabled true" : "enabled false").margin({right : 110})
    Text(config.selected ? "triggerChange true" : "triggerChange false").margin({right : 110}).id("triggerChangeMessage")
    Shape() {
      Path().width(100).height(100).commands('M100 0 L0 100 L50 200 L150 200 L200 100 Z').fillOpacity(0).strokeWidth(3).onClick(()=>{
        if (config.selected) {
          config.triggerChange(false)
          console.log("config.triggerChange: " + config.triggerChange)
        } else {
          config.triggerChange(true)
          console.log("config.triggerChange: " + config.triggerChange)
        }
      }).opacity(config.enabled ? 1 : 0.1)
      Path().width(10).height(10).commands('M50 0 L100 100 L0 100 Z')
        .visibility(config.selected ? Visibility.Visible : Visibility.Hidden)
        .fill(config.selected ? (config.contentModifier as MyCheckboxStyle_trigger).selectedColor : Color.Black)
        .stroke((config.contentModifier as MyCheckboxStyle_trigger).selectedColor)
        .margin({left:11,top:10})
        .opacity(config.enabled ? 1 : 0.1)
    }
    .width(300)
    .height(200)
    .viewPort({ x: 0, y: 0, width: 310, height: 310 })
    .strokeLineJoin(LineJoinStyle.Miter)
    .strokeMiterLimit(5)
    .margin({left:50})
  }
}

@Entry
@Component
struct triggerChangeExample {
  @State checkboxEnabled: boolean = true;
  build() {
    Column({ space: 100 }) {
      Checkbox({ name: '复选框状态', group: 'checkboxGroup' })
        .contentModifier(new MyCheckboxStyle_trigger(Color.Red))
        .onChange((value: boolean) => {
          console.info('Checkbox change is' + value)
        }).enabled(this.checkboxEnabled)

      Row() {
        Toggle({ type: ToggleType.Switch, isOn: true }).onChange((value: boolean) => {
          if (value) {
            this.checkboxEnabled = true
          } else {
            this.checkboxEnabled = false
          }
        })
      }
    }.margin({top : 30})
  }
}