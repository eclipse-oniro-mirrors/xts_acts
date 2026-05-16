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
struct MouseEventExample {
  @State text: string = ''
  build() {
    Column() {
      Text(this.text).id('value')
      Text('onMouse')
        .width('100%')
        .height('100%')
        .id('mouse')
        .backgroundColor(Color.Pink)
        .onMouse((event: MouseEvent) => {
          if(event.button == MouseButton.Left && event.action == MouseAction.Press){
            this.text = '' + event.targetDisplayId + ',' + event.rawDeltaX + ',' + event.rawDeltaY + ',' + event.pressedButtons
          }
        })
      }.width('100%')
  }
}