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
import Utils from '../../MainAbility/common/Utils'

export default function CheckBoxJsunit2() {
  describe('CheckBoxJsunit2', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/checkbox/checkbox',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get checkbox state success " + JSON.stringify(pages));
        if (!("checkbox" == pages.name)) {
          console.info("get checkbox state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(4000);
          console.info("push checkbox page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push checkbox page error " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("checkbox after each called");
    });

    /**
     * @tc.name   testCheckbox_100
     * @tc.number testCheckbox_100
     * @tc.desc   test checkBox
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckbox_100', Level.LEVEL1, async (done: Function) => {
      console.info('[testCheckbox_100] START');
      await Utils.sleep(1000);
      let strJson: string = getInspectorByKey('CheckboxExample_Checkbox1');
      console.info("testCheckbox_100 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.grayscale).assertEqual(0);
      console.info('testCheckbox_100 END');
      done();
    });

    /**
     * @tc.name   testCheckbox_200
     * @tc.number testCheckbox_200
     * @tc.desc   test checkBox
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckbox_200', Level.LEVEL1, async (done: Function) => {
      console.info('[testCheckbox_200] START');
      await Utils.sleep(1000);
      let strJson: string = getInspectorByKey('CheckboxExample_Checkbox1');
      console.info("testCheckbox_200 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.opacity).assertEqual(1);
      console.info('testCheckbox_200 END');
      done();
    });

    /**
     * @tc.name   testCheckbox_300
     * @tc.number testCheckbox_300
     * @tc.desc   test checkBox
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckbox_300', Level.LEVEL1, async (done: Function) => {
      console.info('[testCheckbox_300] START');
      await Utils.sleep(1000);
      let strJson: string = getInspectorByKey('CheckboxExample_Checkbox1');
      console.info("testCheckbox_300 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .borderRadius));
      expect(JSON.parse(strJson).$attrs.borderRadius instanceof Object).assertTrue();
      console.info('testCheckbox_300 END');
      done();
    });

    /**
     * @tc.name   testCheckbox_400
     * @tc.number testCheckbox_400
     * @tc.desc   test checkBox
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckbox_400', Level.LEVEL1, async (done: Function) => {
      console.info('[testCheckbox_400] START');
      await Utils.sleep(1000);
      let strJson: string = getInspectorByKey('CheckboxExample_Checkbox1');

      console.info("testCheckbox_400 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual("Visibility.Visible");
      console.info('testCheckbox_400 END');
      done();
    });
  })
}