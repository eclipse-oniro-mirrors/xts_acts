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
import pointer from '@ohos.multimodalInput.pointer';
import window from '@ohos.window';
import { BusinessError } from '@ohos.base'

@Entry
@Component
struct CursorControlSetCursor {
  @State currentCursor: PointerStyle = pointer.PointerStyle.DEFAULT
  @State setCursorResult: string = ''
  @State setCursorNullResult: string = ''
  @State setCursorUndefinedResult: string = ''
  controller: TextInputController = new TextInputController()

  build() {
    Column() {
      Text('cursorControl setCursor Test')
        .fontWeight(FontWeight.Bold)

      // 显示当前光标样式
      Row() {
        Text('Current Cursor:').width('30%')
        Text(`${this.currentCursor}`).width('20%')
      }
      .width('90%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceBetween)
      .key('currentCursor')

      // 测试正常设置结果
      Row() {
        Text('Set Result:').width('30%')
        Text(this.setCursorResult).width('20%')
      }
      .width('90%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceBetween)
      .key('setResult')

      // 测试null参数结果
      Row() {
        Text('Null Result:').width('30%')
        Text(this.setCursorNullResult).width('20%')
      }
      .width('90%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceBetween)
      .key('nullResult')
      // 测试undefined参数结果
      Row() {
        Text('Undefined Result:').width('30%')
        Text(this.setCursorUndefinedResult).width('20%')
      }
      .width('90%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceBetween)
      .key('undefinedResult')

      // 测试按钮
      Button('Get Current Cursor')
        .width('90%')
        .height('8%')
        .key('getCurrent')
        .onClick(() => {
          this.resetStates();
          window.getLastWindow(getContext(), (error: BusinessError, win: window.Window) => {
            let windowId = win.getWindowProperties().id;
            let style: pointer.PointerStyle = pointer.getPointerStyleSync(windowId);
            this.currentCursor = style;
            AppStorage.setOrCreate('currentCursorResult', style);
          });
        })

      Button('Set Normal Cursor')
        .width('90%')
        .height('8%')
        .key('setNormal')
        .onClick(() => {
          this.resetStates();
          try {
            cursorControl.setCursor(pointer.PointerStyle.SOUTH);
            this.setCursorResult = 'SUCCESS';
            AppStorage.setOrCreate('setCursorNormalResult', 'SUCCESS');
          } catch (error) {
            this.setCursorResult = 'ERROR: ' + error.message;
            AppStorage.setOrCreate('setCursorNormalResult', 'ERROR');
          }
        })

      Button('Test Null Cursor')
        .width('90%')
        .height('8%')
        .key('testNull')
        .onClick(() => {
          this.resetStates();
          try {
            cursorControl.setCursor(null);
            this.setCursorNullResult = 'SUCCESS';
            AppStorage.setOrCreate('setCursorNullResult', 'SUCCESS');
          } catch (error) {
            this.setCursorNullResult = 'ERROR: ' + error.message;
            AppStorage.setOrCreate('setCursorNullResult', 'ERROR');
          }
        })

      Button('Test Undefined Cursor')
        .width('90%')
        .height('8%')
        .key('testUndefined')
        .onClick(() => {
          this.resetStates();
          try {
            cursorControl.setCursor(undefined);
            this.setCursorUndefinedResult = 'SUCCESS';
            AppStorage.setOrCreate('setCursorUndefinedResult', 'SUCCESS');
          } catch (error) {
            this.setCursorUndefinedResult = 'ERROR: ' + error.message;
            AppStorage.setOrCreate('setCursorUndefinedResult', 'ERROR');
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
    this.setCursorResult = '';
    this.setCursorNullResult = '';
    this.setCursorUndefinedResult = '';
    AppStorage.clear();
  }
}