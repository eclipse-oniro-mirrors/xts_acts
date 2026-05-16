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
struct StyledStringMethodsNull {
  @State resultGetStylesNullStart: string = '';
  @State resultGetStylesUndefinedStart: string = '';
  @State resultGetStylesNullLength: string = '';
  @State resultGetStylesUndefinedLength: string = '';
  @State resultGetStylesNullStyledKey: string = '';
  @State resultGetStylesUndefinedStyledKey: string = '';

  @State resultEqualsNull: string = '';
  @State resultEqualsUndefined: string = '';

  @State resultSubStyledStringNullStart: string = '';
  @State resultSubStyledStringUndefinedStart: string = '';
  @State resultSubStyledStringNullLength: string = '';
  @State resultSubStyledStringUndefinedLength: string = '';

  @State resultFromHtmlNull: string = '';
  @State resultFromHtmlUndefined: string = '';
  @State resultFromHtmlEmpty: string = '';

  @State resultToHtmlNull: string = '';
  @State resultToHtmlUndefined: string = '';

  private styledString: StyledString = new StyledString('test');

  build() {
    Column({ space: 10 }) {
      Text('StyledString Methods Null Test')
        .id('styledString_methods_null')
        .height('3%')

      Text('GetStyles Test: ' + this.resultGetStylesNullStart)
        .id('styledString_getStyles_null_start')
        .height('3%')

      Text('GetStyles Test: ' + this.resultGetStylesUndefinedStart)
        .id('styledString_getStyles_undefined_start')
        .height('3%')

      Text('GetStyles Test: ' + this.resultGetStylesNullLength)
        .id('styledString_getStyles_null_length')
        .height('3%')

      Text('GetStyles Test: ' + this.resultGetStylesUndefinedLength)
        .id('styledString_getStyles_undefined_length')
        .height('3%')

      Text('GetStyles Test: ' + this.resultGetStylesNullStyledKey)
        .id('styledString_getStyles_null_styledKey')
        .height('3%')

      Text('GetStyles Test: ' + this.resultGetStylesUndefinedStyledKey)
        .id('styledString_getStyles_undefined_styledKey')
        .height('3%')

      Text('Equals Test: ' + this.resultEqualsNull)
        .id('styledString_equals_null')
        .height('3%')

      Text('Equals Test: ' + this.resultEqualsUndefined)
        .id('styledString_equals_undefined')
        .height('3%')

      Text('SubStyledString Test: ' + this.resultSubStyledStringNullStart)
        .id('styledString_subStyledString_null_start')
        .height('3%')

      Text('SubStyledString Test: ' + this.resultSubStyledStringUndefinedStart)
        .id('styledString_subStyledString_undefined_start')
        .height('3%')

      Text('SubStyledString Test: ' + this.resultSubStyledStringNullLength)
        .id('styledString_subStyledString_null_length')
        .height('3%')

      Text('SubStyledString Test: ' + this.resultSubStyledStringUndefinedLength)
        .id('styledString_subStyledString_undefined_length')
        .height('3%')

      Text('FromHtml Test: ' + this.resultFromHtmlNull)
        .id('styledString_fromHtml_null')
        .height('3%')

      Text('FromHtml Test: ' + this.resultFromHtmlUndefined)
        .id('styledString_fromHtml_undefined')
        .height('3%')

      Text('FromHtml Test: ' + this.resultFromHtmlEmpty)
        .id('styledString_fromHtml_empty')
        .height('3%')

      Text('ToHtml Test: ' + this.resultToHtmlNull)
        .id('styledString_toHtml_null')
        .height('3%')

      Text('ToHtml Test: ' + this.resultToHtmlUndefined)
        .id('styledString_toHtml_undefined')
        .height('3%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
    .onAppear(async () => {
      // ==================== getStyles 方法测试 ====================
      try {
        let result = this.styledString.getStyles(null, 1);
        this.resultGetStylesNullStart = 'success';
      } catch (e) {
        this.resultGetStylesNullStart = 'error: ' + (e as Error).message;
      }

      try {
        let result = this.styledString.getStyles(undefined, 1);
        this.resultGetStylesUndefinedStart = 'success';
      } catch (e) {
        this.resultGetStylesUndefinedStart = 'error: ' + (e as Error).message;
      }

      try {
        let result = this.styledString.getStyles(0, null);
        this.resultGetStylesNullLength = 'success';
      } catch (e) {
        this.resultGetStylesNullLength = 'error: ' + (e as Error).message;
      }

      try {
        let result = this.styledString.getStyles(0, undefined);
        this.resultGetStylesUndefinedLength = 'success';
      } catch (e) {
        this.resultGetStylesUndefinedLength = 'error: ' + (e as Error).message;
      }

      try {
        let result = this.styledString.getStyles(0, 1, null);
        this.resultGetStylesNullStyledKey = 'success';
      } catch (e) {
        this.resultGetStylesNullStyledKey = 'error: ' + (e as Error).message;
      }

      try {
        let result = this.styledString.getStyles(0, 1, undefined);
        this.resultGetStylesUndefinedStyledKey = 'success';
      } catch (e) {
        this.resultGetStylesUndefinedStyledKey = 'error: ' + (e as Error).message;
      }

      // ==================== equals 方法测试 ====================
      try {
        let result = this.styledString.equals(null);
        this.resultEqualsNull = '' + result;
      } catch (e) {
        this.resultEqualsNull = 'error: ' + (e as Error).message;
      }

      try {
        let result = this.styledString.equals(undefined);
        this.resultEqualsUndefined = '' + result;
      } catch (e) {
        this.resultEqualsUndefined = 'error: ' + (e as Error).message;
      }

      // ==================== subStyledString 方法测试 ====================
      try {
        let result = this.styledString.subStyledString(null);
        this.resultSubStyledStringNullStart = result.getString();
      } catch (e) {
        this.resultSubStyledStringNullStart = 'error: ' + (e as Error).message;
      }

      try {
        let result = this.styledString.subStyledString(undefined);
        this.resultSubStyledStringUndefinedStart = result.getString();
      } catch (e) {
        this.resultSubStyledStringUndefinedStart = 'error: ' + (e as Error).message;
      }

      try {
        let result = this.styledString.subStyledString(0, null);
        this.resultSubStyledStringNullLength = result.getString();
      } catch (e) {
        this.resultSubStyledStringNullLength = 'error: ' + (e as Error).message;
      }

      try {
        let result = this.styledString.subStyledString(0, undefined);
        this.resultSubStyledStringUndefinedLength = result.getString();
      } catch (e) {
        this.resultSubStyledStringUndefinedLength = 'error: ' + (e as Error).message;
      }

      // ==================== fromHtml 静态方法测试 ====================
      try {
        let result = await StyledString.fromHtml(null);
        this.resultFromHtmlNull = 'success';
      } catch (e) {
        this.resultFromHtmlNull = 'error: ' + (e as Error).message;
      }

      try {
        let result = await StyledString.fromHtml(undefined);
        this.resultFromHtmlUndefined = 'success';
      } catch (e) {
        this.resultFromHtmlUndefined = 'error: ' + (e as Error).message;
      }

      try {
        let result = await StyledString.fromHtml('');
        this.resultFromHtmlEmpty = 'success';
      } catch (e) {
        this.resultFromHtmlEmpty = 'error: ' + (e as Error).message;
      }

      // ==================== toHtml 静态方法测试 ====================
      try {
        let result = StyledString.toHtml(null);
        this.resultToHtmlNull = 'success';
      } catch (e) {
        this.resultToHtmlNull = 'error: ' + (e as Error).message;
      }

      try {
        let result = StyledString.toHtml(undefined);
        this.resultToHtmlUndefined = 'success';
      } catch (e) {
        this.resultToHtmlUndefined = 'error: ' + (e as Error).message;
      }
    })
  }
}
