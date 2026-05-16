'use static'
import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  Flex,
  FlexAlign,
  Margin,
  ColumnOptions,
  HorizontalAlign,
  FontWeight,
  Row,
  Image
} from '@ohos.arkui.component'
import { AttributeModifier, CommonAttribute, DragEvent, DragItemInfo } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class DragStartModifier implements AttributeModifier<CommonAttribute> {
  @State public change: boolean | undefined = true;
  @State public count: Int = 0

  applyNormalAttribute(instance: CommonAttribute): void {
    if (this.change) {
      instance.onDragStart((event: DragEvent, extraParams?: string): DragItemInfo => {
        this.count += 1;
        return {} as DragItemInfo;
      });
    } else {
      instance.onDragStart(undefined);
    }
  }
}

@Entry
@Component
struct dragPreviewOptionsDemo {
  @State dragStartModifier4: DragStartModifier = new DragStartModifier()

  aboutToAppear() {
    this.dragStartModifier4.change = true
  }

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Row() {
        Column() {
          Image('resources/base/media/startIcon.png')
            .margin({ top: 10 } as Margin)
            .width('30%')
            .border({
              radius: {
                topLeft: 1,
                topRight: 2,
                bottomLeft: 4,
                bottomRight: 8
              }
            })
            .attributeModifier(this.dragStartModifier4)
            .draggable(true)
            .id('commonmethod_onDragStartModifier')
          Text('Count' + this.dragStartModifier4.count)
            .fontSize(26)
            .id('commonmethod_onDragStartModifier2')
          Button('undefined' + this.dragStartModifier4.change)
            .onClick(() => {
              this.dragStartModifier4.change = !this.dragStartModifier4.change
            })
            .id('button_onDragStartModifier')
        }
        .width('100%')
        .height('100%')
      }
      .width('100%')
      .height('20%')
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}

