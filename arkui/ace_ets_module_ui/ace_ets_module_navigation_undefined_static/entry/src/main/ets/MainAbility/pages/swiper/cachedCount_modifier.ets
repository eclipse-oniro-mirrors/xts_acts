'use static'
import { State } from '@ohos.arkui.stateManagement'
import { Entry, Builder, Color, Text, TextAttribute,IDataSource,
  Scroll,Column, Row,Component, Button, TextAlign,LazyForEach,
  ClickEvent, TextStyle, List, ListItem, SwiperController,
  Divider, TextInput, Swiper, AutoPlayOptions,DataChangeListener,
  AttributeModifier,SwiperAttribute
} from '@ohos.arkui.component'
import { Observed } from '@ohos.arkui.stateManagement'

// xxx.ets
export class MyDataSource implements IDataSource<String> {
  constructor() {
  }

  totalCount(): Int {
    return 10;
  }

  getData(index: Int): String {
    return '' + index;
  }

  registerDataChangeListener(listener: DataChangeListener): void {
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
  }
}

@Observed
export class ModifierCachedCount4 implements AttributeModifier<SwiperAttribute> {
  public isUndefined: boolean = false;
  applyNormalAttribute(instance: SwiperAttribute): void {
    instance.cachedCount(this.isUndefined ? undefined : 2 as Int)
  }
}

@Component
struct CustomHeader_zcz {
  private title: string = ''
  aboutToAppear(): void {
    console.error('qwe 正常值 about to apper 被调用')
  }
  build() {
    Text(this.title)
      .width('90%')
      .height(80)
      .backgroundColor('#ffAFEEEE')
      .textAlign(TextAlign.Center)
      .fontSize(30)
  }
}

@Component
struct CustomHeader_ycz {
  private title: string = ''
  aboutToAppear(): void {
    console.error('qwe 异常值 about to apper 被调用')
  }
  build() {
    Text(this.title)
      .width('90%')
      .height(80)
      .backgroundColor('#ffAFEEEE')
      .textAlign(TextAlign.Center)
      .fontSize(30)
  }
}
@Component
struct CustomHeader_mrz {
  private title: string = ''
  aboutToAppear(): void {
    console.error('qwe 默认值 about to apper 被调用')
  }
  build() {
    Text(this.title)
      .width('90%')
      .height(80)
      .backgroundColor('#ffAFEEEE')
      .textAlign(TextAlign.Center)
      .fontSize(30)
  }
}
@Component
struct CustomHeader_dtqh {
  private title: string = ''
  aboutToAppear(): void {
    console.error('qwe 动态切换 about to apper 被调用 index = ' + this.title)
  }
  build() {
    Text(this.title)
      .width('90%')
      .height(80)
      .backgroundColor('#ffAFEEEE')
      .textAlign(TextAlign.Center)
      .fontSize(30)
  }
}

@Entry
@Component
struct cached_SwiperExample {
  private swiperController: SwiperController = new SwiperController();
  private data: MyDataSource = new MyDataSource();
  @State isUndefined: boolean = false;
  @State buttonText: string = 'false'
  @State modifier4 : ModifierCachedCount4 = new ModifierCachedCount4()

  build() {
    Column() {
      Text('autoPlay_2-动态切换').fontSize(20).margin(15).width('90%')
      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: string) => {
          CustomHeader_dtqh({ title:item })
        }, (item: string) => item)
      }
      .attributeModifier(this.modifier4)
      .id('swiper_cachedCount_modifier')

      Button('isUndefined = ' + this.buttonText)
        .id('changeButton')
        .onClick(() => {
          this.modifier4.isUndefined == true ? this.modifier4.isUndefined = false : this.modifier4.isUndefined = true
          this.modifier4.isUndefined == true ? this.buttonText = 'true' : this.buttonText = 'false'
        })
    }.width('100%')
  }
}