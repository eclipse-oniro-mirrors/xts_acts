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

class RemoveGestureByTagEmptyModifier implements GestureModifier {
  applyGesture(event: UIGestureEvent): void {
    event.removeGestureByTag('');
  }
}

class RemoveGestureByTagNullModifier implements GestureModifier {
  applyGesture(event: UIGestureEvent): void {
    event.removeGestureByTag(null);
  }
}

class RemoveGestureByTagUndefinedModifier implements GestureModifier {
  applyGesture(event: UIGestureEvent): void {
    event.removeGestureByTag(undefined);
  }
}

@Entry
@Component
struct RemoveGestureByTagNullAndUndefined {
  @State modifier: RemoveGestureByTagEmptyModifier = new RemoveGestureByTagEmptyModifier();
  @State modifier2: RemoveGestureByTagNullModifier = new RemoveGestureByTagNullModifier();
  @State modifier3: RemoveGestureByTagUndefinedModifier = new RemoveGestureByTagUndefinedModifier();

  build() {
    Column() {
      Text('removeGestureByTag Null Undefined Test')
        .width('100%')
        .height('10%')

      Button('Test gesture tag empty')
        .id('btnTagEmpty')
        .width('100%')
        .height('30%')
        .gestureModifier(this.modifier)

      Button('Test gesture tag null')
        .id('btnTagNull')
        .width('100%')
        .height('30%')
        .gestureModifier(this.modifier2)

      Button('Test gesture tag undefined')
        .id('btnTagUndefined')
        .width('100%')
        .height('30%')
        .gestureModifier(this.modifier3)
    }
    .width('100%')
    .height('100%')
  }
}
