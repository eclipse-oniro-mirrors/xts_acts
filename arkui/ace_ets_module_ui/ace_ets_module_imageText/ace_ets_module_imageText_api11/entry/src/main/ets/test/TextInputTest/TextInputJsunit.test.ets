/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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


import { afterEach, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import router from '@ohos.router';

function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      resolve();
    }, time * 1000);
  }).then(() => {
    console.info(`sleep ${time} over...`);
  })
}


export default function textInputJsunit() {

  describe('textInputTest', () => {
    /**
     * run before testcase
     */
    beforeEach(async (done: Function) => {
      console.info('[textInputTest] before each called')
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/TextInput',
      }
      try {
        let pages = router.getState()
        console.info("[textInputTest] current page is: " + JSON.stringify(pages.name));
        if (!('TextInput' == pages.name)) {
          let result = await router.pushUrl(options);
          console.info("push TextInput page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.info("push TextInput page error " + JSON.stringify(err));
      }
      await sleep(2);
      done();
    });

    /**
     * run after testcase
     */
    afterEach(async () => {
      console.info('[textInputTest] after each called');
      router.clear();
      await sleep(1)
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1440
     * @tc.name testTextInput010
     * @tc.desc aceEtsTest
     */
    it('testTextInput010', Level.LEVEL1, async (done: Function) => {
      console.info('testTextInput010 START');
      let strJson = getInspectorByKey('textInput1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textInput1] get inspector value is: " + JSON.stringify(obj));
      console.info("[textInput1] get inspector value is: " + JSON.stringify(obj.$attrs.type));
      console.info("[textInput1] get inspector value is: " + JSON.stringify(obj.$attrs.enterKeyType));
      console.info("[textInput1] get inspector value is: " + obj.$attrs.placeholderFont);
      console.info("[textInput1] get inspector value is: " + obj.$attrs.placeholderFont.size);
      console.info("[textInput1] get inspector value is: " + JSON.stringify(obj.$attrs.fontSize));
      console.info("[textInput1] get inspector value is: " + JSON.stringify(obj.$attrs.height));
      expect(obj.$type).assertEqual('TextInput');
      expect(obj.$attrs.type).assertEqual('InputType.Normal');
      expect(obj.$attrs.enterKeyType).assertEqual('EnterKeyType.Go');
      expect(obj.$attrs.caretColor).assertEqual('#FF000000');
      expect(obj.$attrs.placeholderColor).assertEqual('#FFC0C0C0');
      expect(obj.$attrs.fontColor).assertEqual('#FFFF0000');
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Bold');
      expect(obj.$attrs.fontFamily).assertEqual('cursive');
      expect(obj.$attrs.fontStyle).assertEqual('FontStyle.Italic');
      expect(obj.$attrs.fontSize).assertEqual('40.00fp');
      expect(obj.$attrs.height).assertEqual('60.00vp');
      expect(obj.$attrs.placeholderFont).assertContain('FontStyle.Normal');
      console.info('testTextInput010 End');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1450
     * @tc.name testTextInput020
     * @tc.desc aceEtsTest
     */
    it('testTextInput020', Level.LEVEL1, async (done: Function) => {
      console.info('testTextInput020 START');
      let strJson = getInspectorByKey('textInput2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textInput2] get inspector value is: " + JSON.stringify(obj));
      expect(obj.$attrs.type).assertEqual('InputType.Normal');
      expect(obj.$attrs.enterKeyType).assertEqual('EnterKeyType.Search');
      console.info('testTextInput020 End');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1460
     * @tc.name testTextInput030
     * @tc.desc aceEtsTest
     */
    it('testTextInput030', Level.LEVEL1, async (done: Function) => {
      console.info('testTextInput030 START');
      let strJson = getInspectorByKey('textInput3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textInput3] get inspector value is: " + JSON.stringify(obj));
      expect(obj.$attrs.type).assertEqual('InputType.Normal');
      expect(obj.$attrs.enterKeyType).assertEqual('EnterKeyType.Send');
      console.info('testTextInput030 End');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1470
     * @tc.name testTextInput040
     * @tc.desc aceEtsTest
     */
    it('testTextInput040', Level.LEVEL1, async (done: Function) => {
      console.info('testTextInput040 START');
      let strJson = getInspectorByKey('textInput4');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textInput4] get inspector value is: " + JSON.stringify(obj));
      expect(obj.$attrs.type).assertEqual('InputType.Normal');
      expect(obj.$attrs.enterKeyType).assertEqual('EnterKeyType.Next');
      console.info('testTextInput040 End');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1480
     * @tc.name testTextInput050
     * @tc.desc aceEtsTest
     */
    it('testTextInput050', Level.LEVEL1, async (done: Function) => {
      console.info('testTextInput050 START');
      let strJson = getInspectorByKey('textInput5');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textInput5] get inspector value is: " + JSON.stringify(obj));
      expect(obj.$attrs.type).assertEqual('InputType.Normal');
      expect(obj.$attrs.enterKeyType).assertEqual('EnterKeyType.Done');
      console.info('testTextInput050 End');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1490
     * @tc.name testTextInput060
     * @tc.desc aceEtsTest
     */
    it('testTextInput060', Level.LEVEL1, async (done: Function) => {
      console.info('testTextInput060 START');
      let strJson = getInspectorByKey('textInput6');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textInput6] get inspector value is: " + JSON.stringify(obj));
      expect(obj.$attrs.type).assertEqual('InputType.Password');
      expect(obj.$attrs.enterKeyType).assertEqual('EnterKeyType.Go');
      console.info('testTextInput060 End');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1500
     * @tc.name testTextInput070
     * @tc.desc aceEtsTest
     */
    it('testTextInput070', Level.LEVEL1, async (done: Function) => {
      console.info('testTextInput070 START');
      let strJson = getInspectorByKey('textInput7');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textInput7] get inspector value is: " + JSON.stringify(obj));
      expect(obj.$attrs.type).assertEqual('InputType.Password');
      expect(obj.$attrs.enterKeyType).assertEqual('EnterKeyType.Search');
      console.info('testTextInput070 End');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1510
     * @tc.name testTextInput080
     * @tc.desc aceEtsTest
     */
    it('testTextInput080', Level.LEVEL1, async (done: Function) => {
      console.info('testTextInput080 START');
      let strJson = getInspectorByKey('textInput8');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textInput8] get inspector value is: " + JSON.stringify(obj));
      expect(obj.$attrs.type).assertEqual('InputType.Password');
      expect(obj.$attrs.enterKeyType).assertEqual('EnterKeyType.Send');
      console.info('testTextInput080 End');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1520
     * @tc.name testTextInput090
     * @tc.desc aceEtsTest
     */
    it('testTextInput090', Level.LEVEL1, async (done: Function) => {
      console.info('testTextInput090 START');
      let strJson = getInspectorByKey('textInput9');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textInput9] get inspector value is: " + JSON.stringify(obj));
      expect(obj.$attrs.type).assertEqual('InputType.Password');
      expect(obj.$attrs.enterKeyType).assertEqual('EnterKeyType.Next');
      console.info('testTextInput090 End');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1530
     * @tc.name testTextInput100
     * @tc.desc aceEtsTest
     */
    it('testTextInput100', Level.LEVEL1, async (done: Function) => {
      console.info('testTextInput100 START');
      let strJson = getInspectorByKey('textInput10');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textInput10] get inspector value is: " + JSON.stringify(obj));
      expect(obj.$attrs.type).assertEqual('InputType.Password');
      expect(obj.$attrs.enterKeyType).assertEqual('EnterKeyType.Done');
      console.info('testTextInput100 End');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1540
     * @tc.name testTextInput110
     * @tc.desc aceEtsTest
     */
    it('testTextInput110', Level.LEVEL1, async (done: Function) => {
      console.info('testTextInput110 START');
      let strJson = getInspectorByKey('textInput11');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textInput11] get inspector value is: " + JSON.stringify(obj));
      expect(obj.$attrs.type).assertEqual('InputType.Email');
      expect(obj.$attrs.enterKeyType).assertEqual('EnterKeyType.Go');
      console.info('testTextInput110 End');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1550
     * @tc.name testTextInput120
     * @tc.desc aceEtsTest
     */
    it('testTextInput120', Level.LEVEL1, async (done: Function) => {
      console.info('testTextInput120 START');
      let strJson = getInspectorByKey('textInput12');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textInput12] get inspector value is: " + JSON.stringify(obj));
      expect(obj.$attrs.type).assertEqual('InputType.Email');
      expect(obj.$attrs.enterKeyType).assertEqual('EnterKeyType.Search');
      console.info('testTextInput120 End');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1560
     * @tc.name testTextInput130
     * @tc.desc aceEtsTest
     */
    it('testTextInput130', Level.LEVEL1, async (done: Function) => {
      console.info('testTextInput130 START');
      let strJson = getInspectorByKey('textInput13');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textInput13] get inspector value is: " + JSON.stringify(obj));
      expect(obj.$attrs.type).assertEqual('InputType.Email');
      expect(obj.$attrs.enterKeyType).assertEqual('EnterKeyType.Send');
      console.info('testTextInput130 End');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1570
     * @tc.name testTextInput140
     * @tc.desc aceEtsTest
     */
    it('testTextInput140', Level.LEVEL1, async (done: Function) => {
      console.info('testTextInput140 START');
      let strJson = getInspectorByKey('textInput14');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textInput14] get inspector value is: " + JSON.stringify(obj));
      expect(obj.$attrs.type).assertEqual('InputType.Email');
      expect(obj.$attrs.enterKeyType).assertEqual('EnterKeyType.Next');
      console.info('testTextInput140 End');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1580
     * @tc.name testTextInput150
     * @tc.desc aceEtsTest
     */
    it('testTextInput150', Level.LEVEL1, async (done: Function) => {
      console.info('testTextInput150 START');
      let strJson = getInspectorByKey('textInput15');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textInput15] get inspector value is: " + JSON.stringify(obj));
      expect(obj.$attrs.type).assertEqual('InputType.Email');
      expect(obj.$attrs.enterKeyType).assertEqual('EnterKeyType.Done');
      console.info('testTextInput150 End');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1590
     * @tc.name testTextInput160
     * @tc.desc aceEtsTest
     */
    it('testTextInput160', Level.LEVEL1, async (done: Function) => {
      console.info('testTextInput160 START');
      let strJson = getInspectorByKey('textInput16');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textInput16] get inspector value is: " + JSON.stringify(obj));
      expect(obj.$attrs.type).assertEqual('InputType.Number');
      expect(obj.$attrs.enterKeyType).assertEqual('EnterKeyType.Go');
      console.info('testTextInput160 End');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1600
     * @tc.name testTextInput170
     * @tc.desc aceEtsTest
     */
    it('testTextInput170', Level.LEVEL1, async (done: Function) => {
      console.info('testTextInput170 START');
      let strJson = getInspectorByKey('textInput17');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textInput17] get inspector value is: " + JSON.stringify(obj));
      expect(obj.$attrs.type).assertEqual('InputType.Number');
      expect(obj.$attrs.enterKeyType).assertEqual('EnterKeyType.Search');
      console.info('testTextInput170 End');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1610
     * @tc.name testTextInput180
     * @tc.desc aceEtsTest
     */
    it('testTextInput180', Level.LEVEL1, async (done: Function) => {
      console.info('testTextInput180 START');
      let strJson = getInspectorByKey('textInput18');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textInput18] get inspector value is: " + JSON.stringify(obj));
      expect(obj.$attrs.type).assertEqual('InputType.Number');
      expect(obj.$attrs.enterKeyType).assertEqual('EnterKeyType.Send');
      console.info('testTextInput180 End');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1620
     * @tc.name testTextInput190
     * @tc.desc aceEtsTest
     */
    it('testTextInput190', Level.LEVEL1, async (done: Function) => {
      console.info('testTextInput190 START');
      let strJson = getInspectorByKey('textInput19');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textInput19] get inspector value is: " + JSON.stringify(obj));
      expect(obj.$attrs.type).assertEqual('InputType.Number');
      expect(obj.$attrs.enterKeyType).assertEqual('EnterKeyType.Next');
      console.info('testTextInput190 End');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1630
     * @tc.name testTextInput190
     * @tc.desc aceEtsTest
     */
    it('testTextInput200', Level.LEVEL1, async (done: Function) => {
      console.info('testTextInput200 START');
      let strJson = getInspectorByKey('textInput20');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textInput20] get inspector value is: " + JSON.stringify(obj));
      expect(obj.$attrs.type).assertEqual('InputType.Number');
      expect(obj.$attrs.enterKeyType).assertEqual('EnterKeyType.Done');
      console.info('testTextInput200 End');
      done();
    });
  })
}
