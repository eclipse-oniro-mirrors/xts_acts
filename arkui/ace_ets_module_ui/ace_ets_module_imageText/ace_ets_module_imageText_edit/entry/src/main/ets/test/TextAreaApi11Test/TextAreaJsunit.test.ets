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


export default function textAreaJsunit() {

  describe('textAreaTest', () => {

    /**
     * run before testcase
     */
    beforeEach(async (done: Function) => {
      console.info('[textAreaTest] before each called')
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextAreaApi11/TextArea',
      };
      try {
        let result = await router.pushUrl(options);
        console.info("push TextArea page success " + JSON.stringify(result));
      } catch (err) {
        console.info("push TextArea page error " + JSON.stringify(err));
      }
      await sleep(2);
      done();
    });

    /**
     * run after testcase
     */
    afterEach(async () => {
      console.info('[textAreaTest] after each called')
      router.clear();
      await sleep(1)
    });

    /**
     * @tc.name   testTextArea010
     * @tc.number SUB_ACE_BASIC_ETS_API_1410
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextArea010', Level.LEVEL1, async (done: Function) => {
      console.info('testTextArea010 START');
      let strJson = getInspectorByKey('textArea1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textArea1] get inspector value is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('TextArea')
      expect(obj.$attrs.placeholderColor).assertEqual('#FFC0C0C0')
      expect(obj.$attrs.textAlign).assertEqual('TextAlign.Start')
      expect(obj.$attrs.caretColor).assertEqual('#FF000000')
      expect(obj.$attrs.fontSize).assertEqual('40.00fp')
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Bold')
      expect(obj.$attrs.fontColor).assertEqual('#FFFF0000')
      expect(obj.$attrs.fontFamily).assertEqual('cursive')
      expect(obj.$attrs.fontStyle).assertEqual('FontStyle.Italic')
      console.info('testTextArea010 End');
      done();
    });

    /**
     * @tc.name   testTextArea020
     * @tc.number SUB_ACE_BASIC_ETS_API_1420
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextArea020', Level.LEVEL1, async (done: Function) => {
      console.info('testTextArea020 START');
      let strJson = getInspectorByKey('textArea2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textArea2] get inspector value is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('TextArea')
      expect(obj.$attrs.textAlign).assertEqual('TextAlign.Center')
      console.info('testTextArea020 End');
      done();
    });

    /**
     * @tc.name   testTextArea030
     * @tc.number SUB_ACE_BASIC_ETS_API_1430
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextArea030', Level.LEVEL1, async (done: Function) => {
      console.info('testTextArea030 START');
      let strJson = getInspectorByKey('textArea3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textArea3] get inspector value is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('TextArea')
      expect(obj.$attrs.textAlign).assertEqual('TextAlign.End')
      console.info('testTextArea030 End');
      done();
    });
  })
}
