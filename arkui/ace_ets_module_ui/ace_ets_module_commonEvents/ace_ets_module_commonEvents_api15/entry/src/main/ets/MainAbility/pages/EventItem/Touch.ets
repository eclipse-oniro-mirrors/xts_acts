/*
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
@Entry
@Component
struct TouchEventExample {
  @State text: string = ''
  build() {
    Column() {
      Text(this.text).key('Text')
      Button('Touch').height(50).width(200).margin(20).id('Touch')
        .onTouch((event?: TouchEvent) => {
          if (event) {
              if (event.type === TouchType.Down) {
                this.text = '' + event.touches[0].width + ',' + event.touches[0].height + ',' + event.touches[0].pressedTime + ',' + event.touches[0].pressure;
              }
          }
        })
      Text(this.text)
    }.width('100%').padding(30)
  }
}