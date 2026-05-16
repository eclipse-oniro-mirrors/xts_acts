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
struct TextMethodsNull2 {
  controller: TextController = new TextController();
  @State resultGetGlyphPositionAtCoordinateNullX: string = '';
  @State resultGetGlyphPositionAtCoordinateUndefinedX: string = '';
  @State resultGetGlyphPositionAtCoordinateNullY: string = '';
  @State resultGetGlyphPositionAtCoordinateUndefinedY: string = '';

  @State resultGetRectsForRangeNullRange: string = '';
  @State resultGetRectsForRangeUndefinedRange: string = '';

  @State resultTextMenuItemIdOfNull: string = '';
  @State resultTextMenuItemIdOfUndefined: string = '';
  @State resultTextMenuItemIdOfEmpty: string = '';

  @State resultTextMenuItemIdEqualsNull: string = '';
  @State resultTextMenuItemIdEqualsUndefined: string = '';

  aboutToAppear(): void {
    let layoutManager:LayoutManager = this.controller.getLayoutManager();
    console.info('TextMethodsNull2Test XXXX: ', layoutManager);
    try {
      let result = layoutManager?.getGlyphPositionAtCoordinate(null, 1);
      this.resultGetGlyphPositionAtCoordinateNullX = 'success';
    } catch (e) {
      this.resultGetGlyphPositionAtCoordinateNullX = 'error: ' + (e as Error).message;
    }

    try {
      let result = layoutManager?.getGlyphPositionAtCoordinate(undefined, 1);
      this.resultGetGlyphPositionAtCoordinateUndefinedX = 'success';
    } catch (e) {
      this.resultGetGlyphPositionAtCoordinateUndefinedX = 'error: ' + (e as Error).message;
    }

    try {
      let result = layoutManager?.getGlyphPositionAtCoordinate(0, null);
      this.resultGetGlyphPositionAtCoordinateNullY = 'success';
    } catch (e) {
      this.resultGetGlyphPositionAtCoordinateNullY = 'error: ' + (e as Error).message;
    }

    try {
      let result = layoutManager?.getGlyphPositionAtCoordinate(0, undefined);
      this.resultGetGlyphPositionAtCoordinateUndefinedY = 'success';
    } catch (e) {
      this.resultGetGlyphPositionAtCoordinateUndefinedY = 'error: ' + (e as Error).message;
    }

    try {
      let result = layoutManager?.getRectsForRange(null, null, null);
      this.resultGetRectsForRangeNullRange = 'success';
    } catch (e) {
      this.resultGetRectsForRangeNullRange = 'error: ' + (e as Error).message;
    }

    try {
      let result = layoutManager?.getRectsForRange(undefined, undefined, undefined);
      this.resultGetRectsForRangeUndefinedRange = 'success';
    } catch (e) {
      this.resultGetRectsForRangeUndefinedRange = 'error: ' + (e as Error).message;
    }

    try {
      let result = TextMenuItemId.of(null);
      this.resultTextMenuItemIdOfNull = 'success';
    } catch (e) {
      this.resultTextMenuItemIdOfNull = 'error: ' + (e as Error).message;
    }

    try {
      let result = TextMenuItemId.of(undefined);
      this.resultTextMenuItemIdOfUndefined = 'success';
    } catch (e) {
      this.resultTextMenuItemIdOfUndefined = 'error: ' + (e as Error).message;
    }

    try {
      let result = TextMenuItemId.of('');
      this.resultTextMenuItemIdOfEmpty = 'success';
    } catch (e) {
      this.resultTextMenuItemIdOfEmpty = 'error: ' + (e as Error).message;
    }

    let testId = TextMenuItemId.of('test');
    try {
      let result = testId.equals(null);
      this.resultTextMenuItemIdEqualsNull = 'success';
    } catch (e) {
      this.resultTextMenuItemIdEqualsNull = 'error: ' + (e as Error).message;
    }

    try {
      let result = testId.equals(undefined);
      this.resultTextMenuItemIdEqualsUndefined = 'success';
    } catch (e) {
      this.resultTextMenuItemIdEqualsUndefined = 'error: ' + (e as Error).message;
    }
  }

  build() {
    Column({ space: 1 }) {
      Text('Text Methods Null Test 2')
        .id('text_methods_null2')
        .height('3%')

      Text('getGlyphPositionAtCoordinate: ' + this.resultGetGlyphPositionAtCoordinateNullX)
        .id('text_getGlyphPositionAtCoordinate_null_x')
        .height('3%')

      Text('getGlyphPositionAtCoordinate: ' + this.resultGetGlyphPositionAtCoordinateUndefinedX)
        .id('text_getGlyphPositionAtCoordinate_undefined_x')
        .height('3%')

      Text('getGlyphPositionAtCoordinate: ' + this.resultGetGlyphPositionAtCoordinateNullY)
        .id('text_getGlyphPositionAtCoordinate_null_y')
        .height('3%')

      Text('getGlyphPositionAtCoordinate: ' + this.resultGetGlyphPositionAtCoordinateUndefinedY)
        .id('text_getGlyphPositionAtCoordinate_undefined_y')
        .height('3%')

      Text('getRectsForRange: ' + this.resultGetRectsForRangeNullRange)
        .id('text_getRectsForRange_null_range')
        .height('3%')

      Text('getRectsForRange: ' + this.resultGetRectsForRangeUndefinedRange)
        .id('text_getRectsForRange_undefined_range')
        .height('3%')

      Text('TextMenuItemId.of: ' + this.resultTextMenuItemIdOfNull)
        .id('text_TextMenuItemId_of_null')
        .height('3%')

      Text('TextMenuItemId.of: ' + this.resultTextMenuItemIdOfUndefined)
        .id('text_TextMenuItemId_of_undefined')
        .height('3%')

      Text('TextMenuItemId.of: ' + this.resultTextMenuItemIdOfEmpty)
        .id('text_TextMenuItemId_of_empty')
        .height('3%')

      Text('TextMenuItemId.equals: ' + this.resultTextMenuItemIdEqualsNull)
        .id('text_TextMenuItemId_equals_null')
        .height('3%')

      Text('TextMenuItemId.equals: ' + this.resultTextMenuItemIdEqualsUndefined)
        .id('text_TextMenuItemId_equals_undefined')
        .height('3%')

      Text('onCreateMenu null test')
        .id('text_onCreateMenu_null')
        .height('3%')
        .editMenuOptions(null)

      Text('onCreateMenu undefined test')
        .id('text_onCreateMenu_undefined')
        .height('3%')
        .editMenuOptions(undefined)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
    .onAppear(() => {

    })
  }
}
