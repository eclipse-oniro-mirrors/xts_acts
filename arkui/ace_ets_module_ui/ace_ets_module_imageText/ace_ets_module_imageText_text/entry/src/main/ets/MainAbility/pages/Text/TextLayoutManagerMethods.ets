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
struct TextLayoutManagerMethods {
  controller: TextController = new TextController();
  
  @State resultGetCharacterPositionAtCoordinateNullX: string = '';
  @State resultGetCharacterPositionAtCoordinateUndefinedX: string = '';
  @State resultGetCharacterPositionAtCoordinateNullY: string = '';
  @State resultGetCharacterPositionAtCoordinateUndefinedY: string = '';
  @State resultGetCharacterPositionAtCoordinateUndefinedReturn: string = '';
  @State resultGetCharacterPositionAtCoordinateNormalReturn: string = '';
  
  @State resultGetGlyphRangeForCharacterRangeNull: string = '';
  @State resultGetGlyphRangeForCharacterRangeUndefined: string = '';
  @State resultGetGlyphRangeForCharacterRangeEmpty: string = '';
  @State resultGetGlyphRangeForCharacterRangeNormal: string = '';
  @State resultGetGlyphRangeForCharacterRangeUndefinedReturn: string = '';
  
  @State resultGetCharacterRangeForGlyphRangeNull: string = '';
  @State resultGetCharacterRangeForGlyphRangeUndefined: string = '';
  @State resultGetCharacterRangeForGlyphRangeEmpty: string = '';
  @State resultGetCharacterRangeForGlyphRangeNormal: string = '';
  @State resultGetCharacterRangeForGlyphRangeUndefinedReturn: string = '';

  onPageShow(): void {
    let layoutManager: LayoutManager = this.controller.getLayoutManager();
    
    // getCharacterPositionAtCoordinate tests
    try {
      let result = layoutManager?.getCharacterPositionAtCoordinate(null, 1);
      if (result === undefined) {
        this.resultGetCharacterPositionAtCoordinateNullX = 'undefined';
      } else {
        this.resultGetCharacterPositionAtCoordinateNullX = JSON.stringify(result);
      }
    } catch (e) {
      this.resultGetCharacterPositionAtCoordinateNullX = 'error: ' + (e as Error).message;
    }

    try {
      let result = layoutManager?.getCharacterPositionAtCoordinate(undefined, 1);
      if (result === undefined) {
        this.resultGetCharacterPositionAtCoordinateUndefinedX = 'undefined';
      } else {
        this.resultGetCharacterPositionAtCoordinateUndefinedX = JSON.stringify(result);
      }
    } catch (e) {
      this.resultGetCharacterPositionAtCoordinateUndefinedX = 'error: ' + (e as Error).message;
    }

    try {
      let result = layoutManager?.getCharacterPositionAtCoordinate(0, null);
      if (result === undefined) {
        this.resultGetCharacterPositionAtCoordinateNullY = 'undefined';
      } else {
        this.resultGetCharacterPositionAtCoordinateNullY = JSON.stringify(result);
      }
    } catch (e) {
      this.resultGetCharacterPositionAtCoordinateNullY = 'error: ' + (e as Error).message;
    }

    try {
      let result = layoutManager?.getCharacterPositionAtCoordinate(0, undefined);
      if (result === undefined) {
        this.resultGetCharacterPositionAtCoordinateUndefinedY = 'undefined';
      } else {
        this.resultGetCharacterPositionAtCoordinateUndefinedY = JSON.stringify(result);
      }
    } catch (e) {
      this.resultGetCharacterPositionAtCoordinateUndefinedY = 'error: ' + (e as Error).message;
    }

    // getCharacterPositionAtCoordinate - unbound controller returns undefined
    let unboundLayoutManager: LayoutManager | undefined = undefined;
    try {
      let result = layoutManager?.getCharacterPositionAtCoordinate(0, 0);
      if (result === undefined) {
        this.resultGetCharacterPositionAtCoordinateUndefinedReturn = 'undefined';
      } else {
        this.resultGetCharacterPositionAtCoordinateUndefinedReturn = JSON.stringify(result);
      }
    } catch (e) {
      this.resultGetCharacterPositionAtCoordinateUndefinedReturn = 'error: ' + (e as Error).message;
    }

    // getCharacterPositionAtCoordinate - normal return with all properties
    try {
      let result = layoutManager?.getCharacterPositionAtCoordinate(10, 10);
      if (result === undefined) {
        this.resultGetCharacterPositionAtCoordinateNormalReturn = 'undefined';
      } else {
        this.resultGetCharacterPositionAtCoordinateNormalReturn = 'position:' + result.position + ',affinity:' + result.affinity;
      }
    } catch (e) {
      this.resultGetCharacterPositionAtCoordinateNormalReturn = 'error: ' + (e as Error).message;
    }

    // getGlyphRangeForCharacterRange tests
    try {
      let result = layoutManager?.getGlyphRangeForCharacterRange(null);
      if (result === undefined) {
        this.resultGetGlyphRangeForCharacterRangeNull = 'undefined';
      } else {
        this.resultGetGlyphRangeForCharacterRangeNull = 'success';
      }
    } catch (e) {
      this.resultGetGlyphRangeForCharacterRangeNull = 'error: ' + (e as Error).message;
    }

    try {
      let result = layoutManager?.getGlyphRangeForCharacterRange(undefined);
      if (result === undefined) {
        this.resultGetGlyphRangeForCharacterRangeUndefined = 'undefined';
      } else {
        this.resultGetGlyphRangeForCharacterRangeUndefined = 'success';
      }
    } catch (e) {
      this.resultGetGlyphRangeForCharacterRangeUndefined = 'error: ' + (e as Error).message;
    }

    try {
      let result = layoutManager?.getGlyphRangeForCharacterRange({start: 0, end: 0});
      if (result === undefined) {
        this.resultGetGlyphRangeForCharacterRangeEmpty = 'undefined';
      } else {
        this.resultGetGlyphRangeForCharacterRangeEmpty = 'length:' + result.length;
      }
    } catch (e) {
      this.resultGetGlyphRangeForCharacterRangeEmpty = 'error: ' + (e as Error).message;
    }

    try {
      let result = layoutManager?.getGlyphRangeForCharacterRange({start: 0, end: 5});
      if (result === undefined) {
        this.resultGetGlyphRangeForCharacterRangeNormal = 'undefined';
      } else {
        this.resultGetGlyphRangeForCharacterRangeNormal = 'length:' + result.length;
      }
    } catch (e) {
      this.resultGetGlyphRangeForCharacterRangeNormal = 'error: ' + (e as Error).message;
    }

    // unbound controller returns undefined
    try {
      let result = layoutManager?.getGlyphRangeForCharacterRange({start: 0, end: 5});
      if (result === undefined) {
        this.resultGetGlyphRangeForCharacterRangeUndefinedReturn = 'undefined';
      } else {
        this.resultGetGlyphRangeForCharacterRangeUndefinedReturn = 'success';
      }
    } catch (e) {
      this.resultGetGlyphRangeForCharacterRangeUndefinedReturn = 'error: ' + (e as Error).message;
    }

    // getCharacterRangeForGlyphRange tests
    try {
      let result = layoutManager?.getCharacterRangeForGlyphRange(null);
      if (result === undefined) {
        this.resultGetCharacterRangeForGlyphRangeNull = 'undefined';
      } else {
        this.resultGetCharacterRangeForGlyphRangeNull = 'success';
      }
    } catch (e) {
      this.resultGetCharacterRangeForGlyphRangeNull = 'error: ' + (e as Error).message;
    }

    try {
      let result = layoutManager?.getCharacterRangeForGlyphRange(undefined);
      if (result === undefined) {
        this.resultGetCharacterRangeForGlyphRangeUndefined = 'undefined';
      } else {
        this.resultGetCharacterRangeForGlyphRangeUndefined = 'success';
      }
    } catch (e) {
      this.resultGetCharacterRangeForGlyphRangeUndefined = 'error: ' + (e as Error).message;
    }

    try {
      let result = layoutManager?.getCharacterRangeForGlyphRange({start: 0, end: 0});
      if (result === undefined) {
        this.resultGetCharacterRangeForGlyphRangeEmpty = 'undefined';
      } else {
        this.resultGetCharacterRangeForGlyphRangeEmpty = 'length:' + result.length;
      }
    } catch (e) {
      this.resultGetCharacterRangeForGlyphRangeEmpty = 'error: ' + (e as Error).message;
    }

    try {
      let result = layoutManager?.getCharacterRangeForGlyphRange({start: 0, end: 5});
      if (result === undefined) {
        this.resultGetCharacterRangeForGlyphRangeNormal = 'undefined';
      } else {
        this.resultGetCharacterRangeForGlyphRangeNormal = 'length:' + result.length;
      }
    } catch (e) {
      this.resultGetCharacterRangeForGlyphRangeNormal = 'error: ' + (e as Error).message;
    }

    // unbound controller returns undefined
    try {
      let result = layoutManager?.getCharacterRangeForGlyphRange({start: 0, end: 5});
      if (result === undefined) {
        this.resultGetCharacterRangeForGlyphRangeUndefinedReturn = 'undefined';
      } else {
        this.resultGetCharacterRangeForGlyphRangeUndefinedReturn = 'success';
      }
    } catch (e) {
      this.resultGetCharacterRangeForGlyphRangeUndefinedReturn = 'error: ' + (e as Error).message;
    }
  }

  build() {
    Column({ space: 1 }) {
      Text('Text LayoutManager Methods Test')
        .id('text_layoutManager_methods')
        .height('3%')
      
      Text(undefined, { controller: this.controller })
        .height('3%')

      Text('getCharacterPositionAtCoordinate null X: ' + this.resultGetCharacterPositionAtCoordinateNullX)
        .id('text_getCharacterPositionAtCoordinate_null_x')
        .height('3%')

      Text('getCharacterPositionAtCoordinate undefined X: ' + this.resultGetCharacterPositionAtCoordinateUndefinedX)
        .id('text_getCharacterPositionAtCoordinate_undefined_x')
        .height('3%')

      Text('getCharacterPositionAtCoordinate null Y: ' + this.resultGetCharacterPositionAtCoordinateNullY)
        .id('text_getCharacterPositionAtCoordinate_null_y')
        .height('3%')

      Text('getCharacterPositionAtCoordinate undefined Y: ' + this.resultGetCharacterPositionAtCoordinateUndefinedY)
        .id('text_getCharacterPositionAtCoordinate_undefined_y')
        .height('3%')

      Text('getCharacterPositionAtCoordinate unbound: ' + this.resultGetCharacterPositionAtCoordinateUndefinedReturn)
        .id('text_getCharacterPositionAtCoordinate_unbound')
        .height('3%')

      Text('getCharacterPositionAtCoordinate normal: ' + this.resultGetCharacterPositionAtCoordinateNormalReturn)
        .id('text_getCharacterPositionAtCoordinate_normal')
        .height('3%')

      Text('getGlyphRangeForCharacterRange null: ' + this.resultGetGlyphRangeForCharacterRangeNull)
        .id('text_getGlyphRangeForCharacterRange_null')
        .height('3%')

      Text('getGlyphRangeForCharacterRange undefined: ' + this.resultGetGlyphRangeForCharacterRangeUndefined)
        .id('text_getGlyphRangeForCharacterRange_undefined')
        .height('3%')

      Text('getGlyphRangeForCharacterRange empty: ' + this.resultGetGlyphRangeForCharacterRangeEmpty)
        .id('text_getGlyphRangeForCharacterRange_empty')
        .height('3%')

      Text('getGlyphRangeForCharacterRange normal: ' + this.resultGetGlyphRangeForCharacterRangeNormal)
        .id('text_getGlyphRangeForCharacterRange_normal')
        .height('3%')

      Text('getGlyphRangeForCharacterRange unbound: ' + this.resultGetGlyphRangeForCharacterRangeUndefinedReturn)
        .id('text_getGlyphRangeForCharacterRange_unbound')
        .height('3%')

      Text('getCharacterRangeForGlyphRange null: ' + this.resultGetCharacterRangeForGlyphRangeNull)
        .id('text_getCharacterRangeForGlyphRange_null')
        .height('3%')

      Text('getCharacterRangeForGlyphRange undefined: ' + this.resultGetCharacterRangeForGlyphRangeUndefined)
        .id('text_getCharacterRangeForGlyphRange_undefined')
        .height('3%')

      Text('getCharacterRangeForGlyphRange empty: ' + this.resultGetCharacterRangeForGlyphRangeEmpty)
        .id('text_getCharacterRangeForGlyphRange_empty')
        .height('3%')

      Text('getCharacterRangeForGlyphRange normal: ' + this.resultGetCharacterRangeForGlyphRangeNormal)
        .id('text_getCharacterRangeForGlyphRange_normal')
        .height('3%')

      Text('getCharacterRangeForGlyphRange unbound: ' + this.resultGetCharacterRangeForGlyphRangeUndefinedReturn)
        .id('text_getCharacterRangeForGlyphRange_unbound')
        .height('3%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
