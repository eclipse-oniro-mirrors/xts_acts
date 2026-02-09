/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import common2D from '@ohos.graphics.common2D';
import drawing from '@ohos.graphics.drawing';

export default function PathIterator() {

  describe('PathIterator', () => {
    beforeAll(() => {
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ITERATOR_STATIC_0100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ITERATOR_STATIC_0100
     * @tc.desc   test for pathIterator EnumValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ITERATOR_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let msg = " ====testPathIteratorVerb==== "
        try {
          console.info(msg + ' Succeeded in PathIteratorVerb.');
          expect(drawing.PathIteratorVerb.MOVE == 0).assertTrue()
          expect(drawing.PathIteratorVerb.LINE == 1).assertTrue()
          expect(drawing.PathIteratorVerb.QUAD == 2).assertTrue()
          expect(drawing.PathIteratorVerb.CONIC == 3).assertTrue()
          expect(drawing.PathIteratorVerb.CUBIC == 4).assertTrue()
          expect(drawing.PathIteratorVerb.CLOSE == 5).assertTrue()
          expect(drawing.PathIteratorVerb.DONE == drawing.PathIteratorVerb.CLOSE + 1).assertTrue()
          console.info(msg + ' drawing.PathIteratorVerb.MOVE: ' + drawing.PathIteratorVerb.MOVE);
          console.info(msg + ' drawing.PathIteratorVerb.LINE: ' + drawing.PathIteratorVerb.LINE);
          console.info(msg + ' drawing.PathIteratorVerb.QUAD: ' + drawing.PathIteratorVerb.QUAD);
          console.info(msg + ' drawing.PathIteratorVerb.CONIC: ' + drawing.PathIteratorVerb.CONIC);
          console.info(msg + ' drawing.PathIteratorVerb.CUBIC: ' + drawing.PathIteratorVerb.CUBIC);
          console.info(msg + ' drawing.PathIteratorVerb.CLOSE: ' + drawing.PathIteratorVerb.CLOSE);
          console.info(msg + ' drawing.PathIteratorVerb.DONE: ' + drawing.PathIteratorVerb.DONE);
          done()
        } catch (err) {
          console.log(msg + " Failed in drawing.PathIteratorVerb " + JSON.stringify(err))
          console.log(msg + " Failed in drawing.PathIteratorVerb " + err)
          expect().assertFail()
          done()
        }
      })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ITERATOR_STATIC_0200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ITERATOR_STATIC_0200
     * @tc.desc   test for pathIterator EnumValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ITERATOR_STATIC_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let msg = " ====testPathIteratorNext==== "
        let path: drawing.Path = new drawing.Path();
        path.moveTo(10, 20);
        let iter: drawing.PathIterator = new drawing.PathIterator(path);
        let verbStr: Array<string> = ["MOVE", "LINE", "QUAD", "CONIC", "CUBIC", "CLOSE", "DONE"];
        let pointCount: Array<number> = [1, 2, 3, 4, 4, 0, 0]; //1,2,3,3.5,4,0,0
        let points: Array<common2D.Point> = [{ x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }];
        let offset = 0;
        try {
          let verb = iter.next(points, offset);
          if(verb) {
            console.info(msg + ' iter.next(points, offset) success: ' + verb);
            done();
          }
          if(verb == undefined){
            console.info(msg + ' iter.next(points, offset) failed: ' + verb);
            expect().assertFail();
            done();
          }
        } catch (err) {
          console.log(msg + " Failed in PathIterator.next " + JSON.stringify(err))
          console.log(msg + " Failed in PathIterator.next " + err)
          expect().assertFail();
          done();
        }
        try {
          let verb1 = iter.next(points);
          if(verb1) {
            console.info(msg + ' verb1  success: ' + verb1);
            done();
          }
          if(verb1 == undefined){
            console.info(msg + ' verb1 failed: ' + verb1);
            expect().assertFail();
            done();
          }
        } catch (err) {
          console.log(msg + " Failed verb1 " + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ITERATOR_STATIC_0300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ITERATOR_STATIC_0300
     * @tc.desc   test for pathIterator EnumValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ITERATOR_STATIC_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let msg = " ====testPathIteratorPeek==== "
        try {
          let path: drawing.Path = new drawing.Path();
          let iter: drawing.PathIterator = new drawing.PathIterator(path);
          if(iter) {
            let res = iter.peek();
            console.info(msg + ' iter.peek(): success' + res);
            done();
          }
          if(iter == undefined){
            console.info(msg + ' PathIterator failed');
            expect().assertFail();
            done();
          }
        } catch (err) {
          console.log(msg + " Failed in PathIterator.peek " + JSON.stringify(err))
          console.log(msg + " Failed in PathIterator.peek " + err)
          expect().assertFail()
          done()
        }
      })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ITERATOR_STATIC_0400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ITERATOR_STATIC_0400
     * @tc.desc   test for pathIterator EnumValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ITERATOR_STATIC_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let msg = " ====testPathIteratorHasNext==== "
        try {
          let path: drawing.Path = new drawing.Path();
          let iter: drawing.PathIterator = new drawing.PathIterator(path);
          let res = iter.hasNext();
          console.info(msg + ' iter.hasNext(): ' + res);
          done()
        } catch (err) {
          console.log(msg + " Faild in PathIterator.hasNext " + JSON.stringify(err))
          console.log(msg + " Faild in PathIterator.hasNext " + err)
          expect().assertFail()
          done()
        }
      })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ITERATOR_STATIC_0500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ITERATOR_STATIC_0500
     * @tc.desc   test for pathIterator EnumValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ITERATOR_STATIC_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let msg = " ====testPathGetPathIterator==== "
        try {
          let path: drawing.Path = new drawing.Path();
          let iter = path.getPathIterator();
          if(iter){
            console.info(msg + ' iter.getPathIterator() success: ' + iter);
            console.info(msg + ' iter.getPathIterator(): ' + JSON.stringify(iter));
            done();
          }
          if(iter == undefined){
            console.info(msg + ' iter.getPathIterator() failed: ' + iter);
            expect().assertFail();
            done();
          }
        } catch (err) {
          console.log(msg + " Faild in Path.getPathIterator " + JSON.stringify(err))
          console.log(msg + " Faild in Path.getPathIterator " + err)
          expect().assertFail()
          done()
        }
      })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ITERATOR_STATIC_0600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ITERATOR_STATIC_0600
     * @tc.desc   test for pathIterator EnumValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ITERATOR_STATIC_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let msg = " ====SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ITERATOR_STATIC_0600==== "
        try {
          let path: drawing.Path = new drawing.Path();
          path.moveTo(10, 20);
          path.lineTo(100, 200);
          path.quadTo(10, 15, 10, 10);
          path.conicTo(200, 400, 100, 200, 3);
          path.cubicTo(100, 100, 80, 150, 300, 150);
          path.close();
          let iter: drawing.PathIterator = new drawing.PathIterator(path);
          let points: Array<common2D.Point> = [{ x: 0, y: 0 }, { x: 1, y: 1 }, { x: 2, y: 2 }, { x: 3, y: 3 }];
          let offset = 0;
          let verb1 = iter.next(points, offset);
          console.info('www data verb ', verb1);
          let verb2 = iter.next(points, offset);
          let verb3 = iter.next(points, offset);
          let verb4 = iter.next(points, offset);
          let verb5 = iter.next(points, offset);
          let verb6 = iter.next(points, offset);
          let verb7 = iter.next(points, offset);
          console.info('www data verb ', verb1, verb2, verb3, verb4, verb5, verb6, verb7);
          expect(verb1).assertEqual(drawing.PathIteratorVerb.MOVE);
          expect(verb2).assertEqual(drawing.PathIteratorVerb.LINE);
          expect(verb3).assertEqual(drawing.PathIteratorVerb.QUAD);
          expect(verb4).assertEqual(drawing.PathIteratorVerb.CONIC);
          expect(verb5).assertEqual(drawing.PathIteratorVerb.CUBIC);
          expect(verb6).assertEqual(drawing.PathIteratorVerb.CLOSE);
          expect(verb7).assertEqual(drawing.PathIteratorVerb.DONE);
          done();
        } catch (err) {
          console.log(msg + " Failed in testPathIteratorNextReturnValue " + JSON.stringify(err))
          console.log(msg + " Failed in testPathIteratorNextReturnValue " + err)
          expect().assertFail()
          done();
        }
      })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ITERATOR_STATIC_0700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ITERATOR_STATIC_0700
     * @tc.desc   test for pathIterator EnumValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ITERATOR_STATIC_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let msg = " ====SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ITERATOR_STATIC_0700==== "
        try {
          let path: drawing.Path = new drawing.Path();
          path.moveTo(10, 20);
          path.lineTo(100, 200);
          path.quadTo(10, 15, 10, 10);
          path.conicTo(200, 400, 100, 200, 3);
          path.cubicTo(100, 100, 80, 150, 300, 150);
          path.close();
          let iter: drawing.PathIterator = new drawing.PathIterator(path);
          let points: Array<common2D.Point> = [{ x: 0, y: 0 }, { x: 1, y: 1 }, { x: 2, y: 2 }, { x: 3, y: 3 }];
          let offset = 0;
          let peek1 = iter.peek();
          iter.next(points, offset);
          let peek2 = iter.peek();
          iter.next(points, offset);
          let peek3 = iter.peek();
          let hasNext1 = iter.hasNext();
          iter.next(points, offset);
          let peek4 = iter.peek();
          iter.next(points, offset);
          let peek5 = iter.peek();
          iter.next(points, offset);
          let peek6 = iter.peek();
          iter.next(points, offset);
          let peek7 = iter.peek();
          let hasNext2 = iter.hasNext();
          console.info('www data peek ', peek1, peek2, peek3, peek4, peek5, peek6, peek7);
          console.info('www data hasNext ', hasNext1, hasNext2);
          expect(peek1).assertEqual(drawing.PathIteratorVerb.MOVE);
          expect(peek2).assertEqual(drawing.PathIteratorVerb.LINE);
          expect(peek3).assertEqual(drawing.PathIteratorVerb.QUAD);
          expect(peek4).assertEqual(drawing.PathIteratorVerb.CONIC);
          expect(peek5).assertEqual(drawing.PathIteratorVerb.CUBIC);
          expect(peek6).assertEqual(drawing.PathIteratorVerb.CLOSE);
          expect(peek7).assertEqual(drawing.PathIteratorVerb.DONE);
          expect(hasNext1).assertEqual(true);
          expect(hasNext2).assertEqual(false);
          done()
        } catch (err) {
          console.log(msg + " Failed in testPathIteratorPeekReturnValue " + JSON.stringify(err))
          console.log(msg + " Failed in testPathIteratorPeekReturnValue " + err)
          expect().assertFail()
          done()
        }
      })

  })
}
