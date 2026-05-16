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
  @Track public isChange: boolean = true
  @Track public text: String = '';
  @Track public change: boolean | undefined = true;

  applyNormalAttribute(instance: ListAttribute): void {
    // 情况 1、2、4 都调用 enabled，区别在于 controlValue 可能是 false、true 或 undefined
    if (this.change) {
      instance
        .onItemMove(this.isChange ? (from: Int, to: Int) => {
          console.log('xxx onItemMove')
          console.log('xxx onItemMove' + this.text)
          this.text += '1';
          console.log('xxx onItemMove' + this.text)
          return true
        } : undefined)
    } else {
      instance
        .onItemMove(undefined)
    }
  }
}

@Entry
@Component
struct Index {
  @State listArr: string[] = ['1'] as string[];
  @State modifier4: MyEnableModifier = new MyEnableModifier()

  @Builder
  pixelMapBuilder() {
    Column() {
      Text('123')
        .fontSize(16)
        .width(80)
        .height(80)
        .textAlign(TextAlign.Center)
    }
  }

  aboutToAppear() {
    for (let i = 0; i < 16; i++) {
      this.listArr.push(i + '');
    }

    this.modifier4.change = true
  }

  build() {
    Column() {
      List() {
        ForEach(this.listArr, (item: string) => {
          ListItem() {
            Text(item)
          }
          .width(80)
          .height(80)
          .borderRadius(4)
          .id('List_item' + item)
        }, (item: string) => item)
      }
      .width('100%')
      .height(500)
      .alignListItem(ListItemAlign.Center)
      .onItemDragStart((event: ItemDragInfo) => {
        console.log('xxx onItemDragStart')
        return () => {
          this.pixelMapBuilder()
        }
      })
      .onItemDrop((event: ItemDragInfo, itemIndex: Int, insertIndex: Int, isSuccess: boolean) => {
        console.log('xxx onItemDrop')
      })
      .attributeModifier(this.modifier4)

      Button('Change').onClick(() => {
        this.modifier4.isChange = !this.modifier4.isChange;
      })
        .id('changeButton')
      Button(this.modifier4.text)
        .backgroundColor('#00ff00')
        .id('ModifierdragText')
    }
    .width('100%')
    .height('100%')
  }
}