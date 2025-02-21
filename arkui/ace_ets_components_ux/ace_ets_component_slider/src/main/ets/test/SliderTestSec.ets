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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';

function sleep(time: number) {
  return new Promise<string>((resolve, reject) => {
    setTimeout(() => {
      resolve("ok")
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

async function forKey(Key: string, text: string) {
  console.info("web afterEach start:" + Key);
  try {
    let backData: events_emitter.EventData = {
      data: {
        "value": Key,
        "content": text,
      }
    }
    let backEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    console.info("start send emitKey");
    events_emitter.emit(backEvent, backData);
  } catch (err) {
    console.info("emit emitKey  err: " + JSON.stringify(err));
  }
  sleep(2000);
}

export default function SliderTestSec() {
  describe('SliderTestSec', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "TestAbility/pages/SliderTestSec",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SliderTestSec state success " + JSON.stringify(pages));
        if (!("SliderTestSec" == pages.name)) {
          console.info("get SliderTestSec state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push SliderTestSec page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SliderTestSec page error " + JSON.stringify(err));
      }
      await sleep(2)
      done()
    });

    /**
     * @tc.number ArkUX_Stage_Slider_showTips_0100
     * @tc.name Set the Slider component showTips property with the parameter (value: true)
     * @tc.desc Verify that the Slider component only sets the showTips attribute value parameter
     *               to a bubble type and no custom text
     */
    it('ArkUX_Stage_Slider_showTips_0100', 0, async (done: Function) => {
      await sleep(1000)
      await forKey("true", "no");
      await sleep(1000)
      try {
        let strJson = getInspectorByKey('SliderNoContent');
        console.info('ArkUX_Stage_Slider_showTips_0100 START  :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_0100 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_0100 obj $attr :' + JSON.stringify(obj.$attrs));
        console.info('ArkUX_Stage_Slider_showTips_0100 obj $attrs.showTips :' + JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_0100 obj $attrs.content :' + JSON.stringify(obj.$attrs.content));
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
     * @tc.number ArkUX_Stage_Slider_showTips_0200
     * @tc.name Set the Slider component showTips property with the parameter (value:false)
     * @tc.desc Verify that the Slider component only sets the showTips attribute value parameter
     *               to a bubble free type and no custom text
     */
    it('ArkUX_Stage_Slider_showTips_0200', 0, async (done: Function) => {
      await sleep(1000)
      await forKey("false", "no");
      await sleep(1000)
      try {
        let strJson = getInspectorByKey('SliderNoContent');
        console.info('ArkUX_Stage_Slider_showTips_0200 START  :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_0200 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_0200 obj $attr :' + JSON.stringify(obj.$attrs));
        console.info('ArkUX_Stage_Slider_showTips_0200 obj $attrs.showTips :' + JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_0200 obj $attrs.content :' + JSON.stringify(obj.$attrs.content));
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
     * @tc.number ArkUX_Stage_Slider_showTips_0300
     * @tc.name Set the Slider component showTips attribute with parameters (value: false, content: "test").
     * @tc.desc Verify that the Slider component sets the showTips attribute value parameter to a bubble free
     *               type, and also sets the custom text 'test'. The custom text setting is successful
     */
    it('ArkUX_Stage_Slider_showTips_0300', 0, async (done: Function) => {
      await forKey("falseStr", "test");
      await sleep(1000)
      try {
        let strJson = getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_0300 START  :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_0300 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_0300 obj $attrs.showTips :' + JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_0300 obj $attrs.content :' + JSON.stringify(obj.$attrs.content));
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
     * @tc.number ArkUX_Stage_Slider_showTips_0400
     * @tc.name Set the showTips property of Slider to (value:false, content:"ab$12@").
     * @tc.desc Verify that the Slider component has set the showTips attribute value parameter to a bubble free
     *               type, and set the custom text 'ab $12 @'. The custom text setting was successful
     */
    it('ArkUX_Stage_Slider_showTips_0400', 0, async (done: Function) => {
      await sleep(1000)
      await forKey("falseStr", "ab$12@");
      await sleep(1000)
      try {
        let strJson = getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_0400 START  :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_0400 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_0400 obj $attrs.showTips :' + JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_0400 obj $attrs.content :' + JSON.stringify(obj.$attrs.content));
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
     * @tc.number ArkUX_Stage_Slider_showTips_0500
     * @tc.name Set the showTips property of the Slider component to (value:false, content:Resources).
     * @tc.desc Verify that the Slider component has set the showTips attribute value parameter to a bubble free
     *               type, and set the resource reference type. The custom text has been successfully set
     */
    it('ArkUX_Stage_Slider_showTips_0500', 0, async (done: Function) => {
      await forKey("false", "ResourceTest");
      await sleep(1000)
      try {
        let strJson = getInspectorByKey('SliderResourceTest');
        console.info('ArkUX_Stage_Slider_showTips_0500 START  :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_0500 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_0500 obj $attrs.showTips :' + JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_0500 obj $attrs.content :' + JSON.stringify(obj.$attrs.content));
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
     * @tc.number ArkUX_Stage_Slider_showTips_0600
     * @tc.name Set the showTips property of the Slider to (value:false, content:"").
     * @tc.desc Verify that the Slider component showTips property parameter value is set to a bubble free type,
     *               while also setting the text to ''
     */
    it('ArkUX_Stage_Slider_showTips_0600', 0, async (done: Function) => {
      await sleep(1000)
      await forKey("falseStr", "");
      await sleep(1000)
      try {
        let strJson = getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_0600 START  :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_0600 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_0600 obj $attrs.showTips :' + JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_0600 obj $attrs.content :' + JSON.stringify(obj.$attrs.content));
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
     * @tc.number ArkUX_Stage_Slider_showTips_0700
     * @tc.name Set the showTips property of the Slider to (value:true,content:"test").
     * @tc.desc Verify that the Slider component showTips property parameter value is set to true with bubble
     *               type, and the text is custom text
     */
    it('ArkUX_Stage_Slider_showTips_0700', 0, async (done: Function) => {
      await sleep(1000)
      await forKey("trueStr", "test");
      await sleep(1000)
      try {
        let strJson = getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_0700 START  :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_0700 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_0700 obj $attrs.showTips :' + JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_0700 obj $attrs.content :' + JSON.stringify(obj.$attrs.content));
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
     * @tc.number ArkUX_Stage_Slider_showTips_0800
     * @tc.name Set the showTips property of the Slider to (value:true,content:"ab$12@").
     * @tc.desc Verify that the Slider component showTips property parameter value is of bubble
     *               type, and the text is custom text with special symbols
     */
    it('ArkUX_Stage_Slider_showTips_0800', 0, async (done: Function) => {
      await sleep(1000)
      await forKey("trueStr", "ab$12@");
      await sleep(1000)
      try {
        let strJson = getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_0800 START  :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_0800 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_0800 obj $attrs.showTips :' + JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_0800 obj $attrs.content :' + JSON.stringify(obj.$attrs.content));
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
     * @tc.number ArkUX_Stage_Slider_showTips_0900
     * @tc.name Set the showTips property of the Slider component (value:true,content:resources)
     * @tc.desc Verify that the Slider component showTips attribute parameter value is of bubble
     *               type and content is of reference type $r ("app. string. sliderTest")
     */
    it('ArkUX_Stage_Slider_showTips_0900', 0, async (done: Function) => {
      await forKey("true", "ResourceTest");
      await sleep(1000)
      try {
        let strJson = getInspectorByKey('SliderResourceTest');
        console.info('ArkUX_Stage_Slider_showTips_0900 START  :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_0900 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_0900 obj $attrs.showTips :' + JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_0900 obj $attrs.content :' + JSON.stringify(obj.$attrs.content));
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
     * @tc.number ArkUX_Stage_Slider_showTips_1000
     * @tc.name Set the showTips property of the Slider component (value:true,content:"")
     * @tc.desc Verify that the Slider component showTips attribute parameter value is of
     *               bubble type, and the content is' '
     */
    it('ArkUX_Stage_Slider_showTips_1000', 0, async (done: Function) => {
      await sleep(1000)
      await forKey("trueStr", "");
      await sleep(1000)
      try {
        let strJson = getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_1000 START  :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_1000 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_1000 obj $attrs.showTips :' + JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_1000 obj $attrs.content :' + JSON.stringify(obj.$attrs.content));
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
     * @tc.number ArkUX_Stage_Slider_showTips_1100
     * @tc.name Continuously set the Slider component showTips property, passing in normal values multiple times
     * @tc.desc Verify that the Slider component showTips attribute has been passed in multiple times with normal
     *               values, and the content text is the last setting
     */
    it('ArkUX_Stage_Slider_showTips_1100', 0, async (done: Function) => {
      await sleep(1000)
      await forKey("falseStr", "no");
      await forKey("trueStr", "test");
      await sleep(1000)
      try {
        let strJson = getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_1100 START  :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_1100 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_1100 obj $attrs.showTips :' + JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_1100 obj $attrs.content :' + JSON.stringify(obj.$attrs.content));
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
     * @tc.number ArkUX_Stage_Slider_showTips_1200
     * @tc.name Set the showTips property of the Slider to (value:false, content:null).
     * @tc.desc Verify that the parameter value of the Slider component showTips attribute is of bubble free type,
     *               content is of outlier, and the result is no user-defined text
     */
    it('ArkUX_Stage_Slider_showTips_1200', 0, async (done: Function) => {
      await sleep(1000)
      await forKey("false", "null");
      await sleep(1000)
      try {
        let strJson = getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_1200 START  :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_1200 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_1200 obj $attrs.showTips :' + JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_1200 obj $attrs.content :' + JSON.stringify(obj.$attrs.content));
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
     * @tc.number ArkUX_Stage_Slider_showTips_1300
     * @tc.name Set the Slider component showTips attribute parameter for (value: false, content: undefined)
     * @tc.desc Verify that the parameter value of the Slider component showTips attribute is of bubble free type,
     *               content is of outlier, and the result is no user-defined text
     */
    it('ArkUX_Stage_Slider_showTips_1300', 0, async (done: Function) => {
      await sleep(1000)
      await forKey("false", "undefined");
      await sleep(1000)
      try {
        let strJson = getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_1300 START  :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_1300 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_1300 obj $attrs.showTips :' + JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_1300 obj $attrs.content :' + JSON.stringify(obj.$attrs.content));
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
     * @tc.number ArkUX_Stage_Slider_showTips_1400
     * @tc.name Set the showTips property of the Slider to (value:false,content:1234).
     * @tc.desc Verify that the parameter value of the Slider component showTips attribute is of bubble free type,
     *               content is of outlier, and the result is no user-defined text
     */
    it('ArkUX_Stage_Slider_showTips_1400', 0, async (done: Function) => {
      await sleep(1000)
      await forKey("falseNum", "123");
      await sleep(1000)
      try {
        let strJson = getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_1400 START  :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_1400 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_1400 obj $attrs.showTips :' + JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_1400 obj $attrs.content :' + JSON.stringify(obj.$attrs.content));
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
     * @tc.number ArkUX_Stage_Slider_showTips_1500
     * @tc.name Set the showTips property of the Slider component (value:true,content:null).
     * @tc.desc Verify and set the Slider component showTips attribute parameter value as the type with bubbles,
     *               content as the outlier, and obtain the result as no user-defined text
     */
    it('ArkUX_Stage_Slider_showTips_1500', 0, async (done: Function) => {
      await sleep(1000)
      await forKey("true", "null");
      await sleep(1000)
      try {
        let strJson = getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_1500 START  :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_1500 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_1500 obj $attrs.showTips :' + JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_1500 obj $attrs.content :' + JSON.stringify(obj.$attrs.content));
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
     * @tc.number ArkUX_Stage_Slider_showTips_1600
     * @tc.name Set the Slider component showTips attributes (value: true, content: undefined)
     * @tc.desc Verify and set the Slider component showTips attribute parameter value as the type with bubbles,
     *               content as the outlier, and obtain the result as no user-defined text
     */
    it('ArkUX_Stage_Slider_showTips_1600', 0, async (done: Function) => {
      await sleep(1000)
      await forKey("true", "undefined");
      await sleep(1000)
      try {
        let strJson = getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_1600 START  :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_1600 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_1600 obj $attrs.showTips :' + JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_1600 obj $attrs.content :' + JSON.stringify(obj.$attrs.content));
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
     * @tc.number ArkUX_Stage_Slider_showTips_1700
     * @tc.name Set the showTips property of the Slider component (value:true,content:1234)
     * @tc.desc Verify and set the Slider component showTips attribute parameter value as the type with bubbles,
     *               content as the outlier, and obtain the result as no user-defined text
     */
    it('ArkUX_Stage_Slider_showTips_1700', 0, async (done: Function) => {
      await sleep(1000)
      await forKey("trueNum", "123");
      await sleep(1000)
      try {
        let strJson = getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_1700 START  :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_1700 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_1700 obj $attrs.showTips :' + JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_1700 obj $attrs.content :' + JSON.stringify(obj.$attrs.content));
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
     * @tc.number ArkUX_Stage_Slider_showTips_1800
     * @tc.name Continuously set the Slider component showTips attribute,
     *               and set the content to an invalid value the last time
     * @tc.desc Verify that the Slider component showTips property is set continuously, and the last time it is
     *               set to an invalid value, the result obtained is no custom text.
     */
    it('ArkUX_Stage_Slider_showTips_1800', 0, async (done: Function) => {
      await sleep(1000)
      await forKey("trueStr", "test");
      await sleep(1000)
      await forKey("true", "null");
      await sleep(1000)
      try {
        let strJson = getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_1800 START  :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_1800 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_1800 obj $attrs.showTips :' + JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_1800 obj $attrs.content :' + JSON.stringify(obj.$attrs.content));
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
     * @tc.number ArkUX_Stage_Slider_showTips_1900
     * @tc.name Set the showTips attribute of the Slider component continuously,
     *               and pass in the outlier and then the normal value
     * @tc.desc Verify that the Slider component showTips attribute is set continuously. After passing in the
     outlier,the normal value is passed in. The result is the last set normal value
     */
    it('ArkUX_Stage_Slider_showTips_1900', 0, async (done: Function) => {
      await sleep(1000)
      await forKey("true", "null");
      await sleep(1000)
      await forKey("trueStr", "test");
      await sleep(1000)
      try {
        let strJson = getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_1900 START  :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_1900 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_1900 obj $attrs.showTips :' + JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_1900 obj $attrs.content :' + JSON.stringify(obj.$attrs.content));
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
     * @tc.number ArkUX_Stage_Slider_showTips_2000
     * @tc.name Do not set the Slider component showTips property
     * @tc.desc Verify that the Slider component showTips property is not set and the
     *               result is no bubbles or text appearing
     */
    it('ArkUX_Stage_Slider_showTips_2000', 0, async (done: Function) => {
      try {
        let strJson = getInspectorByKey('SliderNoShowTips');
        console.info('ArkUX_Stage_Slider_showTips_2000 START  :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_2000 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_2000 obj $attrs.showTips :' + JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_2000 obj $attrs.content :' + JSON.stringify(obj.$attrs.content));
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
     * @tc.number ArkUX_Stage_Slider_showTips_2100
     * @tc.name Slider custom text display
     * @tc.desc Set the parameter to an overly long string
     */
    it('ArkUX_Stage_Slider_showTips_2100', 0, async (done: Function) => {
      await forKey("trueStr", "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
      await sleep(1000)
      try {
        let strJson = getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_2100 START  :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_2100 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_2100 obj $attrs.showTips :' + JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_2100 obj $attrs.content :' + JSON.stringify(obj.$attrs.content));
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
     * @tc.number ArkUX_Stage_Slider_showTips_2200
     * @tc.name Slider custom text display
     * @tc.desc Set the parameter to a string with line breaks
     */
    it('ArkUX_Stage_Slider_showTips_2200', 0, async (done: Function) => {
      await forKey("trueStr", "aaa\nbbb");
      await sleep(1000)
      try {
        let strJson = getInspectorByKey('Slider');
        console.info('ArkUX_Stage_Slider_showTips_2200 START  :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('ArkUX_Stage_Slider_showTips_2200 obj  :' + JSON.stringify(obj));
        console.info('ArkUX_Stage_Slider_showTips_2200 obj $attrs.showTips :' + JSON.stringify(obj.$attrs.showTips));
        console.info('ArkUX_Stage_Slider_showTips_2200 obj $attrs.content :' + JSON.stringify(obj.$attrs.content));
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