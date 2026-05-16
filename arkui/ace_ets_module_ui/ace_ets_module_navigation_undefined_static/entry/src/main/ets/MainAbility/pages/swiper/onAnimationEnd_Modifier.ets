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
  Divider,
  OnSwiperAnimationEndCallback
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class SliderModifierTest0 implements AttributeModifier<SwiperAttribute>{
  public isUndefined: boolean = false;
  public index: int = 0;

  applyNormalAttribute(instance: SwiperAttribute):void{
    instance
      .onAnimationEnd(this.isUndefined ? undefined : () => {
        console.info('qwe onAnimationEnd 被执行')
        this.index += 1;
      } as OnSwiperAnimationEndCallback)
  }
}

@Entry
@Component
struct SwiperExample {
  private swiperController: SwiperController = new SwiperController();
  @State modifier0:SliderModifierTest0 = new SliderModifierTest0()
  @State isUndefined: boolean = false;
  @State buttonText: string = 'false'
  @State index:int = 0;
  build() {
    Column() {
      Text(this.modifier0.index.toString()).id('swiper_onAnimationEnd')
      Text('test modifier' )
      Button('isUndefined = ' + this.modifier0.isUndefined.toString())
        .onClick(() => {
          this.modifier0.isUndefined = !this.modifier0.isUndefined
        }).id('changeButton')
      Column() {
        Text('onAnimationEnd').fontSize(20).margin(15).width('90%')
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
        Divider().margin(10)

        // 2. 新增场景：onAnimationEnd固定触发（打印索引）
        Text('onAnimationEnd-固定触发(打印当前索引)')
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
          .onAnimationEnd((index: int) => {
            console.info("固定触发：当前索引为 " + index);
          } as OnSwiperAnimationEndCallback)
        Divider().margin(10)

        // 3. 新增场景：onAnimationEnd默认值（不设置该属性）
        Text('onAnimationEnd-默认值(不设置属性)')
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
      }
    }.width('100%')
  }
}