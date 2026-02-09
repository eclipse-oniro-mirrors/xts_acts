/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct getItemError {
  scroller: Scroller = new Scroller()
  scroller2: Scroller = new Scroller()
  private arr: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  @State textResult: string = 'Hello world'
  @State textResult2: string = 'Hello world'
  @State closeButtonContent: string = ''

  build(){
    Column({ space: 5 }) {
      Text('getItemRect: ' + this.textResult)
        .id('getItemRect_err_text')
        .margin({top:5})
      Row(){
        Button('error: 401')//401
          .id('getItemRect_401')
          .height('5%')
          .onClick(()=>{
            try {
              this.scroller.getItemRect(undefined)
            } catch (error) {
              this.textResult = (error as BusinessError).code + '';
              console.info('Get error code: %{public}s', JSON.stringify(error.code));
            }
          })
        Button('error: 100004') //100004
          .id('getItemRect_100004')
          .height('5%')
          .onClick(()=>{
            try {
              this.scroller2.getItemRect(1)
            } catch (error) {
              this.textResult = (error as BusinessError).code + '';
              console.info('Get error code: %{public}s', JSON.stringify(error.code));
            }
          })
      }

      Text('getItemIndex: ' + this.textResult2)
        .id('getItemIndex_err_text')
        .margin({top:5})
      Row(){
        Button('error: 401')//401
          .id('getItemIndex_401')
          .height('5%')
          .onClick(()=>{
            try {
              this.scroller.getItemIndex(undefined,2);
            } catch (error) {
              this.textResult2 = (error as BusinessError).code + '';
              console.info('Get error code: %{public}s', JSON.stringify(error.code));
            }
          })
        Button('error: 100004') //100004
          .id('getItemIndex_100004')
          .height('5%')
          .onClick(()=>{
            try {
              this.scroller2.getItemIndex(1,2);
            } catch (error) {
              this.textResult2 = (error as BusinessError).code + '';
              console.info('Get error code: %{public}s', JSON.stringify(error.code));
            }
          })
      }

      List({ initialIndex: 0, scroller: this.scroller }) {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text('' + item)
              .width('80%')
              .height('20%')
              .fontSize(16)
              .fontColor('#ffffff')
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor('#106836')
          }
        }, (item: string) => item)
      }
      .alignListItem(ListItemAlign.Center)
      .friction(0.6)
      .edgeEffect(EdgeEffect.Fade)
      .scrollBar(BarState.On)
      .width('90%')
      .height('60%')
      .backgroundColor(0xFAEEE0)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 })
  }
}