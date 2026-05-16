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
      .nextMargin(this.isUndefined ? undefined : 50 as Double, false)
  }
}

@Entry
@Component
struct SwiperExample {
  private swiperController: SwiperController = new SwiperController();
  @State modifier0:SliderModifierTest0 = new SliderModifierTest0()
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
        Text('nextMargin').fontSize(20).margin(15).width('90%')
        Swiper(this.swiperController, () => {
          ForEach(['1', '2', '3', '4'], (item: string) => {
            Text(item.toString())
              .width('90%')
              .height(160)
              .backgroundColor('#AFEEEE')
              .textAlign(TextAlign.Center)
              .fontSize(30)
          }, (item: string) => item)
        }).attributeModifier(this.modifier0)
          .id('swiper_nextMargin')


        Divider().margin(10) // 新增分隔线，区分场景

        // 2. 新增场景：nextMargin固定20px（较窄右侧边距，不含指示器）
        Text('nextMargin-固定20px(窄边距，不含指示器)')
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
        }).attributeModifier(this.modifier0)
          .nextMargin(20 as Double, false) // 固定窄边距，同原始场景的"不含指示器"配置
        Divider().margin(10)

        // 3. 新增场景：nextMargin固定80px（较宽右侧边距，不含指示器）
        Text('nextMargin-固定80px(宽边距，不含指示器)')
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
          .nextMargin(80 as Double, false) // 固定宽边距，保持"不含指示器"统一对比
        Divider().margin(10)

        // 4. 新增场景：nextMargin固定50px（含指示器，对比是否包含指示器的差异）
        Text('nextMargin-固定50px(含指示器，对比场景)')
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
          .nextMargin(50 as Double, true) // 固定50px，但开启"包含指示器"，对比原始场景
        Divider().margin(10)

        // 5. 新增场景：nextMargin默认值（不设置该属性）
        Text('nextMargin-默认值(不设置属性)')
          .fontSize(20)
          .margin(15)
          .width('90%')
        Swiper(this.swiperController, () => {
          ForEach(['1', '2', '3', '4'], (item: string) => {
            Text(item.toString())
              .width('90%')
              .height(160)
              .backgroundColor('#ffFFE4E1') // 不同背景色区分场景
              .textAlign(TextAlign.Center)
              .fontSize(30)
          }, (item: string) => item)
        })
      }
    }.width('100%')
  }
}