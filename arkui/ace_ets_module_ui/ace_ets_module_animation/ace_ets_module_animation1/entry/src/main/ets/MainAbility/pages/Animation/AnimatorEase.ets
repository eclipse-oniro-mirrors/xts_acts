/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


import { Animator as animator,  AnimatorResult, SimpleAnimatorOptions } from '@kit.ArkUI';

@Entry
@Component
struct AnimatorEase {
  private testAnimator001: AnimatorResult | undefined = undefined
  private testAnimator002: AnimatorResult | undefined = undefined
  private testAnimator003: AnimatorResult | undefined = undefined
  private testAnimator004: AnimatorResult | undefined = undefined
  private testAnimator005: AnimatorResult | undefined = undefined
  private testAnimator006: AnimatorResult | undefined = undefined
  private testAnimator007: AnimatorResult | undefined = undefined
  private testAnimator008: AnimatorResult | undefined = undefined
  private testAnimator009: AnimatorResult | undefined = undefined
  private testAnimator010: AnimatorResult | undefined = undefined
  private testAnimator011: AnimatorResult | undefined = undefined
  private testAnimator012: AnimatorResult | undefined = undefined
  @State testWidth:number = 50
  @State testOnCancel:string = '0'
  @State testWidth002:number = 50
  @State testOnCancel002:string = '0'
  @State testWidth003:number = 50
  @State testOnCancel003:string = '0'
  @State testWidth004:number = 50
  @State testOnCancel004:string = '0'
  @State testWidth005:number = 50
  @State testOnCancel005:string = '0'
  @State testWidth006:number = 50
  @State testOnCancel006:string = '0'
  @State testWidth007:number = 50
  @State testOnCancel007:string = '0'
  @State testWidth008:number = 50
  @State testOnCancel008:string = '0'
  @State testWidth009:number = 50
  @State testOnCancel009:string = '0'
  @State testWidth010:number = 50
  @State testOnCancel010:string = '0'
  @State testWidth011:number = 50
  @State testOnCancel011:string = '0'
  @State testWidth012:number = 50
  @State testOnCancel012:string = '0'

  aboutToAppear() {
    this.createAnimator001();
    this.createAnimator002();
    this.createAnimator003();
    this.createAnimator004();
    this.createAnimator005();
    this.createAnimator006();
    this.createAnimator007();
    this.createAnimator008();
    this.createAnimator009();
    this.createAnimator010();
    this.createAnimator011();
    this.createAnimator012();
  }
  createAnimator001() {
    this.testAnimator001 = animator.create(
      new SimpleAnimatorOptions(100, 200)
        .duration(1000)
        .delay(1000)
        .fill(FillMode.Forwards)
        .easing('friction')
        .iterations(-1)
        .direction(PlayMode.Normal)
    )

    this.testAnimator001.onFrame = (value:number) =>{
      this.testWidth = 50 + value
    }

    this.testAnimator001.onCancel = ()=>{
      this.testOnCancel = '1'
    }
  }

  createAnimator002() {
    this.testAnimator002 = animator.create(
      new SimpleAnimatorOptions(100, 200)
        .duration(1000)
        .delay(1000)
        .fill(FillMode.Forwards)
        .easing('linear')
        .iterations(-1)
        .direction(PlayMode.Normal)
    )

    this.testAnimator002.onFrame = (value:number) =>{
      this.testWidth002 = 50 + value
    }

    this.testAnimator002.onCancel = ()=>{
      this.testOnCancel002 = '1'
    }
  }

  createAnimator003() {
    this.testAnimator003 = animator.create(
      new SimpleAnimatorOptions(100, 200)
        .duration(1000)
        .delay(1000)
        .fill(FillMode.Forwards)
        .easing('ease-in')
        .iterations(-1)
        .direction(PlayMode.Normal)
    )

    this.testAnimator003.onFrame = (value:number) =>{
      this.testWidth003 = 50 + value
    }

    this.testAnimator003.onCancel = ()=>{
      this.testOnCancel003 = '1'
    }
  }

  createAnimator004() {
    this.testAnimator004 = animator.create(
      new SimpleAnimatorOptions(100, 200)
        .duration(1000)
        .delay(1000)
        .fill(FillMode.Forwards)
        .easing('ease-out')
        .iterations(-1)
        .direction(PlayMode.Normal)
    )

    this.testAnimator004.onFrame = (value:number) =>{
      this.testWidth004 = 50 + value
    }

    this.testAnimator004.onCancel = ()=>{
      this.testOnCancel004 = '1'
    }
  }

  createAnimator005() {
    this.testAnimator005 = animator.create(
      new SimpleAnimatorOptions(100, 200)
        .duration(1000)
        .delay(1000)
        .fill(FillMode.Forwards)
        .easing('ease-in-out')
        .iterations(-1)
        .direction(PlayMode.Normal)
    )

    this.testAnimator005.onFrame = (value:number) =>{
      this.testWidth005 = 50 + value
    }

    this.testAnimator005.onCancel = ()=>{
      this.testOnCancel005 = '1'
    }
  }

  createAnimator006() {
    this.testAnimator006 = animator.create(
      new SimpleAnimatorOptions(100, 200)
        .duration(1000)
        .delay(1000)
        .fill(FillMode.Forwards)
        .easing('linear-out-slow-in')
        .iterations(-1)
        .direction(PlayMode.Normal)
    )

    this.testAnimator006.onFrame = (value:number) =>{
      this.testWidth006 = 50 + value
    }

    this.testAnimator006.onCancel = ()=>{
      this.testOnCancel006 = '1'
    }
  }

  createAnimator007() {
    this.testAnimator007 = animator.create(
      new SimpleAnimatorOptions(100, 200)
        .duration(1000)
        .delay(1000)
        .fill(FillMode.Forwards)
        .easing('fast-out-linear-in')
        .iterations(-1)
        .direction(PlayMode.Normal)
    )

    this.testAnimator007.onFrame = (value:number) =>{
      this.testWidth007 = 50 + value
    }

    this.testAnimator007.onCancel = ()=>{
      this.testOnCancel007 = '1'
    }
  }

  createAnimator008() {
    this.testAnimator008 = animator.create(
      new SimpleAnimatorOptions(100, 200)
        .duration(1000)
        .delay(1000)
        .fill(FillMode.Forwards)
        .easing('extreme-deceleration')
        .iterations(-1)
        .direction(PlayMode.Normal)
    )

    this.testAnimator008.onFrame = (value:number) =>{
      this.testWidth008 = 50 + value
    }

    this.testAnimator008.onCancel = ()=>{
      this.testOnCancel008 = '1'
    }
  }

  createAnimator009() {
    this.testAnimator009 = animator.create(
      new SimpleAnimatorOptions(100, 200)
        .duration(1000)
        .delay(1000)
        .fill(FillMode.Forwards)
        .easing('rhythm')
        .iterations(-1)
        .direction(PlayMode.Normal)
    )

    this.testAnimator009.onFrame = (value:number) =>{
      this.testWidth009 = 50 + value
    }

    this.testAnimator009.onCancel = ()=>{
      this.testOnCancel009 = '1'
    }
  }

  createAnimator010() {
    this.testAnimator010 = animator.create(
      new SimpleAnimatorOptions(100, 200)
        .duration(1000)
        .delay(1000)
        .fill(FillMode.Forwards)
        .easing('sharp')
        .iterations(-1)
        .direction(PlayMode.Normal)
    )

    this.testAnimator010.onFrame = (value:number) =>{
      this.testWidth010 = 50 + value
    }

    this.testAnimator010.onCancel = ()=>{
      this.testOnCancel010 = '1'
    }
  }

  createAnimator011() {
    this.testAnimator011 = animator.create(
      new SimpleAnimatorOptions(100, 200)
        .duration(1000)
        .delay(1000)
        .fill(FillMode.Forwards)
        .easing('cubic-bezier(1,0,1,1)')
        .iterations(-1)
        .direction(PlayMode.Normal)
    )

    this.testAnimator011.onFrame = (value:number) =>{
      this.testWidth011 = 50 + value
    }

    this.testAnimator011.onCancel = ()=>{
      this.testOnCancel011 = '1'
    }
  }

  createAnimator012() {
    this.testAnimator012 = animator.create(
      new SimpleAnimatorOptions(100, 200)
        .duration(1000)
        .delay(1000)
        .fill(FillMode.Forwards)
        .easing('interpolating-spring(1,0,1,1')
        .iterations(-1)
        .direction(PlayMode.Normal)
    )

    this.testAnimator012.onFrame = (value:number) =>{
      this.testWidth012 = 50 + value
    }

    this.testAnimator012.onCancel = ()=>{
      this.testOnCancel012 = '1'
    }
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text('animator001-' + this.testOnCancel)
        .width(this.testWidth)
        .height('5%')
        .fontSize(10)
        .backgroundColor(Color.Pink)
        .align(Alignment.TopStart)
        .fontColor(Color.Black)
        .border({ width: 1 })
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key('Test001')
      Text('animator002-' + this.testOnCancel002)
        .width(this.testWidth002)
        .height('5%')
        .fontSize(10)
        .backgroundColor(Color.Pink)
        .align(Alignment.TopStart)
        .fontColor(Color.Black)
        .border({ width: 1 })
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key('Test002')
      Text('animator003-' + this.testOnCancel003)
        .width(this.testWidth003)
        .height('5%')
        .fontSize(10)
        .backgroundColor(Color.Pink)
        .align(Alignment.TopStart)
        .fontColor(Color.Black)
        .border({ width: 1 })
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key('Test003')
      Text('animator004-' + this.testOnCancel004)
        .width(this.testWidth004)
        .height('5%')
        .fontSize(10)
        .backgroundColor(Color.Pink)
        .align(Alignment.TopStart)
        .fontColor(Color.Black)
        .border({ width: 1 })
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key('Test004')
      Text('animator005-' + this.testOnCancel005)
        .width(this.testWidth005)
        .height('5%')
        .fontSize(10)
        .backgroundColor(Color.Pink)
        .align(Alignment.TopStart)
        .fontColor(Color.Black)
        .border({ width: 1 })
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key('Test005')
      Text('animator006-' + this.testOnCancel006)
        .width(this.testWidth006)
        .height('5%')
        .fontSize(10)
        .backgroundColor(Color.Pink)
        .align(Alignment.TopStart)
        .fontColor(Color.Black)
        .border({ width: 1 })
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key('Test006')
      Text('animator007-' + this.testOnCancel007)
        .width(this.testWidth007)
        .height('5%')
        .fontSize(10)
        .backgroundColor(Color.Pink)
        .align(Alignment.TopStart)
        .fontColor(Color.Black)
        .border({ width: 1 })
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key('Test007')
      Text('animator008-' + this.testOnCancel008)
        .width(this.testWidth008)
        .height('5%')
        .fontSize(10)
        .backgroundColor(Color.Pink)
        .align(Alignment.TopStart)
        .fontColor(Color.Black)
        .border({ width: 1 })
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key('Test008')
      Text('animator009-' + this.testOnCancel009)
        .width(this.testWidth009)
        .height('5%')
        .fontSize(10)
        .backgroundColor(Color.Pink)
        .align(Alignment.TopStart)
        .fontColor(Color.Black)
        .border({ width: 1 })
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key('Test009')
      Text('animator010-' + this.testOnCancel010)
        .width(this.testWidth010)
        .height('5%')
        .fontSize(10)
        .backgroundColor(Color.Pink)
        .align(Alignment.TopStart)
        .fontColor(Color.Black)
        .border({ width: 1 })
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key('Test010')
      Text('animator011-' + this.testOnCancel011)
        .width(this.testWidth011)
        .height('5%')
        .fontSize(10)
        .backgroundColor(Color.Pink)
        .align(Alignment.TopStart)
        .fontColor(Color.Black)
        .border({ width: 1 })
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key('Test011')
      Text('animator012-' + this.testOnCancel012)
        .width(this.testWidth012)
        .height('5%')
        .fontSize(10)
        .backgroundColor(Color.Pink)
        .align(Alignment.TopStart)
        .fontColor(Color.Black)
        .border({ width: 1 })
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key('Test012')
      Button('Play').onClick(()=>{
        this.testAnimator001?.play()
        this.testAnimator002?.play()
        this.testAnimator003?.play()
        this.testAnimator004?.play()
        this.testAnimator005?.play()
        this.testAnimator006?.play()
        this.testAnimator007?.play()
        this.testAnimator008?.play()
        this.testAnimator009?.play()
        this.testAnimator010?.play()
        this.testAnimator011?.play()
        this.testAnimator012?.play()
      })
        .height('5%')
        .key('Play')
      Button('Cancel').onClick(()=>{
        this.testAnimator001?.cancel()
        this.testAnimator002?.cancel()
        this.testAnimator003?.cancel()
        this.testAnimator004?.cancel()
        this.testAnimator005?.cancel()
        this.testAnimator006?.cancel()
        this.testAnimator007?.cancel()
        this.testAnimator008?.cancel()
        this.testAnimator009?.cancel()
        this.testAnimator010?.cancel()
        this.testAnimator011?.cancel()
        this.testAnimator012?.cancel()
      })
        .key('Cancel')
        .height('5%')
    }
    .width('100%')
    .height('100%')
  }
}

