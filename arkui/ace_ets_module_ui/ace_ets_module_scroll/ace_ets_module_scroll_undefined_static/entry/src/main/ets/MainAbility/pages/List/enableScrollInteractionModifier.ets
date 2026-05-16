'use static'
import {
  ForEach,
  Entry,
  Component,
  Scroll,
  List,
  TextAlign,
  Column,
  ListItem,
  Text,
  Button,
  Color,
  LazyForEach,
  Stack,
  Row,
  NestedScrollMode,
  Builder,
  ListItemAlign,
  ItemDragInfo,
  ScrollSnapAlign,
  Scroller,
  NestedScrollOptions,
  Resource,
  ListAttribute,
  AttributeModifier
} from '@ohos.arkui.component';
import { State, Observed, Track } from '@ohos.arkui.stateManagement';
import { MyDataSource } from './MyDataSource';

@Observed
export class MyEnableModifier implements AttributeModifier<ListAttribute> {
  // 外部传入控制值，可以是 boolean | undefined
  @Track public enableScrollInteraction: boolean | undefined = false;
  @Track public change: boolean | undefined = true;

  applyNormalAttribute(instance: ListAttribute): void {
    // 情况 1、2、4 都调用 enabled，区别在于 controlValue 可能是 false、true 或 undefined
    if (this.change) {
      instance
        .enableScrollInteraction(this.enableScrollInteraction)
    } else {
      instance
        .enableScrollInteraction(undefined)
    }
  }
}

@Entry
@Component
struct StickyNestedScroll {
  @State array: Array<number> =
    [1, 2, 3, 4, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1] as Array<number>;
  @State isChange: Boolean = false;
  @State modifier4: MyEnableModifier = new MyEnableModifier()

  aboutToAppear(): void {
    for (let i = 0; i < 10; i++) {
      this.array.push(i);
    }

    this.modifier4.change = true
  }

  build() {
    Stack() {
      Scroll() {
        Column() {
          Row() {
            List() {
              ForEach(this.array, (item: number) => {
                ListItem() {
                  Text('' + item)
                    .width('100%').height(100).fontSize(16)
                    .textAlign(TextAlign.Center)
                }
              }, (item: number) => JSON.stringify(item))
            }
            .attributeModifier(this.modifier4)
            .id('enableScrollInteractionModifier')
          }
          .height('20%')

          Button('Change').onClick(() => {
            this.modifier4.enableScrollInteraction =
              this.modifier4.enableScrollInteraction === undefined ? false : undefined
          })
            .id('changeButton')
        }
      }
    }
  }
}