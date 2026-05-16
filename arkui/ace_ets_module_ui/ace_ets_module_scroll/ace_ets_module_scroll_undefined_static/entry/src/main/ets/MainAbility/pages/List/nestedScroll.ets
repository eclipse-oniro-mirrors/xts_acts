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
  Scroller,
  NestedScrollOptions
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { MyDataSource } from './MyDataSource';

@Entry
@Component
struct StickyNestedScroll {
  listScroller: Scroller = new Scroller();
  @State array: Array<number> =
    [1, 2, 3, 4, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1] as Array<number>;
  @State isChange: boolean = true;

  aboutToAppear(): void {
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
              .nestedScroll(this.isChange ? {
                scrollForward: NestedScrollMode.PARENT_FIRST, // 必需属性
                scrollBackward: NestedScrollMode.SELF_FIRST   // 必需属性
              } as NestedScrollOptions : undefined) //接口2
              .height('100%')
              .id('TestListnestedScroll')
            }
            .width('100%')
          }
          .backgroundColor('#DCDCDC')
          .width('100%')
          .height('30%')

          Button('Change').onClick(() => {
            this.isChange = !this.isChange;
          })
            .id('changeButton')
        }
      }
    }
  }
}

