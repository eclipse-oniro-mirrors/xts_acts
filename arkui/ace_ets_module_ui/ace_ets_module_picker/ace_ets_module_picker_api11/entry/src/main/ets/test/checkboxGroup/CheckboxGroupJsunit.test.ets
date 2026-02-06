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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from '../Utils';

export default function checkboxGroupJsunit() {
  describe('checkboxGroupTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/checkboxGroup/checkboxGroup',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get checkboxGroup state success " + JSON.stringify(pages));
        if (!("checkboxGroup" == pages.name)) {
          console.info("get checkboxGroup state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(4000);
          console.info("push checkboxGroup page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push checkboxGroup page error " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("checkboxGroup after each called");
    });

    it('testCheckboxGroup_100', Level.LEVEL1, async (done: Function) => {
      console.info('[testCheckboxGroup_100] START');
      await Utils.sleep(1000);
      let strJson: string = getInspectorByKey('CheckboxGroup');
      console.info("testCheckboxGroup_100 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.opacity).assertEqual(1);
      console.info('testCheckboxGroup_100 END');
      done();
    });

    it('testCheckboxGroup_200', Level.LEVEL1, async (done: Function) => {
      console.info('[testCheckboxGroup_200] START');
      await Utils.sleep(1000);
      let strJson: string = getInspectorByKey('CheckboxGroup');
      console.info("testCheckboxGroup_200 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.alignSelf).assertEqual("ItemAlign.Auto");
      console.info('testCheckboxGroup_200 END');
      done();
    });

    it('testCheckboxGroup_300', Level.LEVEL1, async (done: Function) => {
      console.info('[testCheckboxGroup_300] START');
      await Utils.sleep(1000);
      let strJson: string = getInspectorByKey('CheckboxGroup');
      console.info("testCheckboxGroup_300 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.scrollable).assertEqual(false);
      console.info('testCheckboxGroup_300 END');
      done();
    });

    it('testCheckboxGroup_400', Level.LEVEL1, async (done: Function) => {
      console.info('[testCheckboxGroup_400] START');
      await Utils.sleep(1000);
      let strJson: string = getInspectorByKey('CheckboxGroup');
      console.info("testCheckboxGroup_400 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.borderRadius instanceof Object).assertTrue();
      console.info('testCheckboxGroup_400 END');
      done();
    });

    it('testCheckboxGroup_500', Level.LEVEL1, async (done: Function) => {
      console.info('[testCheckboxGroup_500] START');
      await Utils.sleep(1000);
      let strJson: string = getInspectorByKey('CheckboxGroup');
      console.info("testCheckboxGroup_500 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.flexBasis).assertEqual("auto");
      console.info('testCheckboxGroup_500 END');
      done();
    });

    it('testCheckboxGroup_600', Level.LEVEL1, async (done: Function) => {
      console.info('[testCheckboxGroup_600] START');
      await Utils.sleep(1000);
      let strJson: string = getInspectorByKey('CheckboxGroup');
      console.info("testCheckboxGroup_600 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.borderStyle).assertEqual("BorderStyle.Solid");
      console.info('testCheckboxGroup_600 END');
      done();
    });
  })
}