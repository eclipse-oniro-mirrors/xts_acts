'use static'
import {
  Entry,
  Column,
  Component,
  Button,
  Color,
  FlexAlign,
  Margin,
  ColumnOptions,
  HorizontalAlign,
  TextInput,
  Text
} from '@ohos.arkui.component'
import { AttributeModifier, CommonAttribute } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'


@Observed
export class FocusableModifier implements AttributeModifier<CommonAttribute> {
  @State public focusable: boolean | undefined = true;

  applyNormalAttribute(instance: CommonAttribute): void {
    instance.focusable(this.focusable);
  }
}

@Entry
@Component
struct FocusableExample {
  @State focusableModifier4: FocusableModifier = new FocusableModifier()

  aboutToAppear() {
    this.focusableModifier4.focusable = false
  }

  build() {
    Column({ space: 10 } as ColumnOptions) {
      TextInput({ text: 'Group4' })
        .width(165)
        .height(40)
        .fontColor(Color.Black)
        .attributeModifier(this.focusableModifier4)
        .id('commonmethod_focusableModifier')

      Button('undefined: ' + this.focusableModifier4.focusable)
        .onClick(() => {
          this.focusableModifier4.focusable = this.focusableModifier4.focusable === undefined ? false : undefined
        })
        .id('button_focusableModifier')
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}


