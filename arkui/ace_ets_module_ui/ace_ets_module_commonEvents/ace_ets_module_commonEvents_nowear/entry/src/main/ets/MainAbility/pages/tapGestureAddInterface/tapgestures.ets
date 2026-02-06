/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
struct TapGestureExample {
  @State value: string = ''
  @State count: number = 2;
  @State fingers: number = 1
  @State distanceThreshold: number = 100;

  build() {
    Column() {
      // 单指双击文本触发手势事件
      Column() {
        Text('Click twice ').fontSize(28)
      }.backgroundColor(Color.Green).width(200).height(150).gesture(
        TapGesture({distanceThreshold : this.distanceThreshold,fingers:this.fingers})
          .onAction((event: GestureEvent) => {
            if (event) {
              this.value = JSON.stringify(event.fingerList[0])
            }
          })
      ).key('interfaceTestKey')
      Text(this.value).key('valueKey')
    }
    .height(200)
    .width(300)
    .padding(20)
    .border({ width: 3 })
    .margin(30)
  }
}