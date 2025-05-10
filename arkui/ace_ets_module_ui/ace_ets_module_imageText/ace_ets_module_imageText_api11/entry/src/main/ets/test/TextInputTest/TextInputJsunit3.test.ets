/**
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
import { describe, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium";
import { UiDriver, BY } from '@ohos.UiTest';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../MainAbility/common/Common';

export default function textInputJsunit3() {
  describe('appInfoTest_four_12', () => {
    beforeEach(async (done: Function) => {
      console.info("textInput beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/textInput3',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textInput state pages:" + JSON.stringify(pages));
        if (!("textInput" == pages.name)) {
          console.info("get textInput state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push textInput page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textInput page error:" + JSON.stringify(err));
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textInput after each called");
    });

    it('textInputTest01', Level.LEVEL1, async (done: Function) => {
      console.info('[textInputTest01] START');
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('TextInput');

      console.info("[textInputTest01] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$type).assertEqual('TextArea');
      expect(JSON.parse(strJson).$attrs.fontSize).assertEqual('16.00fp');
      console.info('textInputTest01 END');
      done();
    });

    it('textInputTest02', Level.LEVEL1, async (done: Function) => {
      console.info('[textInputTest02] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontSize": '16',
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 225,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[textInputTest02] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[textInputTest02] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('TextInput');

      console.info("[textInputTest02] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.fontSize).assertEqual('16.00fp');
      done();
    });

    it('textInputTest03', Level.LEVEL1, async (done: Function) => {
      console.info('[textInputTest03] START');
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('TextInput');
      console.info("[textInputTest03] component strJson:" + strJson);

      console.info("[textInputTest03] fontColor:" + JSON.parse(strJson).$attrs.fontColor);
      expect(JSON.parse(strJson).$attrs.fontColor).assertEqual('#FF000000');
      done();
    });

    it('textInputTest04', Level.LEVEL1, async (done: Function) => {
      console.info('[textInputTest04] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontColor": Color.Red
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 225,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[textInputTest04] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[textInputTest04] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('TextInput');

      console.info("[textInputTest04] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.fontColor).assertEqual('#FFFF0000');
      done();
    });

    it('textInputTest05', Level.LEVEL1, async (done: Function) => {
      console.info('[textInputTest05] START');
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('TextInput');

      console.info("[textInputTest05] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[textInputTest05] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson).$attrs.inputType));
      expect(JSON.parse(strJson).$attrs.inputType).assertEqual(undefined);
      done();
    });

    it('textInputTest06', Level.LEVEL1, async (done: Function) => {
      console.info('[textInputTest06] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "type": 'InputType.Email',
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 225,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[textInputTest06] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[textInputTest06] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('TextInput');

      console.info("[textInputTest06] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.inputType).assertEqual(undefined);
      done();
    });

    it('textInputTest07', Level.LEVEL1, async (done: Function) => {
      console.info('[textInputTest07] START');
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('TextInput');
      console.info("[textInputTest07] component strJson:" + strJson);

      console.info("[textInputTest07] textAlign:" + JSON.parse(strJson).$attrs.textAlign);
      expect(JSON.parse(strJson).$attrs.textAlign).assertEqual('TextAlign.Start');
      done();
    });

    it('textInputTest08', Level.LEVEL1, async (done: Function) => {
      console.info('[textInputTest08] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textAlign": 'TextAlign.Start'
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 225,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[textInputTest08] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[textInputTest08] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('TextInput');

      console.info("[textInputTest08] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.textAlign).assertEqual('TextAlign.Start');
      done();
    });

    /*
     * @tc.number :textInputTest09
     * @tc.name   :test getCaretOffset when iput text is null
     * @tc.desc   :expect caretOffset index 0 when input text is null
     */
    it('textInputTest09', Level.LEVEL1, async (done: Function) => {
      console.info('[textInputTest09] START');
      await CommonFunc.sleep(1000);
      let driver = UiDriver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(BY.key('caretOffsetBtn2'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let caretText = await driver.findComponent(BY.key('caretOffsetText2'));
      let text = await caretText.getText();
      expect(text).assertEqual('Index0');
      done();
    });

    /*
     * @tc.number :textInputTest10
     * @tc.name   :test getCaretOffset when iput text length less than maxLength
     * @tc.desc   :expect caretOffset index equal input text length
     */
    it('textInputTest10', Level.LEVEL1, async (done: Function) => {
      console.info('[textInputTest10] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "text2": '123456789'
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 225,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[textInputTest10] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[textInputTest10] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let driver = UiDriver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(BY.key('caretOffsetBtn2'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let caretText = await driver.findComponent(BY.key('caretOffsetText2'));
      let text = await caretText.getText();
      expect(text).assertEqual('Index9');
      done();
    });

    /*
     * @tc.number :textInputTest10
     * @tc.name   :test getCaretOffset when iput text length exceed maxLength
     * @tc.desc   :expect caretOffset index equal maxLength
     */
    it('textInputTest11', Level.LEVEL1, async (done: Function) => {
      console.info('[textAreaTest13] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "text2": '1234567890abc'
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 225,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[textInputTest11] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[textInputTest11] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let driver = UiDriver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(BY.key('caretOffsetBtn2'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let caretText = await driver.findComponent(BY.key('caretOffsetText2'));
      let text = await caretText.getText();
      expect(text).assertEqual('Index10');
      done();
    });
  })
}
