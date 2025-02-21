/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import router from '@system.router';

export default function ActsRichEditorTest() {
  describe('ActsRichEditorTest', function () {
    beforeEach(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'TestAbility/pages/richeditor',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get richeditor state success " + JSON.stringify(pages));
        if (!("richeditor" == pages.name)) {
          console.info("get richeditor state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push richeditor page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push richeditor page error: " + err);
      }
      done()
    });
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    it('Stage_RichEditor_Test_0100', 0, async function (done) {
      console.info('Stage_RichEditor_Test_0100 START');
        try{
          let controller = new RichEditorController()
          let res = controller.addTextSpan("实例文字0", {
            offset: 5,
            style: {
              fontColor: Color.Red,
              fontSize: 8,
              fontStyle: FontStyle.Italic,
              fontWeight: FontWeight.Lighter,
              fontFamily: "sans-serif",
              decoration: { type: TextDecorationType.None, color: Color.Brown }
            }
          })
          console.info('Stage_Font_0100 START  :'+ JSON.stringify(res));
          expect(typeof(res)).assertEqual('number')
          expect(res).assertEqual(0)
          console.info('Stage_RichEditor_Test_0100 END ');
        } catch(err) {
          expect().assertFail()
          console.info('Stage_RichEditor_Test_0100 ERR  '+ JSON.stringify(err));
        }
        done();
    });

    it('Stage_RichEditor_Test_0200', 0, async function (done) {
      console.info('Stage_RichEditor_Test_0200 START');
      try{
        let controller = new RichEditorController()
        let res = controller.addTextSpan("实例文字0")
        console.info('Stage_Font_0200 START  :'+ JSON.stringify(res));
        expect(typeof(res)).assertEqual('number')
        expect(res).assertEqual(0)
        console.info('Stage_RichEditor_Test_0200 END ');
      } catch(err) {
        expect().assertFail()
        console.info('Stage_RichEditor_Test_0200 ERR  '+ JSON.stringify(err));
      }
      done();
    });

    it('Stage_RichEditor_Test_0300', 0, async function (done) {
      console.info('Stage_RichEditor_Test_0300 START');
      try{
        let controller = new RichEditorController()
        let res = controller.addTextSpan('')
        console.info('Stage_Font_0300 START  :'+ JSON.stringify(res));
        expect(typeof(res)).assertEqual('number')
        expect(res).assertEqual(-1)
        console.info('Stage_RichEditor_Test_0300 END ');
      } catch(err) {
        expect().assertFail()
        console.info('Stage_RichEditor_Test_0300 ERR  '+ JSON.stringify(err));
      }
      done();
    });

    it('Stage_RichEditor_Test_0400', 0, async function (done) {
      console.info('Stage_RichEditor_Test_0400 START');
      try{
        let controller = new RichEditorController()
        let res = controller.addTextSpan(null)
        console.info('Stage_Font_0400 START  :'+ JSON.stringify(res));
        expect(typeof(res)).assertEqual('number')
        expect(res).assertEqual(-1)
        console.info('Stage_RichEditor_Test_0400 END ');
      } catch(err) {
        expect().assertFail()
        console.info('Stage_RichEditor_Test_0400 ERR  '+ JSON.stringify(err));
      }
      done();
    });

    it('Stage_RichEditor_Test_0500', 0, async function (done) {
      console.info('Stage_RichEditor_Test_0500 START');
      try{
        let controller = new RichEditorController()
        let res = controller.addImageSpan($r('app.media.icon'), {
          offset: 0,
          imageStyle: {
            size: ["114px", "114px"],
            verticalAlign: ImageSpanAlignment.CENTER,
            objectFit: ImageFit.Cover
          }
        })
        console.info('Stage_Font_0500 START  :'+ JSON.stringify(res));
        expect(typeof(res)).assertEqual('number')
        expect(res).assertEqual(0)
        console.info('Stage_RichEditor_Test_0500 END ');
      } catch(err) {
        expect().assertFail()
        console.info('Stage_RichEditor_Test_0500 ERR  '+ JSON.stringify(err));
      }
      done();
    });

    it('Stage_RichEditor_Test_0600', 0, async function (done) {
      console.info('Stage_RichEditor_Test_0600 START');
      try{
        let controller = new RichEditorController()
        let res = controller.addImageSpan($r('app.media.icon'))
        console.info('Stage_Font_0600 START  :'+ JSON.stringify(res));
        expect(typeof(res)).assertEqual('number')
        expect(res).assertEqual(0)
        console.info('Stage_RichEditor_Test_0600 END ');
      } catch(err) {
        expect().assertFail()
        console.info('Stage_RichEditor_Test_0600 ERR  '+ JSON.stringify(err));
      }
      done();
    });

    it('Stage_RichEditor_Test_0700', 0, async function (done) {
      console.info('Stage_RichEditor_Test_0700 START');
      try{
        let controller = new RichEditorController()
        let res = controller.addImageSpan('')
        console.info('Stage_Font_0600 START  :'+ JSON.stringify(res));
        expect(typeof(res)).assertEqual('number')
        expect(res).assertEqual(-1)
        console.info('Stage_RichEditor_Test_0700 END ');
      } catch(err) {
        expect().assertFail()
        console.info('Stage_RichEditor_Test_0700 ERR  '+ JSON.stringify(err));
      }
      done();
    });

    it('Stage_RichEditor_Test_0800', 0, async function (done) {
      console.info('Stage_RichEditor_Test_0800 START');
      try{
        let controller = new RichEditorController()
        let res = controller.addImageSpan(null)
        console.info('Stage_Font_0800 START  :'+ JSON.stringify(res));
        expect(typeof(res)).assertEqual('number')
        expect(res).assertEqual(-1)
        console.info('Stage_RichEditor_Test_0800 END ');
      } catch(err) {
        expect().assertFail()
        console.info('Stage_RichEditor_Test_0800 ERR  '+ JSON.stringify(err));
      }
      done();
    });

    it('Stage_RichEditor_Test_0900', 0, async function (done) {
      console.info('Stage_RichEditor_Test_0900 START');
      try{
        let controller = new RichEditorController()
        let res = controller.updateSpanStyle({
          start: 22,
          end: 25,
          textStyle: {
            fontColor:Color.Blue,
            fontSize:12,
            fontStyle:FontStyle.Italic,
            fontWeight:FontWeight.Bolder,
            fontFamily:"sans-serif",
            decoration: { type: TextDecorationType.Underline, color: Color.Red }
          }
        })
        console.info('Stage_Font_0900 START  :'+ JSON.stringify(res));
        expect(res).assertUndefined()
        console.info('Stage_RichEditor_Test_0900 END ');
      } catch(err) {
        expect().assertFail()
        console.info('Stage_RichEditor_Test_0900 ERR  '+ JSON.stringify(err));
      }
      done();
    });

    it('Stage_RichEditor_Test_1000', 0, async function (done) {
      console.info('Stage_RichEditor_Test_1000 START');
      try{
        let controller = new RichEditorController()
        let res = controller.updateSpanStyle({
          start: 22,
          end: 25,
          imageStyle: {
            size: [ 277, 177 ],
            verticalAlign:ImageSpanAlignment.CENTER,
            objectFit:ImageFit.Fill
          }
        })
        console.info('Stage_Font_1000 START  :'+ JSON.stringify(res));
        expect(res).assertUndefined()
        console.info('Stage_RichEditor_Test_1000 END ');
      } catch(err) {
        expect().assertFail()
        console.info('Stage_RichEditor_Test_1000 ERR  '+ JSON.stringify(err));
      }
      done();
    });

    it('Stage_RichEditor_Test_1100', 0, async function (done) {
      console.info('Stage_RichEditor_Test_1100 START');
      try{
        let controller = new RichEditorController()
        let res = controller.updateSpanStyle(null)
        console.info('Stage_Font_1100 START  :'+ JSON.stringify(res));
        expect(res).assertUndefined()
        console.info('Stage_RichEditor_Test_1100 END ');
      } catch(err) {
        expect().assertFail()
        console.info('Stage_RichEditor_Test_1100 ERR  '+ JSON.stringify(err));
      }
      done();
    });

    it('Stage_RichEditor_Test_1200', 0, async function (done) {
      console.info('Stage_RichEditor_Test_1200 START');
      try{
        let controller = new RichEditorController()
        let res = controller.deleteSpans({
          start: 22,
          end: 25
        })
        console.info('Stage_Font_1200 START  :'+ JSON.stringify(res));
        expect(res).assertUndefined()
        console.info('Stage_RichEditor_Test_1200 END ');
      } catch(err) {
        expect().assertFail()
        console.info('Stage_RichEditor_Test_1200 ERR  '+ JSON.stringify(err));
      }
      done();
    });

    it('Stage_RichEditor_Test_1300', 0, async function (done) {
      console.info('Stage_RichEditor_Test_1300 START');
      try{
        let controller = new RichEditorController()
        let res = controller.deleteSpans()
        console.info('Stage_Font_1300 START  :'+ JSON.stringify(res));
        expect(res).assertUndefined()
        console.info('Stage_RichEditor_Test_1300 END ');
      } catch(err) {
        expect().assertFail()
        console.info('Stage_RichEditor_Test_1300 ERR  '+ JSON.stringify(err));
      }
      done();
    });

    it('Stage_RichEditor_Test_1400', 0, async function (done) {
      console.info('Stage_RichEditor_Test_1400 START');
      try{
        let controller = new RichEditorController()
        let res = controller.deleteSpans(null)
        console.info('Stage_Font_1400 START  :'+ JSON.stringify(res));
        expect(res).assertUndefined()
        console.info('Stage_RichEditor_Test_1400 END ');
      } catch(err) {
        expect().assertFail()
        console.info('Stage_RichEditor_Test_1400 ERR  '+ JSON.stringify(err));
      }
      done();
    });
    it('Stage_RichEditor_Test_1500', 0, async function (done) {
      console.info('Stage_RichEditor_Test_1500 START');
      try{
        let controller = new RichEditorController();
        let res = controller.getSpans({ start: 0, end: 10 })
        console.info('Stage_RichEditor_Test_1500'+ JSON.stringify(res));
        expect(res).assertUndefined()
        console.info('Stage_RichEditor_Test_1500 END ');
      } catch(err) {
        expect().assertFail()
        console.info('Stage_RichEditor_Test_1500 ERR  '+ JSON.stringify(err));
      }
      done();
    });

    it('Stage_RichEditor_Test_1600', 0, async function (done) {
      console.info('Stage_RichEditor_Test_1600 START');
      try{
        let controller = new RichEditorController();
        let res = controller.getSpans()
        console.info('Stage_RichEditor_Test_1600'+ JSON.stringify(res));
        expect(res).assertUndefined()
        console.info('Stage_RichEditor_Test_1600 END ');
      } catch(err) {
        expect().assertFail()
        console.info('Stage_RichEditor_Test_1600 ERR  '+ JSON.stringify(err));
      }
      done();
    });

    it('Stage_RichEditor_Test_1700', 0, async function (done) {
      console.info('Stage_RichEditor_Test_1700 START');
      try{
        let controller = new RichEditorController();
        let res = controller.getSpans(null)
        console.info('Stage_RichEditor_Test_1700'+ JSON.stringify(res));
        expect(res).assertUndefined()
        console.info('Stage_RichEditor_Test_1700 END ');
      } catch(err) {
        expect().assertFail()
        console.info('Stage_RichEditor_Test_1700 ERR  '+ JSON.stringify(err));
      }
      done();
    });

    it('Stage_RichEditor_Test_1800', 0, async function (done) {
      console.info('Stage_RichEditor_Test_1800 START');
      try{
        let controller = new RichEditorController();
        let res = controller.setCaretOffset(5)
        let get = controller.getCaretOffset()
        console.info('Stage_RichEditor_Test_1800'+ JSON.stringify(res));
        console.info('Stage_RichEditor_Test_1800'+ JSON.stringify(get));
        expect(res).assertEqual(false)
        expect(get).assertEqual(-1)
        console.info('Stage_RichEditor_Test_1800 END ');
      } catch(err) {
        expect().assertFail()
        console.info('Stage_RichEditor_Test_1800 ERR  '+ JSON.stringify(err));
      }
      done();
    });

    it('Stage_RichEditor_Test_1900', 0, async function (done) {
      console.info('Stage_RichEditor_Test_1900 START');
      try{
        let controller = new RichEditorController();
        let res = controller.setCaretOffset(null)
        let get = controller.getCaretOffset()
        console.info('Stage_RichEditor_Test_1900'+ JSON.stringify(res));
        console.info('Stage_RichEditor_Test_1900'+ JSON.stringify(get));
        expect(res).assertEqual(false)
        expect(get).assertEqual(-1)
        console.info('Stage_RichEditor_Test_1900 END ');
      } catch(err) {
        expect().assertFail()
        console.info('Stage_RichEditor_Test_1900 ERR  '+ JSON.stringify(err));
      }
      done();
    });

    it('Stage_RichEditor_Test_2000', 0, async function (done) {
      console.info('Stage_RichEditor_Test_2000 START');
      try{
        let controller = new RichEditorController();
        let res = controller.setCaretOffset(101010101010101010101010101010101)
        let get = controller.getCaretOffset()
        console.info('Stage_RichEditor_Test_2000'+ JSON.stringify(res));
        console.info('Stage_RichEditor_Test_2000'+ JSON.stringify(get));
        expect(res).assertEqual(false)
        expect(get).assertEqual(-1)
        console.info('Stage_RichEditor_Test_2000 END ');
      } catch(err) {
        expect().assertFail()
        console.info('Stage_RichEditor_Test_2000 ERR  '+ JSON.stringify(err));
      }
      done();
    });

    it('Stage_RichEditor_Test_2100', 0, async function (done) {
      console.info('Stage_RichEditor_Test_2100 START');
      setTimeout(()=>{
      try{
        let RichEditorInsertValue: RichEditorInsertValue = { insertOffset:10, insertValue:"aaaaaa" }
        let RichEditorSpanPosition: RichEditorSpanPosition = { spanIndex:10, spanRange:[10,10]}
        let RichEditorTextSpan: RichEditorTextSpan = { spanPosition:{ spanIndex:10, spanRange:[10,10]},value:"aaaaa",textStyle:{ }}
        let RichEditorImageSpanStyle: RichEditorImageSpanStyle = { size:[10,10],verticalAlign:(ImageSpanAlignment.CENTER),objectFit:(ImageFit.Contain)}
        let RichEditorTextSpanResult: RichEditorTextSpanResult = { spanPosition:{ spanIndex:10, spanRange:[10,10]},value:"aaaaa",textStyle:(null),offsetInSpan:[10,100]}
        let RichEditorImageSpanStyleResult: RichEditorImageSpanStyleResult = { size:[10,10],verticalAlign:(ImageSpanAlignment.BASELINE),objectFit:(ImageFit.Cover)}
        let RichEditorImageSpanResult: RichEditorImageSpanResult = { spanPosition:{ spanIndex:10, spanRange:[10,10]},valuePixelMap:(null),valueResourceStr:("aaa"),imageStyle:{ size:[10,10],verticalAlign:(ImageSpanAlignment.TOP),objectFit:(ImageFit.Auto)},offsetInSpan:[10,100]}
        let RichEditorImageSpan: RichEditorImageSpan = { spanPosition:{ spanIndex:10, spanRange:[10,10]},value:"aaaaa",imageStyle:{ size:[10,10],verticalAlign:(ImageSpanAlignment.CENTER),objectFit:(ImageFit.Contain)}}
        let RichEditorImageSpanOptions: RichEditorImageSpanOptions = { offset:10,imageStyle:{ size:[10,10],verticalAlign:(ImageSpanAlignment.CENTER),objectFit:(ImageFit.Contain)}}
        let RichEditorUpdateImageSpanStyleOptions: RichEditorUpdateImageSpanStyleOptions = { imageStyle:{ size:[10,10],verticalAlign:(ImageSpanAlignment.CENTER),objectFit:(ImageFit.Contain)}}
        let RichEditorSelection: RichEditorSelection = { selection:[10,10],spans:(null)}
        let RichEditorDeleteValue: RichEditorDeleteValue = { offset:10,direction:(0),length:10,richEditorDeleteSpans:(null)}
        let RichEditorDeleteValue1: RichEditorDeleteValue = { offset:10,direction:(1),length:10,richEditorDeleteSpans:(null)}
        console.info("Stage_RichEditor_Test_2100 InsertValue is: " + JSON.stringify(RichEditorInsertValue))
        console.info("Stage_RichEditor_Test_2100 InsertValue is: " + JSON.stringify(RichEditorSpanPosition))
        console.info("Stage_RichEditor_Test_2100 InsertValue is: " + JSON.stringify(RichEditorTextSpan))
        console.info("Stage_RichEditor_Test_2100 InsertValue is: " + JSON.stringify(RichEditorImageSpanStyle))
        console.info("Stage_RichEditor_Test_2100 InsertValue is: " + JSON.stringify(RichEditorTextSpanResult))
        console.info("Stage_RichEditor_Test_2100 InsertValue is: " + JSON.stringify(RichEditorImageSpanStyleResult))
        console.info("Stage_RichEditor_Test_2100 InsertValue is: " + JSON.stringify(RichEditorImageSpanResult))
        console.info("Stage_RichEditor_Test_2100 InsertValue is: " + JSON.stringify(RichEditorImageSpan))
        console.info("Stage_RichEditor_Test_2100 InsertValue is: " + JSON.stringify(RichEditorImageSpanOptions))
        console.info("Stage_RichEditor_Test_2100 InsertValue is: " + JSON.stringify(RichEditorUpdateImageSpanStyleOptions))
        console.info("Stage_RichEditor_Test_2100 InsertValue is: " + JSON.stringify(RichEditorSelection))
        console.info("Stage_RichEditor_Test_2100 InsertValue is: " + JSON.stringify(RichEditorDeleteValue))
        console.info("Stage_RichEditor_Test_2100 InsertValue is: " + JSON.stringify(RichEditorDeleteValue1))
        expect(typeof RichEditorInsertValue).assertEqual("object")
        expect(typeof RichEditorSpanPosition).assertEqual("object")
        expect(typeof RichEditorTextSpan).assertEqual("object")
        expect(typeof RichEditorImageSpanStyle).assertEqual("object")
        expect(typeof RichEditorTextSpanResult).assertEqual("object")
        expect(typeof RichEditorImageSpanStyleResult).assertEqual("object")
        expect(typeof RichEditorImageSpanResult).assertEqual("object")
        expect(typeof RichEditorImageSpan).assertEqual("object")
        expect(typeof RichEditorImageSpanOptions).assertEqual("object")
        expect(typeof RichEditorUpdateImageSpanStyleOptions).assertEqual("object")
        expect(typeof RichEditorSelection).assertEqual("object")
        expect(typeof RichEditorDeleteValue).assertEqual("object")
        expect(typeof RichEditorDeleteValue1).assertEqual("object")

        console.info('Stage_RichEditor_Test_2100 END ');
      } catch(err) {
        expect().assertFail()
        console.info('Stage_RichEditor_Test_2100 ERR  '+ JSON.stringify(err));
      }
      done();
      },500)
    });

    it('Stage_RichEditor_Test_2200', 0, async function (done) {
      console.info('Stage_RichEditor_Test_2200 START');
      setTimeout(()=>{
        try{
          let RichEditorInsertValue: RichEditorInsertValue = { insertOffset:10, insertValue:"aaaaaa" }
          console.info("Stage_RichEditor_Test_2200 InsertValue is: " + JSON.stringify(RichEditorInsertValue))
          expect(typeof RichEditorInsertValue).assertEqual("object")
          expect(RichEditorInsertValue.insertOffset).assertEqual(10)
          expect(RichEditorInsertValue.insertValue).assertEqual("aaaaaa")

          console.info('Stage_RichEditor_Test_2200 END ');
        } catch(err) {
          expect().assertFail()
          console.info('Stage_RichEditor_Test_2200 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('Stage_RichEditor_Test_2300', 0, async function (done) {
      console.info('Stage_RichEditor_Test_2300 START');
      setTimeout(()=>{
        try{
          let RichEditorTextSpanResult: RichEditorTextSpanResult = { spanPosition:{ spanIndex:10, spanRange:[10,10]},value:"aaaaa",textStyle:(null),offsetInSpan:[10,100]}
          let RichEditorSpanPosition: RichEditorSpanPosition = { spanIndex:20, spanRange:[20,20]}
          console.info("Stage_RichEditor_Test_2300 InsertValue is: " + JSON.stringify(RichEditorTextSpanResult))
          console.info("Stage_RichEditor_Test_2300 InsertValue is: " + JSON.stringify(RichEditorSpanPosition))
          expect(typeof RichEditorTextSpanResult).assertEqual("object")
          expect(typeof RichEditorSpanPosition).assertEqual("object")
          expect(RichEditorTextSpanResult.spanPosition.spanIndex).assertEqual(10)
          expect(RichEditorTextSpanResult.spanPosition.spanRange[0]).assertEqual(10)
          expect(RichEditorTextSpanResult.spanPosition.spanRange[1]).assertEqual(10)
          expect(RichEditorSpanPosition.spanIndex).assertEqual(20)
          expect(RichEditorSpanPosition.spanRange[0]).assertEqual(20)
          expect(RichEditorSpanPosition.spanRange[1]).assertEqual(20)
          expect(RichEditorTextSpanResult.offsetInSpan[0]).assertEqual(10)
          expect(RichEditorTextSpanResult.offsetInSpan[1]).assertEqual(100)

          console.info('Stage_RichEditor_Test_2300 END ');
        } catch(err) {
          expect().assertFail()
          console.info('Stage_RichEditor_Test_2300 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('Stage_RichEditor_Test_2400', 0, async function (done) {
      console.info('Stage_RichEditor_Test_2400 START');
      setTimeout(()=>{
        try{
          let RichEditorDeleteValue: RichEditorDeleteValue = { offset:10,direction:(0),length:10,richEditorDeleteSpans:(null)}
          let RichEditorDeleteValue1: RichEditorDeleteValue = { offset:10,direction:(1),length:10,richEditorDeleteSpans:(null)}
          console.info("Stage_RichEditor_Test_2400 InsertValue is: " + JSON.stringify(RichEditorDeleteValue))
          console.info("Stage_RichEditor_Test_2400 InsertValue is: " + JSON.stringify(RichEditorDeleteValue1))
          expect(typeof RichEditorDeleteValue).assertEqual("object")
          expect(typeof RichEditorDeleteValue1).assertEqual("object")
          expect(RichEditorDeleteValue.richEditorDeleteSpans).assertEqual(null)
          expect(RichEditorDeleteValue1.richEditorDeleteSpans).assertEqual(null)

          console.info('Stage_RichEditor_Test_2400 END ');
        } catch(err) {
          expect().assertFail()
          console.info('Stage_RichEditor_Test_2400 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('Stage_RichEditor_Test_2500', 0, async function (done) {
      console.info('Stage_RichEditor_Test_2500 START');
      setTimeout(()=>{
        try{
          let RichEditorSelection: RichEditorSelection = { selection:[10,10],spans:(null)}
          console.info("Stage_RichEditor_Test_2500 InsertValue is: " + JSON.stringify(RichEditorSelection))
          expect(typeof RichEditorSelection).assertEqual("object")
          expect(RichEditorSelection.selection[0]).assertEqual(10)
          expect(RichEditorSelection.selection[1]).assertEqual(10)
          expect(RichEditorSelection.spans).assertEqual(null)
          console.info('Stage_RichEditor_Test_2500 END ');
        } catch(err) {
          expect().assertFail()
          console.info('Stage_RichEditor_Test_2500 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('Stage_RichEditor_Test_2600', 0, async function (done) {
      console.info('Stage_RichEditor_Test_2600 START');
      setTimeout(()=>{
        try{
          let RichEditorImageSpanResult: RichEditorImageSpanResult = { spanPosition:{ spanIndex:10, spanRange:[10,10]},valuePixelMap:(null),valueResourceStr:("aaa"),imageStyle:{ size:[10,10],verticalAlign:(ImageSpanAlignment.TOP),objectFit:(ImageFit.Auto)},offsetInSpan:[10,100]}
          console.info("Stage_RichEditor_Test_2600 InsertValue is: " + JSON.stringify(RichEditorImageSpanResult))
          expect(typeof RichEditorImageSpanResult).assertEqual("object")
          expect(RichEditorImageSpanResult.spanPosition.spanRange[0]).assertEqual(10)
          expect(RichEditorImageSpanResult.spanPosition.spanRange[1]).assertEqual(10)
          expect(RichEditorImageSpanResult.spanPosition.spanIndex).assertEqual(10)
          expect(RichEditorImageSpanResult.valuePixelMap).assertEqual(null)
          expect(RichEditorImageSpanResult.valueResourceStr).assertEqual("aaa")
          expect(RichEditorImageSpanResult.imageStyle.size[0]).assertEqual(10)
          expect(RichEditorImageSpanResult.imageStyle.size[1]).assertEqual(10)
          expect(RichEditorImageSpanResult.imageStyle.verticalAlign).assertEqual(ImageSpanAlignment.TOP)
          expect(RichEditorImageSpanResult.imageStyle.objectFit).assertEqual(ImageFit.Auto)
          expect(RichEditorImageSpanResult.offsetInSpan[0]).assertEqual(10)
          expect(RichEditorImageSpanResult.offsetInSpan[1]).assertEqual(100)
          console.info('Stage_RichEditor_Test_2600 END ');
        } catch(err) {
          expect().assertFail()
          console.info('Stage_RichEditor_Test_2600 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('Stage_RichEditor_Test_2700', 0, async function (done) {
      console.info('Stage_RichEditor_Test_2700 START');
      setTimeout(()=>{
        try{
          let RichEditorTextSpan: RichEditorTextSpan = { spanPosition:{ spanIndex:10, spanRange:[10,10]},value:"aaaaa",textStyle:{ }}
          let RichEditorImageSpan: RichEditorImageSpan = { spanPosition:{ spanIndex:10, spanRange:[10,10]},value:"aaaaa",imageStyle:{ size:[10,10],verticalAlign:(ImageSpanAlignment.CENTER),objectFit:(ImageFit.Contain)}}
          console.info("Stage_RichEditor_Test_2700 InsertValue is: " + JSON.stringify(RichEditorTextSpan))
          console.info("Stage_RichEditor_Test_2700 InsertValue is: " + JSON.stringify(RichEditorImageSpan))
          expect(typeof RichEditorTextSpan).assertEqual("object")
          expect(typeof RichEditorImageSpan).assertEqual("object")
          expect(RichEditorTextSpan.spanPosition.spanIndex).assertEqual(10)
          expect(RichEditorTextSpan.spanPosition.spanRange[0]).assertEqual(10)
          expect(RichEditorTextSpan.spanPosition.spanRange[1]).assertEqual(10)
          expect(RichEditorImageSpan.spanPosition.spanIndex).assertEqual(10)
          expect(RichEditorImageSpan.spanPosition.spanRange[0]).assertEqual(10)
          expect(RichEditorImageSpan.spanPosition.spanRange[1]).assertEqual(10)
          console.info('Stage_RichEditor_Test_2700 END ');
        } catch(err) {
          expect().assertFail()
          console.info('Stage_RichEditor_Test_2700 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

  })
}

