/**
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
class MyButtonModifier3 implements AttributeModifier<CheckboxAttribute> {
  isDark: boolean = false

  applySelectedAttribute(instance: CheckboxAttribute): void {
    if(this.isDark){
      instance.selectedColor("#FF209B08")
    } else {
      instance.selectedColor("#ffd2c01e")
    }
  }
}

@Entry
@Component
struct AttributeModifierDemoAPI03 {
  @State modifier: MyButtonModifier3 = new MyButtonModifier3()
  @State flag: boolean = false

  build() {
    Column({space:10}) {
      Checkbox({name: 'checkbox1',  group: 'checkboxGroup'}).key('AttributeModifierDemoAPI03Checkbox')
        .height(150)
        .select(this.flag)
        .selectedColor(Color.Pink)
        .shape(CheckBoxShape.ROUNDED_SQUARE)
        .attributeModifier(this.modifier)

      Button('isDark true').margin(20).key('AttributeModifierDemoAPI03isDark')
        .onClick(() => {
          this.modifier.isDark = true
        })

      Button('选中').width(150).key('AttributeModifierDemoAPI03Selected')
        .onClick(() => {
          this.flag = true
        })
    }
    .width('100%')
  }
}