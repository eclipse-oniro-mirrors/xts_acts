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

export default function checkboxGroupTest() {

  describe('CheckboxGroupTest', () => {

    beforeEach(async (done: Function) => {
      console.info("CheckboxGroupTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/checkbox/CheckboxGroupTest",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CheckboxGroupTest state pages: " + JSON.stringify(pages));
        if (!("checkbox/CheckboxGroupTest" == pages.name)) {
          console.info("get CheckboxGroupTest  state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await Utils.sleep(3000)
          console.info("push CheckboxGroupTest  success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CheckboxGroupTest page error:" + err);
      }
      console.info("CheckboxGroupTest beforeEach end");
      done();
    })

    /**
     * @tc.name   checkboxGroupTest001
     * @tc.number checkboxGroupTest001
     * @tc.desc   testing Checkbox
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('checkboxGroupTest001', Level.LEVEL1, async (done: Function) => {
      let strJson = getInspectorByKey('checkbox1');
      await Utils.sleep(1000);
      console.info('checkboxGroupTest001 strJson ' + strJson);
      let obj: ESObject = JSON.parse(strJson);
      await Utils.sleep(3000)
      expect(obj.$attrs.group).assertEqual('checkboxgroupTrue');
      done();
    })
  })
}
