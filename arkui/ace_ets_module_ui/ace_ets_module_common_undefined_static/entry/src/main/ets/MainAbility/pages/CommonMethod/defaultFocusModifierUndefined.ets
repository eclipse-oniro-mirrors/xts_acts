'use static'
import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  Flex,
  FlexAlign,
  Padding,
  Margin,
  Row,
  Visibility,
  ColumnOptions,
  HorizontalAlign,
  FocusBoxStyle,
  LengthMetrics,
  ColorMetrics,
  Color,
  Scroll,
  RowOptions,
  BorderStyle,
  VerticalAlign,
  TextInput
} from '@ohos.arkui.component'
import hilog from '@ohos.hilog'
import { AttributeModifier, CommonAttribute} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

// ===================== Modifier 定义 =====================
@Observed
export class DefaultFocusModifier implements AttributeModifier<CommonAttribute> {

  applyNormalAttribute(instance: CommonAttribute): void {
    instance.defaultFocus(undefined); // 否则根据状态启用或禁用拖拽
  }
}

@Entry
@Component
struct FocusableExample {
  @State defaultFocusModifier: DefaultFocusModifier = new DefaultFocusModifier()  // 使用自定义的 DraggableModifier
  @State inputValue: string = '';

  // 正常传值
  build() {
    Row() {
      Column({ space: 20 } as ColumnOptions) {
        Column({ space: 5 } as ColumnOptions) {
          Button('defaultFocus_modifier')
            .width(165)
            .height(40)
            .fontColor(Color.White)
          Row({ space: 5 } as RowOptions) {
            Button('1')
              .width(80)
              .height(40)
              .fontColor(Color.White)
            Button('2')
              .width(80)
              .height(40)
              .fontColor(Color.White)
          }
        }
        .borderWidth(2)
        .borderColor(Color.Red)
        .borderStyle(BorderStyle.Dashed)
        .tabIndex(1) // 该Column组件为按TAB键走焦的第一个获焦的组件

        Column({ space: 5 } as ColumnOptions) {
          Button('Group2')
            .width(165)
            .height(40)
            .fontColor(Color.White)
          Row({ space: 5 } as RowOptions) {
            Button('1')
              .width(80)
              .height(40)
              .fontColor(Color.White)
            Button('2')
              .width(80)
              .height(40)
              .fontColor(Color.White)
          }
        }
        .borderWidth(2)
        .borderColor(Color.Green)
        .borderStyle(BorderStyle.Dashed)
        .tabIndex(2) // 该Column组件为按TAB键走焦的第二个获焦的组件
      }

      Column({ space: 20 } as ColumnOptions) {
        Column({ space: 5 } as ColumnOptions) {
          Button('Group2')
            .width(165)
            .height(40)
            .fontColor(Color.White)
          Row({ space: 5 } as RowOptions) {
            Button('1')
              .width(80)
              .height(40)
              .fontColor(Color.White)
            Button('2')
              .width(80)
              .height(40)
              .fontColor(Color.White)
          }
        }
        .borderWidth(2)
        .borderColor(Color.Orange)
        .borderStyle(BorderStyle.Dashed)
        .tabIndex(3) // 该Column组件为按TAB键走焦的第三个获焦的组件

        Column({ space: 5 } as ColumnOptions) {
          TextInput({placeholder: 'input', text: this.inputValue})
            .onChange((value: string) => {
              this.inputValue = value
            })
            .width(156)
            .attributeModifier(this.defaultFocusModifier)
            .id('commonmethod_defaultFocusModifier')
          Button('Group2')
            .width(165)
            .height(40)
            .fontColor(Color.White)
          Row({ space: 5 } as RowOptions) {
            Button('1')
              .width(80)
              .height(40)
              .fontColor(Color.White)
            Button('2')
              .width(80)
              .height(40)
              .fontColor(Color.White)
          }
        }
        .borderWidth(2)
        .borderColor(Color.Blue)
        .borderStyle(BorderStyle.Dashed)
        .tabIndex(4) // 该Column组件为按TAB键走焦的第四个获焦的组件
      }
      .width('100%')
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.Center)
    }
    .justifyContent(FlexAlign.SpaceAround)
  }
}