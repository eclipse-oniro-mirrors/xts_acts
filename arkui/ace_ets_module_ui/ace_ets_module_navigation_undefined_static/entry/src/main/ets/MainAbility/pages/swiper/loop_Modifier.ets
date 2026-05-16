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
  AutoPlayOptions,
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
      .loop(this.isUndefined ? undefined : false).interval(300)
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
        Text('loop').fontSize(20).margin(15).width('90%')
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
          .autoPlay(true, {stopWhenTouched : false} as AutoPlayOptions)
          .id('swiper_loop')
        Divider().margin(10)

        // 2. 新增场景：loop固定为true（开启循环轮播）
        Text('loop-固定为true(循环轮播)')
          .fontSize(20)
          .margin(15)
          .width('90%')
        Swiper(this.swiperController, () => {
          ForEach(['1', '2', '3', '4'], (item: string) => {
            Text(item.toString())
              .width('90%')
              .height(160)
              .backgroundColor('#ff87CEFA')
              .textAlign(TextAlign.Center)
              .fontSize(30)
          }, (item: string) => item)
        })
          .loop(true)
          .interval(300)
          .autoPlay(true, { stopWhenTouched: false } as AutoPlayOptions)
        Divider().margin(10)

        // 3. 新增场景：loop固定为false（关闭循环轮播）
        Text('loop-固定为false(不循环轮播)')
          .fontSize(20)
          .margin(15)
          .width('90%')
        Swiper(this.swiperController, () => {
          ForEach(['1', '2', '3', '4'], (item: string) => {
            Text(item.toString())
              .width('90%')
              .height(160)
              .backgroundColor('#ff98FB98')
              .textAlign(TextAlign.Center)
              .fontSize(30)
          }, (item: string) => item)
        })
          .loop(false)
          .interval(300)
          .autoPlay(true, { stopWhenTouched: false } as AutoPlayOptions)
        Divider().margin(10)

        // 4. 新增场景：loop使用默认值（不设置该属性）
        Text('loop-默认值(不设置属性)')
          .fontSize(20)
          .margin(15)
          .width('90%')
        Swiper(this.swiperController, () => {
          ForEach(['1', '2', '3', '4'], (item: string) => {
            Text(item.toString())
              .width('90%')
              .height(160)
              .backgroundColor('#ffDDA0DD')
              .textAlign(TextAlign.Center)
              .fontSize(30)
          }, (item: string) => item)
        })
          .interval(300)
          .autoPlay(true, { stopWhenTouched: false } as AutoPlayOptions)
      }
    }.width('100%')
  }
}