/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@system.router';
import Utils from './Utils';

export default function textTimer() {
  describe('textTimerJsunit', function () {
    beforeEach(async function (done) {
      console.info("textTimerJsunit beforeEach start");
      let options = {
        uri: 'MainAbility/pages/textTimer',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textTimer state pages: " + JSON.stringify(pages));
        if (!("textTimer" == pages.name)) {
          console.info("get textTimer state pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textTimer page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textTimer page error: " + err);
      }
      done();
    });

    /**
     * @tc.number textTimerJsunit_0100
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('textTimerJsunit_0100',0,async function (done){
      console.info('textTimerJsunit_0100 START');
      let strJson = getInspectorByKey('TextTimerKey1');
      let obj = JSON.parse(strJson);
      console.info("[textTimerJsunit_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.fontSize).assertEqual('20.00fp');
      expect(obj.$attrs.fontColor).assertEqual('#FFFFC0CB');
      expect(obj.$attrs.format).assertEqual('mm:ss.SS');
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Normal');
      expect(obj.$attrs.fontStyle).assertEqual('FontStyle.Italic');
      expect(obj.$attrs.fontFamily).assertEqual('cursive');
      
      console.info('textTimerJsunit_0100 END');
      done();
    });

    /**
     * @tc.number textTimerJsunit_0100
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('textTimerJsunit_0100',0,async function (done){
      console.info('textTimerJsunit_0100 START');
      let strJson = getInspectorByKey('TextTimerKey1');
      let obj = JSON.parse(strJson);
      console.info("[textTimerJsunit_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.fontSize).assertEqual('20.00fp');
      expect(obj.$attrs.fontColor).assertEqual('#FFFFC0CB');
      expect(obj.$attrs.format).assertEqual('mm:ss.SS');
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Normal');
      expect(obj.$attrs.fontStyle).assertEqual('FontStyle.Italic');
      expect(obj.$attrs.fontFamily).assertEqual('cursive');
      
      console.info('textTimerJsunit_0100 END');
      done();
    });

    /**
     * @tc.number textTimerJsunit_0100
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('textTimerJsunit_0100',0,async function (done){
      console.info('textTimerJsunit_0100 START');
      let strJson = getInspectorByKey('TextTimerKey1');
      let obj = JSON.parse(strJson);
      console.info("[textTimerJsunit_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.fontSize).assertEqual('20.00fp');
      expect(obj.$attrs.fontColor).assertEqual('#FFFFC0CB');
      expect(obj.$attrs.format).assertEqual('mm:ss.SS');
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Normal');
      expect(obj.$attrs.fontStyle).assertEqual('FontStyle.Italic');
      expect(obj.$attrs.fontFamily).assertEqual('cursive');
      
      console.info('textTimerJsunit_0100 END');
      done();
    });

    /**
     * @tc.number textTimerJsunit_0100
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('textTimerJsunit_0100',0,async function (done){
      console.info('textTimerJsunit_0100 START');
      let strJson = getInspectorByKey('TextTimerKey1');
      let obj = JSON.parse(strJson);
      console.info("[textTimerJsunit_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.fontSize).assertEqual('20.00fp');      
      console.info('textTimerJsunit_0100 END');
      done();
    });

    /**
     * @tc.number textTimerJsunit_0200
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('textTimerJsunit_0200',0,async function (done){
      console.info('textTimerJsunit_0200 START');
      let strJson = getInspectorByKey('TextTimerKey1');
      let obj = JSON.parse(strJson);
      console.info("[textTimerJsunit_0200] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.fontColor).assertEqual('#FFFFC0CB');

      console.info('textTimerJsunit_0200 END');
      done();
    });

    /**
     * @tc.number textTimerJsunit_0300
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('textTimerJsunit_0300',0,async function (done){
      console.info('textTimerJsunit_0300 START');
      let strJson = getInspectorByKey('TextTimerKey1');
      let obj = JSON.parse(strJson);
      console.info("[textTimerJsunit_0300] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.format).assertEqual('mm:ss.SS');
      
      console.info('textTimerJsunit_0300 END');
      done();
    });

    /**
     * @tc.number textTimerJsunit_0400
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('textTimerJsunit_0400',0,async function (done){
      console.info('textTimerJsunit_0400 START');
      let strJson = getInspectorByKey('TextTimerKey1');
      let obj = JSON.parse(strJson);
      console.info("[textTimerJsunit_0400] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Normal');
      
      console.info('textTimerJsunit_0400 END');
      done();
    });

    /**
     * @tc.number textTimerJsunit_0500
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('textTimerJsunit_0500',0,async function (done){
      console.info('textTimerJsunit_0500 START');
      let strJson = getInspectorByKey('TextTimerKey1');
      let obj = JSON.parse(strJson);
      console.info("[textTimerJsunit_0500] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.fontStyle).assertEqual('FontStyle.Italic');
      
      console.info('textTimerJsunit_0500 END');
      done();
    });

    /**
     * @tc.number textTimerJsunit_0600
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('textTimerJsunit_0600',0,async function (done){
      console.info('textTimerJsunit_0600 START');
      let strJson = getInspectorByKey('TextTimerKey1');
      let obj = JSON.parse(strJson);
      console.info("[textTimerJsunit_0600] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.fontFamily).assertEqual('cursive');
      
      console.info('textTimerJsunit_0600 END');
      done();
    });

  })
}
