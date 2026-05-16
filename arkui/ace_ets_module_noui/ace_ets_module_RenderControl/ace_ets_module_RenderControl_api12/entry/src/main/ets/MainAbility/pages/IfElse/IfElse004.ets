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

// 004 if/else与V2装饰器混用
@ObservedV2
class ClazzIf004 {
  @Trace public innerVal: number;

  constructor(innerVal: number) {
    this.innerVal = innerVal;
  }
}

@Entry
@ComponentV2
struct IfElse004 {
  @Local val: number = 0;
  @Local clazz: ClazzIf004 = new ClazzIf004(0);

  build() {
    Column() {
      Column() {
        Text('使用if/else进行条件判断，内层if/else渲染内容为基本组件，判断条件为@Local状态变量')
          .height('3%')
          .fontSize(9)
          .fontColor(Color.Gray)
        Text('点击按钮val+1，背景色根据数字大小变化')
          .height('3%')
          .fontSize(9)
          .fontColor(Color.Gray)
        Button('@Local val + 1')
          .id('btn_1')
          .width('10%')
          .height('3%')
          .fontSize(9)
          .onClick(() => {
            this.val++;
          })
        if (this.val < 2) {
          Text(this.val.toString())
            .id('text_11')
            .backgroundColor('#00aaaa')
            .height('3%')
            .fontSize(9)
        } else if (this.val < 5) {
          Text(this.val.toString())
            .id('text_12')
            .backgroundColor('#aaaaff')
            .height('3%')
            .fontSize(9)
        } else if (this.val < 10) {
          Text(this.val.toString())
            .id('text_13')
            .backgroundColor('#ffaaaa')
            .height('3%')
            .fontSize(9)
        } else {
          Text('out of range!')
            .id('text_14')
            .height('3%')
            .fontSize(9)
        }
      }
      .width('100%')
      .border({ width: 1 })

      Column() {
        Text('使用if/else进行条件判断，内层if/else渲染内容为基本组件，判断条件为@Observed/@Trace状态变量')
          .height('3%')
          .fontSize(9)
          .fontColor(Color.Gray)
        Text('点击按钮val+1，背景色根据数字大小变化')
          .height('3%')
          .fontSize(9)
          .fontColor(Color.Gray)
        Button('@Trace innerVal + 1')
          .id('btn_2')
          .width('10%')
          .height('3%')
          .fontSize(9)
          .onClick(() => {
            this.clazz.innerVal++;
          })
        if (this.clazz.innerVal < 2) {
          Text(this.clazz.innerVal.toString())
            .id('text_21')
            .backgroundColor('#00aaaa')
            .height('3%')
            .fontSize(9)
        } else if (this.clazz.innerVal < 5) {
          Text(this.clazz.innerVal.toString())
            .id('text_22')
            .backgroundColor('#aaaaff')
            .height('3%')
            .fontSize(9)
        } else if (this.clazz.innerVal < 10) {
          Text(this.clazz.innerVal.toString())
            .id('text_23')
            .backgroundColor('#ffaaaa')
            .height('3%')
            .fontSize(9)
        } else {
          Text('out of range!')
            .id('text_24')
            .height('3%')
            .fontSize(9)
        }
      }
      .width('100%')
      .border({ width: 1 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}