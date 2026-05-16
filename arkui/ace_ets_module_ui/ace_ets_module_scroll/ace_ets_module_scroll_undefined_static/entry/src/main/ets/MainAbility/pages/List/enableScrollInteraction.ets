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
  Row
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { MyDataSource } from './MyDataSource';

@Entry
@Component
struct StickyNestedScroll {
  @State array: Array<number> =
    [1, 2, 3, 4, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1] as Array<number>;
  @State isChange: boolean = false;
  @State enableScrollInteraction_3: boolean | undefined = false;

  aboutToAppear(): void {
    for (let i = 0; i < 10; i++) {
      this.array.push(i);
    }
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
            .id('TestListenableScrollInteraction')
            .enableScrollInteraction(this.enableScrollInteraction_3)
          }
          .height('20%')

          Button('Change').onClick(() => {
            this.enableScrollInteraction_3 = undefined
          })
            .id('changeButton')

        }
      }
    }
  }
}

