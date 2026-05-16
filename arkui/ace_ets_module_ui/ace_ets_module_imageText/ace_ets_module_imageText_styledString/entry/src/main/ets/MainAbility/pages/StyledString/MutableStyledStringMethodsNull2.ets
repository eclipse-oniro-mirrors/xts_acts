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
struct MutableStyledStringMethodsNull2 {
  @State resultRemoveStyleNullStart: string = '';
  @State resultRemoveStyleUndefinedStart: string = '';
  @State resultRemoveStyleNullLength: string = '';
  @State resultRemoveStyleUndefinedLength: string = '';
  @State resultRemoveStyleNullStyledKey: string = '';
  @State resultRemoveStyleUndefinedStyledKey: string = '';

  @State resultRemoveStylesNullStart: string = '';
  @State resultRemoveStylesUndefinedStart: string = '';
  @State resultRemoveStylesNullLength: string = '';
  @State resultRemoveStylesUndefinedLength: string = '';

  @State resultReplaceStyledStringNullStart: string = '';
  @State resultReplaceStyledStringUndefinedStart: string = '';
  @State resultReplaceStyledStringNullLength: string = '';
  @State resultReplaceStyledStringUndefinedLength: string = '';
  @State resultReplaceStyledStringNullOther: string = '';
  @State resultReplaceStyledStringUndefinedOther: string = '';

  @State resultInsertStyledStringNullStart: string = '';
  @State resultInsertStyledStringUndefinedStart: string = '';
  @State resultInsertStyledStringNullOther: string = '';
  @State resultInsertStyledStringUndefinedOther: string = '';

  @State resultAppendStyledStringNull: string = '';
  @State resultAppendStyledStringUndefined: string = '';

  private mutableStyledString: MutableStyledString = new MutableStyledString('test');

  build() {
    Column({ space: 10 }) {
      Text('MutableStyledString Methods Null Test 2')
        .id('mutableStyledString_methods_null2')
        .height('2%')

      Text('RemoveStyle Test: ' + this.resultRemoveStyleNullStart)
        .id('mutableStyledString_removeStyle_null_start')
        .height('2%')

      Text('RemoveStyle Test: ' + this.resultRemoveStyleUndefinedStart)
        .id('mutableStyledString_removeStyle_undefined_start')
        .height('2%')

      Text('RemoveStyle Test: ' + this.resultRemoveStyleNullLength)
        .id('mutableStyledString_removeStyle_null_length')
        .height('2%')

      Text('RemoveStyle Test: ' + this.resultRemoveStyleUndefinedLength)
        .id('mutableStyledString_removeStyle_undefined_length')
        .height('2%')

      Text('RemoveStyle Test: ' + this.resultRemoveStyleNullStyledKey)
        .id('mutableStyledString_removeStyle_null_styledKey')
        .height('2%')

      Text('RemoveStyle Test: ' + this.resultRemoveStyleUndefinedStyledKey)
        .id('mutableStyledString_removeStyle_undefined_styledKey')
        .height('2%')

      Text('RemoveStyles Test: ' + this.resultRemoveStylesNullStart)
        .id('mutableStyledString_removeStyles_null_start')
        .height('2%')

      Text('RemoveStyles Test: ' + this.resultRemoveStylesUndefinedStart)
        .id('mutableStyledString_removeStyles_undefined_start')
        .height('2%')

      Text('RemoveStyles Test: ' + this.resultRemoveStylesNullLength)
        .id('mutableStyledString_removeStyles_null_length')
        .height('2%')

      Text('RemoveStyles Test: ' + this.resultRemoveStylesUndefinedLength)
        .id('mutableStyledString_removeStyles_undefined_length')
        .height('2%')

      Text('ReplaceStyledString Test: ' + this.resultReplaceStyledStringNullStart)
        .id('mutableStyledString_replaceStyledString_null_start')
        .height('2%')

      Text('ReplaceStyledString Test: ' + this.resultReplaceStyledStringUndefinedStart)
        .id('mutableStyledString_replaceStyledString_undefined_start')
        .height('2%')

      Text('ReplaceStyledString Test: ' + this.resultReplaceStyledStringNullLength)
        .id('mutableStyledString_replaceStyledString_null_length')
        .height('2%')

      Text('ReplaceStyledString Test: ' + this.resultReplaceStyledStringUndefinedLength)
        .id('mutableStyledString_replaceStyledString_undefined_length')
        .height('2%')

      Text('ReplaceStyledString Test: ' + this.resultReplaceStyledStringNullOther)
        .id('mutableStyledString_replaceStyledString_null_other')
        .height('2%')

      Text('ReplaceStyledString Test: ' + this.resultReplaceStyledStringUndefinedOther)
        .id('mutableStyledString_replaceStyledString_undefined_other')
        .height('2%')

      Text('InsertStyledString Test: ' + this.resultInsertStyledStringNullStart)
        .id('mutableStyledString_insertStyledString_null_start')
        .height('2%')

      Text('InsertStyledString Test: ' + this.resultInsertStyledStringUndefinedStart)
        .id('mutableStyledString_insertStyledString_undefined_start')
        .height('2%')

      Text('InsertStyledString Test: ' + this.resultInsertStyledStringNullOther)
        .id('mutableStyledString_insertStyledString_null_other')
        .height('2%')

      Text('InsertStyledString Test: ' + this.resultInsertStyledStringUndefinedOther)
        .id('mutableStyledString_insertStyledString_undefined_other')
        .height('2%')

      Text('AppendStyledString Test: ' + this.resultAppendStyledStringNull)
        .id('mutableStyledString_appendStyledString_null')
        .height('2%')

      Text('AppendStyledString Test: ' + this.resultAppendStyledStringUndefined)
        .id('mutableStyledString_appendStyledString_undefined')
        .height('2%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
    .onAppear(() => {
      // ==================== removeStyle 方法测试 ====================
      try {
        this.mutableStyledString.removeStyle(null, 1, StyledStringKey.FONT);
        this.resultRemoveStyleNullStart = 'success';
      } catch (e) {
        this.resultRemoveStyleNullStart = 'error: ' + (e as Error).message;
      }

      try {
        this.mutableStyledString.removeStyle(undefined, 1, StyledStringKey.FONT);
        this.resultRemoveStyleUndefinedStart = 'success';
      } catch (e) {
        this.resultRemoveStyleUndefinedStart = 'error: ' + (e as Error).message;
      }

      try {
        this.mutableStyledString.removeStyle(0, null, StyledStringKey.FONT);
        this.resultRemoveStyleNullLength = 'success';
      } catch (e) {
        this.resultRemoveStyleNullLength = 'error: ' + (e as Error).message;
      }

      try {
        this.mutableStyledString.removeStyle(0, undefined, StyledStringKey.FONT);
        this.resultRemoveStyleUndefinedLength = 'success';
      } catch (e) {
        this.resultRemoveStyleUndefinedLength = 'error: ' + (e as Error).message;
      }

      try {
        this.mutableStyledString.removeStyle(0, 1, null);
        this.resultRemoveStyleNullStyledKey = 'success';
      } catch (e) {
        this.resultRemoveStyleNullStyledKey = 'error: ' + (e as Error).message;
      }

      try {
        this.mutableStyledString.removeStyle(0, 1, undefined);
        this.resultRemoveStyleUndefinedStyledKey = 'success';
      } catch (e) {
        this.resultRemoveStyleUndefinedStyledKey = 'error: ' + (e as Error).message;
      }

      // ==================== removeStyles 方法测试 ====================
      try {
        this.mutableStyledString.removeStyles(null, 1);
        this.resultRemoveStylesNullStart = 'success';
      } catch (e) {
        this.resultRemoveStylesNullStart = 'error: ' + (e as Error).message;
      }

      try {
        this.mutableStyledString.removeStyles(undefined, 1);
        this.resultRemoveStylesUndefinedStart = 'success';
      } catch (e) {
        this.resultRemoveStylesUndefinedStart = 'error: ' + (e as Error).message;
      }

      try {
        this.mutableStyledString.removeStyles(0, null);
        this.resultRemoveStylesNullLength = 'success';
      } catch (e) {
        this.resultRemoveStylesNullLength = 'error: ' + (e as Error).message;
      }

      try {
        this.mutableStyledString.removeStyles(0, undefined);
        this.resultRemoveStylesUndefinedLength = 'success';
      } catch (e) {
        this.resultRemoveStylesUndefinedLength = 'error: ' + (e as Error).message;
      }

      // ==================== replaceStyledString 方法测试 ====================
      try {
        this.mutableStyledString.replaceStyledString(null, 1, new StyledString('test'));
        this.resultReplaceStyledStringNullStart = 'success';
      } catch (e) {
        this.resultReplaceStyledStringNullStart = 'error: ' + (e as Error).message;
      }

      try {
        this.mutableStyledString.replaceStyledString(undefined, 1, new StyledString('test'));
        this.resultReplaceStyledStringUndefinedStart = 'success';
      } catch (e) {
        this.resultReplaceStyledStringUndefinedStart = 'error: ' + (e as Error).message;
      }

      try {
        this.mutableStyledString.replaceStyledString(0, null, new StyledString('test'));
        this.resultReplaceStyledStringNullLength = 'success';
      } catch (e) {
        this.resultReplaceStyledStringNullLength = 'error: ' + (e as Error).message;
      }

      try {
        this.mutableStyledString.replaceStyledString(0, undefined, new StyledString('test'));
        this.resultReplaceStyledStringUndefinedLength = 'success';
      } catch (e) {
        this.resultReplaceStyledStringUndefinedLength = 'error: ' + (e as Error).message;
      }

      try {
        this.mutableStyledString.replaceStyledString(0, 1, null);
        this.resultReplaceStyledStringNullOther = 'success';
      } catch (e) {
        this.resultReplaceStyledStringNullOther = 'error: ' + (e as Error).message;
      }

      try {
        this.mutableStyledString.replaceStyledString(0, 1, undefined);
        this.resultReplaceStyledStringUndefinedOther = 'success';
      } catch (e) {
        this.resultReplaceStyledStringUndefinedOther = 'error: ' + (e as Error).message;
      }

      // ==================== insertStyledString 方法测试 ====================
      try {
        this.mutableStyledString.insertStyledString(null, new StyledString('test'));
        this.resultInsertStyledStringNullStart = 'success';
      } catch (e) {
        this.resultInsertStyledStringNullStart = 'error: ' + (e as Error).message;
      }

      try {
        this.mutableStyledString.insertStyledString(undefined, new StyledString('test'));
        this.resultInsertStyledStringUndefinedStart = 'success';
      } catch (e) {
        this.resultInsertStyledStringUndefinedStart = 'error: ' + (e as Error).message;
      }

      try {
        this.mutableStyledString.insertStyledString(0, null);
        this.resultInsertStyledStringNullOther = 'success';
      } catch (e) {
        this.resultInsertStyledStringNullOther = 'error: ' + (e as Error).message;
      }

      try {
        this.mutableStyledString.insertStyledString(0, undefined);
        this.resultInsertStyledStringUndefinedOther = 'success';
      } catch (e) {
        this.resultInsertStyledStringUndefinedOther = 'error: ' + (e as Error).message;
      }

      // ==================== appendStyledString 方法测试 ====================
      try {
        this.mutableStyledString.appendStyledString(null);
        this.resultAppendStyledStringNull = 'success';
      } catch (e) {
        this.resultAppendStyledStringNull = 'error: ' + (e as Error).message;
      }

      try {
        this.mutableStyledString.appendStyledString(undefined);
        this.resultAppendStyledStringUndefined = 'success';
      } catch (e) {
        this.resultAppendStyledStringUndefined = 'error: ' + (e as Error).message;
      }
    })
  }
}
