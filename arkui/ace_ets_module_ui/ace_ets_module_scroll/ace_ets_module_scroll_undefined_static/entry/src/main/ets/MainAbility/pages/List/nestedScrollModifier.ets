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
  @Track public isChange: Boolean = true;
  @Track public change: boolean | undefined = true;

  applyNormalAttribute(instance: ListAttribute): void {
    // 情况 1、2、4 都调用 enabled，区别在于 controlValue 可能是 false、true 或 undefined
    if (this.change) {
      instance.nestedScroll(this.isChange ? {
        scrollForward: NestedScrollMode.PARENT_FIRST, // 必需属性
        scrollBackward: NestedScrollMode.SELF_FIRST   // 必需属性
      } as NestedScrollOptions : undefined) //接口2
        .height('100%')
    } else {
      instance.nestedScroll(undefined) //接口2
        .height('100%')
    }
  }
}

@Entry
@Component
struct StickyNestedScroll {
  @State array: Array<number> =
    [1, 2, 3, 4, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1] as Array<number>;
  @State modifier4: MyEnableModifier = new MyEnableModifier()

  aboutToAppear() {
    this.modifier4.change = true

    for (let i = 0; i < 10; i++) {
      this.array.push(i);
    }
  }

  build() {
    Stack() {
      Scroll() {
        Column() {
          Scroll() {
            Column() {
              Text('Scroll Area')
                .width('100%')
                .height('20%')
                .backgroundColor('#0080DC')
                .textAlign(TextAlign.Center)
              List() {
                ForEach(this.array, (item: number) => {
                  ListItem() {
                    Text('' + item)
                      .width('100%').height(100).fontSize(16)
                      .textAlign(TextAlign.Center)
                  }
                  .borderRadius(10)
                  .width('60%')
                  .height('80%')
                }, (item: number) => JSON.stringify(item))
              }
              .attributeModifier(this.modifier4)
              .id('nestedScrollModifier')
            }
            .width('100%')
          }
          .backgroundColor('#DCDCDC')
          .width('100%')
          .height('30%')

          Button('Change').onClick(() => {
            this.modifier4.isChange = !this.modifier4.isChange
          }).id('changeButton')
        }
      }
    }
  }
}