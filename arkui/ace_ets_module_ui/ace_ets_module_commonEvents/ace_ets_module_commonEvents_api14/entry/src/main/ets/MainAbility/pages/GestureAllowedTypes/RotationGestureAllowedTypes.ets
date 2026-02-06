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
struct RotationGestureAllowedTypes {
  @State types: Array<SourceTool | undefined | null> = [];
  @State result: string = 'allowed types default';
  @State angle: number = 0;

  build() {
    Column() {
      Column() {
        Text('RotationGesture').fontSize(20)
      }
      .rotate({ angle: this.angle })
      .width('90%')
      .height('10%')
      .backgroundColor(Color.Yellow)
      .key('RotationGestureAllowedTypes_Text')
      .gesture(
        RotationGesture()
          .allowedTypes(this.types)
          .onActionStart((event: GestureEvent) => {
            console.info('RotationGestureAllowedTypes onActionStart')
            this.result = 'allowed types success'
          })
          .onActionUpdate((event: GestureEvent) => {
            console.info('RotationGestureAllowedTypes onActionUpdate')
            this.result = 'allowed types success'
          })
      )

      Text(this.result).key('RotationGestureAllowedTypes_result')

      Button('Mouse').id('Mouse_Type')
        .onClick(() => {
          this.result = 'allowed types default';
          this.types = [SourceTool.MOUSE];
        })
      Button('Finger').id('Finger_Type')
        .onClick(() => {
          this.result = 'allowed types default';
          this.types = [SourceTool.Finger];
        })
      Button('Invalid').id('Invalid_type')
        .onClick(() => {
          this.result = 'allowed types default';
          this.types = [null, undefined];
        })
    }
    .padding({ top: 10, left: 40 })
    .alignItems(HorizontalAlign.Start)
    .width('100%')
    .height('100%')
    .backgroundColor('#ffbebaba')
    .key('RotationGestureAllowedTypes_Father')
  }
}
