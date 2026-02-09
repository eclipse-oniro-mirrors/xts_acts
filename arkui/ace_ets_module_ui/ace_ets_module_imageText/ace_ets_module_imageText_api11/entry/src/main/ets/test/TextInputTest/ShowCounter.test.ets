/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeEach, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';


export default function showCounterTest() {
  describe('showCounterTest', () => {
    beforeEach(async (done: Function) => {
      console.info("showCounterTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/ShowCounter',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get showCounterTest state pages: " + JSON.stringify(pages));
        if (!("ShowCounter" == pages.name)) {
          console.info("get showCounterTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push showCounterTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push showCounterTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   showCounterTest_0010
     * @tc.number SUB_ACE_showCounterTest_0010
     * @tc.desc   test textInput showCounter value: true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showCounterTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('[showCounterTest_0010] START');
      let strJson = getInspectorByKey('showCounter_true');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showCounterTest_0010] showCounter is: " + JSON.stringify(obj.$attrs.showCounter));
      expect(JSON.stringify(obj.$attrs.showCounter)+'').assertContain('"value":true');
      expect(JSON.stringify(obj.$attrs.showCounter)+'').assertContain('"thresholdPercentage":40');
      expect(JSON.stringify(obj.$attrs.showCounter)+'').assertContain('"highlightBorder":true');
      console.info('[showCounterTest_0010] END');
      done();
    });

    /**
     * @tc.name   showCounterTest_0020
     * @tc.number SUB_ACE_showCounterTest_0020
     * @tc.desc   test textInput showCounter value: false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showCounterTest_0020', Level.LEVEL0, async (done: Function) => {
      console.info('[showCounterTest_0020] START');
      let strJson = getInspectorByKey('showCounter_false');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showCounterTest_0020] showCounter is: " + JSON.stringify(obj.$attrs.showCounter));
      expect(JSON.stringify(obj.$attrs.showCounter)+'').assertContain('"value":false');
      expect(JSON.stringify(obj.$attrs.showCounter)+'').assertContain('"thresholdPercentage":0');
      expect(JSON.stringify(obj.$attrs.showCounter)+'').assertContain('"highlightBorder":true');
      console.info('[showCounterTest_0020] END');
      done();
    });

    /**
     * @tc.name   showCounterTest_0030
     * @tc.number SUB_ACE_showCounterTest_0030
     * @tc.desc   test textInput showCounter value: undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showCounterTest_0030', Level.LEVEL0, async (done: Function) => {
      console.info('[showCounterTest_0030] START');
      let strJson = getInspectorByKey('showCounter_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showCounterTest_0030] showCounter is: " + JSON.stringify(obj.$attrs.showCounter));
      expect(JSON.stringify(obj.$attrs.showCounter)+'').assertContain('"value":false');
      expect(JSON.stringify(obj.$attrs.showCounter)+'').assertContain('"thresholdPercentage":-1');
      expect(JSON.stringify(obj.$attrs.showCounter)+'').assertContain('"highlightBorder":true');
      console.info('[showCounterTest_0030] END');
      done();
    });

    /**
     * @tc.name   showCounterTest_0040
     * @tc.number SUB_ACE_showCounterTest_0040
     * @tc.desc   test textInput showCounter value: default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showCounterTest_0040', Level.LEVEL0, async (done: Function) => {
      console.info('[showCounterTest_0040] START');
      let strJson = getInspectorByKey('showCounter_default');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showCounterTest_0040] showCounter is: " + JSON.stringify(obj.$attrs.showCounter));
      expect(JSON.stringify(obj.$attrs.showCounter)+'').assertContain('"value":false');
      expect(JSON.stringify(obj.$attrs.showCounter)+'').assertContain('"thresholdPercentage":-1');
      expect(JSON.stringify(obj.$attrs.showCounter)+'').assertContain('"highlightBorder":true');
      console.info('[showCounterTest_0040] END');
      done();
    });

    /**
     * @tc.name   showCounterTest_0050
     * @tc.number SUB_ACE_showCounterTest_0050
     * @tc.desc   test textInput showCounter highlightBorder: false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showCounterTest_0050', Level.LEVEL0, async (done: Function) => {
      console.info('[showCounterTest_0050] START');
      let strJson = getInspectorByKey('highlightBorder_false');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showCounterTest_0050] showCounter is: " + JSON.stringify(obj.$attrs.showCounter));
      expect(JSON.stringify(obj.$attrs.showCounter)+'').assertContain('"value":false');
      expect(JSON.stringify(obj.$attrs.showCounter)+'').assertContain('"thresholdPercentage":0');
      expect(JSON.stringify(obj.$attrs.showCounter)+'').assertContain('"highlightBorder":false');
      console.info('[showCounterTest_0050] END');
      done();
    });

    /**
     * @tc.name   showCounterTest_0060
     * @tc.number SUB_ACE_showCounterTest_0060
     * @tc.desc   test textInput showCounter highlightBorder: undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showCounterTest_0060', Level.LEVEL0, async (done: Function) => {
      console.info('[showCounterTest_0060] START');
      let strJson = getInspectorByKey('highlightBorder_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showCounterTest_0060] showCounter is: " + JSON.stringify(obj.$attrs.showCounter));
      expect(JSON.stringify(obj.$attrs.showCounter)+'').assertContain('"value":true');
      expect(JSON.stringify(obj.$attrs.showCounter)+'').assertContain('"thresholdPercentage":-1');
      expect(JSON.stringify(obj.$attrs.showCounter)+'').assertContain('"highlightBorder":true');      
      console.info('[showCounterTest_0060] END');
      done();
    });
  })
}

