/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { BusinessError } from '@kit.BasicServicesKit'

@Entry
@Component
struct swiperPreloadItems {
  @State currentIndex: number = 1
  swiperController: SwiperController = new SwiperController()
  swiperController2: SwiperController = new SwiperController()
  @State arr: string[] = ['0', '1', '2', '3', '4', '5']
  @State textResult: string = 'Hello world'
  @State flag: boolean = false

  build() {
    Column() {
      Text('preloadItems: ' + this.textResult)
        .id('preloadItems_swiper_text')
        .margin({top:10})
      Button('preload items: [2, 3]')
        .id('preloadItems_swiper_succ')
        .height('5%')
        .onClick(()=>{
          try {
            this.swiperController.preloadItems([2, 3])
              .then(() => {
                this.textResult = 'success'
                console.info('preloadItems [2, 3] success.')
              })
              .catch((error: BusinessError) => {
                console.error('error preloadItems [2, 3] failed, error code: ' + error.code)
              })
          } catch (error) {
            console.error('error preloadItems [2, 3] failed, error code: ' + error.code)
          }

        })
      Button('preload items: 401')
        .id('preloadItems_swiper_401')
        .height('5%')
        .onClick(()=>{
          try {
            this.swiperController.preloadItems([-1])
              .then(() => {
                console.info('preloadItems [-1] success.')
              })
              .catch((error: BusinessError) => {
                this.textResult = JSON.stringify(error.code)//'401'
                console.info('Get error code: %{public}s', JSON.stringify(error.code));
                console.error('error preloadItems [-1] failed, error code: ' + error.code + ', error message: ' + error.message)
              })
          } catch (error) {
            console.error('error preloadItems [-1] failed, error code: ' + error.code + ', error message: ' + error.message)
          }

        })
      Button('preload items: 100004')
        .id('preloadItems_swiper_1004')
        .height('5%')
        .onClick(()=>{
          try {
            this.swiperController2.preloadItems([2, 3])
              .then(() => {
                console.info('preloadItems [2, 3] success.')
              })
              .catch((error: BusinessError) => {
                console.error('error preloadItems [2, 3] failed, error code: ' + error.code)
              })
          } catch (error) {
            this.textResult = JSON.stringify(error.code)//'100004'
            console.info('Get error code: %{public}s', JSON.stringify(error.code));
            console.error('error preloadItems [2, 3] failed, error code: ' + error.code + ', error message: ' + error.message)
          }

        })

      Swiper(this.swiperController) {
        ForEach(this.arr, (item: string) => {
          Text(item.toString())
            .width('90%')
            .height(160)
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
            .fontSize(30)
        }, (item: string) => item)
      }
      .cachedCount(2)
      .index(1)
      .autoPlay(false)
      .interval(4000)
      .loop(true)
      .indicatorInteractive(true)

    }
    .width('100%')
    .margin(5)
  }
}