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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import CommonFunc from "../../MainAbility/common/Common";

async function forKey(key: string, text: string) {
  console.info("web afterEach start:" + key);
  try {
    let backData: events_emitter.EventData = {
      data: {
        "value": key,
        "content": text,
      }
    }
    let backEvent: events_emitter.InnerEvent = {
      eventId:10,
      priority:events_emitter.EventPriority.LOW
    }
    console.info("start send emitKey");
    events_emitter.emit(backEvent, backData);
  } catch (err) {
    console.info("emit emitKey  err: " + JSON.stringify(err));
  }
  CommonFunc.sleep(2000);
}
export default function SliderTestSec() {
  describe('SliderTestSec', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url:  "MainAbility/pages/Slider/SliderTestSec",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SliderTestSec state success " + JSON.stringify(pages));
        if (!("SliderTestSec" == pages.name)) {
          console.info("get SliderTestSec state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push SliderTestSec page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SliderTestSec page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2)
      done()
    });

    /**
     * @tc.name   ArkUX_Stage_Slider_showTips_0100
     * @tc.number ArkUX_Stage_Slider_showTips_0100
     * @tc.desc   Verify that the Slider component only sets the showTips attribute value parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Slider_showTips_0100', Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000)
      await forKey("true","no");
      await CommonFunc.sleep(1000)
      try{
        let strJson = getInspectorByKey('SliderNoContent');
        console.info('ArkUX_Stage_Slider_showTips_0100 START  :' + JSON.stringify(strJson));
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_0100 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_0100 obj $attr :'+ JSON.stringify(obj.$attrs));
        console.info('ArkUX_Stage_Slider_showTips_0100 obj $attrs.showTips :'+ JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_0100 obj $attrs.content :'+ JSON.stringify(obj.$attrs.content));
        expect(obj.$attrs.showTips).assertEqual("true")  
        expect(obj.$attrs.content).assertEqual(undefined)
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_Slider_showTips_0100 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_showTips_0200
     * @tc.number ArkUX_Stage_Slider_showTips_0200
     * @tc.desc   Verify that the Slider component only sets the showTips attribute value parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Slider_showTips_0200', Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000)
      await forKey("false","no");
      await CommonFunc.sleep(1000)
      try{
        let strJson = getInspectorByKey('SliderNoContent');
        console.info('ArkUX_Stage_Slider_showTips_0200 START  :' + JSON.stringify(strJson));
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_0200 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_0200 obj $attr :'+ JSON.stringify(obj.$attrs));
        console.info('ArkUX_Stage_Slider_showTips_0200 obj $attrs.showTips :'+ JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_0200 obj $attrs.content :'+ JSON.stringify(obj.$attrs.content));
        expect(obj.$attrs.showTips).assertEqual("false")  
        expect(obj.$attrs.content).assertEqual(undefined)
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_Slider_showTips_0200 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_showTips_0300
     * @tc.number ArkUX_Stage_Slider_showTips_0300
     * @tc.desc   Verify that the Slider component sets the showTips attribute value parameter to a bubble free
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Slider_showTips_0300', Level.LEVEL0, async (done: Function) => {
      await forKey("falseStr","test");
      await CommonFunc.sleep(1000)
      try{
        let strJson = getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_0300 START  :' + JSON.stringify(strJson));
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_0300 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_0300 obj $attrs.showTips :'+ JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_0300 obj $attrs.content :'+ JSON.stringify(obj.$attrs.content));
        expect(obj.$attrs.showTips).assertEqual("false")  
        expect(obj.$attrs.content).assertEqual("test")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_Slider_showTips_0300 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_showTips_0400
     * @tc.number ArkUX_Stage_Slider_showTips_0400
     * @tc.desc   Verify that the Slider component has set the showTips attribute value parameter to a bubble free
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Slider_showTips_0400', Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000)
      await forKey("falseStr","ab$12@");
      await CommonFunc.sleep(1000)
      try{
        let strJson = getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_0400 START  :' + JSON.stringify(strJson));
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_0400 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_0400 obj $attrs.showTips :'+ JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_0400 obj $attrs.content :'+ JSON.stringify(obj.$attrs.content));
        expect(obj.$attrs.showTips).assertEqual("false")  
        expect(obj.$attrs.content).assertEqual("ab$12@")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_Slider_showTips_0400 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_showTips_0500
     * @tc.number ArkUX_Stage_Slider_showTips_0500
     * @tc.desc   Verify that the Slider component has set the showTips attribute value parameter to a bubble free
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Slider_showTips_0500', Level.LEVEL0, async (done: Function) => {
      await forKey("false","ResourceTest");
      await CommonFunc.sleep(1000)
      try{
        let strJson = getInspectorByKey('SliderResourceTest');
        console.info('ArkUX_Stage_Slider_showTips_0500 START  :' + JSON.stringify(strJson));
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_0500 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_0500 obj $attrs.showTips :'+ JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_0500 obj $attrs.content :'+ JSON.stringify(obj.$attrs.content));
        expect(obj.$attrs.showTips).assertEqual("false")  
        expect(obj.$attrs.content).assertEqual("ResourceTest")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_Slider_showTips_0500 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_showTips_0600
     * @tc.number ArkUX_Stage_Slider_showTips_0600
     * @tc.desc   Verify that the Slider component showTips property parameter value is set to a bubble free type,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Slider_showTips_0600', Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000)
      await forKey("falseStr","");
      await CommonFunc.sleep(1000)
      try{
        let strJson = getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_0600 START  :' + JSON.stringify(strJson));
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_0600 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_0600 obj $attrs.showTips :'+ JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_0600 obj $attrs.content :'+ JSON.stringify(obj.$attrs.content));
        expect(obj.$attrs.showTips).assertEqual("false") 
        expect(obj.$attrs.content).assertEqual("")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_Slider_showTips_0600 err  :' + JSON.stringify(err))
        done()
      }
    })

     /**
      * @tc.name   ArkUX_Stage_Slider_showTips_0700
      * @tc.number ArkUX_Stage_Slider_showTips_0700
      * @tc.desc   Verify that the Slider component showTips property parameter value is set to true with bubble
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('ArkUX_Stage_Slider_showTips_0700', Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000)
      await forKey("trueStr","test");
      await CommonFunc.sleep(1000)
      try{
        let strJson = getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_0700 START  :' + JSON.stringify(strJson));
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_0700 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_0700 obj $attrs.showTips :'+ JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_0700 obj $attrs.content :'+ JSON.stringify(obj.$attrs.content));
        expect(obj.$attrs.showTips).assertEqual("true") 
        expect(obj.$attrs.content).assertEqual("test")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_Slider_showTips_0700 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_showTips_0800
     * @tc.number ArkUX_Stage_Slider_showTips_0800
     * @tc.desc   Verify that the Slider component showTips property parameter value is of bubble
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Slider_showTips_0800', Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000)
      await forKey("trueStr","ab$12@");
      await CommonFunc.sleep(1000)
      try{
        let strJson = getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_0800 START  :' + JSON.stringify(strJson));
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_0800 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_0800 obj $attrs.showTips :'+ JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_0800 obj $attrs.content :'+ JSON.stringify(obj.$attrs.content));
        expect(obj.$attrs.showTips).assertEqual("true") 
        expect(obj.$attrs.content).assertEqual("ab$12@")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_Slider_showTips_0800 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_showTips_0900
     * @tc.number ArkUX_Stage_Slider_showTips_0900
     * @tc.desc   Verify that the Slider component showTips attribute parameter value is of bubble
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Slider_showTips_0900', Level.LEVEL0, async (done: Function) => {
      await forKey("true","ResourceTest");
      await CommonFunc.sleep(1000)
      try{
        let strJson = getInspectorByKey('SliderResourceTest');
        console.info('ArkUX_Stage_Slider_showTips_0900 START  :' + JSON.stringify(strJson));
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_0900 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_0900 obj $attrs.showTips :'+ JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_0900 obj $attrs.content :'+ JSON.stringify(obj.$attrs.content));
        expect(obj.$attrs.showTips).assertEqual("true")  
        expect(obj.$attrs.content).assertEqual("ResourceTest")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_Slider_showTips_0900 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_showTips_1000
     * @tc.number ArkUX_Stage_Slider_showTips_1000
     * @tc.desc   Verify that the Slider component showTips attribute parameter value is of
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Slider_showTips_1000', Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000)
      await forKey("trueStr","");
      await CommonFunc.sleep(1000)
      try{
        let strJson = getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_1000 START  :' + JSON.stringify(strJson));
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_1000 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_1000 obj $attrs.showTips :'+ JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_1000 obj $attrs.content :'+ JSON.stringify(obj.$attrs.content));
        expect(obj.$attrs.showTips).assertEqual("true") 
        expect(obj.$attrs.content).assertEqual("")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_Slider_showTips_1300 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_showTips_1100
     * @tc.number ArkUX_Stage_Slider_showTips_1100
     * @tc.desc   Verify that the Slider component showTips attribute has been passed in multiple times with normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Slider_showTips_1100', Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000)
      await forKey("falseStr","no");
      await forKey("trueStr","test");
      await CommonFunc.sleep(1000)
      try{
        let strJson = getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_1100 START  :' + JSON.stringify(strJson));
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_1100 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_1100 obj $attrs.showTips :'+ JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_1100 obj $attrs.content :'+ JSON.stringify(obj.$attrs.content));
        expect(obj.$attrs.showTips).assertEqual("true")
        expect(obj.$attrs.content).assertEqual("test")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_Slider_showTips_1100 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_showTips_1200
     * @tc.number ArkUX_Stage_Slider_showTips_1200
     * @tc.desc   Verify that the parameter value of the Slider component showTips attribute is of bubble free type,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Slider_showTips_1200', Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000)
      await forKey("false","null");
      await CommonFunc.sleep(1000)
      try{
        let strJson = getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_1200 START  :' + JSON.stringify(strJson));
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_1200 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_1200 obj $attrs.showTips :'+ JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_1200 obj $attrs.content :'+ JSON.stringify(obj.$attrs.content));
        expect(obj.$attrs.showTips).assertEqual("false") 
        expect(obj.$attrs.content).assertEqual(undefined)
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_Slider_showTips_1200 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_showTips_1300
     * @tc.number ArkUX_Stage_Slider_showTips_1300
     * @tc.desc   Verify that the parameter value of the Slider component showTips attribute is of bubble free type,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Slider_showTips_1300', Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000)
      await forKey("false","undefined");
      await CommonFunc.sleep(1000)
      try{
        let strJson = getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_1300 START  :' + JSON.stringify(strJson));
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_1300 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_1300 obj $attrs.showTips :'+ JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_1300 obj $attrs.content :'+ JSON.stringify(obj.$attrs.content));
        expect(obj.$attrs.showTips).assertEqual("false") 
        expect(obj.$attrs.content).assertEqual(undefined)
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_Slider_showTips_1300 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_showTips_1400
     * @tc.number ArkUX_Stage_Slider_showTips_1400
     * @tc.desc   Verify that the parameter value of the Slider component showTips attribute is of bubble free type,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Slider_showTips_1400', Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000)
      await forKey("falseNum","123");
      await CommonFunc.sleep(1000)
      try{
        let strJson = getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_1400 START  :' + JSON.stringify(strJson));
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_1400 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_1400 obj $attrs.showTips :'+ JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_1400 obj $attrs.content :'+ JSON.stringify(obj.$attrs.content));
        expect(obj.$attrs.showTips).assertEqual("false")
        expect(obj.$attrs.content).assertEqual(undefined)
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_Slider_showTips_1400 err  :' + JSON.stringify(err))
        done()
      }
    })

    

    /**
     * @tc.name   ArkUX_Stage_Slider_showTips_1500
     * @tc.number ArkUX_Stage_Slider_showTips_1500
     * @tc.desc   Verify and set the Slider component showTips attribute parameter value as the type with bubbles,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Slider_showTips_1500', Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000)
      await forKey("true","null");
      await CommonFunc.sleep(1000)
      try{
        let strJson = getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_1500 START  :' + JSON.stringify(strJson));
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_1500 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_1500 obj $attrs.showTips :'+ JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_1500 obj $attrs.content :'+ JSON.stringify(obj.$attrs.content));
        expect(obj.$attrs.showTips).assertEqual("true") 
        expect(obj.$attrs.content).assertEqual(undefined)
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_Slider_showTips_1400 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_showTips_1600
     * @tc.number ArkUX_Stage_Slider_showTips_1600
     * @tc.desc   Verify and set the Slider component showTips attribute parameter value as the type with bubbles,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Slider_showTips_1600', Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000)
      await forKey("true","undefined");
      await CommonFunc.sleep(1000)
      try{
        let strJson = getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_1600 START  :' + JSON.stringify(strJson));
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_1600 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_1600 obj $attrs.showTips :'+ JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_1600 obj $attrs.content :'+ JSON.stringify(obj.$attrs.content));
        expect(obj.$attrs.showTips).assertEqual("true") 
        expect(obj.$attrs.content).assertEqual(undefined)
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_Slider_showTips_1600 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_showTips_1700
     * @tc.number ArkUX_Stage_Slider_showTips_1700
     * @tc.desc   Verify and set the Slider component showTips attribute parameter value as the type with bubbles,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Slider_showTips_1700', Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000)
      await forKey("trueNum","123");
      await CommonFunc.sleep(1000)
      try{
        let strJson = getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_1700 START  :' + JSON.stringify(strJson));
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_1700 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_1700 obj $attrs.showTips :'+ JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_1700 obj $attrs.content :'+ JSON.stringify(obj.$attrs.content));
        expect(obj.$attrs.showTips).assertEqual("true") 
        expect(obj.$attrs.content).assertEqual(undefined)
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_Slider_showTips_1700 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_showTips_1800
     * @tc.number ArkUX_Stage_Slider_showTips_1800
     * @tc.desc   Verify that the Slider component showTips property is set continuously, and the last time it is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Slider_showTips_1800', Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000)
      await forKey("trueStr","test");
      await CommonFunc.sleep(1000)
      await forKey("true","null");
      await CommonFunc.sleep(1000)
      try{
        let strJson = getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_1800 START  :' + JSON.stringify(strJson));
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_1800 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_1800 obj $attrs.showTips :'+ JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_1800 obj $attrs.content :'+ JSON.stringify(obj.$attrs.content));
        expect(obj.$attrs.showTips).assertEqual("true")  
        expect(obj.$attrs.content).assertEqual(undefined)
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_Slider_showTips_1800 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_showTips_1900
     * @tc.number ArkUX_Stage_Slider_showTips_1900
     * @tc.desc   Verify that the Slider component showTips attribute is set continuously. After passing in the
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Slider_showTips_1900', Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000)
      await forKey("true","null");
      await CommonFunc.sleep(1000)
      await forKey("trueStr","test");
      await CommonFunc.sleep(1000)
      try{
        let strJson = getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_1900 START  :' + JSON.stringify(strJson));
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_1900 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_1900 obj $attrs.showTips :'+ JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_1900 obj $attrs.content :'+ JSON.stringify(obj.$attrs.content));
        expect(obj.$attrs.showTips).assertEqual("true")
        expect(obj.$attrs.content).assertEqual("test")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_Slider_showTips_1900 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_showTips_2000
     * @tc.number ArkUX_Stage_Slider_showTips_2000
     * @tc.desc   Verify that the Slider component showTips property is not set and the
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Slider_showTips_2000', Level.LEVEL0, async (done: Function) => {
      try{
        let strJson = getInspectorByKey('SliderNoShowTips');
        console.info('ArkUX_Stage_Slider_showTips_2000 START  :' + JSON.stringify(strJson));
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_2000 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_2000 obj $attrs.showTips :'+ JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_2000 obj $attrs.content :'+ JSON.stringify(obj.$attrs.content));
        expect(obj.$attrs.showTips).assertEqual("false")
        expect(obj.$attrs.content).assertEqual(undefined)
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_Slider_showTips_2100 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_showTips_2100
     * @tc.number ArkUX_Stage_Slider_showTips_2100
     * @tc.desc   Set the parameter to an overly long string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Slider_showTips_2100', Level.LEVEL0, async (done: Function) => {
      await forKey("trueStr","aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
      await CommonFunc.sleep(1000)
      try{
        let strJson = getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_2100 START  :' + JSON.stringify(strJson));
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_2100 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_2100 obj $attrs.showTips :'+ JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_2100 obj $attrs.content :'+ JSON.stringify(obj.$attrs.content));
        expect(obj.$attrs.showTips).assertEqual("true")
        expect(obj.$attrs.content).assertEqual("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_Slider_showTips_2100 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_Slider_showTips_2200
     * @tc.number ArkUX_Stage_Slider_showTips_2200
     * @tc.desc   Set the parameter to a string with line breaks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Slider_showTips_2200', Level.LEVEL0, async (done: Function) => {
      await forKey("trueStr","aaa\nbbb");
      await CommonFunc.sleep(1000)
      try{
        let strJson = getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_2200 START  :' + JSON.stringify(strJson));
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_2200 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_2200 obj $attrs.showTips :'+ JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_2200 obj $attrs.content :'+ JSON.stringify(obj.$attrs.content));
        expect(obj.$attrs.showTips).assertEqual("true")
        expect(obj.$attrs.content).assertEqual("aaa\nbbb")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_Slider_showTips_2200 err  :' + JSON.stringify(err))
        done()
      }
    })

  })
}