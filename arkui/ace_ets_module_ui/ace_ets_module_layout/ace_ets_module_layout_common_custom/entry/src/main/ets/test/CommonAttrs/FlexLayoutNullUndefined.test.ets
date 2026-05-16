/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import CommonFunc from '../../MainAbility/common/Common';

export default function FlexLayoutNullUndefinedTest() {
  describe('FlexLayoutNullUndefinedTest', () => {
    beforeAll(async (done: Function) => {
      console.info("FlexLayoutNullUndefined beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonAttrs/FlexLayoutNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FlexLayoutNullUndefined state success " + JSON.stringify(pages));
        if (!("FlexLayoutNullUndefined" == pages.name)) {
          console.info("get FlexLayoutNullUndefined state success " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FlexLayoutNullUndefined page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexLayoutNullUndefined page error: " + err);
      }
      done()
    });

    /**
     * @tc.name   FlexLayoutNullUndefinedTest_0100
     * @tc.number FlexLayoutNullUndefinedTest_0100
     * @tc.desc   test flexBasis with empty string parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FlexLayoutNullUndefinedTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('FlexLayoutNullUndefinedTest_0100 START');

      let strJson = getInspectorByKey('FlexNullUndefinedTest_flexBasis_1');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[FlexLayoutNullUndefinedTest_0100] obj.$attrs.flexBasis:' + obj.$attrs.flexBasis);
      expect(obj.$attrs.flexBasis).assertEqual('0.00vp');
      console.info('FlexLayoutNullUndefinedTest_0100 END');
      done();
    });

    /**
     * @tc.name   FlexLayoutNullUndefinedTest_0200
     * @tc.number FlexLayoutNullUndefinedTest_0200
     * @tc.desc   test flexBasis with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FlexLayoutNullUndefinedTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('FlexLayoutNullUndefinedTest_0200 START');

      let strJson = getInspectorByKey('FlexNullUndefinedTest_flexBasis_2');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[FlexLayoutNullUndefinedTest_0200] obj.$attrs.flexBasis:' + obj.$attrs.flexBasis);
      expect(obj.$attrs.flexBasis).assertEqual('0.00auto');
      console.info('FlexLayoutNullUndefinedTest_0200 END');
      done();
    });

    /**
     * @tc.name   FlexLayoutNullUndefinedTest_0300
     * @tc.number FlexLayoutNullUndefinedTest_0300
     * @tc.desc   test flexBasis with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FlexLayoutNullUndefinedTest_0300', Level.LEVEL1, async (done: Function) => {
      console.info('FlexLayoutNullUndefinedTest_0300 START');

      let strJson = getInspectorByKey('FlexNullUndefinedTest_flexBasis_3');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[FlexLayoutNullUndefinedTest_0300] obj.$attrs.flexBasis:' + obj.$attrs.flexBasis);
      expect(obj.$attrs.flexBasis).assertEqual('0.00auto');
      console.info('FlexLayoutNullUndefinedTest_0300 END');
      done();
    });

    /**
     * @tc.name   FlexLayoutNullUndefinedTest_0400
     * @tc.number FlexLayoutNullUndefinedTest_0400
     * @tc.desc   test flexGrow with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FlexLayoutNullUndefinedTest_0400', Level.LEVEL1, async (done: Function) => {
      console.info('FlexLayoutNullUndefinedTest_0400 START');

      let strJson = getInspectorByKey('FlexNullUndefinedTest_flexGrow_1');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[FlexLayoutNullUndefinedTest_0400] obj.$attrs.flexGrow:' + obj.$attrs.flexGrow);
      expect(obj.$attrs.flexGrow).assertEqual(0);
      console.info('FlexLayoutNullUndefinedTest_0400 END');
      done();
    });

    /**
     * @tc.name   FlexLayoutNullUndefinedTest_0500
     * @tc.number FlexLayoutNullUndefinedTest_0500
     * @tc.desc   test flexGrow with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FlexLayoutNullUndefinedTest_0500', Level.LEVEL1, async (done: Function) => {
      console.info('FlexLayoutNullUndefinedTest_0500 START');

      let strJson = getInspectorByKey('FlexNullUndefinedTest_flexGrow_2');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[FlexLayoutNullUndefinedTest_0500] obj.$attrs.flexGrow:' + obj.$attrs.flexGrow);
      expect(obj.$attrs.flexGrow).assertEqual(0);
      console.info('FlexLayoutNullUndefinedTest_0500 END');
      done();
    });

    /**
     * @tc.name   FlexLayoutNullUndefinedTest_0600
     * @tc.number FlexLayoutNullUndefinedTest_0600
     * @tc.desc   test flexShrink with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FlexLayoutNullUndefinedTest_0600', Level.LEVEL1, async (done: Function) => {
      console.info('FlexLayoutNullUndefinedTest_0600 START');

      let strJson = getInspectorByKey('FlexNullUndefinedTest_flexShrink_1');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[FlexLayoutNullUndefinedTest_0600] obj.$attrs.flexShrink:' + obj.$attrs.flexShrink);
      expect(obj.$attrs.flexShrink).assertEqual(1);
      console.info('FlexLayoutNullUndefinedTest_0600 END');
      done();
    });

    /**
     * @tc.name   FlexLayoutNullUndefinedTest_0700
     * @tc.number FlexLayoutNullUndefinedTest_0700
     * @tc.desc   test flexShrink with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FlexLayoutNullUndefinedTest_0700', Level.LEVEL1, async (done: Function) => {
      console.info('FlexLayoutNullUndefinedTest_0700 START');

      let strJson = getInspectorByKey('FlexNullUndefinedTest_flexShrink_2');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[FlexLayoutNullUndefinedTest_0700] obj.$attrs.flexShrink:' + obj.$attrs.flexShrink);
      expect(obj.$attrs.flexShrink).assertEqual(1);
      console.info('FlexLayoutNullUndefinedTest_0700 END');
      done();
    });

    /**
     * @tc.name   FlexLayoutNullUndefinedTest_0800
     * @tc.number FlexLayoutNullUndefinedTest_0800
     * @tc.desc   test alignSelf with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FlexLayoutNullUndefinedTest_0800', Level.LEVEL1, async (done: Function) => {
      console.info('FlexLayoutNullUndefinedTest_0800 START');

      let strJson = getInspectorByKey('FlexNullUndefinedTest_alignSelf_1');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[FlexLayoutNullUndefinedTest_0800] obj.$attrs.alignSelf:' + obj.$attrs.alignSelf);
      expect(obj.$attrs.alignSelf).assertEqual('ItemAlign.Auto');
      console.info('FlexLayoutNullUndefinedTest_0800 END');
      done();
    });

    /**
     * @tc.name   FlexLayoutNullUndefinedTest_0900
     * @tc.number FlexLayoutNullUndefinedTest_0900
     * @tc.desc   test alignSelf with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FlexLayoutNullUndefinedTest_0900', Level.LEVEL1, async (done: Function) => {
      console.info('FlexLayoutNullUndefinedTest_0900 START');

      let strJson = getInspectorByKey('FlexNullUndefinedTest_alignSelf_2');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[FlexLayoutNullUndefinedTest_0900] obj.$attrs.alignSelf:' + obj.$attrs.alignSelf);
      expect(obj.$attrs.alignSelf).assertEqual('ItemAlign.Auto');
      console.info('FlexLayoutNullUndefinedTest_0900 END');
      done();
    });
  })
}

