/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

class AddGestureNullModifier implements GestureModifier {
  applyGesture(event: UIGestureEvent): void {
    try {
      event.addGesture(null);
    } catch (e) {
      AppStorage.setOrCreate('addGestureNull',String(e))
      console.info('addGesture null error: ' + e);
    }
  }
}

class AddGestureUndefinedModifier implements GestureModifier {
  applyGesture(event: UIGestureEvent): void {
    try {
      event.addGesture(undefined);
    } catch (e) {
      AppStorage.setOrCreate('addGestureUndefined',String(e))
      console.info('addGesture undefined error: ' + e);
    }
  }
}

@Entry
@Component
struct AddGestureNullAndUndefined {
  @State modifier: AddGestureNullModifier = new AddGestureNullModifier();
  @State modifier2: AddGestureUndefinedModifier = new AddGestureUndefinedModifier();

  build() {
    Column() {
      Text('addGesture Null Undefined Test')
        .width('100%')
        .height('10%')

      Button('Test gesture null')
        .id('btnGestureNull')
        .width('100%')
        .height('45%')
        .gestureModifier(this.modifier)

      Button('Test gesture undefined')
        .id('btnGestureGUndefined')
        .width('100%')
        .height('45%')
        .gestureModifier(this.modifier2)
    }
    .width('100%')
    .height('100%')
  }
}
