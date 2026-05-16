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

@Entry
@Component
struct Rawfile0140 {
  @State id1: number = -1;
  @State id2: number = 0;
  @State id3: number = -1;
  @State id4: number = 0;

  aboutToAppear(): void {
    this.id1 = $r(`app.string.app_name`).id;
    this.id2 = $r('app.string.app_name').id;
    this.id3 = $rawfile(`startIcon.png`).id;
    this.id4 = $rawfile('startIcon.png').id;
  }
  build() {
    Column() {
      Text(this.id1.toString())
        .id('id1')
        .height('5%')
      Text(this.id2.toString())
        .id('id2')
        .height('5%')
      Text(this.id3.toString())
        .id('id3')
        .height('5%')
      Text(this.id4.toString())
        .id('id4')
        .height('5%')
    }
  }
}