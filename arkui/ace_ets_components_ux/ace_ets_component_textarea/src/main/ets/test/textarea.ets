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
import events_emitter from '@ohos.events.emitter';
function sleep(time){
  return new Promise((resolve,reject)=>{
    setTimeout(()=>{
      resolve("ok")
    },time)
  }).then(()=>{
    console.info(`sleep ${time} over...`)
  })
}
async function forKey(Key,text) {
  try {
    let backData = {
      data: {
        "type": Key,
        "text": text 
      }
    }
    let backEvent = {
      eventId:10,
      priority:events_emitter.EventPriority.LOW
    }
    console.info("start send emitKey");
    events_emitter.emit(backEvent, backData);
    console.info("backData :====>"+   JSON.stringify(backData));
  } catch (err) {
    console.info("emit emitKey  err: " + JSON.stringify(err));
  }
  await sleep(2000)
}
export default function textAreaTest() {
  describe('ActsAbilityTest', function () {

  /**
   * @tc.number    ArkUX_Stage_TextArea_MaxLength_0100
   * @tc.name      Tests the maximum number of input characters for text
   * @tc.desc      Tests the MaxLength property parameter of the TextArea component to 0
   */
   it('ArkUX_Stage_TextArea_MaxLength_0100',0, async function (done) {
     await forKey("TextNum","0");
     try{
       let strJson = getInspectorByKey('TextArea');
       console.info('ArkUX_Stage_TextArea_MaxLength_0100 START :' + JSON.stringify(strJson));
       let obj = JSON.parse(strJson);
       console.info('ArkUX_Stage_TextArea_MaxLength_0100 obj $attrs.maxLength :'+ JSON.stringify(obj.$attrs.maxLength));
       expect(obj.$attrs.maxLength).assertEqual("0")
       done()
     } catch (err) {
       expect().assertFail()
       console.info('ArkUX_Stage_TextArea_MaxLength_0100 err  :' + JSON.stringify(err))
       done()
     }
   })

  /**
   * @tc.number    ArkUX_Stage_TextArea_MaxLength_0200
   * @tc.name      Tests the maximum number of input characters for text
   * @tc.desc      Tests the MaxLength property parameter of the TextArea component to 10
   */
   it('ArkUX_Stage_TextArea_MaxLength_0200',0, async function (done) {
     await forKey("TextNum","10");
     try{
       let strJson = getInspectorByKey('TextArea');
       console.info('ArkUX_Stage_TextArea_MaxLength_0200 START :' + JSON.stringify(strJson));
       let obj = JSON.parse(strJson);
       console.info('ArkUX_Stage_TextArea_MaxLength_0200 obj $attrs.maxLength :'+ JSON.stringify(obj.$attrs.maxLength));
       expect(obj.$attrs.maxLength).assertEqual("10")
       done()
     } catch (err) {
       expect().assertFail()
       console.info('ArkUX_Stage_TextArea_MaxLength_0200 err  :' + JSON.stringify(err))
       done()
     }
   })

  /**
   * @tc.number    ArkUX_Stage_TextArea_MaxLength_0300
   * @tc.name      Tests the maximum number of input characters for text
   * @tc.desc      Set the MaxLength property parameter of the TextArea component to string "10".
   */
   it('ArkUX_Stage_TextArea_MaxLength_0300',0, async function (done) {
     await forKey("TextStr","10");
     try{
       let strJson = getInspectorByKey('TextArea');
       console.info('ArkUX_Stage_TextArea_MaxLength_0300 START :' + JSON.stringify(strJson));
       let obj = JSON.parse(strJson);
       console.info('ArkUX_Stage_TextArea_MaxLength_0300 obj $attrs.maxLength :'+ JSON.stringify(obj.$attrs.maxLength));
       expect(obj.$attrs.maxLength).assertEqual("INF")
       done()
     } catch (err) {
       expect().assertFail()
       console.info('ArkUX_Stage_TextArea_MaxLength_0300 err  :' + JSON.stringify(err))
       done()
     }
   })

  /**
   * @tc.number    ArkUX_Stage_TextArea_MaxLength_0400
   * @tc.name      Tests the maximum number of input characters for text
   * @tc.desc      Set the MaxLength property parameter of the TextArea component to -1.
   */
   it('ArkUX_Stage_TextArea_MaxLength_0400',0, async function (done) {
     await forKey("TextNum","-1");
     try{
       let strJson = getInspectorByKey('TextArea');
       console.info('ArkUX_Stage_TextArea_MaxLength_0400 START :' + JSON.stringify(strJson));
       let obj = JSON.parse(strJson);
       console.info('ArkUX_Stage_TextArea_MaxLength_0400 obj $attrs.maxLength :'+ JSON.stringify(obj.$attrs.maxLength));
       await sleep(5000)
       expect(obj.$attrs.maxLength).assertEqual("INF")
       done()
     } catch (err) {
       expect().assertFail()
       console.info('ArkUX_Stage_TextArea_MaxLength_0400 err  :' + JSON.stringify(err))
       done()
     }
   })

  /**
   * @tc.number    ArkUX_Stage_TextArea_MaxLength_0500
   * @tc.name      Tests the maximum number of input characters for text
   * @tc.desc      Set the MaxLength property parameter of the TextArea component to "".
   */
   it('ArkUX_Stage_TextArea_MaxLength_0500',0, async function (done) {
     await forKey("TextStr","");
     try{
       let strJson = getInspectorByKey('TextArea');
       console.info('ArkUX_Stage_TextArea_MaxLength_0500 START :' + JSON.stringify(strJson));
       let obj = JSON.parse(strJson);
       console.info('ArkUX_Stage_TextArea_MaxLength_0500 obj $attrs.maxLength :'+ JSON.stringify(obj.$attrs.maxLength));
       expect(obj.$attrs.maxLength).assertEqual("INF")
       done()
     } catch (err) {
       expect().assertFail()
       console.info('ArkUX_Stage_TextArea_MaxLength_0500 err  :' + JSON.stringify(err))
       done()
     }
   })

  /**
   * @tc.number    ArkUX_Stage_TextArea_MaxLength_0600
   * @tc.name      Tests the maximum number of input characters for text
   * @tc.desc      Set the MaxLength property parameter of the TextArea component to null.
   */
   it('ArkUX_Stage_TextArea_MaxLength_0600',0, async function (done) {
     await forKey("TextErr","null");
     try{
       let strJson = getInspectorByKey('TextArea');
       console.info('ArkUX_Stage_TextArea_MaxLength_0600 START :' + JSON.stringify(strJson));
       let obj = JSON.parse(strJson);
       console.info('ArkUX_Stage_TextArea_MaxLength_0600 obj $attrs.maxLength :'+ JSON.stringify(obj.$attrs.maxLength));
       await sleep(5000)
       expect(obj.$attrs.maxLength).assertEqual("INF")
       done()
     } catch (err) {
       expect().assertFail()
       console.info('ArkUX_Stage_TextArea_MaxLength_0600 err  :' + JSON.stringify(err))
       done()
     }
   })

  /**
   * @tc.number    ArkUX_Stage_TextArea_MaxLength_0700
   * @tc.name      Tests the maximum number of input characters for text
   * @tc.desc      Set the MaxLength property parameter of the TextArea component to undefined.
   */
   it('ArkUX_Stage_TextArea_MaxLength_0700',0, async function (done) {
     await forKey("TextErr","undefined");
     try{
       let strJson = getInspectorByKey('TextArea');
       console.info('ArkUX_Stage_TextArea_MaxLength_0700 START :' + JSON.stringify(strJson));
       let obj = JSON.parse(strJson);
       console.info('ArkUX_Stage_TextArea_MaxLength_0700 obj $attrs.maxLength :'+ JSON.stringify(obj.$attrs.maxLength));
       await sleep(7000)
       expect(obj.$attrs.maxLength).assertEqual("INF")
       done()
     } catch (err) {
       expect().assertFail()
       console.info('ArkUX_Stage_TextArea_MaxLength_0700 err  :' + JSON.stringify(err))
       done()
     }
   })

  /**
   * @tc.number    ArkUX_Stage_TextArea_MaxLength_0800
   * @tc.name      Tests the maximum number of input characters for text
   * @tc.desc      Set the MaxLength property parameter of the TextArea component to 5 and again to 10
   */
   it('ArkUX_Stage_TextArea_MaxLength_0800',0, async function (done) {
     await forKey("TextNum","5");
     await forKey("TextNum","10");
     try{
       let strJson = getInspectorByKey('TextArea');
       console.info('ArkUX_Stage_TextArea_MaxLength_0800 START :' + JSON.stringify(strJson));
       let obj = JSON.parse(strJson);
       console.info('ArkUX_Stage_TextArea_MaxLength_0800 obj $attrs.maxLength :'+ JSON.stringify(obj.$attrs.maxLength));
       expect(obj.$attrs.maxLength).assertEqual("10")
       done()
     } catch (err) {
       expect().assertFail()
       console.info('ArkUX_Stage_TextArea_MaxLength_0800 err  :' + JSON.stringify(err))
       done()
     }
   })

  /**
   * @tc.number    ArkUX_Stage_TextArea_MaxLength_0900
   * @tc.name      Tests the maximum number of input characters for text
   * @tc.desc      Set the MaxLength property parameter of the TextArea component to 5 and again to null
   */
   it('ArkUX_Stage_TextArea_MaxLength_0900',0, async function (done) {
     await forKey("TextNum","5");
     await forKey("TextErr","null");
     try{
       let strJson = getInspectorByKey('TextArea');
       console.info('ArkUX_Stage_TextArea_MaxLength_0900 START :' + JSON.stringify(strJson));
       let obj = JSON.parse(strJson);
       console.info('ArkUX_Stage_TextArea_MaxLength_0900 obj $attrs.maxLength :'+ JSON.stringify(obj.$attrs.maxLength));
       expect(obj.$attrs.maxLength).assertEqual("INF")
       done()
     } catch (err) {
       expect().assertFail()
       console.info('ArkUX_Stage_TextArea_MaxLength_0900 err  :' + JSON.stringify(err))
       done()
     }
   })

  /**
   * @tc.number    ArkUX_Stage_TextArea_MaxLength_1000
   * @tc.name      Tests the maximum number of input characters for text
   * @tc.desc      Set the MaxLength property parameter of the TextArea component to undefined and again to 5
   */
   it('ArkUX_Stage_TextArea_MaxLength_1000',0, async function (done) {
     await forKey("TextErr","undefined");
     await forKey("TextNum","5");
     try{
       let strJson = getInspectorByKey('TextArea');
       console.info('ArkUX_Stage_TextArea_MaxLength_1000 START :' + JSON.stringify(strJson));
       let obj = JSON.parse(strJson);
       console.info('ArkUX_Stage_TextArea_MaxLength_1000 obj $attrs.maxLength :'+ JSON.stringify(obj.$attrs.maxLength));
       expect(obj.$attrs.maxLength).assertEqual("5")
       done()
     } catch (err) {
       expect().assertFail()
       console.info('ArkUX_Stage_TextArea_MaxLength_1000 err  :' + JSON.stringify(err))
       done()
     }
   })

  /**
   * @tc.number    ArkUX_Stage_TextArea_ShowCounter_0100
   * @tc.name      Set whether text displays a text counter
   * @tc.desc      Modify the assertion to set the TextArea component ShowCounter property parameter to true
   */
   it('ArkUX_Stage_TextArea_ShowCounter_0100',0, async function (done) {
     await forKey("BoolTrue","");
     try{
       let strJson = getInspectorByKey('TextArea');
       console.info('ArkUX_Stage_TextArea_ShowCounter_0100 START :' + JSON.stringify(strJson));
       let obj = JSON.parse(strJson);
       console.info('ArkUX_Stage_TextArea_ShowCounter_0100 obj $attrs.showCounter :'+ JSON.stringify(obj.$attrs.showCounter));
       expect(obj.$attrs.showCounter.value).assertEqual(true)
       done()
     } catch (err) {
       expect().assertFail()
       console.info('ArkUX_Stage_TextArea_ShowCounter_0100 err  :' + JSON.stringify(err))
       done()
     }
   })

  /**
   * @tc.number    ArkUX_Stage_TextArea_ShowCounter_0200
   * @tc.name      Set whether text displays a text counter
   * @tc.desc      Modify the assertion to set the TextArea component ShowCounter property parameter to false
   */
   it('ArkUX_Stage_TextArea_ShowCounter_0200',0, async function (done) {
     await forKey("BoolFalse","");
     try{
       let strJson = getInspectorByKey('TextArea');
       console.info('ArkUX_Stage_TextArea_ShowCounter_0200 START :' + JSON.stringify(strJson));
       let obj = JSON.parse(strJson);
       console.info('ArkUX_Stage_TextArea_ShowCounter_0200 obj $attrs.showCounter :'+ JSON.stringify(obj.$attrs.showCounter));
       expect(obj.$attrs.showCounter.value).assertEqual(false)
       done()
     } catch (err) {
       expect().assertFail()
       console.info('ArkUX_Stage_TextArea_ShowCounter_0200 err  :' + JSON.stringify(err))
       done()
     }
   })

  /**
   * @tc.number    ArkUX_Stage_TextArea_ShowCounter_0300
   * @tc.name      Set whether text displays a text counter
   * @tc.desc      Set the TextArea component ShowCounter property parameter to 1
   */
   it('ArkUX_Stage_TextArea_ShowCounter_0300',0, async function (done) {
     await forKey("BoolErrNum","1");
     try{
       let strJson = getInspectorByKey('TextArea');
       console.info('ArkUX_Stage_TextArea_ShowCounter_0300 START :' + JSON.stringify(strJson));
       let obj = JSON.parse(strJson);
       console.info('ArkUX_Stage_TextArea_ShowCounter_0300 obj $attrs.showCounter :'+ JSON.stringify(obj.$attrs.showCounter));
       expect(obj.$attrs.showCounter.value).assertEqual(false)
       done()
     } catch (err) {
       expect().assertFail()
       console.info('ArkUX_Stage_TextArea_ShowCounter_0300 err  :' + JSON.stringify(err))
       done()
     }
   })

  /**
   * @tc.number    ArkUX_Stage_TextArea_ShowCounter_0400
   * @tc.name      Set whether text displays a text counter
   * @tc.desc      Set the TextArea component ShowCounter property parameter to ''
   */
   it('ArkUX_Stage_TextArea_ShowCounter_0400',0, async function (done) {
     await forKey("BoolErrStr","");
     try{
       let strJson = getInspectorByKey('TextArea');
       console.info('ArkUX_Stage_TextArea_ShowCounter_0400 START :' + JSON.stringify(strJson));
       let obj = JSON.parse(strJson);
       console.info('ArkUX_Stage_TextArea_ShowCounter_0400 obj $attrs.showCounter :'+ JSON.stringify(obj.$attrs.showCounter));
       expect(obj.$attrs.showCounter.value).assertEqual(false)
       done()
     } catch (err) {
       expect().assertFail()
       console.info('ArkUX_Stage_TextArea_ShowCounter_0400 err  :' + JSON.stringify(err))
       done()
     }
   })

  /**
   * @tc.number    ArkUX_Stage_TextArea_ShowCounter_0500
   * @tc.name      Set whether text displays a text counter
   * @tc.desc      Set the TextArea component ShowCounter property parameter to null
   */
   it('ArkUX_Stage_TextArea_ShowCounter_0500',0, async function (done) {
     await forKey("BoolErrNull","");
     try{
       let strJson = getInspectorByKey('TextArea');
       console.info('ArkUX_Stage_TextArea_ShowCounter_0500 START :' + JSON.stringify(strJson));
       let obj = JSON.parse(strJson);
       console.info('ArkUX_Stage_TextArea_ShowCounter_0500 obj $attrs.ShowCounter :'+ JSON.stringify(obj.$attrs.showCounter));
       expect(obj.$attrs.showCounter.value).assertEqual(false)
       done()
     } catch (err) {
       expect().assertFail()
       console.info('ArkUX_Stage_TextArea_ShowCounter_0500 err  :' + JSON.stringify(err))
       done()
     }
   })

  /**
   * @tc.number    ArkUX_Stage_TextArea_ShowCounter_0600
   * @tc.name      Set whether text displays a text counter
   * @tc.desc      Set the TextArea component ShowCounter property parameter to undefined
   */
   it('ArkUX_Stage_TextArea_ShowCounter_0600',0, async function (done) {
     await forKey("BoolErrUndefined","");
     try{
       let strJson = getInspectorByKey('TextArea');
       console.info('ArkUX_Stage_TextArea_ShowCounter_0600 START :' + JSON.stringify(strJson));
       let obj = JSON.parse(strJson);
       console.info('ArkUX_Stage_TextArea_ShowCounter_0600 obj $attrs.ShowCounter :'+ JSON.stringify(obj.$attrs.showCounter));
       expect(obj.$attrs.showCounter.value).assertEqual(false)
       done()
     } catch (err) {
       expect().assertFail()
       console.info('ArkUX_Stage_TextArea_ShowCounter_0600 err  :' + JSON.stringify(err))
       done()
     }
   })

  /**
   * @tc.number    ArkUX_Stage_TextArea_ShowCounter_0700
   * @tc.name      Set whether text displays a text counter
   * @tc.desc      Set the TextArea component ShowCounter property parameter to true,
   *               and then set the parameter to false again
   */
   it('ArkUX_Stage_TextArea_ShowCounter_0700',0, async function (done) {
     await forKey("BoolTrue","");
     await forKey("BoolFalse","");
     try{
       let strJson = getInspectorByKey('TextArea');
       console.info('ArkUX_Stage_TextArea_ShowCounter_0700 START :' + JSON.stringify(strJson));
       let obj = JSON.parse(strJson);
       console.info('ArkUX_Stage_TextArea_ShowCounter_0700 obj $attrs.ShowCounter :'+ JSON.stringify(obj.$attrs.showCounter));
       expect(obj.$attrs.showCounter.value).assertEqual(false)
       done()
     } catch (err) {
       expect().assertFail()
       console.info('ArkUX_Stage_TextArea_ShowCounter_0700 err  :' + JSON.stringify(err))
       done()
     }
   })

  /**
   * @tc.number    ArkUX_Stage_TextArea_ShowCounter_0800
   * @tc.name      Set whether text displays a text counter
   * @tc.desc      Set the TextArea component ShowCounter property parameter to true,
   *               and then set the parameter to null again
   */
   it('ArkUX_Stage_TextArea_ShowCounter_0800',0, async function (done) {
     await forKey("BoolTrue","");
     await forKey("BoolErrNull","");
     try{
       let strJson = getInspectorByKey('TextArea');
       console.info('ArkUX_Stage_TextArea_ShowCounter_0800 START :' + JSON.stringify(strJson));
       let obj = JSON.parse(strJson);
       console.info('ArkUX_Stage_TextArea_ShowCounter_0800 obj $attrs.ShowCounter :'+ JSON.stringify(obj.$attrs.showCounter));
       expect(obj.$attrs.showCounter.value).assertEqual(false)
       done()
     } catch (err) {
       expect().assertFail()
       console.info('ArkUX_Stage_TextArea_ShowCounter_0800 err  :' + JSON.stringify(err))
       done()
     }
   })

  /**
   * @tc.number    ArkUX_Stage_TextArea_ShowCounter_0900
   * @tc.name      Set whether text displays a text counter
   * @tc.desc      Set the TextArea component ShowCounter property parameter to undefined,
   *               and then set the parameter to true again
   */
   it('ArkUX_Stage_TextArea_ShowCounter_0900',0, async function (done) {
     await forKey("BoolErrUndefined","");
     await forKey("BoolTrue","");
     try{
       let strJson = getInspectorByKey('TextArea');
       console.info('ArkUX_Stage_TextArea_ShowCounter_0900 START :' + JSON.stringify(strJson));
       let obj = JSON.parse(strJson);
       console.info('ArkUX_Stage_TextArea_ShowCounter_0900 obj $attrs.ShowCounter :'+ JSON.stringify(obj.$attrs.showCounter));
       expect(obj.$attrs.showCounter.value).assertEqual(true)
       done()
     } catch (err) {
       expect().assertFail()
       console.info('ArkUX_Stage_TextArea_ShowCounter_0900 err  :' + JSON.stringify(err))
       done()
     }
   })


  /**
   * @tc.number    ArkUX_Stage_TextArea_0100
   * @tc.name      TextArea component ShowCounter and maxlength default value validation
   * @tc.desc      Do not set the TextArea components ShowCounter and maxlength properties
   */
   it('ArkUX_Stage_TextArea_0100',0, async function (done) {
    try{
      let strJson = getInspectorByKey('TextAreaNo');
      console.info('ArkUX_Stage_TextArea_0100 START :' + JSON.stringify(strJson));
      let obj = JSON.parse(strJson);
      expect(obj.$attrs.showCounter.value).assertEqual(false)
       expect(obj.$attrs.maxLength).assertEqual("INF")
      done()
    } catch (err) {
      expect().assertFail()
      console.info('ArkUX_Stage_TextArea_0100 err  :' + JSON.stringify(err))
      done()
    }
  })

   /**
     * @tc.number    ArkUX_Stage_TextArea_barState_0100
     * @tc.name      Set TextArea text status
     * @tc.desc      Set the BarState property parameter of the TextArea component to BarState.Off
     */
    it('ArkUX_Stage_TextArea_barState_0100',0, function (done) {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextArea_barState_0100');
          let obj = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextArea_barState_0100 barState:" + JSON.stringify(obj.$attrs.barState))
          expect(obj.$attrs.barState).assertEqual("BarState.OFF");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_barState_0100 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number    ArkUX_Stage_TextArea_barState_0200
     * @tc.name      Set TextArea text status
     * @tc.desc      Set the BarState property parameter of the TextArea component to BarState.AUTO
     */
    it('ArkUX_Stage_TextArea_barState_0200',0, function (done) {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextArea_barState_0200');
          let obj = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextArea_barState_0200 barState:" + JSON.stringify(obj.$attrs.barState))
          expect(obj.$attrs.barState).assertEqual("BarState.AUTO");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_barState_0200 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number    ArkUX_Stage_TextArea_barState_0300
     * @tc.name      Set TextArea text status
     * @tc.desc      Set the BarState property parameter of the TextArea component to BarState.ON
     */
    it('ArkUX_Stage_TextArea_barState_0300',0, function (done) {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextArea_barState_0300');
          let obj = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextArea_barState_0300 barState:" + JSON.stringify(obj.$attrs.barState))
          expect(obj.$attrs.barState).assertEqual("BarState.ON");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_barState_0300 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number    ArkUX_Stage_TextArea_barState_0400
     * @tc.name      Set TextArea text status
     * @tc.desc      Set the BarState property parameter of the TextArea component to BarState.OFF,
     *               and then set the parameter to BarState.AUTO again
     */
    it('ArkUX_Stage_TextArea_barState_0400',0, function (done) {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextArea_barState_0400');
          let obj = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextArea_barState_0400 barState:" + JSON.stringify(obj.$attrs.barState))
          expect(obj.$attrs.barState).assertEqual("BarState.AUTO");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_barState_0400 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number    ArkUX_Stage_TextArea_barState_0500
     * @tc.name      Set TextArea text status
     * @tc.desc      Set the BarState property parameter of the TextArea component to 0
     */
    it('ArkUX_Stage_TextArea_barState_0500',0, function (done) {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextArea_barState_0500');
          let obj = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextArea_barState_0500 barState:" + JSON.stringify(obj.$attrs.barState))
          expect(obj.$attrs.barState).assertEqual("BarState.OFF");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_barState_0500 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number    ArkUX_Stage_TextArea_barState_0600
     * @tc.name      Set TextArea text status
     * @tc.desc      Set the BarState property parameter of the TextArea component to 10
     */
    it('ArkUX_Stage_TextArea_barState_0600',0, function (done) {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextArea_barState_0600');
          let obj = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextArea_barState_0600 barState:" + JSON.stringify(obj.$attrs.barState))
          expect(obj.$attrs.barState).assertEqual("BarState.AUTO");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_barState_0600 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number    ArkUX_Stage_TextArea_barState_0700
     * @tc.name      Set TextArea text status
     * @tc.desc      Set the BarState property parameter of the TextArea component to "sfasf"
     */
    it('ArkUX_Stage_TextArea_barState_0700',0, function (done) {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextArea_barState_0700');
          let obj = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextArea_barState_0700 barState:" + JSON.stringify(obj.$attrs.barState))
          expect(obj.$attrs.barState).assertEqual("BarState.AUTO");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_barState_0700 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number    ArkUX_Stage_TextArea_barState_0800
     * @tc.name      Set TextArea text status
     * @tc.desc      Set the BarState property parameter of the TextArea component to ""
     */
    it('ArkUX_Stage_TextArea_barState_0800',0, function (done) {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextArea_barState_0800');
          let obj = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextArea_barState_0800 barState:" + JSON.stringify(obj.$attrs.barState))
          expect(obj.$attrs.barState).assertEqual("BarState.AUTO");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_barState_0800 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number    ArkUX_Stage_TextArea_barState_0900
     * @tc.name      Set TextArea text status
     * @tc.desc      Set the BarState property parameter of the TextArea component to null
     */
    it('ArkUX_Stage_TextArea_barState_0900',0, function (done) {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextArea_barState_0900');
          let obj = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextArea_barState_0900 barState:" + JSON.stringify(obj.$attrs.barState))
          expect(obj.$attrs.barState).assertEqual("BarState.AUTO");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_barState_0900 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number    ArkUX_Stage_TextArea_barState_1000
     * @tc.name      Set TextArea text status
     * @tc.desc      Set the BarState property parameter of the TextArea component to undefined
     */
    it('ArkUX_Stage_TextArea_barState_1000',0, function (done) {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextArea_barState_1000');
          let obj = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextArea_barState_1000 barState:" + JSON.stringify(obj.$attrs.barState))
          expect(obj.$attrs.barState).assertEqual("BarState.AUTO");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_barState_1000 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number    ArkUX_Stage_TextArea_barState_1100
     * @tc.name      Set TextArea text status
     * @tc.desc      Set the barState property parameter of the TextArea component to Outlier undefined,
     *               and set the parameter BarState.OFF again
     */
    it('ArkUX_Stage_TextArea_barState_1100',0, function (done) {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextArea_barState_1100');
          let obj = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextArea_barState_1100 barState:" + JSON.stringify(obj.$attrs.barState))
          expect(obj.$attrs.barState).assertEqual("BarState.AUTO");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_barState_1100 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number    ArkUX_Stage_TextArea_barState_1200
     * @tc.name      Set TextArea text status
     * @tc.desc      Set the barState property parameter of the TextArea component to BarState.OFF,
     *               and set the parameter again to Outlier undefined
     */
    it('ArkUX_Stage_TextArea_barState_1200',0, function (done) {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextArea_barState_1200');
          let obj = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextArea_barState_1200 barState:" + JSON.stringify(obj.$attrs.barState))
          expect(obj.$attrs.barState).assertEqual("BarState.ON");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_barState_1200 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number    ArkUX_Stage_TextArea_barState_1300
     * @tc.name      Set TextArea text status
     * @tc.desc      Do not set the TextArea component barState property
     */
    it('ArkUX_Stage_TextArea_barState_1300',0, function (done) {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('TextAreaNO');
          let obj = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextArea_barState_1300 barState:" + JSON.stringify(obj.$attrs.barState))
          expect(obj.$attrs.barState).assertEqual("BarState.AUTO");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_barState_1300 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number    ArkUX_Stage_TextArea_barState_1400
     * @tc.name      Set TextArea text status
     * @tc.desc      Set the BarState property parameter to BarState.ON
     *               when the TextArea component is not in inline mode
     */
    it('ArkUX_Stage_TextArea_barState_1400',0, function (done) {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('TextAreaStyleDefault');
          let obj = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextArea_barState_1400 barState:" + JSON.stringify(obj.$attrs.barState))
          expect(obj.$attrs.barState).assertEqual("BarState.ON");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_barState_1400 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number    ArkUX_Stage_TextArea_Style_0100
     * @tc.name      Set TextArea text input style
     * @tc.desc      Set the TextArea text input style, set the TextArea component Style property
     *               parameter to TextContentStyle.DEFAULT
     */
    it('ArkUX_Stage_TextArea_Style_0100',0, function (done) {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextArea_Style_0100');
          let obj = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextArea_Style_0100 style:" + JSON.stringify(obj.$attrs.style))
          expect(obj.$attrs.style).assertEqual("TextContentStyle.DEFAULT");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_Style_0100 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number    ArkUX_Stage_TextArea_Style_0200
     * @tc.name      Set TextArea text input style
     * @tc.desc      Set the TextArea text input style, set the TextArea component Style property
     *               parameter to TextContentStyle.INLINE
     */
    it('ArkUX_Stage_TextArea_Style_0200',0, function (done) {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextArea_Style_0200');
          let obj = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextArea_Style_0200 style:" + JSON.stringify(obj.$attrs.style))
          expect(obj.$attrs.style).assertEqual("TextContentStyle.INLINE");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_Style_0200 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number    ArkUX_Stage_TextArea_Style_0300
     * @tc.name      Set TextArea text input style
     * @tc.desc      Set the TextArea text input style, set the TextArea component Style property
     *               parameter to 0
     */
    it('ArkUX_Stage_TextArea_Style_0300',0, function (done) {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextArea_Style_0300');
          let obj = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextArea_Style_0300 style:" + JSON.stringify(obj.$attrs.style))
          expect(obj.$attrs.style).assertEqual("TextContentStyle.DEFAULT");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_Style_0300 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number    ArkUX_Stage_TextArea_Style_0400
     * @tc.name      Set TextArea text input style
     * @tc.desc      Set the TextArea text input style, set the TextArea component Style property
     *               parameter to 10
     */
    it('ArkUX_Stage_TextArea_Style_0400',0, function (done) {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextArea_Style_0400');
          let obj = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextArea_Style_0400 style:" + JSON.stringify(obj.$attrs.style))
          expect(obj.$attrs.style).assertEqual("TextContentStyle.DEFAULT");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_Style_0400 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number    ArkUX_Stage_TextArea_Style_0500
     * @tc.name      Set TextArea text input style
     * @tc.desc      Set the TextArea text input style, set the TextArea component Style property
     *               parameter to "10"
     */
    it('ArkUX_Stage_TextArea_Style_0500',0, function (done) {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextArea_Style_0500');
          let obj = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextArea_Style_0500 style:" + JSON.stringify(obj.$attrs.style))
          expect(obj.$attrs.style).assertEqual("TextContentStyle.DEFAULT");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_Style_0500 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number    ArkUX_Stage_TextArea_Style_0600
     * @tc.name      Set TextArea text input style
     * @tc.desc      Set the TextArea text input style, set the TextArea component Style property
     *               parameter to ""
     */
    it('ArkUX_Stage_TextArea_Style_0600',0, function (done) {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextArea_Style_0600');
          let obj = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextArea_Style_0600 style:" + JSON.stringify(obj.$attrs.style))
          expect(obj.$attrs.style).assertEqual("TextContentStyle.DEFAULT");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_Style_0600 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number    ArkUX_Stage_TextArea_Style_0700
     * @tc.name      Set TextArea text input style
     * @tc.desc      Set the TextArea text input style, set the TextArea component Style property
     *               parameter to null
     */
    it('ArkUX_Stage_TextArea_Style_0700',0, function (done) {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextArea_Style_0700');
          let obj = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextArea_Style_0700 style:" + JSON.stringify(obj.$attrs.style))
          expect(obj.$attrs.style).assertEqual("TextContentStyle.DEFAULT");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_Style_0700 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number    ArkUX_Stage_TextArea_Style_0800
     * @tc.name      Set TextArea text input style
     * @tc.desc      Set the TextArea text input style, set the TextArea component Style property
     *               parameter to undefined
     */
    it('ArkUX_Stage_TextArea_Style_0800',0, function (done) {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextArea_Style_0800');
          let obj = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextArea_Style_0800 style:" + JSON.stringify(obj.$attrs.style))
          expect(obj.$attrs.style).assertEqual("TextContentStyle.DEFAULT");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_Style_0800 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number    ArkUX_Stage_TextArea_Style_0900
     * @tc.name      Set TextArea text input style
     * @tc.desc      Set the TextArea component Style property parameter to TextContentStyle. DEFAULT, and
     *               then set the parameter to TextContentStyle. INLINE again
     */
    it('ArkUX_Stage_TextArea_Style_0900',0, function (done) {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextArea_Style_0900');
          let obj = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextArea_Style_0900 style:" + JSON.stringify(obj.$attrs.style))
          expect(obj.$attrs.style).assertEqual("TextContentStyle.INLINE");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_Style_0900 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number    ArkUX_Stage_TextArea_Style_1000
     * @tc.name      Set TextArea text input style
     * @tc.desc      Set the TextArea component Style property parameter to TextContentStyle. NLINE,
     *               and then set the parameter to Outlier undefined
     */
    it('ArkUX_Stage_TextArea_Style_1000',0, function (done) {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextArea_Style_1000');
          let obj = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextArea_Style_1000 style:" + JSON.stringify(obj.$attrs.style))
          expect(obj.$attrs.style).assertEqual("TextContentStyle.INLINE");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_Style_1000 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number    ArkUX_Stage_TextArea_Style_1100
     * @tc.name      Set TextArea text input style
     * @tc.desc      Set the TextArea component Style property parameter to Outlier undefined,
     *               and set the parameter to TextContentStyle. INLINE again
     */
    it('ArkUX_Stage_TextArea_Style_1100',0, function (done) {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextArea_Style_1100');
          let obj = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextArea_Style_1100 style:" + JSON.stringify(obj.$attrs.style))
          expect(obj.$attrs.style).assertEqual("TextContentStyle.DEFAULT");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_Style_1100 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number    ArkUX_Stage_TextArea_Style_1200
     * @tc.name      Set TextArea text input style
     * @tc.desc      Do not set the TextArea component Style property
     */
    it('ArkUX_Stage_TextArea_Style_1200',0, function (done) {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('TextAreaStyleDefault');
          let obj = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextArea_Style_1200 style:" + JSON.stringify(obj.$attrs.style))
          expect(obj.$attrs.style).assertEqual("TextContentStyle.DEFAULT");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_Style_1200 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

  })
}