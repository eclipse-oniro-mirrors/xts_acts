/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
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
 
import { CustomKeyboardContinueFeature } from '@ohos.arkui.UIContext';
@Entry
@Component
struct CustomKeyboardContinueTest {
  controller: TextInputController = new TextInputController();
  controller2: TextInputController = new TextInputController();
  @State inputValue: string = '';
  @State inputValue2: string = '';
  @State supportAvoidance: boolean = true;
  @State str: string = '否';
 
  // 自定义键盘组件
  @Builder
  CustomKeyboardBuilder() {
    Column() {
      Row() {
        Button('x').onClick(() => {
          // 关闭自定义键盘
          this.controller.stopEditing();
        }).margin(10)
        Button('delete').onClick(() => {
          this.inputValue = this.inputValue.slice(0, -1);
        }).margin(10)
      }
 
      Grid() {
        ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9, '*', 0, '#'], (item: number | string) => {
          GridItem() {
            Button(item + '')
              .width(110).onClick(() => {
              this.inputValue += item;
            })
          }
        })
      }.maxCount(3).columnsGap(10).rowsGap(10).padding(5)
    }.backgroundColor('rgb(213, 213, 213)').height(300)
  }
 
  // 自定义键盘组件
  @Builder
  CustomKeyboardBuilder2() {
    Column() {
      Row() {
        Button('x').onClick(() => {
          // 关闭自定义键盘
          this.controller2.stopEditing();
        }).margin(10)
        Button('delete').onClick(() => {
          this.inputValue2 = this.inputValue2.slice(0, -1);
        }).margin(10)
      }
 
      Grid() {
        ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9, '*', 0, '#'], (item: number | string) => {
          GridItem() {
            Button(item + '')
              .width(110).onClick(() => {
              this.inputValue2 += item;
            })
          }
        })
      }.maxCount(3).columnsGap(10).rowsGap(10).padding(5)
    }.backgroundColor('rgb(227, 248, 249)').height(150)
  }
 
  build() {
    Scroll() {
      Column() {
        Row(){
          Button('设置ENABLED').onClick(()=>{
            this.getUIContext().setCustomKeyboardContinueFeature(CustomKeyboardContinueFeature.ENABLED);
            AppStorage.setOrCreate('CustomKeyboardContinueFeature',CustomKeyboardContinueFeature.ENABLED)
          }).id('CustomKeyboardContinueFeatureBtn1')
          Button('设置DISABLED').onClick(()=>{
            this.getUIContext().setCustomKeyboardContinueFeature(CustomKeyboardContinueFeature.DISABLED);
            AppStorage.setOrCreate('CustomKeyboardContinueFeature',CustomKeyboardContinueFeature.DISABLED)
          }).id('CustomKeyboardContinueFeatureBtn2')
          Button('设置3').onClick(()=>{
            this.getUIContext().setCustomKeyboardContinueFeature(3);
          })
          Button('设置0').onClick(()=>{
            this.getUIContext().setCustomKeyboardContinueFeature(0);
          })
        }
        Row(){
          Button('设置1').onClick(()=>{
            this.getUIContext().setCustomKeyboardContinueFeature(1);
          })
          Button('设置null').onClick(()=>{
            this.getUIContext().setCustomKeyboardContinueFeature(null);
          })
          Button('设置undefined').onClick(()=>{
            this.getUIContext().setCustomKeyboardContinueFeature(undefined);
          })
        }
        TextInput({
          placeholder: 'TextInput1 bind CustomKeyboardBuilder',
          controller: this.controller,
          text: this.inputValue
        })// 绑定自定义键盘
          .customKeyboard(this.CustomKeyboardBuilder(), { supportAvoidance: this.supportAvoidance })
          .margin(10)
          .border({ width: 1 })
        TextInput({
          placeholder: 'TextInput2 bind CustomKeyboardBuilder2',
          controller: this.controller2,
          text: this.inputValue2
        })// 绑定自定义键盘
          .customKeyboard(this.CustomKeyboardBuilder2(), { supportAvoidance: this.supportAvoidance })
          .margin(10)
          .border({ width: 1 })
      }
    }
  }
}