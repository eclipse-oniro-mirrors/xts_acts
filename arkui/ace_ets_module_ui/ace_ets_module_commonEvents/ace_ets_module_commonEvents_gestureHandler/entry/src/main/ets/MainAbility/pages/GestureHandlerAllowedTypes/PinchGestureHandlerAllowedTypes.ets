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

class PinchGestureHandlerAllowedTypesModifier implements GestureModifier {
  toolTypes: Array<SourceTool | undefined | null> = [];
  listener: Callback<string> = (data: string) => {
  };

  constructor(types: Array<SourceTool | undefined | null>, callback: Callback<string>) {
    this.toolTypes = types;
    this.listener = callback;
  }

  applyGesture(event: UIGestureEvent): void {
    event.addGesture(
      new PinchGestureHandler()
        .allowedTypes(this.toolTypes)
        .onActionStart((event: GestureEvent) => {
          this.listener('allowed types success');
        })
        .onActionUpdate((event: GestureEvent) => {
          this.listener('allowed types success');
        })
    )
  }
}

@Entry
@Component
struct PinchGestureHandlerAllowedTypes {
  @State result: string = 'allowed types default';
  private callback: Callback<string> = (data: string) => {
    this.result = data;
  }
  @State modifier: PinchGestureHandlerAllowedTypesModifier =
    new PinchGestureHandlerAllowedTypesModifier([], this.callback);

  build() {
    Column() {
      Text('Pinch')
        .fontSize(20)
        .width('90%')
        .height('55%')
        .backgroundColor(Color.Yellow)
        .key('PinchGestureHandlerAllowedTypes_Text')
        .gestureModifier(this.modifier)

      Text(this.result).key('PinchGestureHandlerAllowedTypes_result').height('10%')

      Button('Mouse').id('Mouse_Type')
        .onClick(() => {
          this.result = 'allowed types default'
          this.modifier = new PinchGestureHandlerAllowedTypesModifier([SourceTool.MOUSE], this.callback);
        }).height('10%')
      Button('Finger').id('Finger_Type')
        .onClick(() => {
          this.result = 'allowed types default'
          this.modifier = new PinchGestureHandlerAllowedTypesModifier([SourceTool.Finger], this.callback);
        }).height('10%')
      Button('Invalid').id('Invalid_type')
        .onClick(() => {
          this.result = 'allowed types default';
          this.modifier = new PinchGestureHandlerAllowedTypesModifier([null, undefined], this.callback);
        }).height('10%')
    }
    .alignItems(HorizontalAlign.Start)
    .width('100%')
    .height('100%')
    .backgroundColor('#ffbebaba')
    .key('PinchGestureHandlerAllowedTypes_Father')
  }
}