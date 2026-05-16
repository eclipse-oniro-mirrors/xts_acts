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
struct FocusControlRequestFocus {
  @State requestFocusValid: boolean = false
  @State requestFocusNull: boolean = false
  @State requestFocusUndefined: boolean = false
  @State requestFocusEmpty: boolean = false

  build() {
    Column() {
      Text('focusControl requestFocus Test')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)

      // 测试有效ID
      Row() {
        Text('Valid ID Result:').width('30%').fontSize(16)
        Text(this.requestFocusValid ? 'true' : 'false').width('20%').fontSize(16)
      }
      .width('90%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceBetween)
      .key('validResult')

      // 测试null参数
      Row() {
        Text('Null Result:').width('30%').fontSize(16)
        Text(this.requestFocusNull ? 'true' : 'false').width('20%').fontSize(16)
      }
      .width('90%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceBetween)
      .key('nullResult')

      // 测试undefined参数
      Row() {
        Text('Undefined Result:').width('30%').fontSize(16)
        Text(this.requestFocusUndefined ? 'true' : 'false').width('20%').fontSize(16)
      }
      .width('90%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceBetween)
      .key('undefinedResult')

      // 测试空字符串参数
      Row() {
        Text('Empty Result:').width('30%').fontSize(16)
        Text(this.requestFocusEmpty ? 'true' : 'false').width('20%').fontSize(16)
      }
      .width('90%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceBetween)
      .key('emptyResult')

      // 测试按钮
      Button('Test Valid ID')
        .width('90%')
        .height('8%')
        .fontSize(16)
        .key('testValid')
        .onClick(() => {
          this.resetStates();
          let res = focusControl.requestFocus('testButton');
          AppStorage.setOrCreate('requestFocusValidResult', res);
          this.requestFocusValid = res;
        })

      Button('Test Null ID')
        .width('90%')
        .height('8%')
        .fontSize(16)
        .key('testNull')
        .onClick(() => {
          this.resetStates();
          try {
            let res = focusControl.requestFocus(null);
            AppStorage.setOrCreate('requestFocusNullResult', res);
            this.requestFocusNull = res;
          } catch (error) {
            AppStorage.setOrCreate('requestFocusNullResult', false);
            AppStorage.setOrCreate('requestFocusNullError', error.message);
            this.requestFocusNull = false;
          }
        })

      Button('Test Undefined ID')
        .width('90%')
        .height('8%')
        .fontSize(16)
        .key('testUndefined')
        .onClick(() => {
          this.resetStates();
          try {
            let res = focusControl.requestFocus(undefined);
            AppStorage.setOrCreate('requestFocusUndefinedResult', res);
            this.requestFocusUndefined = res;
          } catch (error) {
            AppStorage.setOrCreate('requestFocusUndefinedResult', false);
            AppStorage.setOrCreate('requestFocusUndefinedError', error.message);
            this.requestFocusUndefined = false;
          }
        })

      Button('Test Empty ID')
        .width('90%')
        .height('8%')
        .fontSize(16)
        .key('testEmpty')
        .onClick(() => {
          this.resetStates();
          try {
            let res = focusControl.requestFocus('');
            AppStorage.setOrCreate('requestFocusEmptyResult', res);
            this.requestFocusEmpty = res;
          } catch (error) {
            AppStorage.setOrCreate('requestFocusEmptyResult', false);
            AppStorage.setOrCreate('requestFocusEmptyError', error.message);
            this.requestFocusEmpty = false;
          }
        })

      Button('Reset States')
        .width('90%')
        .height('8%')
        .fontSize(16)
        .key('resetStates')
        .onClick(() => {
          this.resetStates();
        })

      // 目标按钮（用于设置焦点）
      Button('Target Button')
        .width('90%')
        .height('8%')
        .fontSize(16)
        .key('testButton')
    }
    .width('100%')
    .height('90%')
  }

  private resetStates(): void {
    this.requestFocusValid = false;
    this.requestFocusNull = false;
    this.requestFocusUndefined = false;
    this.requestFocusEmpty = false;
    AppStorage.clear();
  }
}