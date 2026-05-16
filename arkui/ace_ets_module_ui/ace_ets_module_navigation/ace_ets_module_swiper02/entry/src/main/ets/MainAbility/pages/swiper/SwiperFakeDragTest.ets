/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct SwiperFakeDragTest {
  private swiperController1: SwiperController = new SwiperController();
  private swiperController2: SwiperController = new SwiperController();
  private baseDisplayX: number = 0;
  private panOption: PanGestureOptions = new PanGestureOptions({ direction: PanDirection.Left | PanDirection.Right });

  build() {
    Scroll() {
      Column({ space: 20 }) {
        Swiper(this.swiperController1) {
          Column() {
            Text('可消费拖动事件的内层组件1')
          }
          .justifyContent(FlexAlign.Center)
          .backgroundColor('#D5D5D5')
          .gesture(
            // 内层组件消费了拖拽事件，根据事件信息触发外层Swiper滚动。
            PanGesture(this.panOption)
              .onActionStart((event: GestureEvent) => {
                let ret = this.swiperController1.isFakeDragging();
                console.log('SwiperFakeDrag test isFakeDragging ret = ', ret)
                AppStorage.setOrCreate('isFakeDraggingFlag', ret);
                if (ret) {
                  return;
                }
                console.info('SwiperFakeDrag test startFakeDrag ret = ', ret);
                this.baseDisplayX = event.offsetX;
              })
              .onActionUpdate((event: GestureEvent) => {
                if (event) {
                  let ret = this.swiperController1.fakeDragBy(0);
                  console.info('fakeDragBy ret = ', ret);
                  AppStorage.setOrCreate('fakeDragByFlag', ret);
                  this.baseDisplayX = event.offsetX;
                }
              })
              .onActionEnd((event: GestureEvent) => {
                let ret = this.swiperController1.stopFakeDrag();
                AppStorage.setOrCreate('stopFakeDragFlag', ret);
                console.info('SwiperFakeDrag test stopFakeDrag ret = ', ret);
              })
          )

          Column()
            .backgroundColor('#E3F8F9')
        }
        .width('90%')
        .height('50%')
        .id('swiper1')
        Swiper(this.swiperController2) {
          Column() {
            Text('可消费拖动事件的内层组件2')
          }
          .id('column2')
          .justifyContent(FlexAlign.Center)
          .backgroundColor('#D5D5D5')
          .gesture(
            // 内层组件消费了拖拽事件，根据事件信息触发外层Swiper滚动。
            PanGesture(this.panOption)
              .onActionStart((event: GestureEvent) => {
                let ret = this.swiperController2.isFakeDragging();
                console.log('SwiperFakeDrag test isFakeDragging ret = ', ret)
                AppStorage.setOrCreate('isFakeDraggingFlag', ret);
                if (ret) {
                  return;
                }
                ret = this.swiperController2.startFakeDrag();
                console.info('SwiperFakeDrag test startFakeDrag ret = ', ret);
                AppStorage.setOrCreate('startFakeDragFlag', ret);
                this.baseDisplayX = event.offsetX;
              })
              .onActionUpdate((event: GestureEvent) => {
                if (event) {
                  let ret = this.swiperController2.fakeDragBy(event.offsetX - this.baseDisplayX);
                  console.info('fakeDragBy ret = ', ret);
                  AppStorage.setOrCreate('fakeDragByFlag', ret);
                  this.baseDisplayX = event.offsetX;
                }
              })
              .onActionEnd((event: GestureEvent) => {
                let ret = this.swiperController2.stopFakeDrag();
                AppStorage.setOrCreate('stopFakeDragFlag', ret);
                console.info('SwiperFakeDrag test stopFakeDrag ret = ', ret);
              })
          )

          Column()
            .backgroundColor('#E3F8F9')
        }
        .width('90%')
        .height('50%')
        .id('swiper2')
      }
      .width('100%')
    }
  }
}