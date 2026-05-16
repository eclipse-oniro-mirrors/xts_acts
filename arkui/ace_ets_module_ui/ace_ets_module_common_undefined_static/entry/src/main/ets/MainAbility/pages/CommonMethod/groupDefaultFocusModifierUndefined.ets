'use static'
import {
  Entry,
  Column,
  Component,
  Button,
  Color,
  FlexAlign,
  ColumnOptions,
  VerticalAlign,
  Row,
  RowOptions,
  BorderStyle
} from '@ohos.arkui.component'
import { State , Observed } from '@ohos.arkui.stateManagement'
import { AttributeModifier, CommonAttribute } from '@ohos.arkui.component'


@Observed
export class GroupDefaultFocusModifier implements AttributeModifier<CommonAttribute> {
  @State public groupDefaultFocus: boolean | undefined = true;

  // 设置 groupDefaultFocus 的值
  applyNormalAttribute(instance: CommonAttribute): void {
    instance.groupDefaultFocus(this.groupDefaultFocus);
  }
}

@Entry
@Component
struct FocusableExample {
  @State groupDefaultFocusModifier1: GroupDefaultFocusModifier =
    new GroupDefaultFocusModifier()
  @State groupDefaultFocusModifier2: GroupDefaultFocusModifier =
    new GroupDefaultFocusModifier()
  @State groupDefaultFocusModifier4: GroupDefaultFocusModifier =
    new GroupDefaultFocusModifier()

  aboutToAppear() {
    this.groupDefaultFocusModifier4.groupDefaultFocus = true;
  }

  build() {
    Row() {
      Column({ space: 20 } as ColumnOptions) {
        Column({ space: 5 } as ColumnOptions) {
          Button('Group2')
            .width(165)
            .height(40)
            .fontColor(Color.White)
          Button('undefined: ' + this.groupDefaultFocusModifier4.groupDefaultFocus)
            .onClick(() => {
              this.groupDefaultFocusModifier4.groupDefaultFocus =
                this.groupDefaultFocusModifier4.groupDefaultFocus === undefined ? true : undefined
            })
            .id('button_groupDefaultFocusModifier')
          Row({ space: 5 } as RowOptions) {
            Button('1')
              .width(80)
              .height(40)
              .fontColor(Color.White)
            Button('2')
              .width(80)
              .height(40)
              .fontColor(Color.White)
              .attributeModifier(this.groupDefaultFocusModifier4)
              .id('commonmethod_groupDefaultFocusModifier')
          }
        }
        .borderWidth(2)
        .borderColor(Color.Blue)
        .borderStyle(BorderStyle.Dashed)
        .tabIndex(4)
      }
    }
    .width('100%')
    .alignItems(VerticalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}
