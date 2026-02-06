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

export default function textAreaJsunit3() {
  describe('appInfoTest_four_10', () => {
    beforeEach(async (done: Function) => {
      console.info("textArea beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextAreaApi11/textArea3',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textArea state pages:" + JSON.stringify(pages));
        if (!("textArea3" == pages.name)) {
          console.info("get textArea state pages.name:" + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push textArea page success");
        }
      } catch (err) {
        console.error("push textArea page error:" + JSON.stringify(err));
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textArea after each called");
    });

    /**
     * @tc.name   textAreaTest01
     * @tc.number SUB_ACE_BASIC_ETS_API_textAreaTest01
     * @tc.desc   test TextArea
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textAreaTest01', Level.LEVEL1, async (done: Function) => {
      console.info('[textAreaTest01] START');
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('textArea');
      console.info("[textAreaTest01] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$type).assertEqual('TextArea');
      expect(JSON.parse(strJson).$attrs.fontSize).assertEqual('30.00fp');
      console.info('textAreaTest01 END');
      done();
    });

    /**
     * @tc.name   textAreaTest02
     * @tc.number SUB_ACE_BASIC_ETS_API_textAreaTest02
     * @tc.desc   test TextArea
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textAreaTest02', Level.LEVEL1, async (done: Function) => {
      console.info('[textAreaTest02] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontSize": '50',
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 215,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[textAreaTest02] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[textAreaTest02] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('textArea');

      console.info("[textAreaTest02] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.fontSize).assertEqual('50.00fp');
      console.info('textAreaTest02 END');
      done();
    });

    /**
     * @tc.name   textAreaTest03
     * @tc.number SUB_ACE_BASIC_ETS_API_textAreaTest03
     * @tc.desc   test TextArea
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textAreaTest03', Level.LEVEL1, async (done: Function) => {
      console.info('[textAreaTest03] START');
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('textArea');

      console.info("[textAreaTest03] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      // 适配开发侧非法入参修改
      expect(JSON.parse(strJson).$attrs.fontColor).assertEqual('#FF182432');
      console.info('textAreaTest03 END');
      done();
    });

    /**
     * @tc.name   textAreaTest04
     * @tc.number SUB_ACE_BASIC_ETS_API_textAreaTest04
     * @tc.desc   test TextArea
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textAreaTest04', Level.LEVEL1, async (done: Function) => {
      console.info('[textAreaTest04] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontColor": '#FFFF0000',
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 216,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[textAreaTest04] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[textAreaTest04] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('textArea');

      console.info("[textAreaTest04] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.fontColor).assertEqual('#FFFF0000');
      console.info('textAreaTest04 END');
      done();
    });

    /**
     * @tc.name   textAreaTest05
     * @tc.number SUB_ACE_BASIC_ETS_API_textAreaTest05
     * @tc.desc   test TextArea
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textAreaTest05', Level.LEVEL1, async (done: Function) => {
      console.info('[testArea05] START');
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('textArea');

      console.info("[textAreaTest05] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.textAlign).assertEqual('TextAlign.Center');
      console.info('textAreaTest05 END');
      done();
    });

    /**
     * @tc.name   textAreaTest06
     * @tc.number SUB_ACE_BASIC_ETS_API_textAreaTest06
     * @tc.desc   test TextArea
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textAreaTest06', Level.LEVEL1, async (done: Function) => {
      console.info('[textAreaTest06] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textAlign": 'TextAlign.Start',
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 217,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[textAreaTest06] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[textAreaTest06] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('textArea');

      console.info("[textAreaTest06] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.textAlign).assertEqual('TextAlign.Start');
      console.info('textAreaTest06 END');
      done();
    });

    /**
     * @tc.name   textAreaTest07
     * @tc.number SUB_ACE_BASIC_ETS_API_textAreaTest07
     * @tc.desc   test TextArea
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textAreaTest07', Level.LEVEL1, async (done: Function) => {
      console.info('[textAreaTest07] START');
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('textArea');

      console.info("[textAreaTest07] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .constructor));
      expect(JSON.parse(strJson).$attrs.constructor.text).assertEqual(undefined);
      console.info('textAreaTest07 END');
      done();
    });

    /**
     * @tc.name   textAreaTest08
     * @tc.number SUB_ACE_BASIC_ETS_API_textAreaTest08
     * @tc.desc   test TextArea
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textAreaTest08', Level.LEVEL1, async (done: Function) => {
      console.info('[textAreaTest08] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "text": 'TextArea_1',
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 218,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[textAreaTest08] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[textAreaTest08] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('textArea');

      console.info("[textAreaTest08] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .constructor));
      expect(JSON.parse(strJson).$attrs.constructor.text).assertEqual(undefined);
      console.info('textAreaTest08 END');
      done();
    });

    /**
     * @tc.name   textAreaTest09
     * @tc.number SUB_ACE_BASIC_ETS_API_textAreaTest09
     * @tc.desc   test TextArea
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textAreaTest09', Level.LEVEL1, async (done: Function) => {
      console.info('[textAreaTest09] START');
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('textArea');

      console.info("[textAreaTest09] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.textAlign).assertEqual('TextAlign.Start');
      console.info('textAreaTest09 END');
      done();
    });

    /**
     * @tc.name   textAreaTest10
     * @tc.number SUB_ACE_BASIC_ETS_API_textAreaTest10
     * @tc.desc   test TextArea
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textAreaTest10', Level.LEVEL1, async (done: Function) => {
      console.info('[textAreaTest10] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textAlign": TextAlign.Start,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 218,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[textAreaTest10] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[textAreaTest10] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('textArea');

      console.info("[textAreaTest10] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.textAlign).assertEqual('TextAlign.Start');
      console.info('textAreaTest10 END');
      done();
    });

    /**
     * @tc.name   textAreaTest11
     * @tc.number SUB_ACE_BASIC_ETS_API_textAreaTest11
     * @tc.desc   expect caretOffset index 0 when text is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textAreaTest11', Level.LEVEL1, async (done: Function) => {
      console.info('[textAreaTest11] START');
      await CommonFunc.sleep(1000);
      let driver = UiDriver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(BY.key('caretOffsetBtn1'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let caretText = await driver.findComponent(BY.key('caretOffsetText1'));
      let text = await caretText.getText();
      expect(text).assertEqual('Index0');
      done();
    });

    /**
     * @tc.name   textAreaTest12
     * @tc.number SUB_ACE_BASIC_ETS_API_textAreaTest12
     * @tc.desc   expect caretOffset index equal text length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textAreaTest12', Level.LEVEL1, async (done: Function) => {
      console.info('[textAreaTest12] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "text2": '123456789'
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 218,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[textAreaTest12] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[textAreaTest12] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let driver = UiDriver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(BY.key('caretOffsetBtn1'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let caretText = await driver.findComponent(BY.key('caretOffsetText1'));
      let text = await caretText.getText();
      expect(text).assertEqual('Index9');
      done();
    });

    /**
     * @tc.name   textAreaTest13
     * @tc.number SUB_ACE_BASIC_ETS_API_textAreaTest13
     * @tc.desc   expect caretOffset index equal maxLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textAreaTest13', Level.LEVEL1, async (done: Function) => {
      console.info('[textAreaTest13] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "text2": '1234567890abc'
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 218,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[textAreaTest13] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[textAreaTest13] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let driver = UiDriver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(BY.key('caretOffsetBtn1'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let caretText = await driver.findComponent(BY.key('caretOffsetText1'));
      let text = await caretText.getText();
      expect(text).assertEqual('Index10');
      done();
    });
  })
}
