import keyboardController from '../KeyboardController';
import { numberSourceListData, sourceListType } from '../KeyboardKeyData';

@Component
struct keyItem {
  private keyValue: sourceListType = numberSourceListData[0];
  @State keyBgc: string = '#fff'
  @State keyFontColor: string = '#000'

  build() {
    Column() {
      Flex({ direction: FlexDirection.Column,
        alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
        Text(this.keyValue.content).fontSize(20).fontColor(this.keyFontColor)
      }
    }
    .backgroundColor(this.keyBgc)
    .borderRadius(6)
    .width('8%')
    .height('65%')
    .onClick(() => {
      keyboardController.insertText(this.keyValue.content);
    })
  }
}

// 删除组件
@Component
export struct deleteItem {
  @State keyBgc: string = '#fff'
  @State keyFontColor: string = '#000'

  build() {
    Column() {
      Flex({ direction: FlexDirection.Column,
        alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
        Text('删除').fontSize(20).fontColor(this.keyFontColor)
      }
    }
    .backgroundColor(this.keyBgc)
    .width('13%')
    .borderRadius(6)
    .onClick(() => {
      keyboardController.deleteForward(1);
    })
  }
}

// 数字键盘
@Component
struct numberMenu {
  private numberList: sourceListType[] = numberSourceListData;

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceEvenly }) {
      Flex({ justifyContent: FlexAlign.SpaceBetween }) {
        ForEach(this.numberList, (item: sourceListType) => { // 数字键盘第一行
          keyItem({ keyValue: item })
        }, (item: sourceListType) => item.content);
      }
      .padding({ top: '2%' })
      .width('96%')
      .height('25%')

      Flex({ justifyContent: FlexAlign.SpaceBetween }) {
        deleteItem()
      }
      .width('96%')
      .height('25%')
    }
  }
}

@Entry
@Component
struct Index {
  private numberList: sourceListType[] = numberSourceListData

  build() {
    Stack() {
      Flex({
        direction: FlexDirection.Column,
        alignItems: ItemAlign.Center,
        justifyContent: FlexAlign.End
      }) {
        Flex({
          direction: FlexDirection.Column,
          alignItems: ItemAlign.Center,
          justifyContent: FlexAlign.SpaceBetween
        }) {
          numberMenu({
            numberList: this.numberList
          })
        }
        .align(Alignment.End)
        .width('100%')
        .height('75%')
      }
      .height('100%').align(Alignment.End).backgroundColor('#cdd0d7')
    }
    .position({ x: 0, y: 0 }).zIndex(99999)
  }
}
