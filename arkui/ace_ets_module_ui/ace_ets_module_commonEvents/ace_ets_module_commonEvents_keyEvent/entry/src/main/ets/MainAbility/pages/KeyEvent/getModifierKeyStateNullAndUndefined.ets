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
@Entry
@Component
struct KeyEventGetModifierKeyState {
  @State baseEventCtrlResult: boolean = false
  @State baseEventShiftResult: boolean = false
  @State baseEventNullResult: string = ''
  @State baseEventUndefinedResult: string = ''
  @State baseEventEmptyResult: string = ''

  build() {
    Column() {
      Text('KeyEvent getModifierKeyState Test')
        .fontWeight(FontWeight.Bold)

      // 测试按钮
      Button('Test Normal Array')
        .width('90%')
        .height('8%')
        .key('testNormal')
        .onClick(() => {
          this.resetStates();
        })
        .onClick((event: BaseEvent) => {
          this.baseEventCtrlResult = event.getModifierKeyState?.(['ctrl']) ?? false
          this.baseEventShiftResult = event.getModifierKeyState?.(['shift']) ?? false
          AppStorage.setOrCreate('getModifierKeyStateNormalResult', this.baseEventCtrlResult);
          AppStorage.setOrCreate('getModifierKeyStateShiftResult', this.baseEventShiftResult);
        })

      Button('Test Null Array')
        .width('90%')
        .height('8%')
        .key('testNull')
        .onClick(() => {
          this.resetStates();
        })
        .onClick((event: BaseEvent) => {
          try {
            let result = event.getModifierKeyState?.(null);
            AppStorage.setOrCreate('getModifierKeyStateNullResult', result);
            this.baseEventNullResult = 'SUCCESS';
          } catch (error) {
            AppStorage.setOrCreate('getModifierKeyStateNullResult', false);
            AppStorage.setOrCreate('getModifierKeyStateNullError', error.message);
            this.baseEventNullResult = 'ERROR';
          }
        })

      Button('Test Undefined Array')
        .width('90%')
        .height('8%')
        .key('testUndefined')
        .onClick(() => {
          this.resetStates();
        })
        .onClick((event: BaseEvent) => {
          try {
            let result = event.getModifierKeyState?.(undefined);
            AppStorage.setOrCreate('getModifierKeyStateUndefinedResult', result);
            this.baseEventUndefinedResult = 'SUCCESS';
          } catch (error) {
            AppStorage.setOrCreate('getModifierKeyStateUndefinedResult', false);
            AppStorage.setOrCreate('getModifierKeyStateUndefinedError', error.message);
            this.baseEventUndefinedResult = 'ERROR';
          }
        })

      Button('Test Empty Array')
        .width('90%')
        .height('8%')
        .key('testEmpty')
        .onClick(() => {
          this.resetStates();
        })
        .onClick((event: BaseEvent) => {
          try {
            let result = event.getModifierKeyState?.([]);
            AppStorage.setOrCreate('getModifierKeyStateEmptyResult', result);
            this.baseEventEmptyResult = 'SUCCESS';
          } catch (error) {
            AppStorage.setOrCreate('getModifierKeyStateEmptyResult', false);
            AppStorage.setOrCreate('getModifierKeyStateEmptyError', error.message);
            this.baseEventEmptyResult = 'ERROR';
          }
        })

      Button('Reset States')
        .width('90%')
        .height('8%')
        .key('resetStates')
        .onClick(() => {
          this.resetStates();
        })
    }
    .width('100%')
    .height('100%')
  }

  private resetStates(): void {
    this.baseEventCtrlResult = false;
    this.baseEventShiftResult = false;
    this.baseEventNullResult = '';
    this.baseEventUndefinedResult = '';
    this.baseEventEmptyResult = '';
    AppStorage.clear();
  }
}