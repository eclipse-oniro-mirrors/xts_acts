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

class LongPressGestureHandlerAllowedTypesModifier implements GestureModifier {
  toolTypes: Array<SourceTool | undefined | null> = [];
  listener: Callback<string> = (data: string) => {};
  constructor(types: Array<SourceTool | undefined | null>, callback: Callback<string>) {
    this.toolTypes = types;
    this.listener = callback;
  }

  applyGesture(event: UIGestureEvent): void {
    event.addGesture(
      new LongPressGestureHandler({ fingers: 1 })
        .allowedTypes(this.toolTypes)
        .onAction((event: GestureEvent) => {
          this.listener('allowed types success');
        })
    )
  }
}

@Entry
@Component
struct LongPressGestureHandlerAllowedTypes {
  @State result: string = 'allowed types default';
  private callback: Callback<string> = (data: string) => {
    this.result = data;
  }
  @State modifier: LongPressGestureHandlerAllowedTypesModifier = new LongPressGestureHandlerAllowedTypesModifier([], this.callback);
  build() {
    Column({space: 10}) {
      Text('LongPress').fontSize(20).width(240).height(80).margin({left:0,top:0}).padding({left:0,top:0}).backgroundColor(Color.Yellow).key('LongPressGestureHandlerAllowedTypes_Text')
        .gestureModifier(this.modifier)

      Text(this.result).key('LongPressGestureHandlerAllowedTypes_result')

      Button('Mouse').id('Mouse_Type')
        .onClick(() => {
          this.result = 'allowed types default'
          this.modifier = new LongPressGestureHandlerAllowedTypesModifier([SourceTool.MOUSE], this.callback);
        })
      Button('Finger').id('Finger_Type')
        .onClick(() => {
          this.result = 'allowed types default'
          this.modifier = new LongPressGestureHandlerAllowedTypesModifier([SourceTool.Finger], this.callback);
        })
      Button('Invalid').id('Invalid_type')
          .onClick(() => {
            this.result = 'allowed types default';
            this.modifier = new LongPressGestureHandlerAllowedTypesModifier([null, undefined], this.callback);
          })
    }.alignItems(HorizontalAlign.Start).width('100%').height('100%').backgroundColor('#ffbebaba').key('LongPressGestureHandlerAllowedTypes_Father')
  }
}

