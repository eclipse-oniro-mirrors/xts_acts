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
@Entry
@Component
struct CheckboxgroupExample {
  @State checkgroupselectAll2: boolean = false
  @State checkboxselect: boolean = true

  build() {
    Scroll() {
      Column() {
        // 全选按钮
        Text(`checkgroupselectAll: ${this.checkgroupselectAll2}`).id('checkboxGroupText').height('5%')
        Flex({ justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
          CheckboxGroup({ group: 'checkboxGroup' })
            .selectAll($$this.checkgroupselectAll2)
            .checkboxShape(CheckBoxShape.ROUNDED_SQUARE)
            .selectedColor('#007DFF')
            .onChange((itemName: CheckboxGroupResult) => {
              console.info('checkbox group content' + JSON.stringify(itemName))
            }).height('5%')
          Text('Select All').fontSize(9).lineHeight(20).fontColor('#182431').fontWeight(500).height('5%')
        }

        // 选项1
        Flex({ justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
          Checkbox({ name: 'checkbox1', group: 'checkboxGroup' })
            .select($$this.checkboxselect)
            .selectedColor('#007DFF')
            .shape(CheckBoxShape.ROUNDED_SQUARE)
            .onChange((value: boolean) => {
              console.info('Checkbox1 change is' + value)
            }).height('5%')
            .id('checkboxGroup1')
          Text('Checkbox1').fontSize(9).lineHeight(20).fontColor('#182431').fontWeight(500).height('5%')
        }

        // 选项2
        Flex({ justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
          Checkbox({ name: 'checkbox2', group: 'checkboxGroup' })
            .selectedColor('#007DFF')
            .shape(CheckBoxShape.ROUNDED_SQUARE)
            .onChange((value: boolean) => {
              console.info('Checkbox2 change is' + value)
            }).height('5%')
            .id('checkboxGroup2')
          Text('Checkbox2').fontSize(9).lineHeight(20).fontColor('#182431').fontWeight(500).height('5%')
        }

        // 选项3
        Flex({ justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
          Checkbox({ name: 'checkbox3', group: 'checkboxGroup' })
            .selectedColor('#007DFF')
            .shape(CheckBoxShape.ROUNDED_SQUARE)
            .onChange((value: boolean) => {
              console.info('Checkbox3 change is' + value)
            }).height('5%')
            .id('checkboxGroup3')
          Text('Checkbox3').fontSize(9).lineHeight(20).fontColor('#182431').fontWeight(500).height('5%')
        }
      }
    }
  }
}