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
struct getModifierKeyState2 {
  @State baseEventState: boolean = false;
  @State DragEventState: boolean = true;
  @State KeyEventState: boolean = false;

  build() {
    Column() {
      Button("" + this.KeyEventState).id("getModifierKeyState_KeyEvent")
        .onKeyEvent((event: KeyEvent) => {
          if (event.getModifierKeyState?.(["ctrl"]) == true) {
            AppStorage.setOrCreate('KeyEventCtrl', event.getModifierKeyState?.(["ctrl"]))
          }
          AppStorage.setOrCreate('KeyEventShift', event.getModifierKeyState?.(["shift"]))
        })
    }
  }
}