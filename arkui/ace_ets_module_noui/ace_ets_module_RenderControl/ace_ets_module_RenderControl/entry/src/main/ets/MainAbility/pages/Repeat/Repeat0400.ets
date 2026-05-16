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


@ObservedV2
class SwiperItemInfo {
  @Trace public name: string;
  @Trace public url: string;

  constructor(name: string, url: string) {
    this.name = name;
    this.url = url;
  }
}

@Entry
@ComponentV2
struct Repeat0400 {
  @Local itemList: Array<SwiperItemInfo> = [];
  @Local swipeStartIndex: number = -1;
  @Local repeat0040_1: string = '-1';
  @Local repeat0040_2: string = '-1';
  @Local isLoading: boolean = true;
  @Local hasError: boolean = false;
  private imagesUrl: Array<string> = [
    'app.media.img1',
    'app.media.img2',
    'app.media.img3',
    'app.media.img4'
  ];
  private swiperController: SwiperController = new SwiperController();

  aboutToAppear(): void {
    for (let i = 0; i < 50; i++) {
      this.itemList.push(new SwiperItemInfo('img' + i, this.imagesUrl[i % 4]));
    }
  }

  build() {
    Column({ space: 10 }) {
      Column() {
        Text('swiper with repeat')
          .height('3%')
        Button('toNext')
          .height('3%')
          .id('toNext')
          .onClick(() => {
            this.swiperController.showNext()
          })
        Text(this.repeat0040_1)
          .id('repeat0400_1')
          .height('3%')
        Text(this.repeat0040_2)
          .id('repeat0400_2')
          .height('3%')
        Text(this.isLoading && !this.hasError ? 'Normal display' : 'Error display')
          .id('display_status')
          .height('3%')
      }

      Swiper(this.swiperController) {
        Repeat<SwiperItemInfo>(this.itemList)
          .each((obj: RepeatItem<SwiperItemInfo>) => {
            Stack() {
              Image($r(obj.item.url))
                .onComplete(() => {
                  if (!this.hasError) {
                    this.isLoading = true
                    this.hasError = false
                  }
                })
                .onError(() => {
                  this.isLoading = false
                  this.hasError = true
                })
              Text(obj.item.name)
                .backgroundColor(Color.White)
                .border({ width: 10 })
            }
            .width('100%')
            .height('100%')
            .margin(10)
            .onAttach(() => {
              this.repeat0040_2 = obj.item.name;
            })
            .onDetach(() => {
              this.repeat0040_1 = obj.item.name;
            })
          }
          )
          .virtualScroll({ totalCount: this.itemList.length })
      }
      .cachedCount(0)
      .layoutWeight(1)
    }
  }
}