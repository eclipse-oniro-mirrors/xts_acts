'use static'
import {
  Entry,
  Text,
  Column,
  Row,
  Component,
  Button,
  ClickEvent,
  Scroll,
  Margin,
  Color,
  $r,
  Swiper,
  SwiperController,
  DotIndicator,
  ScrollState,
  SwiperAnimationEvent,
  TextAlign,
  Curve,
  SwiperContentWillScrollResult,
  SwiperAttribute,
  AttributeModifier,
  List,
  ForEach,
  Divider
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class SliderModifierTest0 implements AttributeModifier<SwiperAttribute>{
  public isUndefined: boolean = false;
  applyNormalAttribute(instance: SwiperAttribute):void{
    instance
      .itemSpace( this.isUndefined ? undefined : 30 as Double)
  }
}

@Entry
@Component
struct SwiperExample {
  private swiperController: SwiperController = new SwiperController();
  @State modifier0:SliderModifierTest0 = new SliderModifierTest0()
  @State isUndefined: boolean = false;
  @State buttonText: string = 'false'
  @State index:number = 0;
  build() {
    Column() {
      Text('test modifier' )
      Button('isUndefined = ' + this.modifier0.isUndefined.toString())
        .onClick(() => {
          this.modifier0.isUndefined = !this.modifier0.isUndefined
        }).id('changeButton')
      Column() {
        Text('itemSpace').fontSize(20).margin(15).width('90%')
        Swiper(this.swiperController, () => {
          ForEach(['1', '2', '3', '4'], (item: string) => {
            Text(item.toString())
              .width('90%')
              .height(160)
              .backgroundColor('#AFEEEE')
              .textAlign(TextAlign.Center)
              .fontSize(30)
          }, (item: string) => item)
        })
          .attributeModifier(this.modifier0)
          .displayCount(3 as int)
          .id('swiper_itemSpace')
        Divider().margin(10) // 新增分隔线，优化场景区分

        // 2. 新增场景：itemSpace 固定为 10px（较窄间距）
        Text('itemSpace-固定10px(较窄间距)')
          .fontSize(20)
          .margin(15)
          .width('90%')
        Swiper(this.swiperController, () => {
          ForEach(['1', '2', '3', '4'], (item: string) => {
            Text(item.toString())
              .width('90%')
              .height(160)
              .backgroundColor('#ff87CEFA') // 不同背景色区分场景
              .textAlign(TextAlign.Center)
              .fontSize(30)
          }, (item: string) => item)
        })
          .itemSpace(10 as Int)
          .displayCount(3 as Int) // 保持与原始一致的显示数量
        Divider().margin(10)

        // 3. 新增场景：itemSpace 固定为 50px（较宽间距）
        Text('itemSpace-固定50px(较宽间距)')
          .fontSize(20)
          .margin(15)
          .width('90%')
        Swiper(this.swiperController, () => {
          ForEach(['1', '2', '3', '4'], (item: string) => {
            Text(item.toString())
              .width('90%')
              .height(160)
              .backgroundColor('#ff98FB98') // 不同背景色区分场景
              .textAlign(TextAlign.Center)
              .fontSize(30)
          }, (item: string) => item)
        })
          .itemSpace(50 as Int)
          .displayCount(3 as Int)
        Divider().margin(10)

        // 4. 新增场景：itemSpace 使用默认值（不设置该属性）
        Text('itemSpace-默认值(不设置属性)')
          .fontSize(20)
          .margin(15)
          .width('90%')
        Swiper(this.swiperController, () => {
          ForEach(['1', '2', '3', '4'], (item: string) => {
            Text(item.toString())
              .width('90%')
              .height(160)
              .backgroundColor('#ffDDA0DD') // 不同背景色区分场景
              .textAlign(TextAlign.Center)
              .fontSize(30)
          }, (item: string) => item)
        })
          .displayCount(3 as Int) // 仅保留 displayCount，不设置 itemSpace
      }
    }.width('100%')
  }
}