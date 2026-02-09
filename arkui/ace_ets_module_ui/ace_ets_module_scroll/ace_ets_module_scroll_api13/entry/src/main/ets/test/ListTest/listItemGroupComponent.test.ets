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
import {Driver} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'
import hilog from '@ohos.hilog';


let selectorBundleName = '';
const TAG = '[Sample_MyApp]';
const DOMAIN = 0xF811;
let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

export default function listItemGroupComponent() {
  describe('listItemGroupComponent', () => {
    beforeEach(async (done: Function) => {
      console.info("listItemGroupComponent beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/listItemGroup',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get listItemGroupComponent state pages: " + JSON.stringify(pages));
        if (!("listItemGroup" == pages.name)) {
          console.info("get listItemGroupComponent state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push listItemGroupComponent page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push listItemGroupComponent page error: " + err);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   listItemGroupComponent_0100
     * @tc.number SUB_ACE_ARKUI_ListItemGroup_Component_0100
     * @tc.desc   TestUpdater: HeaderComponentUpdateTest1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('listItemGroupComponent_0100', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      await driver.delayMs(2000);
      let com1 = (JSON.parse(getInspectorByKey("buildTest1")) as attrs).$attrs.content;
      expect(com1 === "message1").assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'listItemGroupComponent_0100');
      done();
    });

  /**
   * @tc.name   listItemGroupComponent_0101
   * @tc.number SUB_ACE_ARKUI_ListItemGroup_Component_0101
   * @tc.desc   TestUpdater: FooterComponentUpdateTest2
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('listItemGroupComponent_0101', Level.LEVEL1, async (done: Function) => {
    let driver = Driver.create();
    await driver.delayMs(2000);
    let com2 = (JSON.parse(getInspectorByKey("buildTest2")) as attrs).$attrs.content;
    expect(com2 === "message2").assertTrue();
    hilog.info(DOMAIN, TAG, '%{public}s', 'listItemGroupComponent_0101');
    done();
  });
  })
}
interface attrs{
  $attrs:com
}
interface com{
  content:string
}