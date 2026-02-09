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

export default function checkboxGroupGroupTest() {

  describe('CheckboxGroupGroupTest', () => {

    beforeEach(async (done: Function) => {
      console.info("CheckboxGroupGroupTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/checkboxgroup/CheckboxGroupGroupTest",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CheckboxGroupGroupTest state pages: " + JSON.stringify(pages));
        if (!("CheckboxGroupGroupTest" == pages.name)) {
          console.info("get CheckboxGroupGroupTest  state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await Utils.sleep(3000)
          console.info("push CheckboxGroupGroupTest  success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CheckboxGroupGroupTest page error:" + err);
      }
      console.info("CheckboxGroupGroupTest beforeEach end");
      done();
    })

    /**
     * @tc.name   checkboxGroupGroupTest001
     * @tc.number checkboxGroupGroupTest001
     * @tc.desc   testing checkboxGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('checkboxGroupGroupTest001', Level.LEVEL1, async (done: Function) => {
      let  strJson = getInspectorByKey('checkboxgroup')
      await Utils.sleep(1000)
      console.info('checkboxGroupGroupTest001 strJson ' + strJson)
      let obj: ESObject = JSON.parse(strJson)
      await Utils.sleep(3000)
      console.info('checkboxGroupGroupTest001 group ' + JSON.stringify(obj.$attrs.group))
      expect(obj.$attrs.group).assertEqual("checkboxgroup")
      console.info('checkboxGroupGroupTest001 end')
      done();
    })

  })
}
