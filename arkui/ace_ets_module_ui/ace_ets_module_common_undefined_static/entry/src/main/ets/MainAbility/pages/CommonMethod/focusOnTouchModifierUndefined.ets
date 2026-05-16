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
  HorizontalAlign
} from '@ohos.arkui.component'
import { State , Observed } from '@ohos.arkui.stateManagement'
import { AttributeModifier, CommonAttribute } from '@ohos.arkui.component'


@Observed
export class FocusOnTouchModifier implements AttributeModifier<CommonAttribute> {
  @State public focusOnTouch: boolean | undefined = true;

  applyNormalAttribute(instance: CommonAttribute): void {
    instance.focusOnTouch(this.focusOnTouch);
  }
}

@Entry
@Component
struct FocusableExample {
  @State focusOnTouchModifier4: FocusOnTouchModifier = new FocusOnTouchModifier()

  aboutToAppear() {
    this.focusOnTouchModifier4.focusOnTouch = true
  }

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Button('Group')
        .width(165)
        .height(40)
        .fontColor(Color.White)
        .attributeModifier(this.focusOnTouchModifier4)
        .id('commonmethod_focusOnTouchModifier')

      Button('undefined: ' + this.focusOnTouchModifier4.focusOnTouch)
        .onClick(() => {
          this.focusOnTouchModifier4.focusOnTouch =
            this.focusOnTouchModifier4.focusOnTouch === undefined ? true : undefined
        })
        .id('button_focusOnTouchModifier')
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}

