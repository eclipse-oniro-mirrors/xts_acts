import { UIUtils, Binding, MutableBinding, Local } from '@ohos.arkui.stateManagement';
import { Entry, Column, Text, Button, Builder, ClickEvent, ComponentV2, rememberVariable, MutableVariable } from '@kit.ArkUI';

@Builder
function customButton(readOnlyParam: Binding<number>, mutableParam: MutableBinding<number>) {
  Column() {
    Text(`ReadOnly Binding: ${readOnlyParam.value}`)
      .id('ReadOnlyBindingText')
    Text(`Mutable Binding: ${mutableParam.value}`)
      .id('MutableBindingText')
    Button('Modify MutableBinding')
      .id('ModifyMutableBindingBtn')
      .onClick((e: ClickEvent) => {
        mutableParam.value += 1;
      })
  }
}

@Builder
function mutableVariableBuilder() {
  let message: MutableVariable<string> = rememberVariable<string>('Hello world'); 
  Text(`${message.value}`)
  .id('MutableVariableText')
  .height('5%')
  Button('Change message in builder')
    .height('5%')
    .id('MutableVariableButton')
    .onClick(() => {
      message.value += '!'; 
    })
}

@Entry
@ComponentV2
struct UIUtilsMakeBindingPage {
  @Local num1: number = 10;
  @Local num2: number = 20;

  build() {
    Column() {
      Text(`num1: ${this.num1}`)
        .id('num1Text')
      Text(`num2: ${this.num2}`)
        .id('num2Text')

      Button('Modify num1')
        .id('ModifyNum1Btn')
        .onClick((e: ClickEvent) => {
          this.num1 += 1;
        })

      Button('Modify num2')
        .id('ModifyNum2Btn')
        .onClick((e: ClickEvent) => {
          this.num2 += 1;
        })

      customButton(
        UIUtils.makeBinding(() => this.num1),
        UIUtils.makeBinding(() => this.num2, (v: number) => {
          this.num2 = v;
        })
      )
      mutableVariableBuilder()
    }
    .width('100%')
    .height('100%')
  }
}
