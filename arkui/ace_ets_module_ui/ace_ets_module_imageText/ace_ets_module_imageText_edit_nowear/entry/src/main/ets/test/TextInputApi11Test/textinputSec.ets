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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
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

async function forKey(Key: string, text: string, icon?: ESObject) {
  try {
    let backData: events_emitter.EventData = {
      data: {
        "type": Key,
        "text": text,
        "icon": JSON.stringify(icon),
      }
    }
    let backEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    console.info("start send emitKey");
    events_emitter.emit(backEvent, backData);
    console.info("backData :====>" + JSON.stringify(backData));
  } catch (err) {
    console.info("emit emitKey  err: " + JSON.stringify(err));
  }
  await sleep(2000)
}

export default function textinputSec() {
  describe('textinputSec', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextInputApi11/TextinputSec",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextinputSec state success " + JSON.stringify(pages));
        if (!("TextinputSec" == pages.name)) {
          console.info("get TextinputSec state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push TextinputSec page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextinputSec page error " + JSON.stringify(err));
      }
      await sleep(2)
      done()
    });

    /**
     * @tc.name   ArkUX_Stage_TextInput_ShowUnderline_0100
     * @tc.number ArkUX_Stage_TextInput_ShowUnderline_0100
     * @tc.desc   Set the ShowOutline property of the Textinput component to true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_ShowUnderline_0100', Level.LEVEL1, async (done: Function) => {
      await forKey("BoolTrue", "");
      try {
        let strJson = getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0100 START :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0100 obj $attrs.showUnderline :' + JSON.stringify(obj.$attrs.showUnderline));
        expect(obj.$attrs.showUnderline).assertEqual(true)
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0100 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_ShowUnderline_0200
     * @tc.number ArkUX_Stage_TextInput_ShowUnderline_0200
     * @tc.desc   Set the ShowOutline property of the Textinput component to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_ShowUnderline_0200', Level.LEVEL1, async (done: Function) => {
      await forKey("BoolFalse", "");
      try {
        let strJson = getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0200 START :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0200 obj $attrs.showUnderline :' + JSON.stringify(obj.$attrs.showUnderline));
        expect(obj.$attrs.showUnderline).assertEqual(false)
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0200 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_ShowUnderline_0300
     * @tc.number ArkUX_Stage_TextInput_ShowUnderline_0300
     * @tc.desc   Set the ShowOutline property of the Textinput component to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_ShowUnderline_0300', Level.LEVEL1, async (done: Function) => {
      await forKey("BoolErrNull", "");
      try {
        let strJson = getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0300 START :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0300 obj $attrs.showUnderline :' + JSON.stringify(obj.$attrs.showUnderline));
        await sleep(5000)
        expect(obj.$attrs.showUnderline).assertEqual(false)
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0300 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_ShowUnderline_0400
     * @tc.number ArkUX_Stage_TextInput_ShowUnderline_0400
     * @tc.desc   Set the ShowOutline property of the Textinput component to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_ShowUnderline_0400', Level.LEVEL1, async (done: Function) => {
      await forKey("BoolErrUndefined", "");
      try {
        let strJson = getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0400 START :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0400 obj $attrs.showUnderline :' + JSON.stringify(obj.$attrs.showUnderline));
        expect(obj.$attrs.showUnderline).assertEqual(false)
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0400 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_ShowUnderline_0500
     * @tc.number ArkUX_Stage_TextInput_ShowUnderline_0500
     * @tc.desc   Set the ShowOutline property of the Textinput component to ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_ShowUnderline_0500', Level.LEVEL1, async (done: Function) => {
      await forKey("BoolErrStr", "");
      try {
        let strJson = getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0500 START :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0500 obj $attrs.showUnderline :' + JSON.stringify(obj.$attrs.showUnderline));
        expect(obj.$attrs.showUnderline).assertEqual(false)
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0500 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_ShowUnderline_0600
     * @tc.number ArkUX_Stage_TextInput_ShowUnderline_0600
     * @tc.desc   Continuously set the showOutline property of the Textinput component and all are valid values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_ShowUnderline_0600', Level.LEVEL1, async (done: Function) => {
      await forKey("BoolFalse", "");
      await forKey("BoolTrue", "");
      try {
        let strJson = getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0600 START :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0600 obj $attrs.showUnderline :' + JSON.stringify(obj.$attrs.showUnderline));
        expect(obj.$attrs.showUnderline).assertEqual(true)
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0600 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_ShowUnderline_0700
     * @tc.number ArkUX_Stage_TextInput_ShowUnderline_0700
     * @tc.desc   Continuously set the showOutline property of the Textinput component, with parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_ShowUnderline_0700', Level.LEVEL1, async (done: Function) => {
      await forKey("BoolTrue", "");
      await forKey("BoolErrStr", "");
      try {
        let strJson = getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0700 START :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0700 obj $attrs.showUnderline :' + JSON.stringify(obj.$attrs.showUnderline));
        expect(obj.$attrs.showUnderline).assertEqual(false)
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0700 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_ShowUnderline_0800
     * @tc.number ArkUX_Stage_TextInput_ShowUnderline_0800
     * @tc.desc   Continuously set the showOutline property of the Textinput component,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_ShowUnderline_0800', Level.LEVEL1, async (done: Function) => {
      await forKey("BoolErrStr", "");
      await forKey("BoolTrue", "");
      try {
        let strJson = getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0800 START :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0800 obj $attrs.showUnderline :' + JSON.stringify(obj.$attrs.showUnderline));
        expect(obj.$attrs.showUnderline).assertEqual(true)
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0800 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_ShowUnderline_0900
     * @tc.number ArkUX_Stage_TextInput_ShowUnderline_0900
     * @tc.desc   Set the ShowOutline property of the Textinput component to 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_ShowUnderline_0900', Level.LEVEL1, async (done: Function) => {
      await forKey("BoolErrNum", "1");
      await sleep(2000)
      try {
        let strJson = getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0900 START :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0900 obj $attrs.showUnderline :' + JSON.stringify(obj.$attrs.showUnderline));
        expect(obj.$attrs.showUnderline).assertEqual(false)
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0900 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_ShowError_0100
     * @tc.number ArkUX_Stage_TextInput_ShowError_0100
     * @tc.desc   Set the TextInput component ShowError property parameter to string type 'string'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_ShowError_0100', Level.LEVEL1, async (done: Function) => {
      await forKey("TextStr", "string");
      try {
        let strJson = getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowError_0100 START :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('ArkUX_Stage_TextInput_ShowError_0100 obj $attrs.showError :' + JSON.stringify(obj.$attrs.showError));
        console.info('ArkUX_Stage_TextInput_ShowError_0100 obj $attrs.showErrorText :' + JSON.stringify(obj.$attrs.showErrorText));
        console.info('ArkUX_Stage_TextInput_ShowError_0100 obj $attrs.errorText :' + JSON.stringify(obj.$attrs.errorText));
        expect(obj.$attrs.showErrorText).assertEqual(true)
        expect(obj.$attrs.errorText).assertEqual("string")
        expect(obj.$attrs.showError).assertEqual("string")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_ShowError_0100 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_ShowError_0200
     * @tc.number ArkUX_Stage_TextInput_ShowError_0200
     * @tc.desc   Set the TextInput component ShowError property parameter to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_ShowError_0200', Level.LEVEL1, async (done: Function) => {
      await forKey("TextErr", "undefined");
      try {
        let strJson = getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowError_0200 START :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('ArkUX_Stage_TextInput_ShowError_0200 obj $attrs.showError :' + JSON.stringify(obj.$attrs.showError));
        console.info('ArkUX_Stage_TextInput_ShowError_0200 obj $attrs.showErrorText :' + JSON.stringify(obj.$attrs.showErrorText));
        console.info('ArkUX_Stage_TextInput_ShowError_0200 obj $attrs.errorText :' + JSON.stringify(obj.$attrs.errorText));
        expect(obj.$attrs.showErrorText).assertEqual(false)
        expect(obj.$attrs.errorText).assertEqual("")
        expect(obj.$attrs.showError).assertEqual("undefined")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_ShowError_0200 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_ShowError_0300
     * @tc.number ArkUX_Stage_TextInput_ShowError_0300
     * @tc.desc   Set the TextInput component ShowError property parameter to number type 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_ShowError_0300', Level.LEVEL1, async (done: Function) => {
      await forKey("TextNum", "10");
      try {
        let strJson = getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowError_0300 START :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('ArkUX_Stage_TextInput_ShowError_0300 obj $attrs.showError :' + JSON.stringify(obj.$attrs.showError));
        console.info('ArkUX_Stage_TextInput_ShowError_0300 obj $attrs.showErrorText :' + JSON.stringify(obj.$attrs.showErrorText));
        console.info('ArkUX_Stage_TextInput_ShowError_0300 obj $attrs.errorText :' + JSON.stringify(obj.$attrs.errorText));
        expect(obj.$attrs.showErrorText).assertEqual(false)
        expect(obj.$attrs.errorText).assertEqual("")
        expect(obj.$attrs.showError).assertEqual("undefined")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_ShowError_0300 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_ShowError_0400
     * @tc.number ArkUX_Stage_TextInput_ShowError_0400
     * @tc.desc   Set the TextInput component ShowError property parameter to the resource reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_ShowError_0400', Level.LEVEL1, async (done: Function) => {
      try {
        let strJson = getInspectorByKey('TextInputResources');
        console.info('ArkUX_Stage_TextInput_ShowError_0400 START :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('ArkUX_Stage_TextInput_ShowError_0400 obj $attrs.showError :' + JSON.stringify(obj.$attrs.showError));
        console.info('ArkUX_Stage_TextInput_ShowError_0400 obj $attrs.showErrorText :' + JSON.stringify(obj.$attrs.showErrorText));
        console.info('ArkUX_Stage_TextInput_ShowError_0400 obj $attrs.errorText :' + JSON.stringify(obj.$attrs.errorText));
        expect(obj.$attrs.showErrorText).assertEqual(true)
        expect(obj.$attrs.errorText).assertEqual("string")
        expect(obj.$attrs.showError).assertEqual("string")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_ShowError_0400 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_ShowError_0500
     * @tc.number ArkUX_Stage_TextInput_ShowError_0500
     * @tc.desc   Set the TextInput component ShowError property parameter to ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_ShowError_0500', Level.LEVEL1, async (done: Function) => {
      await forKey("TextStr", "");
      try {
        let strJson = getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowError_0500 START :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('ArkUX_Stage_TextInput_ShowError_0500 obj $attrs.showError :' + JSON.stringify(obj.$attrs.showError));
        console.info('ArkUX_Stage_TextInput_ShowError_0500 obj $attrs.showErrorText :' + JSON.stringify(obj.$attrs.showErrorText));
        console.info('ArkUX_Stage_TextInput_ShowError_0500 obj $attrs.errorText :' + JSON.stringify(obj.$attrs.errorText));
        expect(obj.$attrs.showErrorText).assertEqual(true)
        expect(obj.$attrs.errorText).assertEqual("")
        expect(obj.$attrs.showError).assertEqual("")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_ShowError_0500 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_ShowError_0600
     * @tc.number ArkUX_Stage_TextInput_ShowError_0600
     * @tc.desc   Set the TextInput component ShowError property parameter to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_ShowError_0600', Level.LEVEL1, async (done: Function) => {
      await forKey("TextErr", "null");
      try {
        let strJson = getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowError_0600 START :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('ArkUX_Stage_TextInput_ShowError_0600 obj $attrs.showError :' + JSON.stringify(obj.$attrs.showError));
        console.info('ArkUX_Stage_TextInput_ShowError_0600 obj $attrs.showErrorText :' + JSON.stringify(obj.$attrs.showErrorText));
        console.info('ArkUX_Stage_TextInput_ShowError_0600 obj $attrs.errorText :' + JSON.stringify(obj.$attrs.errorText));
        expect(obj.$attrs.showErrorText).assertEqual(false)
        expect(obj.$attrs.errorText).assertEqual("")
        expect(obj.$attrs.showError).assertEqual("undefined")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_ShowError_0600 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_ShowError_0700
     * @tc.number ArkUX_Stage_TextInput_ShowError_0700
     * @tc.desc   Set the TextInput component ShowError property parameter to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_ShowError_0700', Level.LEVEL1, async (done: Function) => {
      await forKey("TextNum", "-1");
      try {
        let strJson = getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowError_0700 START :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('ArkUX_Stage_TextInput_ShowError_0700 obj $attrs.showError :' + JSON.stringify(obj.$attrs.showError));
        console.info('ArkUX_Stage_TextInput_ShowError_0700 obj $attrs.showErrorText :' + JSON.stringify(obj.$attrs.showErrorText));
        console.info('ArkUX_Stage_TextInput_ShowError_0700 obj $attrs.errorText :' + JSON.stringify(obj.$attrs.errorText));
        expect(obj.$attrs.showErrorText).assertEqual(false)
        expect(obj.$attrs.errorText).assertEqual("")
        expect(obj.$attrs.showError).assertEqual("undefined")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_ShowError_0700 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_ShowError_0800
     * @tc.number ArkUX_Stage_TextInput_ShowError_0800
     * @tc.desc   Set the TextInput component ShowError property parameter to "string",
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_ShowError_0800', Level.LEVEL1, async (done: Function) => {
      await forKey("TextStr", "string");
      await forKey("TextStr", "showError");
      try {
        let strJson = getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowError_0800 START :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('ArkUX_Stage_TextInput_ShowError_0800 obj $attrs.showError :' + JSON.stringify(obj.$attrs.showError));
        console.info('ArkUX_Stage_TextInput_ShowError_0800 obj $attrs.showErrorText :' + JSON.stringify(obj.$attrs.showErrorText));
        console.info('ArkUX_Stage_TextInput_ShowError_0800 obj $attrs.errorText :' + JSON.stringify(obj.$attrs.errorText));
        expect(obj.$attrs.showErrorText).assertEqual(true)
        expect(obj.$attrs.errorText).assertEqual("showError")
        expect(obj.$attrs.showError).assertEqual("showError")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_ShowError_0800 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_ShowError_0900
     * @tc.number ArkUX_Stage_TextInput_ShowError_0900
     * @tc.desc   Set the TextInput component ShowError property parameter to 'string' and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_ShowError_0900', Level.LEVEL1, async (done: Function) => {
      await forKey("TextStr", "string");
      await forKey("TextErr", "null");
      try {
        let strJson = getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowError_0900 START :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('ArkUX_Stage_TextInput_ShowError_0900 obj $attrs.showError :' + JSON.stringify(obj.$attrs.showError));
        console.info('ArkUX_Stage_TextInput_ShowError_0900 obj $attrs.showErrorText :' + JSON.stringify(obj.$attrs.showErrorText));
        console.info('ArkUX_Stage_TextInput_ShowError_0900 obj $attrs.errorText :' + JSON.stringify(obj.$attrs.errorText));
        expect(obj.$attrs.showErrorText).assertEqual(false)
        expect(obj.$attrs.errorText).assertEqual("")
        expect(obj.$attrs.showError).assertEqual("undefined")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_ShowError_0900 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_ShowError_1000
     * @tc.number ArkUX_Stage_TextInput_ShowError_1000
     * @tc.desc   Set the TextInput component ShowError property parameter to 'string' and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_ShowError_1000', Level.LEVEL1, async (done: Function) => {
      await forKey("TextErr", "null");
      await forKey("TextStr", "string");
      try {
        let strJson = getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowError_1000 START :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info('ArkUX_Stage_TextInput_ShowError_1000 obj $attrs.showError :' + JSON.stringify(obj.$attrs.showError));
        console.info('ArkUX_Stage_TextInput_ShowError_1000 obj $attrs.showErrorText :' + JSON.stringify(obj.$attrs.showErrorText));
        console.info('ArkUX_Stage_TextInput_ShowError_1000 obj $attrs.errorText :' + JSON.stringify(obj.$attrs.errorText));
        expect(obj.$attrs.showErrorText).assertEqual(true)
        expect(obj.$attrs.errorText).assertEqual("string")
        expect(obj.$attrs.showError).assertEqual("string")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_ShowError_1000 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_PasswordIcon_0100
     * @tc.number ArkUX_Stage_TextInput_PasswordIcon_0100
     * @tc.desc   Set password type, image source verification, TextInput component, PasswordIcon property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_PasswordIcon_0100', Level.LEVEL1, async (done: Function) => {
      let passwordIcon: ESObject = {
        onIconSrc: $r("app.media.ohos_app_bar_fa"),
      }
      await forKey("passWordIcon", "", passwordIcon);
      try {
        let obj: ESObject = JSON.parse(getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0100 obj $attrs.passwordIcon :' + JSON.stringify(obj.$attrs.passwordIcon));
        let Icon: ESObject = JSON.parse(obj.$attrs.passwordIcon);
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0100 obj Icon :' + JSON.stringify(Icon));
        expect((Icon.onIconSrc.indexOf($r("app.media.ohos_app_bar_fa").id.toString() + ".svg")) != -1).assertTrue();
        expect(Icon.offIconSrc).assertEqual("SYS_HIDE_PASSWORD_SVG");
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0100 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_PasswordIcon_0200
     * @tc.number ArkUX_Stage_TextInput_PasswordIcon_0200
     * @tc.desc   Set password type, image source verification, TextInput component, PasswordIcon property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_PasswordIcon_0200', Level.LEVEL1, async (done: Function) => {
      let passwordIcon: ESObject = {
        offIconSrc: $r("app.media.ohos_app_bar_back"),
      }
      await forKey("passWordIcon", "", passwordIcon);
      try {
        let obj: ESObject = JSON.parse(getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0200 obj $attrs.passwordIcon :' + JSON.stringify(obj.$attrs.passwordIcon));
        let Icon: ESObject = JSON.parse(obj.$attrs.passwordIcon);
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0200 obj Icon :' + JSON.stringify(Icon));
        expect(Icon.onIconSrc).assertEqual("SYS_SHOW_PASSWORD_SVG");
        expect((Icon.offIconSrc.indexOf($r("app.media.ohos_app_bar_back").id.toString() + ".svg")) != -1).assertTrue();
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0200 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_PasswordIcon_0300
     * @tc.number ArkUX_Stage_TextInput_PasswordIcon_0300
     * @tc.desc   Verify the obtained results of setting the PasswordIcon property parameter of the TextInput
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_PasswordIcon_0300', Level.LEVEL1, async (done: Function) => {
      let passwordIcon: ESObject = {
        onIconSrc: $r("app.media.ohos_correct"),
        offIconSrc: $r("app.media.ohos_close"),
      }
      await forKey("passWordIcon", "", passwordIcon);
      try {
        let obj: ESObject = JSON.parse(getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0300 obj $attrs.passwordIcon :' + JSON.stringify(obj.$attrs.passwordIcon));
        let Icon: ESObject = JSON.parse(obj.$attrs.passwordIcon);
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0300 obj Icon :' + JSON.stringify(Icon));
        expect((Icon.onIconSrc.indexOf($r("app.media.ohos_correct").id.toString() + ".svg")) != -1).assertTrue();
        expect((Icon.offIconSrc.indexOf($r("app.media.ohos_close").id.toString() + ".svg")) != -1).assertTrue();
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0300 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_PasswordIcon_0400
     * @tc.number ArkUX_Stage_TextInput_PasswordIcon_0400
     * @tc.desc   Validate the result of setting the PasswordIcon property parameter to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_PasswordIcon_0400', Level.LEVEL1, async (done: Function) => {
      let passwordIcon: ESObject = {
        onIconSrc: null,
        offIconSrc: null,
      }
      await forKey("passWordIcon", "", passwordIcon);
      try {
        let obj: ESObject = JSON.parse(getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0400 obj $attrs.passwordIcon :' + JSON.stringify(obj.$attrs.passwordIcon));
        let Icon: ESObject = JSON.parse(obj.$attrs.passwordIcon);
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0400 obj Icon :' + JSON.stringify(Icon));
        expect(Icon.onIconSrc).assertEqual("SYS_SHOW_PASSWORD_SVG");
        expect(Icon.offIconSrc).assertEqual("SYS_HIDE_PASSWORD_SVG");
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0400 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_PasswordIcon_0500
     * @tc.number ArkUX_Stage_TextInput_PasswordIcon_0500
     * @tc.desc   Validate the result of setting the PasswordIcon property parameter to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_PasswordIcon_0500', Level.LEVEL1, async (done: Function) => {
      let passwordIcon: ESObject = {
        onIconSrc: undefined,
        offIconSrc: undefined,
      }
      await forKey("passWordIcon", "", passwordIcon);
      try {
        let obj: ESObject = JSON.parse(getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0500 obj $attrs.passwordIcon :' + JSON.stringify(obj.$attrs.passwordIcon));
        let Icon: ESObject = JSON.parse(obj.$attrs.passwordIcon);
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0500 obj Icon :' + JSON.stringify(Icon));
        expect(Icon.onIconSrc).assertEqual("SYS_SHOW_PASSWORD_SVG");
        expect(Icon.offIconSrc).assertEqual("SYS_HIDE_PASSWORD_SVG");
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0500 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_PasswordIcon_0600
     * @tc.number ArkUX_Stage_TextInput_PasswordIcon_0600
     * @tc.desc   Validate the result of setting the PasswordIcon property parameter to ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_PasswordIcon_0600', Level.LEVEL1, async (done: Function) => {
      let passwordIcon: ESObject = {
        onIconSrc: "",
        offIconSrc: "",
      }
      await forKey("passWordIcon", "", passwordIcon);
      try {
        let obj: ESObject = JSON.parse(getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0600 obj $attrs.passwordIcon :' + JSON.stringify(obj.$attrs.passwordIcon));
        let Icon: ESObject = JSON.parse(obj.$attrs.passwordIcon);
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0600 obj Icon :' + JSON.stringify(Icon));
        expect(Icon.onIconSrc).assertEqual("SYS_SHOW_PASSWORD_SVG");
        expect(Icon.offIconSrc).assertEqual("SYS_HIDE_PASSWORD_SVG");
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0600 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_PasswordIcon_0700
     * @tc.number ArkUX_Stage_TextInput_PasswordIcon_0700
     * @tc.desc   Validate the result of setting the PasswordIcon property parameter to 123
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_PasswordIcon_0700', Level.LEVEL1, async (done: Function) => {
      let passwordIcon: ESObject = {
        onIconSrc: 123,
        offIconSrc: 123,
      }
      await forKey("passWordIcon", "", passwordIcon);
      try {
        let obj: ESObject = JSON.parse(getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0700 obj $attrs.passwordIcon :' + JSON.stringify(obj.$attrs.passwordIcon));
        let Icon: ESObject = JSON.parse(obj.$attrs.passwordIcon);
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0700 obj Icon :' + JSON.stringify(Icon));
        expect(Icon.onIconSrc).assertEqual("SYS_SHOW_PASSWORD_SVG");
        expect(Icon.offIconSrc).assertEqual("SYS_HIDE_PASSWORD_SVG");
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0700 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_PasswordIcon_0800
     * @tc.number ArkUX_Stage_TextInput_PasswordIcon_0800
     * @tc.desc   Verify and set the TextInput component PasswordIcon property parameter onIconSrc as normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_PasswordIcon_0800', Level.LEVEL1, async (done: Function) => {
      let passwordIcon: ESObject = {
        onIconSrc: $r('app.media.ohos_correct'),
        offIconSrc: null
      }
      await forKey("passWordIcon", "", passwordIcon);
      try {
        let obj: ESObject = JSON.parse(getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0800 obj $attrs.passwordIcon :' + JSON.stringify(obj.$attrs.passwordIcon));
        let Icon: ESObject = JSON.parse(obj.$attrs.passwordIcon);
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0800 obj Icon :' + JSON.stringify(Icon));
        expect((Icon.onIconSrc.indexOf($r("app.media.ohos_correct").id.toString() + ".svg")) != -1).assertTrue();
        expect(Icon.offIconSrc).assertEqual("SYS_HIDE_PASSWORD_SVG");
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0800 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_PasswordIcon_0900
     * @tc.number ArkUX_Stage_TextInput_PasswordIcon_0900
     * @tc.desc   Verify and set the TextInput component PasswordIcon property parameter onIconSrc as
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_PasswordIcon_0900', Level.LEVEL1, async (done: Function) => {
      let passwordIcon: ESObject = {
        onIconSrc: null, offIconSrc: $r('app.media.ohos_close')
      }
      await forKey("passWordIcon", "", passwordIcon);
      try {
        let obj: ESObject = JSON.parse(getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0900 obj $attrs.passwordIcon :' + JSON.stringify(obj.$attrs.passwordIcon));
        let Icon: ESObject = JSON.parse(obj.$attrs.passwordIcon);
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0900 obj Icon :' + JSON.stringify(Icon));
        expect(Icon.onIconSrc).assertEqual("SYS_SHOW_PASSWORD_SVG");
        expect((Icon.offIconSrc.indexOf($r("app.media.ohos_close").id.toString() + ".svg")) != -1).assertTrue();
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0900 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_PasswordIcon_1000
     * @tc.number ArkUX_Stage_TextInput_PasswordIcon_1000
     * @tc.desc   Verify the obtained results of continuously setting the PasswordIcon property parameter of
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_PasswordIcon_1000', Level.LEVEL1, async (done: Function) => {
      let passwordIcon: ESObject = {
        onIconSrc: $r('app.media.ohos_correct'), offIconSrc: $r('app.media.ohos_close')
      }
      await forKey("passWordIcon", "", passwordIcon);
      passwordIcon = {
        onIconSrc: $r('app.media.ohos_app_bar_fa'), offIconSrc: $r('app.media.ohos_app_bar_back')
      }
      await forKey("passWordIcon", "", passwordIcon);
      await sleep(1000)
      try {
        let obj: ESObject = JSON.parse(getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1000 obj $attrs.passwordIcon :' + JSON.stringify(obj.$attrs.passwordIcon));
        let Icon: ESObject = JSON.parse(obj.$attrs.passwordIcon);
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1000 obj Icon :' + JSON.stringify(Icon));
        expect((Icon.onIconSrc.indexOf($r("app.media.ohos_app_bar_fa").id.toString() + ".svg")) != -1).assertTrue();
        expect((Icon.offIconSrc.indexOf($r("app.media.ohos_app_bar_back").id.toString() + ".svg")) != -1).assertTrue();
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1000 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_PasswordIcon_1100
     * @tc.number ArkUX_Stage_TextInput_PasswordIcon_1100
     * @tc.desc   Verify the result of obtaining outlier after continuously setting the PasswordIcon property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_PasswordIcon_1100', Level.LEVEL1, async (done: Function) => {
      let passwordIcon: ESObject = {
        onIconSrc: $r('app.media.ohos_correct'), offIconSrc: $r('app.media.ohos_close')
      }
      await forKey("passWordIcon", "", passwordIcon);
      passwordIcon = {
        onIconSrc: null, offIconSrc: null
      }
      await forKey("passWordIcon", "", passwordIcon);
      try {
        let obj: ESObject = JSON.parse(getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1100 obj $attrs.passwordIcon :' + JSON.stringify(obj.$attrs.passwordIcon));
        let Icon: ESObject = JSON.parse(obj.$attrs.passwordIcon);
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1100 obj Icon :' + JSON.stringify(Icon));
        expect(Icon.onIconSrc).assertEqual("SYS_SHOW_PASSWORD_SVG");
        expect(Icon.offIconSrc).assertEqual("SYS_HIDE_PASSWORD_SVG");
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1100 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_PasswordIcon_1200
     * @tc.number ArkUX_Stage_TextInput_PasswordIcon_1200
     * @tc.desc   Verify that the parameter of the PasswordIcon property of the TextInput component is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_PasswordIcon_1200', Level.LEVEL1, async (done: Function) => {
      let passwordIcon: ESObject = {
        onIconSrc: null, offIconSrc: null
      }
      await forKey("passWordIcon", "", passwordIcon);
      passwordIcon = {
        onIconSrc: $r('app.media.ohos_correct'), offIconSrc: $r('app.media.ohos_close')
      }
      await forKey("passWordIcon", "", passwordIcon);
      try {
        let obj: ESObject = JSON.parse(getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1200 obj $attrs.passwordIcon :' + JSON.stringify(obj.$attrs.passwordIcon));
        let Icon: ESObject = JSON.parse(obj.$attrs.passwordIcon);
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1200 obj Icon :' + JSON.stringify(Icon));
        expect((Icon.onIconSrc.indexOf($r("app.media.ohos_correct").id.toString() + ".svg")) != -1).assertTrue();
        expect((Icon.offIconSrc.indexOf($r("app.media.ohos_close").id.toString() + ".svg")) != -1).assertTrue();
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1200 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_PasswordIcon_1300
     * @tc.number ArkUX_Stage_TextInput_PasswordIcon_1300
     * @tc.desc   Verify that the parameter onIconSrc of the PasswordIcon property of the TextInput component is set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_PasswordIcon_1300', Level.LEVEL1, async (done: Function) => {
      let passwordIcon: ESObject = {
        onIconSrc: $r('app.media.ohos_correct'), offIconSrc: null
      }
      await forKey("passWordIcon", "", passwordIcon);
      passwordIcon = {
        onIconSrc: null, offIconSrc: $r('app.media.ohos_app_bar_back')
      }
      await forKey("passWordIcon", "", passwordIcon);
      try {
        let obj: ESObject = JSON.parse(getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1300 obj $attrs.passwordIcon :' + JSON.stringify(obj.$attrs.passwordIcon));
        let Icon: ESObject = JSON.parse(obj.$attrs.passwordIcon);
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1300 obj Icon :' + JSON.stringify(Icon));
        expect(Icon.onIconSrc).assertEqual("SYS_SHOW_PASSWORD_SVG");
        expect((Icon.offIconSrc.indexOf($r("app.media.ohos_app_bar_back").id.toString() + ".svg")) != -1).assertTrue();
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1300 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_PasswordIcon_1400
     * @tc.number ArkUX_Stage_TextInput_PasswordIcon_1400
     * @tc.desc   Verify that the parameter of the PasswordIcon property of the TextInput component is set to
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_PasswordIcon_1400', Level.LEVEL1, async (done: Function) => {
      let passwordIcon: ESObject = {
        onIconSrc: $r('app.media.ohos_correct'), offIconSrc: $r('app.media.ohos_close')
      }
      await forKey("passWordIcon", "", passwordIcon);
      let passwordIconSec: ESObject = {
        onIconSrc: null
      }
      await forKey("passWordIcon", "", passwordIconSec);
      try {
        let obj: ESObject = JSON.parse(getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1400 obj $attrs.passwordIcon :' + JSON.stringify(obj.$attrs.passwordIcon));
        let Icon: ESObject = JSON.parse(obj.$attrs.passwordIcon);
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1400 obj Icon :' + JSON.stringify(Icon));
        expect(Icon.onIconSrc).assertEqual("SYS_SHOW_PASSWORD_SVG");
        expect(Icon.offIconSrc).assertEqual("SYS_HIDE_PASSWORD_SVG");
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1400 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_PasswordIcon_1500
     * @tc.number ArkUX_Stage_TextInput_PasswordIcon_1500
     * @tc.desc   Verify the result obtained by adding new properties to the TextInput component without setting it
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_PasswordIcon_1500', Level.LEVEL1, async (done: Function) => {
      try {
        let obj: ESObject = JSON.parse(getInspectorByKey('TextInputNO'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1500 obj $attrs.passwordIcon :' + JSON.stringify(obj.$attrs.passwordIcon));
        let Icon: ESObject = JSON.parse(obj.$attrs.passwordIcon);
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1500 obj Icon :' + JSON.stringify(Icon));
        expect(Icon.onIconSrc).assertEqual(983328);
        expect(Icon.offIconSrc).assertEqual(983327);
        expect(obj.$attrs.showErrorText).assertEqual(false)
        expect(obj.$attrs.errorText).assertEqual("")
        expect(obj.$attrs.showError).assertEqual("undefined")
        expect(obj.$attrs.showUnderline).assertEqual(false)
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1500 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_PasswordIcon_1600
     * @tc.number ArkUX_Stage_TextInput_PasswordIcon_1600
     * @tc.desc   Set password type, image source verification, TextInput component, PasswordIcon property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_PasswordIcon_1600', Level.LEVEL1, async (done: Function) => {
      let passwordIcon: ESObject = {
        onIconSrc: $r('app.media.icon'), offIconSrc: $r('app.media.icon')
      }
      await forKey("passWordIcon", "", passwordIcon);
      try {
        let obj: ESObject = JSON.parse(getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1600 obj $attrs.passwordIcon :' + JSON.stringify(obj.$attrs.passwordIcon));
        let Icon: ESObject = JSON.parse(obj.$attrs.passwordIcon);
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1600 obj Icon :' + JSON.stringify(Icon));
        expect((Icon.onIconSrc.indexOf($r("app.media.icon").id.toString() + ".png")) != -1).assertTrue();
        expect((Icon.offIconSrc.indexOf($r("app.media.icon").id.toString() + ".png")) != -1).assertTrue();
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1600 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_PasswordIcon_1700
     * @tc.number ArkUX_Stage_TextInput_PasswordIcon_1700
     * @tc.desc   Set password type, image source verification, TextInput component, PasswordIcon property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_PasswordIcon_1700', Level.LEVEL1, async (done: Function) => {
      let passwordIcon: ESObject = {
        onIconSrc: "../../resources/base/media/icon.png", offIconSrc: "../../resources/base/media/icon.png"
      }
      await forKey("passWordIcon", "", passwordIcon);
      try {
        let obj: ESObject = JSON.parse(getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1700 obj $attrs.passwordIcon :' + JSON.stringify(obj.$attrs.passwordIcon));
        let Icon: ESObject = JSON.parse(obj.$attrs.passwordIcon);
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1700 obj Icon :' + JSON.stringify(Icon));
        expect(Icon.onIconSrc).assertEqual("../../resources/base/media/icon.png");
        expect(Icon.offIconSrc).assertEqual("../../resources/base/media/icon.png");
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1700 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_barState_0100
     * @tc.number ArkUX_Stage_TextInput_barState_0100
     * @tc.desc   Set the BarState property parameter of the TextInput component to BarState.OFF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_barState_0100', Level.LEVEL1, (done: Function) => {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_barState_0100');
          let obj: ESObject = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextInput_barState_0100 barState:" + JSON.stringify(obj.$attrs.barState))
          expect(obj.$attrs.barState).assertEqual("BarState.OFF");
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_barState_0100 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_barState_0200
     * @tc.number ArkUX_Stage_TextInput_barState_0200
     * @tc.desc   Set the BarState property parameter of the TextInput component to BarState.AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_barState_0200', Level.LEVEL1, (done: Function) => {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_barState_0200');
          let obj: ESObject = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextInput_barState_0200 barState:" + JSON.stringify(obj.$attrs.barState))
          expect(obj.$attrs.barState).assertEqual("BarState.AUTO");
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_barState_0200 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_barState_0300
     * @tc.number ArkUX_Stage_TextInput_barState_0300
     * @tc.desc   Set the BarState property parameter of the TextInput component to BarState.ON
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_barState_0300', Level.LEVEL1, (done: Function) => {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_barState_0300');
          let obj: ESObject = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextInput_barState_0300 barState:" + JSON.stringify(obj.$attrs.barState))
          expect(obj.$attrs.barState).assertEqual("BarState.ON");
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_barState_0300 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_barState_0400
     * @tc.number ArkUX_Stage_TextInput_barState_0400
     * @tc.desc   Set the BarState property parameter of the TextInput component to BarState.OFF,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_barState_0400', Level.LEVEL1, (done: Function) => {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_barState_0400');
          let obj: ESObject = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextInput_barState_0400 barState:" + JSON.stringify(obj.$attrs.barState))
          expect(obj.$attrs.barState).assertEqual("BarState.AUTO");
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_barState_0400 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_barState_0500
     * @tc.number ArkUX_Stage_TextInput_barState_0500
     * @tc.desc   Set the BarState property parameter of the TextInput component to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_barState_0500', Level.LEVEL1, (done: Function) => {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_barState_0500');
          let obj: ESObject = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextInput_barState_0500 barState:" + JSON.stringify(obj.$attrs.barState))
          expect(obj.$attrs.barState).assertEqual("BarState.OFF");
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_barState_0500 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_barState_0600
     * @tc.number ArkUX_Stage_TextInput_barState_0600
     * @tc.desc   Set the BarState property parameter of the TextInput component to 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_barState_0600', Level.LEVEL1, (done: Function) => {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_barState_0600');
          let obj: ESObject = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextInput_barState_0600 barState:" + JSON.stringify(obj.$attrs.barState))
          expect(obj.$attrs.barState).assertEqual("BarState.AUTO");
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_barState_0600 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_barState_0700
     * @tc.number ArkUX_Stage_TextInput_barState_0700
     * @tc.desc   Set the BarState property parameter of the TextInput component to "sfasf"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_barState_0700', Level.LEVEL1, (done: Function) => {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_barState_0700');
          let obj: ESObject = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextInput_barState_0700 barState:" + JSON.stringify(obj.$attrs.barState))
          expect(obj.$attrs.barState).assertEqual("BarState.AUTO");
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_barState_0700 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_barState_0800
     * @tc.number ArkUX_Stage_TextInput_barState_0800
     * @tc.desc   Set the BarState property parameter of the TextInput component to ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_barState_0800', Level.LEVEL1, (done: Function) => {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_barState_0800');
          let obj: ESObject = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextInput_barState_0800 barState:" + JSON.stringify(obj.$attrs.barState))
          expect(obj.$attrs.barState).assertEqual("BarState.AUTO");
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_barState_0800 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_barState_0900
     * @tc.number ArkUX_Stage_TextInput_barState_0900
     * @tc.desc   Set the BarState property parameter of the TextInput component to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_barState_0900', Level.LEVEL1, (done: Function) => {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_barState_0900');
          let obj: ESObject = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextInput_barState_0900 barState:" + JSON.stringify(obj.$attrs.barState))
          expect(obj.$attrs.barState).assertEqual("BarState.AUTO");
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_barState_0900 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_barState_1000
     * @tc.number ArkUX_Stage_TextInput_barState_1000
     * @tc.desc   Set the BarState property parameter of the TextInput component to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_barState_1000', Level.LEVEL1, (done: Function) => {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_barState_1000');
          let obj: ESObject = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextInput_barState_1000 barState:" + JSON.stringify(obj.$attrs.barState))
          expect(obj.$attrs.barState).assertEqual("BarState.AUTO");
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_barState_1000 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_barState_1100
     * @tc.number ArkUX_Stage_TextInput_barState_1100
     * @tc.desc   Set the barState property parameter of the TextInput component to Outlier undefined,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_barState_1100', Level.LEVEL1, (done: Function) => {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_barState_1100');
          let obj: ESObject = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextInput_barState_1100 barState:" + JSON.stringify(obj.$attrs.barState))
          expect(obj.$attrs.barState).assertEqual("BarState.AUTO");
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_barState_1100 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_barState_1200
     * @tc.number ArkUX_Stage_TextInput_barState_1200
     * @tc.desc   Set the barState property parameter of the TextInput component to BarState.OFF,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_barState_1200', Level.LEVEL1, (done: Function) => {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_barState_1200');
          let obj: ESObject = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextInput_barState_1200 barState:" + JSON.stringify(obj.$attrs.barState))
          expect(obj.$attrs.barState).assertEqual("BarState.ON");
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_barState_1200 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_barState_1300
     * @tc.number ArkUX_Stage_TextInput_barState_1300
     * @tc.desc   Do not set the TextInput component barState property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_barState_1300', Level.LEVEL1, (done: Function) => {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('TextInputInlineNO');
          let obj: ESObject = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextInput_barState_1300 barState:" + JSON.stringify(obj.$attrs.barState))
          expect(obj.$attrs.barState).assertEqual("BarState.AUTO");
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_barState_1300 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_barState_1400
     * @tc.number ArkUX_Stage_TextInput_barState_1400
     * @tc.desc   Set the BarState property parameter to BarState.ON
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_barState_1400', Level.LEVEL1, (done: Function) => {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('TextInputStyleDefault');
          let obj: ESObject = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextInput_barState_1400 barState:" + JSON.stringify(obj.$attrs.barState))
          expect(obj.$attrs.barState).assertEqual("BarState.ON");
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_barState_1400 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_maxLines_0100
     * @tc.number ArkUX_Stage_TextInput_maxLines_0100
     * @tc.desc   Set the MaxLines property parameter of the TextInput component to 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_maxLines_0100', Level.LEVEL1, (done: Function) => {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_maxLines_0100');
          let obj: ESObject = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextInput_maxLines_0100 maxLines:" + JSON.stringify(obj.$attrs.maxLines))
          expect(obj.$attrs.maxLines).assertEqual("10");
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_maxLines_0100 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_maxLines_0200
     * @tc.number ArkUX_Stage_TextInput_maxLines_0200
     * @tc.desc   Set the MaxLines property parameter of the TextInput component to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_maxLines_0200', Level.LEVEL1, (done: Function) => {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_maxLines_0200');
          let obj: ESObject = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextInput_maxLines_0200 maxLines:" + JSON.stringify(obj.$attrs.maxLines))
          expect(obj.$attrs.maxLines).assertEqual("3");
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_maxLines_0200 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_maxLines_0300
     * @tc.number ArkUX_Stage_TextInput_maxLines_0300
     * @tc.desc   Set the MaxLines property parameter of the TextInput component to "123"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_maxLines_0300', Level.LEVEL1, (done: Function) => {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_maxLines_0300');
          let obj: ESObject = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextInput_maxLines_0300 maxLines:" + JSON.stringify(obj.$attrs.maxLines))
          expect(obj.$attrs.maxLines).assertEqual("3");
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_maxLines_0300 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_maxLines_0400
     * @tc.number ArkUX_Stage_TextInput_maxLines_0400
     * @tc.desc   Set the MaxLines property parameter of the TextInput component to -5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_maxLines_0400', Level.LEVEL1, (done: Function) => {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_maxLines_0400');
          let obj: ESObject = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextInput_maxLines_0400 maxLines:" + JSON.stringify(obj.$attrs.maxLines))
          expect(obj.$attrs.maxLines).assertEqual("3");
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_maxLines_0400 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_maxLines_0500
     * @tc.number ArkUX_Stage_TextInput_maxLines_0500
     * @tc.desc   Set the MaxLines property parameter of the TextInput component to ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_maxLines_0500', Level.LEVEL1, (done: Function) => {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_maxLines_0500');
          let obj: ESObject = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextInput_maxLines_0500 maxLines:" + JSON.stringify(obj.$attrs.maxLines))
          expect(obj.$attrs.maxLines).assertEqual("3");
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_maxLines_0500 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_maxLines_0600
     * @tc.number ArkUX_Stage_TextInput_maxLines_0600
     * @tc.desc   Set the MaxLines property parameter of the TextInput component to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_maxLines_0600', Level.LEVEL1, (done: Function) => {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_maxLines_0600');
          let obj: ESObject = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextInput_maxLines_0600 maxLines:" + JSON.stringify(obj.$attrs.maxLines))
          expect(obj.$attrs.maxLines).assertEqual("3");
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_maxLines_0600 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_maxLines_0700
     * @tc.number ArkUX_Stage_TextInput_maxLines_0700
     * @tc.desc   Set the MaxLines property parameter of the TextInput component to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_maxLines_0700', Level.LEVEL1, (done: Function) => {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_maxLines_0700');
          let obj: ESObject = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextInput_maxLines_0700 maxLines:" + JSON.stringify(obj.$attrs.maxLines))
          expect(obj.$attrs.maxLines).assertEqual("3");
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_maxLines_0700 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_maxLines_0800
     * @tc.number ArkUX_Stage_TextInput_maxLines_0800
     * @tc.desc   Set the MaxLines property parameter of the TextInput component to 1,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_maxLines_0800', Level.LEVEL1, (done: Function) => {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_maxLines_0800');
          let obj: ESObject = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextInput_maxLines_0800 maxLines:" + JSON.stringify(obj.$attrs.maxLines))
          expect(obj.$attrs.maxLines).assertEqual("10");
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_maxLines_0800 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_maxLines_0900
     * @tc.number ArkUX_Stage_TextInput_maxLines_0900
     * @tc.desc   Set the maxLines attribute parameter of TextInput component to 10,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_maxLines_0900', Level.LEVEL1, (done: Function) => {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_maxLines_0900');
          let obj: ESObject = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextInput_maxLines_0900 maxLines:" + JSON.stringify(obj.$attrs.maxLines))
          expect(obj.$attrs.maxLines).assertEqual("3");
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_maxLines_0900 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_maxLines_1000
     * @tc.number ArkUX_Stage_TextInput_maxLines_1000
     * @tc.desc   Set the maxLines property parameter of TextInput component to Outlier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_maxLines_1000', Level.LEVEL1, (done: Function) => {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_maxLines_1000');
          let obj: ESObject = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextInput_maxLines_1000 maxLines:" + JSON.stringify(obj.$attrs.maxLines))
          expect(obj.$attrs.maxLines).assertEqual("10");
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_maxLines_1000 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_maxLines_1100
     * @tc.number ArkUX_Stage_TextInput_maxLines_1100
     * @tc.desc   Do not set the TextInput component maxLines property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_maxLines_1100', Level.LEVEL1, (done: Function) => {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('TextInputInlineNO');
          let obj: ESObject = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextInput_maxLines_1100 maxLines:" + JSON.stringify(obj.$attrs.maxLines))
          expect(obj.$attrs.maxLines).assertEqual("3");
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_maxLines_1100 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.name   ArkUX_Stage_TextInput_maxLines_1200
     * @tc.number ArkUX_Stage_TextInput_maxLines_1200
     * @tc.desc   Set the TextInput component maxLines property in non inline mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_TextInput_maxLines_1200', Level.LEVEL1, (done: Function) => {
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('TextInputStyleDefault');
          let obj: ESObject = JSON.parse(strJson);
          console.log("ArkUX_Stage_TextInput_maxLines_1200 maxLines:" + JSON.stringify(obj.$attrs.maxLines))
          expect(obj.$attrs.maxLines).assertEqual("1");
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_maxLines_1200 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })
  })
}
