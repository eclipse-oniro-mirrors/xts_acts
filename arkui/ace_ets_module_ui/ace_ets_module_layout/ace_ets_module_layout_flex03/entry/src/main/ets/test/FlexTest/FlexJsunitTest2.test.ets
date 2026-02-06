
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
import events_emitter from '@ohos.events.emitter';
import Utils from '../../MainAbility/common/Utils';
import router from '@ohos.router';

export default function FlexJsunitTest2() {
  describe('FlexJsunitTest2', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/flexPage',
      }
      try {
        router.clear();
        let pages: router.RouterState = router.getState();
        console.info("get flex state success " + JSON.stringify(pages));
        if (!("flex" == pages.name)) {
          console.info("get flex state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push flex page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push flex page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("flex after each called");
    });

    /**
     * @tc.name   testFlex_0100
     * @tc.number testFlex_0100
     * @tc.desc   test flex flexBasis
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlex_0100', Level.LEVEL0, async (done:Function) => {
      console.info("testFlex_0100 START");
      await Utils.sleep(1000);
      let strJson: string = getInspectorByKey('flexBasis');
      console.info("testFlex_0100 component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("testFlex_0100 $attrs.flexBasis is: " + JSON.parse(strJson).$attrs.flexBasis);
      expect(JSON.parse(strJson).$attrs.flexBasis).assertEqual("0.00auto");
      console.info('testFlex_0100 END');
      done()
    });

    /**
     * @tc.name   testFlex_0200
     * @tc.number testFlex_0200
     * @tc.desc   test flex flexGrow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlex_0200', Level.LEVEL0, async (done:Function) => {
      console.info('testFlex_0200 START');
      await Utils.sleep(1000);
      let strJson: string = getInspectorByKey('flexGrow');
      console.info("testFlex_0200 component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("testFlex_0200 $attrs.flexGrow is: " + JSON.parse(strJson).$attrs.flexGrow);
      expect(JSON.parse(strJson).$attrs.flexGrow).assertEqual(0);
      console.info('testFlex_0200 END');
      done()
    });

    /**
     * @tc.name   testFlex_0300
     * @tc.number testFlex_0300
     * @tc.desc   test flex flexShrink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlex_0300', Level.LEVEL0, async (done:Function) => {
      console.info('testFlex_0300 START');
      await Utils.sleep(1000);
      let strJson: string = getInspectorByKey('flexShrink');
      console.info("testFlex_0300 component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("testFlex_0300 $attrs.flexShrink is: " + JSON.parse(strJson).$attrs.flexShrink);
      expect(JSON.parse(strJson).$attrs.flexShrink).assertEqual(0);
      console.info('testFlex_0300 END');
      done()
    });

    /**
     * @tc.name   testFlex_0400
     * @tc.number testFlex_0400
     * @tc.desc   test flex alignSelf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlex_0400', Level.LEVEL0, async (done:Function) => {
      console.info('testFlex_0400 START');
      await Utils.sleep(1000);
      let strJson: string = getInspectorByKey('alignSelf');
      console.info("testFlex_0400 component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("testFlex_0400 $attrs.alignSelf is: " + JSON.parse(strJson).$attrs.alignSelf);
      expect(JSON.parse(strJson).$attrs.alignSelf).assertEqual("ItemAlign.Auto");
      console.info('testFlex_0400 END');
      done()
    });

    /**
     * @tc.name   testFlex_0500
     * @tc.number testFlex_0500
     * @tc.desc   test flex type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlex_0500', Level.LEVEL0, async (done:Function) => {
      console.info('testFlex_0500 START');
      let strJson: string = getInspectorByKey('FlexJsunitTest2_flex');
      console.info("testFlex_0500 component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("testFlex_0500 $type is: " + JSON.parse(strJson).$type);
      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      done()
    });

    /**
     * @tc.name   testFlex_0600
     * @tc.number testFlex_0600
     * @tc.desc   test flex direction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlex_0600', Level.LEVEL0, async (done:Function) => {
      console.info('testFlex_0600 START');
      let strJson: string = getInspectorByKey('FlexJsunitTest2_flex');
      console.info("testFlex_0600 component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("testFlex_0600 $attrs.constructor.direction is: " + JSON.parse(strJson).$attrs.constructor.direction);
      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      console.info('testFlex_0600 END');
      done()
    });
  })
}