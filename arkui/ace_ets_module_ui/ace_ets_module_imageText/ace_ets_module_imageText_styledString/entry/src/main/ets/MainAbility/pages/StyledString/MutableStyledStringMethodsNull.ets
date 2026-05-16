/**
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
struct MutableStyledStringMethodsNull {
  @State resultReplaceStringNullStart: string = '';
  @State resultReplaceStringUndefinedStart: string = '';
  @State resultReplaceStringNullLength: string = '';
  @State resultReplaceStringUndefinedLength: string = '';
  @State resultReplaceStringNullOther: string = '';
  @State resultReplaceStringUndefinedOther: string = '';
  @State resultReplaceStringEmptyOther: string = '';

  @State resultInsertStringNullStart: string = '';
  @State resultInsertStringUndefinedStart: string = '';
  @State resultInsertStringNullOther: string = '';
  @State resultInsertStringUndefinedOther: string = '';
  @State resultInsertStringEmptyOther: string = '';

  @State resultRemoveStringNullStart: string = '';
  @State resultRemoveStringUndefinedStart: string = '';
  @State resultRemoveStringNullLength: string = '';
  @State resultRemoveStringUndefinedLength: string = '';

  @State resultReplaceStyleNull: string = '';
  @State resultReplaceStyleUndefined: string = '';

  @State resultSetStyleNull: string = '';
  @State resultSetStyleUndefined: string = '';

  private mutableStyledString: MutableStyledString = new MutableStyledString('test');

  build() {
    Column({ space: 10 }) {
      Text('MutableStyledString Methods Null Test')
        .id('mutableStyledString_methods_null')
        .height('2%')

      Text('ReplaceString Test: ' + this.resultReplaceStringNullStart)
        .id('mutableStyledString_replaceString_null_start')
        .height('2%')

      Text('ReplaceString Test: ' + this.resultReplaceStringUndefinedStart)
        .id('mutableStyledString_replaceString_undefined_start')
        .height('2%')

      Text('ReplaceString Test: ' + this.resultReplaceStringNullLength)
        .id('mutableStyledString_replaceString_null_length')
        .height('2%')

      Text('ReplaceString Test: ' + this.resultReplaceStringUndefinedLength)
        .id('mutableStyledString_replaceString_undefined_length')
        .height('2%')

      Text('ReplaceString Test: ' + this.resultReplaceStringNullOther)
        .id('mutableStyledString_replaceString_null_other')
        .height('2%')

      Text('ReplaceString Test: ' + this.resultReplaceStringUndefinedOther)
        .id('mutableStyledString_replaceString_undefined_other')
        .height('2%')

      Text('ReplaceString Test: ' + this.resultReplaceStringEmptyOther)
        .id('mutableStyledString_replaceString_empty_other')
        .height('2%')

      Text('InsertString Test: ' + this.resultInsertStringNullStart)
        .id('mutableStyledString_insertString_null_start')
        .height('2%')

      Text('InsertString Test: ' + this.resultInsertStringUndefinedStart)
        .id('mutableStyledString_insertString_undefined_start')
        .height('2%')

      Text('InsertString Test: ' + this.resultInsertStringNullOther)
        .id('mutableStyledString_insertString_null_other')
        .height('2%')

      Text('InsertString Test: ' + this.resultInsertStringUndefinedOther)
        .id('mutableStyledString_insertString_undefined_other')
        .height('2%')

      Text('InsertString Test: ' + this.resultInsertStringEmptyOther)
        .id('mutableStyledString_insertString_empty_other')
        .height('2%')

      Text('RemoveString Test: ' + this.resultRemoveStringNullStart)
        .id('mutableStyledString_removeString_null_start')
        .height('2%')

      Text('RemoveString Test: ' + this.resultRemoveStringUndefinedStart)
        .id('mutableStyledString_removeString_undefined_start')
        .height('2%')

      Text('RemoveString Test: ' + this.resultRemoveStringNullLength)
        .id('mutableStyledString_removeString_null_length')
        .height('2%')

      Text('RemoveString Test: ' + this.resultRemoveStringUndefinedLength)
        .id('mutableStyledString_removeString_undefined_length')
        .height('2%')

      Text('ReplaceStyle Test: ' + this.resultReplaceStyleNull)
        .id('mutableStyledString_replaceStyle_null')
        .height('2%')

      Text('ReplaceStyle Test: ' + this.resultReplaceStyleUndefined)
        .id('mutableStyledString_replaceStyle_undefined')
        .height('2%')

      Text('SetStyle Test: ' + this.resultSetStyleNull)
        .id('mutableStyledString_setStyle_null')
        .height('2%')

      Text('SetStyle Test: ' + this.resultSetStyleUndefined)
        .id('mutableStyledString_setStyle_undefined')
        .height('2%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
    .onAppear(() => {
      // ==================== replaceString 方法测试 ====================
      try {
        this.mutableStyledString.replaceString(null, 1, 'test');
        this.resultReplaceStringNullStart = 'success';
      } catch (e) {
        this.resultReplaceStringNullStart = 'error: ' + (e as Error).message;
      }

      try {
        this.mutableStyledString.replaceString(undefined, 1, 'test');
        this.resultReplaceStringUndefinedStart = 'success';
      } catch (e) {
        this.resultReplaceStringUndefinedStart = 'error: ' + (e as Error).message;
      }

      try {
        this.mutableStyledString.replaceString(0, null, 'test');
        this.resultReplaceStringNullLength = 'success';
      } catch (e) {
        this.resultReplaceStringNullLength = 'error: ' + (e as Error).message;
      }

      try {
        this.mutableStyledString.replaceString(0, undefined, 'test');
        this.resultReplaceStringUndefinedLength = 'success';
      } catch (e) {
        this.resultReplaceStringUndefinedLength = 'error: ' + (e as Error).message;
      }

      try {
        this.mutableStyledString.replaceString(0, 1, null);
        this.resultReplaceStringNullOther = 'success';
      } catch (e) {
        this.resultReplaceStringNullOther = 'error: ' + (e as Error).message;
      }

      try {
        this.mutableStyledString.replaceString(0, 1, undefined);
        this.resultReplaceStringUndefinedOther = 'success';
      } catch (e) {
        this.resultReplaceStringUndefinedOther = 'error: ' + (e as Error).message;
      }

      try {
        this.mutableStyledString.replaceString(0, 1, '');
        this.resultReplaceStringEmptyOther = 'success';
      } catch (e) {
        this.resultReplaceStringEmptyOther = 'error: ' + (e as Error).message;
      }

      // ==================== insertString 方法测试 ====================
      try {
        this.mutableStyledString.insertString(null, 'test');
        this.resultInsertStringNullStart = 'success';
      } catch (e) {
        this.resultInsertStringNullStart = 'error: ' + (e as Error).message;
      }

      try {
        this.mutableStyledString.insertString(undefined, 'test');
        this.resultInsertStringUndefinedStart = 'success';
      } catch (e) {
        this.resultInsertStringUndefinedStart = 'error: ' + (e as Error).message;
      }

      try {
        this.mutableStyledString.insertString(0, null);
        this.resultInsertStringNullOther = 'success';
      } catch (e) {
        this.resultInsertStringNullOther = 'error: ' + (e as Error).message;
      }

      try {
        this.mutableStyledString.insertString(0, undefined);
        this.resultInsertStringUndefinedOther = 'success';
      } catch (e) {
        this.resultInsertStringUndefinedOther = 'error: ' + (e as Error).message;
      }

      try {
        this.mutableStyledString.insertString(0, '');
        this.resultInsertStringEmptyOther = 'success';
      } catch (e) {
        this.resultInsertStringEmptyOther = 'error: ' + (e as Error).message;
      }

      // ==================== removeString 方法测试 ====================
      try {
        this.mutableStyledString.removeString(null, 1);
        this.resultRemoveStringNullStart = 'success';
      } catch (e) {
        this.resultRemoveStringNullStart = 'error: ' + (e as Error).message;
      }

      try {
        this.mutableStyledString.removeString(undefined, 1);
        this.resultRemoveStringUndefinedStart = 'success';
      } catch (e) {
        this.resultRemoveStringUndefinedStart = 'error: ' + (e as Error).message;
      }

      try {
        this.mutableStyledString.removeString(0, null);
        this.resultRemoveStringNullLength = 'success';
      } catch (e) {
        this.resultRemoveStringNullLength = 'error: ' + (e as Error).message;
      }

      try {
        this.mutableStyledString.removeString(0, undefined);
        this.resultRemoveStringUndefinedLength = 'success';
      } catch (e) {
        this.resultRemoveStringUndefinedLength = 'error: ' + (e as Error).message;
      }

      // ==================== replaceStyle 方法测试 ====================
      try {
        this.mutableStyledString.replaceStyle(null);
        this.resultReplaceStyleNull = 'success';
      } catch (e) {
        this.resultReplaceStyleNull = 'error: ' + (e as Error).message;
      }

      try {
        this.mutableStyledString.replaceStyle(undefined);
        this.resultReplaceStyleUndefined = 'success';
      } catch (e) {
        this.resultReplaceStyleUndefined = 'error: ' + (e as Error).message;
      }

      // ==================== setStyle 方法测试 ====================
      try {
        this.mutableStyledString.setStyle(null);
        this.resultSetStyleNull = 'success';
      } catch (e) {
        this.resultSetStyleNull = 'error: ' + (e as Error).message;
      }

      try {
        this.mutableStyledString.setStyle(undefined);
        this.resultSetStyleUndefined = 'success';
      } catch (e) {
        this.resultSetStyleUndefined = 'error: ' + (e as Error).message;
      }
    })
  }
}
