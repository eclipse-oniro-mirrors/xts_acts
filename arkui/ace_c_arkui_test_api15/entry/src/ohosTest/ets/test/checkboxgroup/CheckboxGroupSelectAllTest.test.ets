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

import { expect, beforeEach, beforeAll, describe, it, Level} from '@ohos/hypium';
import Utils from '../common/Utils';
import router from '@ohos.router';

export default function checkboxGroupSelectAllTest() {

  describe('CheckboxGroupSelectAllTest', () => {

    beforeEach(async (done: Function) => {
      console.info("CheckboxGroupSelectAllTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/checkboxgroup/CheckboxGroupSelectAllTest",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CheckboxGroupSelectAllTest state pages: " + JSON.stringify(pages));
        if (!("CheckboxGroupSelectAllTest" == pages.name)) {
          console.info("get CheckboxGroupSelectAllTest  state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await Utils.sleep(3000)
          console.info("push CheckboxGroupSelectAllTest  success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CheckboxGroupSelectAllTest page error:" + err);
      }
      console.info("CheckboxGroupSelectAllTest beforeEach end");
      done();
    })

    /*
     * @tc.number     : checkboxGroupSelectAllTest
     * @tc.name       : checkboxGroupSelectAllTest001
     * @tc.desc       : testing checkboxGroup
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('checkboxGroupSelectAllTest001', Level.LEVEL1, async (done: Function) => {
      let  strJson = getInspectorByKey('checkboxgroupTrue')
      await Utils.sleep(1000)
      console.info('checkboxGroupSelectAllTest001 strJson ' + strJson)
      let obj: ESObject = JSON.parse(strJson)
      await Utils.sleep(3000)
      console.info('CheckboxGroupSelectAllTest selectAll ' + JSON.stringify(obj.$attrs.selectAll))
      expect(obj.$attrs.selectAll).assertEqual("true")
      console.info('CheckboxGroupSelectAllTest selectAll end')
      done();
    })

    /*
     * @tc.number     : checkboxGroupSelectAllTest
     * @tc.name       : checkboxGroupSelectAllTest002
     * @tc.desc       : testing checkboxGroup
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('checkboxGroupSelectAllTest002', Level.LEVEL1, async (done: Function) => {
      let  strJson = getInspectorByKey('checkboxgroupFalse')
      await Utils.sleep(1000)
      console.info('checkboxGroupSelectAllTest002 strJson ' + strJson)
      let obj: ESObject = JSON.parse(strJson)
      await Utils.sleep(3000)
      console.info('CheckboxGroupSelectAllTest selectAll ' + JSON.stringify(obj.$attrs.selectAll))
      expect(obj.$attrs.selectAll).assertEqual("false")
      console.info('CheckboxGroupSelectAllTest selectAll end')
      done();
    })
  })
}
